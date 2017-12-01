#!/bin/bash

senha=$1
usuario=$2
equipamento=$3
porta=$4
empresa=$5

aux="@"

acesso=$usuario$aux$equipamento

sshpass -p $senha ssh $acesso -p $porta -o StrictHostKeyChecking=no 'display current-configuration > backup.cfg'


sshpass -p $senha sftp -o port=$porta $acesso  << SFTP

get backup.cfg
rm backup.cfg

exit
EOF
SFTP

DATE=`date +%Y-%m-%dx%H-%M`
nome="backup_huawei_"
ext=".cfg"


