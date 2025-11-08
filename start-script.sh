#!/bin/bash


service mariadb start

sleep 5

mariadb  < /docker-entrypoint-initdb.d/database.sql

echo -e "\e[35m ___   _____        ___                    "
echo -e "\e[35m(  _ \(  _  )      (  _ \                  "
echo -e "\e[35m| ( (_) ( ) |\e[32m______\e[35m| ( (_)  _ _ _ __   __  "
echo -e "\e[35m| |  _| | | |\e[32m______\e[35m) |  _ / _  )  __)/ __ \\e"
echo -e "\e[35m| (_( ) (_) |      | (_( ) (_| | |  (  ___/"
echo -e "\e[35m(____/(_____)      (____/ \__ _)_)   \____)"
echo -e ".............................by \e[32m\e[1mvink\e[35m\e[0m technologies"

echo -e "\n\n\n"
echo -e "\e[1musername:\e[0m admin@cocare.com \t\e[1mPassword:\e[0m Password123\n\n"
echo -e "\e[1mco-care:\e[0m is currently running: "



apache2-foreground