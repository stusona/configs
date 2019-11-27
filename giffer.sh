#! /bin/sh
echo Input variables:
echo 1. Name of video file
echo 2. Time start
echo 3. Length to convert to gif
ffmpeg -ss $2 -t $3 -i $1 -filter_complex "[0:v] fps=15,scale=480:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" output.gif
