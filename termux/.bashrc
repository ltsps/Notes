echo "user:"$(whoami)

if pgrep -x "sshd" > /dev/null
then
        echo "sshd is running"
else
        sshd
        echo "sshd is auto runned"
fi

ps auxf |grep -q [7]722:localhost || autossh -M 7723 -yfNR  *:7722:localhost:8022 cly@103.124.105.215 -p 8822 2>&1>/dev/null &
ps auxf |grep -q [9]222:localhost || autossh -M 9223 -yfNR *:9222:localhost:8022 root@3.lysps.top -p 3232 2>&1>/dev/null &
ps auxf |grep -q [k]cp || ~/kcptun/client_linux_arm64 -c ~/kcptun/client.general.json &
ps auxf |grep -q [f]rp || ~/frp_0.35.1_linux_arm/frpc -c ~/frp_0.35.1_linux_arm/frpc.ini 2>&1>/dev/null &
