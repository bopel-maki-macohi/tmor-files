@REM https://tutorialreference.com/batch-scripting/examples/faq/batch-script-how-to-get-current-date-time-into-variables
@ECHO OFF
SET "YYYY=%DATE:~10,4%"
SET "MM=%DATE:~4,2%"
SET "DD=%DATE:~7,2%"

SET "HH=%TIME:~0,2%"
SET "MIN=%TIME:~3,2%"
SET "SEC=%TIME:~6,2%"

@REM Handle the leading space in the time for hours < 10
IF "%HH:~0,1%"==" " SET "HH=0%HH:~1,1%"

SET "SortableDateTime=%YYYY%-%MM%-%DD%@%HH%-%MIN%-%SEC%"

lime build html5
cd export/release/html5/bin
git add .
git commit -m "New HTML5 build (%SortableDateTime%)"
git push -u origin main