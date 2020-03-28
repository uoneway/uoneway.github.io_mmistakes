#!/bin/bash

# REPLACE THIS as your github.io structure
posts_folder_path='_posts'
images_folder_path='assets/images'


target_folder=$1
post_title=$2



echo "### Welcome to notion_to_github! ###"

if [ $# = 0 ]; then
	echo -e "Please enter a folder name exported from notion:"
    read  target_folder
fi
while [ ! -d "$target_folder" ]; do
	echo -e "We can't find the folder. Enter a folder name exported from notion::"
    read  target_folder
done

if [ $# -lt 2 ]; then
	echo -e "Please enter a post title in english:"
    read  post_title
fi
fixed_filename=$(date +%Y)-$(date +%m)-$(date +%d)-$post_title

# 1. Image path change in Untitled.md
sed -i '' "s|Untitled/Untitled|../$images_folder_path/$fixed_filename/Untitled|g" "$target_folder/Untitled.md"

# 2. Change file name and move
# If directories not exist, make it. 
mkdir -p $posts_folder_path
mkdir -p $images_folder_path/$target_folder
mv -i -v "$target_folder/Untitled.md" "$posts_folder_path/$fixed_filename.md"
mv -i -v "$target_folder/Untitled" "$images_folder_path/$fixed_filename"

# 3. git add and commit
git add "$posts_folder_path/$fixed_filename.md"
git add "$images_folder_path/$fixed_filename"

git commit -m "$fixed_filename is uploaded"
#git push

rm -r $target_folder