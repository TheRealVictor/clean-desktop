#!/bin/bash
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

currentDate=$(date +"%d-%m-%Y %H.%M.%S")
documentsPath=~/Documents
desktopPath=~/Desktop
folderName="Desktop - $currentDate"
folderPath="$documentsPath/$folderName"

function checkIfCleaningIsNeeded() {
  cd $desktopPath
  fileCount=$(find . -name "[!.]*" | wc -l)

  if [ $fileCount -eq 0 ]
  then
    echo "😀 Looks like there are no files to clean"
    # Stop the script from running if there are no files to clean
    exit
  fi
}

function createFolder() {
  echo "🛠 Creating a new folder"

  # Change directory to documents
  cd $documentsPath

  # Make directory with current date and time
  mkdir -p "$folderName"
}

function moveFiles() {
  echo "🚚 Moving files"

  # Changes directory to the desktop
  cd "$desktopPath"

  # Moves all files from desktop to new directory
  mv * "$folderPath"
}

function showDone() {
  echo "🤘 Your desktop is now clean"
}

# Run all the functions
checkIfCleaningIsNeeded
createFolder
moveFiles
showDone
