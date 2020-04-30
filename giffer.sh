#! /bin/sh

# Based on https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/

echo Input variables:
echo 1. Name of video file
echo 2. Time start
echo 3. Length to convert to gif
echo 4. Frames per second
echo 5. Output pixel width
# 
ffmpeg -ss $2 -t $3 -i $1 -filter_complex "[0:v] fps=$4,scale=$5:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" output.gif
