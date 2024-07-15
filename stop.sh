unames=`uname -s`
if [ $unames == "Darwin" ]; then
    echo "MacOS"
    lsof -i tcp:3003 | grep -v PID | awk '{print $2}' | xargs kill
  
    exit 0
fi
fuser -k 3003/tcp