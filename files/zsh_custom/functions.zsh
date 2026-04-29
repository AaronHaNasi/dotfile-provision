# Pull random quote from fortune
if (( $RANDOM % 2 == 1)); then
    fortune quotes
else
    fortune
fi
