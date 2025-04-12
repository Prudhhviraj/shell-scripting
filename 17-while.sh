#! /bin/bash
while read -r line
do
    echo "$line"
done < 16-delete-old-logs.sh
# The above code reads the /etc/passwd file line by line and prints each line to the console.
#
# The while loop continues until all lines in the file have been read.
# The read command reads a single line from the file and assigns it to the variable line.
# The -r option prevents backslashes from being interpreted as escape characters.
# The < operator redirects the contents of the file to the while loop.


