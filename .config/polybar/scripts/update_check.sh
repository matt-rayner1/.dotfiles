#/bin/sh

NUM_UPDATES=$((checkupdates | wc -l) 2> /dev/null)

if [[ $NUM_UPDATES == 0 ]]; then
    echo "0"
else
    echo !$NUM_UPDATES
fi
