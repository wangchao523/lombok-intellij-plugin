@ECHO OFF

SET pluginVersion=0.16

for %%X in (15.0.2 15.0.4 15.0.6) do call :buildPlugin %%X

:buildPlugin
SETLOCAL
echo Called with %1
SET IDEA_VERSION=%1
call gradlew clean
call gradlew buildPlugin check
call gradlew publishPlugin
copy build\distributions\lombok-plugin-%pluginVersion%.zip distro\lombok-plugin-%pluginVersion%-%1.zip
ENDLOCAL & SET result=%retval%