echo "user: "$(whoami)

if pgrep -x "sshd" > /dev/null
then
        echo "sshd is running"
else
        sshd
        echo "sshd is starting"
fi

#ssh -yfNR *:8022:localhost:8022 root@3.lysps.top -p 3232
if pgrep -x "autossh" > /dev/null
then
        echo "autossh is running"
else
        autossh -M 8023 -yfNR *:8022:localhost:8022 root@3.lysps.top -p 3232
        echo "autossh is starting"
fi
