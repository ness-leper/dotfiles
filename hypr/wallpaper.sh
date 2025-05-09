#!/bin/bash

set -ex

api_url="https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"
base_url="https://www.bing.com"

output=$HOME/Pictures/wallpapers/$(date -I).png

# Fetch the URL from the Bing API endpoint.
url_path=$(curl -s "$api_url" | jq -r ".images[0].url")

# Download the image to $output.
curl -L -o "${output}" "${base_url}${url_path}"
