#!/bin/bash

api_url="https://bing.biturl.top/?resolution=3840&format=json&index=0&mkt=zh-CN"
response=$(curl -s "$api_url")

# Parse JSON response
start_date=$(echo "$response" | jq -r '.start_date')
end_date=$(echo "$response" | jq -r '.end_date')
image_url=$(echo "$response" | jq -r '.url')
copyright=$(echo "$response" | jq -r '.copyright')
copyright_link=$(echo "$response" | jq -r '.copyright_link')

# Directory to store images and config file
home_dir="$HOME"
relative_path="/Pictures"
image_dir="${home_dir}${relative_path}"

# Image filename
image_filename="$start_date"_"$end_date.jpg"

curl -s -o "$image_dir/$image_filename" "$image_url"

# swww img "$image_dir/$image_filename"
feh --bg-scale "$image_dir/$image_filename"
