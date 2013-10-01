#!/bin/sh
sshpass -p 'vagrant' ssh -q -p $1 -o StrictHostKeyChecking=no vagrant@10.0.2.2 <<'ENDSSH'
wget -q -O /dev/null http://localhost:33221/shutdown
rm continuous-delivery-training-*.jar
wget http://10.0.2.2:18081/artifactory/libs-release/sourcetalk-tage/continuous-delivery-training/$2/continuous-delivery-training-$2.jar
nohup java -jar continuous-delivery-training-$2.jar &
ENDSSH
