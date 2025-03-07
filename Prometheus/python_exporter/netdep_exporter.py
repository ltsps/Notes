from prometheus_client import start_http_server, Gauge,CollectorRegistry
import socket
import struct
import time
import sys
import yaml


def parse_yaml_config(file_path):
    with open(file_path, 'r') as file:
        config = yaml.safe_load(file)
    return config

def parse_tcp_file():
    with open('/proc/net/tcp', 'r') as f:
        lines = f.readlines()[1:]  # Skip the header line
        for line in lines:
            parts = line.split()
            local_address_hex = parts[1]
            rem_address_hex = parts[2]
            tx_queue = parts[4].split(':')[0]
            rx_queue = parts[4].split(':')[1]

            # Convert local_address from hex to decimal
            local_ip_hex, local_port_hex = local_address_hex.split(':')
            local_ip_decimal = socket.inet_ntoa(struct.pack("<L", int(local_ip_hex, 16)))
            local_port_decimal = int(local_port_hex, 16)

            # Convert rem_address from hex to decimal
            rem_ip_hex, rem_port_hex = rem_address_hex.split(':')
            rem_ip_decimal = socket.inet_ntoa(struct.pack("<L", int(rem_ip_hex, 16)))
            rem_port_decimal = int(rem_port_hex, 16)

            yield local_ip_decimal, local_port_decimal, rem_ip_decimal, rem_port_decimal, int(tx_queue, 16), int(rx_queue, 16)

custom_registry = CollectorRegistry()

# Define Prometheus metrics
tx_queue_gauge = Gauge('tcp_tx_queue', 'TCP TX Queue', ['local_ip', 'local_port','rem_ip','rem_port'], registry=custom_registry)
rx_queue_gauge = Gauge('tcp_rx_queue', 'TCP RX Queue', ['local_ip', 'local_port','rem_ip','rem_port'], registry=custom_registry)

def update_metrics():
    for local_ip, local_port,rem_ip,rem_port, tx_queue, rx_queue in parse_tcp_file():
        tx_queue_gauge.labels(local_ip=local_ip, local_port=local_port, rem_ip=rem_ip, rem_port=rem_port).set(tx_queue)
        rx_queue_gauge.labels(local_ip=local_ip, local_port=local_port, rem_ip=rem_ip, rem_port=rem_port).set(rx_queue)

class AuthHandler(BaseHTTPRequestHandler):
    """Main class to present webpages and authentication."""
    def do_HEAD(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_AUTHHEAD(self):
        self.send_response(401)
        self.send_header('WWW-Authenticate', 'Basic realm="Test"')
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        """Present frontpage with user authentication."""
        if self.headers.get('Authorization') == None:
            self.do_AUTHHEAD()
            self.wfile.write(b'no auth header received')
        elif self.headers.get('Authorization') == 'Basic ' + str(base64.b64encode(b"username:password"), "utf-8"):
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b'authenticated!')
        else:
            self.do_AUTHHEAD()
            self.wfile.write(self.headers.get('Authorization').encode())
            self.wfile.write(b'not authenticated')

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python main.py --web.config.file=<config_file_path>")
        sys.exit(1)

    config_file_path = sys.argv[1].split('=')[1]
    config = parse_yaml_config(config_file_path)
    print(config)

    # Extract TLS and authentication information

    cert_file = config.get('tls_server_config', {}).get('cert_file', None)
    key_file = config.get('tls_server_config', {}).get('key_file', None)
    auth_info = config.get('basic_auth_users', {})

    # Print or use the extracted information as needed
    print("TLS Information:", cert_file)
    print("Authentication Information:", auth_info)

    app = make_wsgi_app(custom_registry)
    httpd = make_server('127.0.0.1', 9300, app)
    httpd.serve_forever()
    
    # Start up the server to expose the metrics.
    #start_http_server(9300,'127.0.0.1',registry=custom_registry,certfile=cert_file,keyfile=key_file)
    # Update metrics in a loop
    #while True:
    #    update_metrics()
    #    time.sleep(15)  # Update every 10 seconds
