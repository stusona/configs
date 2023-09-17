@echo off
REM ==================================================
REM FFMPEG TOOL
REM ==================================================
set /p FILENAME="File to be converted: "
::echo File to be converted: %FILENAME%

set /p START_TIME="Time to start: "
::echo Time to start: %START_TIME%

set /p LENGTH="Length of video trim: "
::echo Length of video trim: %LENGTH%

set /p FPS="FPS: "
::echo FPS: %FPS%

set /p WIDTH="Output pixel width: "
::echo Output pixel width: %WIDTH%

set /p HEIGHT="Output pixel height (-1 indicates maintain aspect ratio): "
::echo Output pixel height x width: %HEIGHT% x %WIDTH%

:: -ss seek to position in input video
:: -t amount of time to read in
:: ^ it is important that these are BEFORE the input file
:: -i input file
:: [0:v] means take first input video stream
:: fps is frames per second for output file
:: scale is size of output file (-1 indicates maintain aspect ratio) -2 has a similar meaning to -1 but to stay close to the aspect ratio but round to an even number. This is important for many video codecs which require even dimensions, such as H.264. It doesn’t matter for GIFs.
:: Split takes the video and splits it into 2 files: [a] & [b]
:: ; indicates that we're specifying a new filter
:: palettegen filter converts [a] into a 256 color palette file [p]
:: The video [b] and palette [p] are input into paletteuse

:: [0:v] is first video stream
:: crop=out_width:out_height:top_left_x:top_left_y (where origin is top left of video)

ffmpeg -ss %START_TIME% -t %LENGTH% -i %FILENAME% ^
-filter_complex "[0:v] fps=%FPS%, scale=width=%WIDTH%:height=-1, split [a][b];[a] palettegen [p];[b][p] paletteuse" ^
output.gif
PAUSE

:: here's a crop filter (very manual process!)
::-filter_complex "[0:v] fps=%FPS%, scale=width=%WIDTH%:height=-1, split [a][b];[a] palettegen [p];[b][p] paletteuse, crop=600:600:180:0" ^