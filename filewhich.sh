#!/bin/bash

# Default value for -a 
SHOW_ALL=0;
while getopts :ap: option
	do 
		case "${option}"
		in
			a) SHOW_ALL=1;;
			p) FILEPATH="${OPTARG}";;
		esac
done

shift $((OPTIND-1))

# Check for exported variable
if [ -z ${FILEPATH+xxx} ]; then 
	# FilePath is not set and -p option not used
	echo "Usage: filewhich [-a] [-p /path/to/files:/path/to/more/files] file_name"; 
	exit 1;
fi

# Loop through colon-separated values
IFS=':' read -r -a array <<< "$FILEPATH"
for directory in "${array[@]}"
do
	# Use glob expansion to check if file is present
	for f in $directory*; do
		filename=$(echo "$f" | cut -c 3-)
		# Check if file is present
		if [ "$filename" == "$1" ]; then
			echo "$directory$filename";
			if [ $SHOW_ALL == 0 ]; then
				exit 0;
			fi;
		fi;
	done
done