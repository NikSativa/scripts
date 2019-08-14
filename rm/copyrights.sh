#!/bin/bash
# Usage:
# $ cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates
# $ bash ~/remove-boilerplate-comments-from-xcode-templates.sh
# Repeat for /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates

#find -E . -type f \
#\( -regex '.*\.[chm]' -or -regex '.*\.swift' \) \
#-exec sed -i '' '1,/^$/d' '{}' ';'

#find -E . -type f -name '*.swift' \
#-regex '(.*)//\n//[ \t]+(.*)+\n//[ \t]+(.*)\n//\n//[ \t]+(.*)\n//[ \t]+(.*)\n//\n\n' -print
#-exec sed -i '' '1,/^$/,d' '{}' ';'

#REGEXP='(.*)//\n//[ \t]+(.*)+\n//[ \t]+(.*)\n//\n//[ \t]+(.*)\n//[ \t]+(.*)\n//\n\n'
#FILES="find . -name *.swift"
#echo "$FILES"
#sed "/^\(\$REGEXP\)$/"

# find -E $(xcode-select --print-path) -regex '.*___\.(c|h|m|swift)' -print0 | xargs -0 -n 1 sed -i '' '1,/^$/d'
