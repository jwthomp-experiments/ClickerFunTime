
exports:


export-web:
	/Applications/Godot.app/Contents/MacOS/Godot --headless --export-debug ClickerFunTime ./exports/html5/index.html

export-mac:
	/Applications/Godot.app/Contents/MacOS/Godot --headless --export-debug "Clicker Fun Time Debug App" ./exports/html5/ClickerFunTime.app

export-win:
	/Applications/Godot.app/Contents/MacOS/Godot --headless --export-debug "Clicker Fun Time" ./exports/html5/ClickerFunTime.exec
