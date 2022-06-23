#!/bin/bash

#  ████▄ ██████  █▄▄    ████▄ ██████ ██████ 
#     ██ ██       ██       ██ ██     ██  ██ 
#     ██ ██████ ██████     ██ ██████ ██  ██ 
# ▄▄  ██ ██  ██ ██  ██ ▄▄  ██ ██  ██ ██  ██ 
# ██████ ██████ ██████ ██████ ██████ ██  ██ 


production_directory='/home/george/Dev/anbani.github.io/'
development_directory='/home/george/Dev/anbani-next/'


# Clean production static hosting directory
echo '჻ Pulling latest gh build' && cd $production_directory && git pull 
echo '჻ Cleaning up production static hosting directory' && rm -rf 'docs/'
# Deploy development build from next.anbani.ge
echo '჻ Copying latest development build' && cd $development_directory && cp -r 'docs' $production_directory
echo '჻ Fixing CNAME'  && cd $production_directory && cd 'docs' && echo 'anbani.ge' > CNAME
echo '჻ Creating update git commit'  && cd $production_directory && git add . && git commit -m "🚀 Upgrade" && git push
