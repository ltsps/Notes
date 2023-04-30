#!/usr/bin/expect

set res [exec sh -c {python3 /mnt/c/documents/scripts/auto/one_word.py}]
puts $res

set timeout= 30
spawn zssh zlb
expect "password:"
send "$res\r"
interact
