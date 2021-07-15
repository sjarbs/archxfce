#!/usr/bin/sh

youtube-dl \
	--output "%(title)s.%(ext)s" \
	--extract-audio \
	--audio-format mp3 \
	"https://www.youtube.com/playlist?list=PLOX9iIsMbf0Fj-MGB67wwREAqsw68ATls"
