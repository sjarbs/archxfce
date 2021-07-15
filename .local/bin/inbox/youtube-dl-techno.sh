#!/usr/bin/sh

youtube-dl \
	--verbose \
	--download-archive downloaded.txt \
	--no-overwrites \
	--ignore-errors \
	--continue \
	--output "%(title)s.%(ext)s" \
	--yes-playlist \
	--extract-audio \
	--audio-format mp3 \
	--audio-quality 0 \
	"https://www.youtube.com/playlist?list=PLOX9iIsMbf0Fj-MGB67wwREAqsw68ATls"
