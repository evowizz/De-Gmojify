# De-Gmojify
[![GitHub Release](https://img.shields.io/github/v/release/evowizz/De-Gmojify)]()

## Description
This small Google Chrome extension removes the 'Add Reaction' button from Gmail™. No need to worry about accidentally clicking it anymore!

## Installation
There are two ways to install this extension:

### From the Chrome Web Store
1. Go to the [Chrome Web Store](https://chromewebstore.google.com/detail/gpjfhlbmbglgakpmbocoebjakcnifknf)
2. Click 'Add to Chrome'
3. Enjoy!

### Using the latest release
1. Go to the [latest release](https://github.com/evowizz/De-Gmojify/releases/latest)
2. Download the `dist.zip` file
3. Unzip the file
4. Go to `chrome://extensions` in your browser
5. Enable 'Developer mode' in the top right corner
6. Click 'Load unpacked' in the top left corner
7. Select the unzipped folder
8. Enjoy!

## Building
1. Clone the repository
2. Install [jq](https://jqlang.github.io/jq/) if you don't have it already
3. Install [Terser](https://terser.org/) if you don't have it already
4. Run one of `build_bash.sh` or `build_zsh.sh` depending on your shell
5. The built extension will be in the `dist` folder
6. Follow the instructions above to install the extension from the `dist` folder
7. Enjoy!

## License
```
Copyright 2024 Dylan Roussel

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
