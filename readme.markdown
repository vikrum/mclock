#mclock   

A minimalist menu bar clock for your Mac that shows the time in UTC, e.g. `UTC Wed Nov 11  20:51:07`.

![mclock in action](https://github.com/palaniraja/mclock/raw/master/screenshots/mclock-in-action.png "mclock in action")

## Build

Requires macOS 26.6+ and a Swift toolchain (Xcode or the Command Line Tools).

    make app        # builds build/mclock.app
    make install    # copies it to ~/Applications

The time zone and format are hardcoded in `Sources/mclock/main.swift`.

***
###License

Copyright 2011 Palaniraja

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
