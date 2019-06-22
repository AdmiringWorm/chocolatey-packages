#! /bin/sh

file=$(find icons -name $1.png -or -name $1.svg)
if [ -z "$file" ]; then
  echo "ERROR: No icons found for $1"
  exit 1
fi

directory=$(find . -type d -name $1)

if [ -z "$directory" ]; then
  echo "ERROR: No package directory named $1 was found"
  exit 1
fi

if [ ! -d "$directory/icons" ]; then
  echo "Creating package icon directory"
  mkdir "$directory/icons"
fi

echo "Moving $1 icon to package directory"
if [ ! -z "$2" ]; then
  extension="${file##*.}"
  git mv $file "$directory/icons/$2x$2.$extension"
else
  git mv $file "$directory/icons"
fi

echo "Creating commit message"
git commit -m "($1) Moved icon to package icons directory

ref #47"
