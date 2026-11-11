APP = build/mclock.app

.PHONY: app install clean

app:
	swift build -c release
	rm -rf $(APP)
	mkdir -p $(APP)/Contents/MacOS $(APP)/Contents/Resources
	cp .build/release/mclock $(APP)/Contents/MacOS/
	cp Info.plist $(APP)/Contents/
	cp mclock.icns $(APP)/Contents/Resources/
	codesign --force --sign - $(APP)

install: app
	mkdir -p ~/Applications
	rm -rf ~/Applications/mclock.app
	cp -R $(APP) ~/Applications/

clean:
	rm -rf .build build
