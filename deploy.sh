#!/bin/sh
PORT=$1
VERSION=$2
echo Deploying version $VERSION to 10.0.2.2:$PORT
sshpass -p 'vagrant' ssh -q -p $PORT -o StrictHostKeyChecking=no vagrant@10.0.2.2 <<'ENDSSH'
wget -q -O /dev/null http://localhost:33221/shutdown
rm continuous-delivery-training-*.jar
wget http://10.0.2.2:18081/artifactory/libs-release/sourcetalk-tage/continuous-delivery-training/$VERSION/continuous-delivery-training-$VERSION.jar
nohup java -jar continuous-delivery-training-$2.jar &
ENDSSH
