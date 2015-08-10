#!/bin/sh
# # Delete backup more than 90 days old.
#
backupDir="/var/lib/psa/dumps"
#
daysToKeep=90

echo "Checking for files older than $daysToKeep days in $backupDir"
listOfFiles=`find $backupDir -mtime +$daysToKeep`
if [ ! -z $listOfFiles ]
then
	echo "Found [$listOfFiles]"
else
	echo "None found."
fi
for toDelete in $listOfFiles
do
	echo "Deleting $toDelete"
	rm -rf $toDelete
done
echo "Done."