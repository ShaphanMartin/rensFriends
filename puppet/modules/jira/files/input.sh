#!/usr/bin/expect

set timeout 20

spawn "./atlassian-jira-6.3.13-x64.bin"

expect "Enter the number1 :" { send "1\r" }
expect "Enter the number2 :" { send "2\r" }
expect "Enter the port :" { send "8081\r" }
expect "Enter the port2 :" { send "8006\r" }

interact