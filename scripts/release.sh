#!/bin/bash

#  ████▄ ██████  █▄▄    ████▄ ██████ ██████ 
#     ██ ██       ██       ██ ██     ██  ██ 
#     ██ ██████ ██████     ██ ██████ ██  ██ 
# ▄▄  ██ ██  ██ ██  ██ ▄▄  ██ ██  ██ ██  ██ 
# ██████ ██████ ██████ ██████ ██████ ██  ██ 

# Usage:
#   ./deploy.sh [production_directory] [development_directory]
#
# Example:
#   ./deploy.sh /path/to/prod/ /path/to/dev/
#
# If no parameters are passed, the following defaults will be used:
production_directory=${1:-'/home/george/Space/GitHub/anbani.github.io'}
development_directory=${2:-'/home/george/Space/GitHub/anbani-next'}

echo "Production directory: $production_directory"
echo "Development directory: $development_directory"

# Clean production static hosting directory
echo '჻ Pulling latest gh build'
cd "$production_directory" || exit 1
git pull 

echo '჻ Cleaning up production static hosting directory'
rm -rf docs/

# Deploy development build from next.anbani.ge
echo '჻ Copying latest development build'
cd "$development_directory" || exit 1
cp -r docs "$production_directory"

echo '჻ Fixing CNAME'
cd "$production_directory/docs" || exit 1
echo 'anbani.ge' > CNAME

echo '჻ Creating update git commit'
cd "$production_directory" || exit 1
git add .
git commit -m "🚀 Upgrade"
git push

echo '჻ All done!'
