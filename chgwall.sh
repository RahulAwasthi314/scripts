# FILES2=(~/Pictures/wallpapers/Windows_spotlight/*)

TIME=1

WALL_LOC="$HOME/.config/wallpaper.jpg"

# files=("${FILES1[@]}" "${FILES2[@]}")
files=("${FILES1[@]}")
WALLPAPER="aaa"
echo $((TIME*60))

while true; do

	WALLPAPER2=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
	# make sure it changes
	while [[ "$WALLPAPER2" == "$WALLPAPER" ]]; do
		WALLPAPER2=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
	done
	WALLPAPER=$WALLPAPER2
	cp "$WALLPAPER" "$WALL_LOC"
	feh --bg-scale "$WALL_LOC"
	sleep $((TIME))
done
