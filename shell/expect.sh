#!/usr/bin/expect
set timeout= 30
spawn ssh xx
expect "password:"
send "xxx\r"
interact
