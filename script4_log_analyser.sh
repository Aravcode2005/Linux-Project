

LOGFILE=$1
KEYWORD=${2:-"error"}  
COUNT=0

echo "======================================"
echo "  Log File Analyzer"
echo "======================================"
echo ""


if [ -z "$LOGFILE" ]; then
    echo "Please give a log file path."
    echo "Example: ./script4_log_analyzer.sh /var/log/syslog error"
    exit 1
fi


if [ ! -f "$LOGFILE" ]; then
    echo "Error: $LOGFILE not found."
    exit 1
fi

ATTEMPT=1
while [ ! -s "$LOGFILE" ] && [ $ATTEMPT -le 3 ]; do
    echo "File seems empty. Attempt $ATTEMPT of 3... retrying in 2 seconds."
    sleep 2
    ATTEMPT=$((ATTEMPT + 1))
done

if [ ! -s "$LOGFILE" ]; then
    echo "File is empty even after retrying. Nothing to analyze."
    exit 1
fi

echo "File    : $LOGFILE"
echo "Keyword : $KEYWORD"
echo ""


while IFS= read -r LINE; do
   
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Total matches found: $COUNT"
echo ""


echo "Last 5 matching lines:"
echo "----------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo ""
echo "======================================"
