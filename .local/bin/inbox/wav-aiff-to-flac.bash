# https://unix.stackexchange.com/questions/428018/how-to-convert-all-wav-files-in-subdirectories-to-flac
# $0 - passed into shell command as a destination directory ~/Music_Flac/
# $1 - passed into shell command as a filepath {}
# bn=${1##*/} - file basename without directory path
# bn=${bn%.*} - file basename with extension truncated
# -loglevel 16 - set the logging level 16 used by ffmpeg

find /run/media/sj/Home/Files/Audio/Nicotine -type f -iname "*.aif" -exec sh -c \
'bn=${1##*/}; bn=${bn%.*}; ffmpeg -loglevel 16 -i "$1" "${0}${bn}.flac"' /run/media/sj/Home/Files/Audio/  {} \;