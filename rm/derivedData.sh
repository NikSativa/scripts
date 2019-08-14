#!/bin/bash

sleep 0.1
echo "Removing 'Build' folder inside the Project folder"
rm -rf "./Build"
sleep 0.1

echo "Removing 'DerivedData' folder inside the Project folder"
rm -rf "./DerivedData"
sleep 0.1

echo "Removing 'DerivedData' folder inside the Library folder"
rm -rf "~/Library/Developer/Xcode/DerivedData"
sleep 0.1
