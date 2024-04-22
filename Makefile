
exports:

exports-clean:
	rm -rf ./exports/html5
	rm -rf ./exports/linux
	rm -rf ./exports/windows
	rm -rf ./exports/macos
	mkdir -p ./exports/html5 ./exports/linux ./exports/windows ./exports/macos


export-html5:
	/Applications/Godot.app/Contents/MacOS/Godot --headless --export-debug ClickerFunTime ./exports/html5/index.html

export-macos:
	/Applications/Godot.app/Contents/MacOS/Godot --headless --export-debug "Clicker Fun Time Debug App" ./exports/macos/ClickerFunTime.dmg

export-windows:
	/Applications/Godot.app/Contents/MacOS/Godot --headless --export-debug "Clicker Fun Time" ./exports/windows/ClickerFunTime.exe

export-linux:
	/Applications/Godot.app/Contents/MacOS/Godot --headless --export-debug "Clicker Fun Time" ./exports/linux/clicker-fun-time


butler-status:
	butler status jwthomp/clicker-fun-time:HTML
	butler status jwthomp/clicker-fun-time:macos
	butler status jwthomp/clicker-fun-time:windows
	butler status jwthomp/clicker-fun-time:linux

butler-push-html:
	butler push exports/html5 jwthomp/clicker-fun-time:HTML

butler-push-windows:
	butler push exports/windows jwthomp/clicker-fun-time:windows

butler-push-macos:
	butler push exports/macos jwthomp/clicker-fun-time:macos

butler-push-linux:
	butler push exports/linux jwthomp/clicker-fun-time:linux



