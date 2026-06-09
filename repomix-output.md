This file is a merged representation of the entire codebase, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
.github/workflows/build_ios.yml
.github/workflows/build-android.yml
.github/workflows/cd.yml
.gitignore
.metadata
指令.md
analysis_options.yaml
android/.gitignore
android/app/build.gradle.kts
android/app/src/debug/AndroidManifest.xml
android/app/src/main/AndroidManifest.xml
android/app/src/main/kotlin/com/example/aiservice/MainActivity.kt
android/app/src/main/res/drawable-v21/launch_background.xml
android/app/src/main/res/drawable/launch_background.xml
android/app/src/main/res/mipmap-hdpi/ic_launcher.png
android/app/src/main/res/mipmap-mdpi/ic_launcher.png
android/app/src/main/res/mipmap-xhdpi/ic_launcher.png
android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png
android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png
android/app/src/main/res/values-night/styles.xml
android/app/src/main/res/values/styles.xml
android/app/src/profile/AndroidManifest.xml
android/build.gradle.kts
android/build/reports/problems/problems-report.html
android/gradle.properties
android/gradle/wrapper/gradle-wrapper.properties
android/settings.gradle.kts
ios/.gitignore
ios/Flutter/AppFrameworkInfo.plist
ios/Flutter/Debug.xcconfig
ios/Flutter/Release.xcconfig
ios/Runner.xcodeproj/project.pbxproj
ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata
ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings
ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme
ios/Runner.xcworkspace/contents.xcworkspacedata
ios/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings
ios/Runner/AppDelegate.swift
ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png
ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png
ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json
ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage.png
ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@2x.png
ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@3x.png
ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md
ios/Runner/Base.lproj/LaunchScreen.storyboard
ios/Runner/Base.lproj/Main.storyboard
ios/Runner/Info.plist
ios/Runner/Runner-Bridging-Header.h
ios/Runner/SceneDelegate.swift
ios/RunnerTests/RunnerTests.swift
lib/core/constants/app_constants.dart
lib/core/models/api_message.dart
lib/core/models/api_message.freezed.dart
lib/core/models/api_message.g.dart
lib/core/models/app_config_store.dart
lib/core/models/app_config_store.freezed.dart
lib/core/models/app_config_store.g.dart
lib/core/models/app_config.dart
lib/core/models/app_config.freezed.dart
lib/core/models/app_config.g.dart
lib/core/models/attachment.dart
lib/core/models/attachment.freezed.dart
lib/core/models/attachment.g.dart
lib/core/models/chat_chunk.dart
lib/core/models/chat_chunk.freezed.dart
lib/core/models/chat_round.dart
lib/core/models/chat_round.freezed.dart
lib/core/models/chat_round.g.dart
lib/core/models/generation_event.dart
lib/core/models/generation_event.freezed.dart
lib/core/models/model_info.dart
lib/core/models/model_info.freezed.dart
lib/core/models/model_info.g.dart
lib/core/models/session.dart
lib/core/models/session.freezed.dart
lib/core/models/session.g.dart
lib/core/models/sse_event.dart
lib/core/utils/sse_parser.dart
lib/data/data_sources/api_builders/api_request_builder.dart
lib/data/data_sources/api_builders/chat_completions_api_builder.dart
lib/data/data_sources/api_builders/google_api_builder.dart
lib/data/data_sources/api_builders/model_info_parser.dart
lib/data/data_sources/api_builders/responses_api_builder.dart
lib/data/data_sources/chat_source_router.dart
lib/data/data_sources/chat_source.dart
lib/data/data_sources/local_chat_source.dart
lib/data/data_sources/local_file_source.dart
lib/data/data_sources/remote_chat_source.dart
lib/data/data_sources/sse_event_decoder.dart
lib/data/database/database.dart
lib/data/database/database.g.dart
lib/data/repositories/conversation_repository.dart
lib/data/services/config_service.dart
lib/di/providers.dart
lib/domain/models/session_card_meta.dart
lib/domain/models/session_list_item.dart
lib/domain/models/tree_node.dart
lib/domain/models/tree_node.freezed.dart
lib/domain/models/tree_node.g.dart
lib/domain/services/attachment_preparer.dart
lib/domain/services/chat_context_builder.dart
lib/domain/services/chat_service.dart
lib/domain/services/stream_processor.dart
lib/domain/services/tree_builder.dart
lib/main.dart
lib/presentation/models/input_state.dart
lib/presentation/models/input_state.freezed.dart
lib/presentation/models/pending_attachment.dart
lib/presentation/pages/branch_tree_page.dart
lib/presentation/pages/chat_page.dart
lib/presentation/pages/home_page.dart
lib/presentation/pages/image_attachment_viewer_page.dart
lib/presentation/pages/settings_page.dart
lib/presentation/pages/text_attachment_viewer_page.dart
lib/presentation/providers/chat_notifier.dart
lib/presentation/providers/config_notifier.dart
lib/presentation/providers/input_notifier.dart
lib/presentation/providers/session_list_notifier.dart
lib/presentation/providers/settings_form_notifier.dart
lib/presentation/widgets/attachment_list.dart
lib/presentation/widgets/common/app_page_scaffold.dart
lib/presentation/widgets/common/app_toast.dart
lib/presentation/widgets/common/declarative_text_field.dart
lib/presentation/widgets/input_bar.dart
lib/presentation/widgets/markdown_parser.dart
lib/presentation/widgets/markdown_widget.dart
lib/presentation/widgets/message_bubble.dart
lib/presentation/widgets/thought_bubble.dart
linux/.gitignore
linux/CMakeLists.txt
linux/flutter/CMakeLists.txt
linux/flutter/generated_plugin_registrant.cc
linux/flutter/generated_plugin_registrant.h
linux/flutter/generated_plugins.cmake
linux/runner/CMakeLists.txt
linux/runner/main.cc
linux/runner/my_application.cc
linux/runner/my_application.h
macos/.gitignore
macos/Flutter/Flutter-Debug.xcconfig
macos/Flutter/Flutter-Release.xcconfig
macos/Flutter/GeneratedPluginRegistrant.swift
macos/Runner.xcodeproj/project.pbxproj
macos/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
macos/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme
macos/Runner.xcworkspace/contents.xcworkspacedata
macos/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
macos/Runner/AppDelegate.swift
macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_1024.png
macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_128.png
macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_16.png
macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_256.png
macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_32.png
macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_512.png
macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_64.png
macos/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json
macos/Runner/Base.lproj/MainMenu.xib
macos/Runner/Configs/AppInfo.xcconfig
macos/Runner/Configs/Debug.xcconfig
macos/Runner/Configs/Release.xcconfig
macos/Runner/Configs/Warnings.xcconfig
macos/Runner/DebugProfile.entitlements
macos/Runner/Info.plist
macos/Runner/MainFlutterWindow.swift
macos/Runner/Release.entitlements
macos/RunnerTests/RunnerTests.swift
pubspec.lock
pubspec.yaml
README.md
web/favicon.png
web/icons/Icon-192.png
web/icons/Icon-512.png
web/icons/Icon-maskable-192.png
web/icons/Icon-maskable-512.png
web/index.html
web/manifest.json
windows/.gitignore
windows/CMakeLists.txt
windows/flutter/CMakeLists.txt
windows/flutter/generated_plugin_registrant.cc
windows/flutter/generated_plugin_registrant.h
windows/flutter/generated_plugins.cmake
windows/runner/CMakeLists.txt
windows/runner/flutter_window.cpp
windows/runner/flutter_window.h
windows/runner/main.cpp
windows/runner/resource.h
windows/runner/resources/app_icon.ico
windows/runner/runner.exe.manifest
windows/runner/Runner.rc
windows/runner/utils.cpp
windows/runner/utils.h
windows/runner/win32_window.cpp
windows/runner/win32_window.h
```

# Files

## File: .gitignore
````
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.build/
.buildlog/
.history
.svn/
.swiftpm/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins-dependencies
.pub-cache/
.pub/
/build/
/coverage/

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release
````

## File: .metadata
````
# This file tracks properties of this Flutter project.
# Used by Flutter tool to assess capabilities and perform upgrades etc.
#
# This file should be version controlled and should not be manually edited.

version:
  revision: "ff37bef603469fb030f2b72995ab929ccfc227f0"
  channel: "stable"

project_type: app

# Tracks metadata for the flutter migrate command
migration:
  platforms:
    - platform: root
      create_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
      base_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
    - platform: android
      create_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
      base_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
    - platform: ios
      create_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
      base_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
    - platform: linux
      create_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
      base_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
    - platform: macos
      create_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
      base_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
    - platform: web
      create_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
      base_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
    - platform: windows
      create_revision: ff37bef603469fb030f2b72995ab929ccfc227f0
      base_revision: ff37bef603469fb030f2b72995ab929ccfc227f0

  # User provided section

  # List of Local paths (relative to this file) that should be
  # ignored by the migrate tool.
  #
  # Files that are not part of the templates will be ignored by default.
  unmanaged_files:
    - 'lib/main.dart'
    - 'ios/Runner.xcodeproj/project.pbxproj'
````

## File: 指令.md
````markdown
```
flutter run -d chrome
```
```
flutter build apk --debug
```
```
flutter run
```
```
flutter pub run build_runner build --delete-conflicting-outputs
```
```
npx repomix lib --ignore '**/*.g.dart' --ignore '**/*.freezed.dart' --style markdown -o flutter_lib_code.md
```


打包
```
git add .
```
```
git commit -m "update"
```
```
git push
```
恢复
```
git fetch origin
```
```
git reset --hard origin/main
```
```
git clean -fd
```
````

## File: analysis_options.yaml
````yaml
# This file configures the analyzer, which statically analyzes Dart code to
# check for errors, warnings, and lints.
#
# The issues identified by the analyzer are surfaced in the UI of Dart-enabled
# IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
# invoked from the command line by running `flutter analyze`.

# The following line activates a set of recommended lints for Flutter apps,
# packages, and plugins designed to encourage good coding practices.
include: package:flutter_lints/flutter.yaml

linter:
  # The lint rules applied to this project can be customized in the
  # section below to disable rules from the `package:flutter_lints/flutter.yaml`
  # included above or to enable additional rules. A list of all available lints
  # and their documentation is published at https://dart.dev/lints.
  #
  # Instead of disabling a lint rule for the entire project in the
  # section below, it can also be suppressed for a single line of code
  # or a specific dart file by using the `// ignore: name_of_lint` and
  # `// ignore_for_file: name_of_lint` syntax on the line or in the file
  # producing the lint.
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options
````

## File: android/.gitignore
````
gradle-wrapper.jar
/.gradle
/captures/
/gradlew
/gradlew.bat
/local.properties
GeneratedPluginRegistrant.java
.cxx/

# Remember to never publicly share your keystore.
# See https://flutter.dev/to/reference-keystore
key.properties
**/*.keystore
**/*.jks
````

## File: android/app/src/debug/AndroidManifest.xml
````xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- The INTERNET permission is required for development. Specifically,
         the Flutter tool needs it to communicate with the running application
         to allow setting breakpoints, to provide hot reload, etc.
    -->
    <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
````

## File: android/app/src/main/kotlin/com/example/aiservice/MainActivity.kt
````kotlin
package com.example.aiservice

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity()
````

## File: android/app/src/main/res/drawable-v21/launch_background.xml
````xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Modify this file to customize your launch splash screen -->
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="?android:colorBackground" />

    <!-- You can insert your own image assets here -->
    <!-- <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/launch_image" />
    </item> -->
</layer-list>
````

## File: android/app/src/main/res/drawable/launch_background.xml
````xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Modify this file to customize your launch splash screen -->
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@android:color/white" />

    <!-- You can insert your own image assets here -->
    <!-- <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/launch_image" />
    </item> -->
</layer-list>
````

## File: android/app/src/main/res/values-night/styles.xml
````xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Theme applied to the Android Window while the process is starting when the OS's Dark Mode setting is on -->
    <style name="LaunchTheme" parent="@android:style/Theme.Black.NoTitleBar">
        <!-- Show a splash screen on the activity. Automatically removed when
             the Flutter engine draws its first frame -->
        <item name="android:windowBackground">@drawable/launch_background</item>
    </style>
    <!-- Theme applied to the Android Window as soon as the process has started.
         This theme determines the color of the Android Window while your
         Flutter UI initializes, as well as behind your Flutter UI while its
         running.

         This Theme is only used starting with V2 of Flutter's Android embedding. -->
    <style name="NormalTheme" parent="@android:style/Theme.Black.NoTitleBar">
        <item name="android:windowBackground">?android:colorBackground</item>
    </style>
</resources>
````

## File: android/app/src/main/res/values/styles.xml
````xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Theme applied to the Android Window while the process is starting when the OS's Dark Mode setting is off -->
    <style name="LaunchTheme" parent="@android:style/Theme.Light.NoTitleBar">
        <!-- Show a splash screen on the activity. Automatically removed when
             the Flutter engine draws its first frame -->
        <item name="android:windowBackground">@drawable/launch_background</item>
    </style>
    <!-- Theme applied to the Android Window as soon as the process has started.
         This theme determines the color of the Android Window while your
         Flutter UI initializes, as well as behind your Flutter UI while its
         running.

         This Theme is only used starting with V2 of Flutter's Android embedding. -->
    <style name="NormalTheme" parent="@android:style/Theme.Light.NoTitleBar">
        <item name="android:windowBackground">?android:colorBackground</item>
    </style>
</resources>
````

## File: android/app/src/profile/AndroidManifest.xml
````xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- The INTERNET permission is required for development. Specifically,
         the Flutter tool needs it to communicate with the running application
         to allow setting breakpoints, to provide hot reload, etc.
    -->
    <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
````

## File: android/build/reports/problems/problems-report.html
````html
<!DOCTYPE html>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                    <style type="text/css">
                /*! normalize.css v7.0.0 | MIT License | github.com/necolas/normalize.css */
html {
    line-height: 1.15;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%
}

body {
    margin: 0
}

article, aside, footer, header, nav, section {
    display: block
}

h1 {
    font-size: 2em;
    margin: .67em 0
}

figcaption, figure, main {
    display: block
}

figure {
    margin: 1em 40px
}

hr {
    box-sizing: content-box;
    height: 0;
    overflow: visible
}

pre {
    font-family: monospace, monospace;
    font-size: 1em
}

a {
    background-color: transparent;
    -webkit-text-decoration-skip: objects
}

abbr[title] {
    border-bottom: none;
    text-decoration: underline;
    text-decoration: underline dotted
}

b, strong {
    font-weight: inherit
}

b, strong {
    font-weight: bolder
}

code, kbd, samp {
    font-family: monospace, monospace;
    font-size: 1em
}

dfn {
    font-style: italic
}

mark {
    background-color: #ff0;
    color: #000
}

small {
    font-size: 80%
}

sub, sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline
}

sub {
    bottom: -.25em
}

sup {
    top: -.5em
}

audio, video {
    display: inline-block
}

audio:not([controls]) {
    display: none;
    height: 0
}

img {
    border-style: none
}

svg:not(:root) {
    overflow: hidden
}

button, input, optgroup, select, textarea {
    font-family: sans-serif;
    font-size: 100%;
    line-height: 1.15;
    margin: 0
}

button, input {
    overflow: visible
}

button, select {
    text-transform: none
}

[type=reset], [type=submit], button, html [type=button] {
    -webkit-appearance: button
}

[type=button]::-moz-focus-inner, [type=reset]::-moz-focus-inner, [type=submit]::-moz-focus-inner, button::-moz-focus-inner {
    border-style: none;
    padding: 0
}

[type=button]:-moz-focusring, [type=reset]:-moz-focusring, [type=submit]:-moz-focusring, button:-moz-focusring {
    outline: 1px dotted ButtonText
}

fieldset {
    padding: .35em .75em .625em
}

legend {
    box-sizing: border-box;
    color: inherit;
    display: table;
    max-width: 100%;
    padding: 0;
    white-space: normal
}

progress {
    display: inline-block;
    vertical-align: baseline
}

textarea {
    overflow: auto
}

[type=checkbox], [type=radio] {
    box-sizing: border-box;
    padding: 0
}

[type=number]::-webkit-inner-spin-button, [type=number]::-webkit-outer-spin-button {
    height: auto
}

[type=search] {
    -webkit-appearance: textfield;
    outline-offset: -2px
}

[type=search]::-webkit-search-cancel-button, [type=search]::-webkit-search-decoration {
    -webkit-appearance: none
}

::-webkit-file-upload-button {
    -webkit-appearance: button;
    font: inherit
}

details, menu {
    display: block
}

summary {
    display: list-item
}

canvas {
    display: inline-block
}

template {
    display: none
}

[hidden] {
    display: none
}

/* configuration cache styles */

.report-wrapper {
    margin: 0;
    padding: 0 24px;
}

.gradle-logo {
    width: 32px;
    height: 24px;
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAYAAACbU/80AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAIKADAAQAAAABAAAAGAAAAAA915G0AAAD5klEQVRIDbVWC0xTZxT+emmhVUEeA1/ROh/tFAFFGK7oJisIKsNVoOwBbJPowEWHzikRxeiMRpwwjDWRBHQLIzOmiRhe22BT40TitiyaMBQFfMEeLMIEaSmk+/+rvd7be4no6Elu7n++c/5zzv845/wyOyG4iGyDgzCdNOPLM9W41n4bnmNUiHo5DNsz0hGsmcV6lbkyAOOWXJjrz4qWp1C4o3z/LqzWL4VcJB1FIHmZHn/f78a6pDcxbeIEfNvQiPwTZbDZBpC24zOEaGfDpTsgtZby6u+QlrubFWUY3nh6AH39/ahr/Bn1jZfxW3ML2js60dtvgbtcQVblj8CZM7A0PBSrol6Ft+c4KZ8iTB1nwN0//8IEP9/hA2i924Gir0/iq8oa/NvbJzLiDKiUSqTE6pGVbEBY4BxnsYAPSnwXTa3tLCZ5BF3dPdAkGNHzoFcwcaRMnC4CeZkZiAgKFE252nITC1Pew9Dj5GNEGgS4Rbb5eZ1Te7UXG6FLX4cV6zeh5kIDaDpSunL9Boyf5nLOpwT4Sx+BxWrFK8QAnTAapPRQwofcj86uLoG59cbVEOzA0NAQNh38Atn5RSjY8rFAmc/I3dyQvOx1PsSNVy7Roa3ajHDePbBYLSLn1MaGd5KFAXy07xAOl59C6elK+I73hIHcbGd6wXs8qkyH8FZcjLOI5X/9/TrOnLsAldJDUu4As1NToFFPe3IEpm/M2HigwCFnU6t4Zw6Ck1JhGRhgcXq5juXloKyqFnlHirmz5CaNcEAv59kSE9wVikcB3O78A/MSU0Fznk/H9+yAetJEnPr+B8RFLsLcGS8ia28+qQuX+WrPNNZOV+Nc6VH4+3iz89g0pEaLzRUiQ3LGDWsM8Qidq2WL0PGKKlgf74ZIeQTAfFJ6a44WIsDXh9OW/dPdY58aawC9KK6kpOgolO7JxViVSuBGXnvxksudZ5F0O5yzGYxMJnBOGaau4fnPU2RNAtCFBKFoa7akczaAptY2iWmjB33+yQa4kZwfjpi2ex3Dyf43vuAljWQ/4Btmei1WPj+q45hF4U+1J4fEizCEvNf0EWHoIW244sfzoN1RipaT2kDfdjfv3MNpojdISjmfIheE8Fnp8WR9vJ2Zr+O+bYUmO+kJ9KnIUtf9bnvY2x9wcqrrvnCJvfL8Tw4V9v9LU7PdKzJaoNdy645AR4ph1JMncZHRKrVvYyYY5kmP8iO1v2T3dk6HDtYmrgJtOnwKnaPFrg8z+BBX7QSgEyOPJfX9Qd9DFs40GgTOHbrBs2ch4bXFuEG2mmFkeD9hpUMk+NMXEe0TNtsg/Ly94DVurEAuxfwHC1WiVbe0U7MAAAAASUVORK5CYII=");
    background-size: contain;
}

.header {
    display: flex;
    flex-wrap: wrap;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    padding: 24px 24px 0 24px;
    background-color: white;
    z-index: 1;
}

.learn-more {
    margin-left: auto;
    align-self: center;
    font-size: 0.875rem;
    font-weight: normal;
}

.title {
    display: flex;
    align-items: center;
    padding: 18px 0 24px 0;
    flex: 1 0 100%;
}

.content {
    font-size: 0.875rem;
    padding: 240px 0 48px;
    overflow-x: auto;
    white-space: nowrap;
}

.content ol:first-of-type {
    margin: 0;
}

.tree-btn {
    cursor: pointer;
    display: inline-block;
    width: 16px;
    height: 16px;
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-top: -0.2em;
}

.tree-btn.collapsed {
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192 512"><path d="M166.9 264.5l-117.8 116c-4.7 4.7-12.3 4.7-17 0l-7.1-7.1c-4.7-4.7-4.7-12.3 0-17L127.3 256 25.1 155.6c-4.7-4.7-4.7-12.3 0-17l7.1-7.1c4.7-4.7 12.3-4.7 17 0l117.8 116c4.6 4.7 4.6 12.3-.1 17z" fill="%23999999" stroke="%23999999"/></svg>');
}

.tree-btn.expanded {
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><path d="M119.5 326.9L3.5 209.1c-4.7-4.7-4.7-12.3 0-17l7.1-7.1c4.7-4.7 12.3-4.7 17 0L128 287.3l100.4-102.2c4.7-4.7 12.3-4.7 17 0l7.1 7.1c4.7 4.7 4.7 12.3 0 17L136.5 327c-4.7 4.6-12.3 4.6-17-.1z" fill="%23999999" stroke="%23999999"/></svg>');
}

ul .tree-btn {
    margin-right: 3px;
}

.leaf-icon {
    display: inline-block;
    width: 16px;
    height: 16px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><path d="M32 256 H224" stroke="%23999999" stroke-width="48" stroke-linecap="round"/></svg>');
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-top: -0.2em;
}

.invisible-text {
    user-select: all; /* Allow the text to be selectable */
    color: transparent; /* Hide the text */
    text-indent: -9999px; /* Move the text out of view */
    position: relative;
    white-space: pre; /* Preserve meaningful whitespace in the invisible text for copying */
}

.text-for-copy {
    display: inline-block;
}

.enum-icon {
    display: inline-block;
    width: 16px;
    height: 16px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024"><circle cx="512" cy="512" r="200" /></svg>');
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-inline-start: 0.5ex;
    margin-inline-end: 0.5ex;
    margin-top: -0.2em;
}

.error-icon {
    display: inline-block;
    width: 16px;
    height: 16px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z" fill="%23FC461E" stroke="%23FC461E"/></svg>');
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-inline-start: 0.5ex;
    margin-inline-end: 0.5ex;
    margin-top: -0.2em;
}

.advice-icon {
    display: inline-block;
    width: 16px;
    height: 16px;
    background-image: url('data:image/svg+xml;utf8,<svg width="800px" height="800px" viewBox="-4.93 0 122.88 122.88" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  style="enable-background:new 0 0 113.01 122.88" xml:space="preserve"><g><path d="M44.13,102.06c-1.14,0.03-2.14-0.81-2.3-1.96c-0.17-1.2,0.64-2.31,1.82-2.54c-1.3-7.37-4.85-11.43-8.6-15.72 c-2.92-3.34-5.95-6.81-8.34-11.92c-2.35-5.03-3.64-10.23-3.6-15.63c0.05-5.4,1.42-10.96,4.4-16.71c0.02-0.04,0.04-0.07,0.06-0.11 l0,0c3.91-6.62,9.38-11.04,15.47-13.52c5.11-2.09,10.66-2.8,16.1-2.3c5.42,0.5,10.73,2.2,15.37,4.94 c5.9,3.49,10.75,8.67,13.42,15.21c1.44,3.54,2.42,7.49,2.54,11.82c0.12,4.31-0.62,8.96-2.61,13.88 c-2.66,6.59-6.18,10.68-9.47,14.51c-3.03,3.53-5.85,6.81-7.42,11.84c0.89,0.21,1.59,0.94,1.73,1.9c0.17,1.24-0.7,2.39-1.94,2.56 l-0.77,0.11c-0.14,1.09-0.23,2.26-0.27,3.51l0.25-0.04c1.24-0.17,2.39,0.7,2.56,1.94c0.17,1.24-0.7,2.39-1.94,2.56l-0.78,0.11 c0.01,0.15,0.02,0.3,0.03,0.45l0,0c0.07,0.88,0.08,1.73,0.03,2.54l0.13-0.02c1.25-0.15,2.38,0.74,2.54,1.98 c0.15,1.25-0.74,2.38-1.98,2.54l-1.68,0.21c-1.2,3.11-3.34,5.48-5.87,6.94c-1.74,1.01-3.67,1.59-5.61,1.71 c-1.97,0.12-3.96-0.25-5.78-1.13c-2.08-1.02-3.94-2.71-5.29-5.14c-0.65-0.33-1.13-0.97-1.23-1.75c-0.04-0.31-0.01-0.61,0.07-0.89 c-0.39-1.16-0.68-2.43-0.87-3.83l-0.07,0.01c-1.24,0.17-2.39-0.7-2.56-1.94c-0.17-1.24,0.7-2.39,1.94-2.56l0.54-0.08 C44.19,104.32,44.18,103.16,44.13,102.06L44.13,102.06z M2.18,58.86C1.01,58.89,0.04,57.98,0,56.81c-0.04-1.17,0.88-2.14,2.05-2.18 l8.7-0.3c1.17-0.04,2.14,0.88,2.18,2.05c0.04,1.17-0.88,2.14-2.05,2.18L2.18,58.86L2.18,58.86z M110.68,50.25 c1.16-0.12,2.2,0.73,2.32,1.89c0.12,1.16-0.73,2.2-1.89,2.32l-8.66,0.91c-1.16,0.12-2.2-0.73-2.32-1.89 c-0.12-1.16,0.73-2.2,1.89-2.32L110.68,50.25L110.68,50.25z M94.91,14.78c0.65-0.97,1.96-1.23,2.93-0.58 c0.97,0.65,1.23,1.96,0.58,2.93l-4.84,7.24c-0.65,0.97-1.96,1.23-2.93,0.58c-0.97-0.65-1.23-1.96-0.58-2.93L94.91,14.78 L94.91,14.78z M57.63,2.06c0.03-1.17,1-2.09,2.16-2.06c1.17,0.03,2.09,1,2.06,2.16l-0.22,8.7c-0.03,1.17-1,2.09-2.16,2.06 c-1.17-0.03-2.09-1-2.06-2.16L57.63,2.06L57.63,2.06z M13.88,15.53c-0.86-0.8-0.9-2.14-0.11-2.99c0.8-0.86,2.14-0.9,2.99-0.11 l6.37,5.94c0.86,0.8,0.9,2.14,0.11,2.99c-0.8,0.86-2.14,0.9-2.99,0.11L13.88,15.53L13.88,15.53z M47.88,96.95l18.49-2.63 c1.59-6.7,5.05-10.73,8.8-15.08c3.08-3.58,6.36-7.4,8.76-13.34c1.76-4.35,2.41-8.43,2.31-12.19c-0.1-3.75-0.96-7.21-2.24-10.34 c-2.3-5.63-6.51-10.11-11.65-13.15c-4.11-2.43-8.8-3.94-13.59-4.37c-4.77-0.44-9.64,0.19-14.13,2.02 c-5.26,2.15-9.99,5.97-13.39,11.72c-2.64,5.12-3.86,10.02-3.9,14.73c-0.04,4.74,1.11,9.33,3.2,13.8c2.13,4.56,4.97,7.8,7.69,10.92 C42.47,83.9,46.48,88.49,47.88,96.95L47.88,96.95z M65.62,99.02l-17.27,2.45c0.05,1.1,0.07,2.25,0.05,3.47l17.05-2.42 C65.47,101.29,65.52,100.12,65.62,99.02L65.62,99.02z M48.49,109.52c0.12,0.92,0.3,1.76,0.53,2.54l16.55-2.04 c0.11-0.86,0.13-1.77,0.05-2.74l0,0l0-0.02l-0.01-0.17L48.49,109.52L48.49,109.52z M51.37,116.36c0.64,0.67,1.35,1.19,2.1,1.55 c1.15,0.56,2.42,0.79,3.67,0.72c1.29-0.08,2.57-0.47,3.74-1.15c1.1-0.64,2.09-1.53,2.88-2.65L51.37,116.36L51.37,116.36z"/></g></svg>');
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-inline-start: 0.5ex;
    margin-inline-end: 0.5ex;
    margin-top: -0.2em;
}

.warning-icon {
    display: inline-block;
    width: 13px;
    height: 13px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z" fill="%23DEAD22" stroke="%23DEAD22"/></svg>');
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-inline-start: 0.3ex;
    margin-inline-end: 1.1ex;
    margin-top: -0.1em;
}

.documentation-button {
    cursor: pointer;
    display: inline-block;
    width: 13px;
    height: 13px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28zm7.67-24h-16c-6.627 0-12-5.373-12-12v-.381c0-70.343 77.44-63.619 77.44-107.408 0-20.016-17.761-40.211-57.44-40.211-29.144 0-44.265 9.649-59.211 28.692-3.908 4.98-11.054 5.995-16.248 2.376l-13.134-9.15c-5.625-3.919-6.86-11.771-2.645-17.177C185.658 133.514 210.842 116 255.67 116c52.32 0 97.44 29.751 97.44 80.211 0 67.414-77.44 63.849-77.44 107.408V304c0 6.627-5.373 12-12 12zM256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8z" fill="%23999999" stroke="%23999999"/></svg>');
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-inline-start: 0.5ex;
    margin-inline-end: 0.5ex;
    margin-top: -0.2em;
}

.documentation-button::selection {
    color: transparent;
}

.documentation-button:hover {
    color: transparent;
}

.copy-button {
    cursor: pointer;
    display: inline-block;
    width: 12px;
    height: 12px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M433.941 193.941l-51.882-51.882A48 48 0 0 0 348.118 128H320V80c0-26.51-21.49-48-48-48h-66.752C198.643 13.377 180.858 0 160 0s-38.643 13.377-45.248 32H48C21.49 32 0 53.49 0 80v288c0 26.51 21.49 48 48 48h80v48c0 26.51 21.49 48 48 48h224c26.51 0 48-21.49 48-48V227.882a48 48 0 0 0-14.059-33.941zm-22.627 22.627a15.888 15.888 0 0 1 4.195 7.432H352v-63.509a15.88 15.88 0 0 1 7.431 4.195l51.883 51.882zM160 30c9.941 0 18 8.059 18 18s-8.059 18-18 18-18-8.059-18-18 8.059-18 18-18zM48 384c-8.822 0-16-7.178-16-16V80c0-8.822 7.178-16 16-16h66.752c6.605 18.623 24.389 32 45.248 32s38.643-13.377 45.248-32H272c8.822 0 16 7.178 16 16v48H176c-26.51 0-48 21.49-48 48v208H48zm352 96H176c-8.822 0-16-7.178-16-16V176c0-8.822 7.178-16 16-16h144v72c0 13.2 10.8 24 24 24h72v208c0 8.822-7.178 16-16 16z" fill="%23999999" stroke="%23999999"/></svg>');
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    margin-inline-start: 0.5ex;
    margin-top: -0.2em;
}

.groups{
    display: flex;
    border-bottom: 1px solid #EDEEEF;
    flex: 1 0 100%;
}

.uncategorized {
    display: flex;
    border-top: 4px solid #EDEEEF;
    flex: 1 0 100%;
}

.group-selector {
    padding: 0 52px 24px 0;
    font-size: 0.9rem;
    font-weight: bold;
    color: #999999;
    cursor: pointer;
}

.group-selector__count {
    margin: 0 8px;
    border-radius: 8px;
    background-color: #999;
    color: #fff;
    padding: 1px 8px 2px;
    font-size: 0.75rem;
}

.group-selector--active {
    color: #02303A;
    cursor: auto;
}

.group-selector--active .group-selector__count {
    background-color: #686868;
}

.group-selector--disabled {
    cursor: not-allowed;
}

.accordion-header {
    cursor: pointer;
}

.container {
    padding-left: 0.5em;
    padding-right: 0.5em;
}

.stacktrace {
    border-radius: 4px;
    overflow-x: auto;
    padding: 0.5rem;
    margin-bottom: 0;
    min-width: 1000px;
}

/* Lato (bold, regular) */
@font-face {
    font-display: swap;
    font-family: Lato;
    font-weight: 500;
    font-style: normal;
    src: url("https://assets.gradle.com/lato/fonts/lato-semibold/lato-semibold.woff2") format("woff2"),
    url("https://assets.gradle.com/lato/fonts/lato-semibold/lato-semibold.woff") format("woff");
}

@font-face {
    font-display: swap;
    font-family: Lato;
    font-weight: bold;
    font-style: normal;
    src: url("https://assets.gradle.com/lato/fonts/lato-bold/lato-bold.woff2") format("woff2"),
    url("https://assets.gradle.com/lato/fonts/lato-bold/lato-bold.woff") format("woff");
}

* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

html,
body {
    margin: 0;
    padding: 0;
}

html {
    font-family: "Lato", "Helvetica Neue", Arial, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 1.5;
}

body {
    color: #02303A;
    background-color: #ffffff;
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
}


/* typography */
h1, h2, h3, h4, h5, h6 {
    color: #02303A;
    text-rendering: optimizeLegibility;
    margin: 0;
}

h1 {
    font-size: 1rem;
}

h2 {
    font-size: 0.9rem;
}

h3 {
    font-size: 1.125rem;
}

h4, h5, h6 {
    font-size: 0.875rem;
}

h1 code {
    font-weight: bold;
}

ul, ol, dl {
    list-style-position: outside;
    line-height: 1.6;
    padding: 0;
    margin: 0 0 0 20px;
    list-style-type: none;
}

li {
    line-height: 2;
}

a {
    color: #1DA2BD;
    text-decoration: none;
    transition: all 0.3s ease, visibility 0s;
}

a:hover {
    color: #35c1e4;
}

/* code */
code, pre {
    font-family: Inconsolata, Monaco, "Courier New", monospace;
    font-style: normal;
    font-variant-ligatures: normal;
    font-variant-caps: normal;
    font-variant-numeric: normal;
    font-variant-east-asian: normal;
    font-weight: normal;
    font-stretch: normal;
    color: #686868;
}

*:not(pre) > code {
    letter-spacing: 0;
    padding: 0.1em 0.5ex;
    text-rendering: optimizeSpeed;
    word-spacing: -0.15em;
    word-wrap: break-word;
}

pre {
    font-size: 0.75rem;
    line-height: 1.8;
    margin-top: 0;
    margin-bottom: 1.5em;
    padding: 1rem;
}

pre code {
    background-color: transparent;
    color: inherit;
    line-height: 1.8;
    font-size: 100%;
    padding: 0;
}

a code {
    color: #1BA8CB;
}

pre.code, pre.programlisting, pre.screen, pre.tt {
    background-color: #f7f7f8;
    border-radius: 4px;
    font-size: 1em;
    line-height: 1.45;
    margin-bottom: 1.25em;
    overflow-x: auto;
    padding: 1rem;
}

li em, p em {
    padding: 0 1px;
}

code em, tt em {
    text-decoration: none;
}

code + .copy-button {
    margin-inline-start: 0.2ex;
}

.java-exception {
    font-size: 0.75rem;
    padding-left: 24px;
}

.java-exception ul {
    margin: 0;
    line-height: inherit;
}

.java-exception code {
    white-space: pre;
}

.java-exception-part-toggle {
    user-select: none;
    cursor: pointer;
    border-radius: 2px;
    padding: 0.1em 0.2em;
    background: azure;
    color: #686868;
}

                </style>
    <!-- Inconsolata is used as a default monospace font in the report. -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" />

    <title>Gradle Configuration Cache</title>
</head>
<body>

<div id="playground"></div>

<div class="report" id="report">
    Loading...
</div>

<script type="text/javascript">
function configurationCacheProblems() { return (
// begin-report-data
{"diagnostics":[{"locations":[{}],"problem":[{"text":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"severity":"WARNING","problemDetails":[{"text":"This is scheduled to be removed in Gradle 10.0."}],"contextualLabel":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated.","documentationLink":"https://docs.gradle.org/8.14/userguide/upgrading_version_8.html#groovy_space_assignment_syntax","problemId":[{"name":"deprecation","displayName":"Deprecation"},{"name":"properties-should-be-assigned-using-the-propname-value-syntax-setting-a-property-via-the-gradle-generated-propname-value-or-propname-value-syntax-in-groovy-dsl","displayName":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"solutions":[[{"text":"Use assignment ('group = <value>') instead."}]]},{"locations":[{}],"problem":[{"text":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"severity":"WARNING","problemDetails":[{"text":"This is scheduled to be removed in Gradle 10.0."}],"contextualLabel":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated.","documentationLink":"https://docs.gradle.org/8.14/userguide/upgrading_version_8.html#groovy_space_assignment_syntax","problemId":[{"name":"deprecation","displayName":"Deprecation"},{"name":"properties-should-be-assigned-using-the-propname-value-syntax-setting-a-property-via-the-gradle-generated-propname-value-or-propname-value-syntax-in-groovy-dsl","displayName":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"solutions":[[{"text":"Use assignment ('version = <value>') instead."}]]},{"locations":[{}],"problem":[{"text":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"severity":"WARNING","problemDetails":[{"text":"This is scheduled to be removed in Gradle 10.0."}],"contextualLabel":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated.","documentationLink":"https://docs.gradle.org/8.14/userguide/upgrading_version_8.html#groovy_space_assignment_syntax","problemId":[{"name":"deprecation","displayName":"Deprecation"},{"name":"properties-should-be-assigned-using-the-propname-value-syntax-setting-a-property-via-the-gradle-generated-propname-value-or-propname-value-syntax-in-groovy-dsl","displayName":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"solutions":[[{"text":"Use assignment ('namespace = <value>') instead."}]]},{"locations":[{}],"problem":[{"text":"The RepositoryHandler.jcenter() method has been deprecated."}],"severity":"WARNING","problemDetails":[{"text":"This is scheduled to be removed in Gradle 9.0."}],"contextualLabel":"The RepositoryHandler.jcenter() method has been deprecated.","documentationLink":"https://docs.gradle.org/8.14/userguide/upgrading_version_6.html#jcenter_deprecation","problemId":[{"name":"deprecation","displayName":"Deprecation"},{"name":"repository-jcenter","displayName":"The RepositoryHandler.jcenter() method has been deprecated."}],"solutions":[[{"text":"JFrog announced JCenter's sunset in February 2021. Use mavenCentral() instead."}]]},{"locations":[{}],"problem":[{"text":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"severity":"WARNING","problemDetails":[{"text":"This is scheduled to be removed in Gradle 10.0."}],"contextualLabel":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated.","documentationLink":"https://docs.gradle.org/8.14/userguide/upgrading_version_8.html#groovy_space_assignment_syntax","problemId":[{"name":"deprecation","displayName":"Deprecation"},{"name":"properties-should-be-assigned-using-the-propname-value-syntax-setting-a-property-via-the-gradle-generated-propname-value-or-propname-value-syntax-in-groovy-dsl","displayName":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"solutions":[[{"text":"Use assignment ('group = <value>') instead."}]]},{"locations":[{}],"problem":[{"text":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"severity":"WARNING","problemDetails":[{"text":"This is scheduled to be removed in Gradle 10.0."}],"contextualLabel":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated.","documentationLink":"https://docs.gradle.org/8.14/userguide/upgrading_version_8.html#groovy_space_assignment_syntax","problemId":[{"name":"deprecation","displayName":"Deprecation"},{"name":"properties-should-be-assigned-using-the-propname-value-syntax-setting-a-property-via-the-gradle-generated-propname-value-or-propname-value-syntax-in-groovy-dsl","displayName":"Properties should be assigned using the 'propName = value' syntax. Setting a property via the Gradle-generated 'propName value' or 'propName(value)' syntax in Groovy DSL has been deprecated."}],"solutions":[[{"text":"Use assignment ('version = <value>') instead."}]]},{"locations":[{}],"problem":[{"text":"The RepositoryHandler.jcenter() method has been deprecated."}],"severity":"WARNING","problemDetails":[{"text":"This is scheduled to be removed in Gradle 9.0."}],"contextualLabel":"The RepositoryHandler.jcenter() method has been deprecated.","documentationLink":"https://docs.gradle.org/8.14/userguide/upgrading_version_6.html#jcenter_deprecation","problemId":[{"name":"deprecation","displayName":"Deprecation"},{"name":"repository-jcenter","displayName":"The RepositoryHandler.jcenter() method has been deprecated."}],"solutions":[[{"text":"JFrog announced JCenter's sunset in February 2021. Use mavenCentral() instead."}]]}],"problemsReport":{"totalProblemCount":7,"buildName":"android","requestedTasks":"assembleDebug","documentationLink":"https://docs.gradle.org/8.14/userguide/reporting_problems.html","documentationLinkCaption":"Problem report","summaries":[]}}
// end-report-data
);}
</script>
                <script type="text/javascript">
                !function(n,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["configuration-cache-report"]=t():n["configuration-cache-report"]=t()}(this,(()=>(({70:function(){void 0===ArrayBuffer.isView&&(ArrayBuffer.isView=function(n){return null!=n&&null!=n.__proto__&&n.__proto__.__proto__===Int8Array.prototype.__proto__}),void 0===Math.imul&&(Math.imul=function(n,t){return(4294901760&n)*(65535&t)+(65535&n)*(0|t)|0}),this["configuration-cache-report"]=function(n){"use strict";var t,r,i,e,u,o,f,s,c,a,h,l,_,v,d,g,w,b,p,m,k,q,y,B,C,x,j,P,I,S,z,T,E,L,N,A,M,F,D,O,R,H,$,G,U,V,Q,Z,Y,W,K,X,J,nn,tn,rn,en,un,on,fn,sn,cn,an,hn,ln,_n,vn,dn,gn,wn,bn,pn,mn,kn,qn,yn,Bn,Cn,xn,jn,Pn,In,Sn,zn,Tn,En,Ln,Nn,An,Mn=Math.imul,Fn=ArrayBuffer.isView;function Dn(n,t){if(!(t>=0))throw _u(ce("Requested element count "+t+" is less than zero."));return function(n,t){if(!(t>=0))throw _u(ce("Requested element count "+t+" is less than zero."));if(0===t)return Ct();if(t>=n.length)return function(n){switch(n.length){case 0:return Ct();case 1:return qr(n[0]);default:return function(n){return Hr(function(n){return new It(n,!1)}(n))}(n)}}(n);if(1===t)return qr(n[0]);var r=0,i=Rr(),e=0,u=n.length;n:for(;e<u;){var o=n[e];if(e=e+1|0,i.d(o),(r=r+1|0)===t)break n}return i}(n,rt(n.length-t|0,0))}function On(n,t,r,i,e,u,o){return t=t===A?", ":t,r=r===A?"":r,i=i===A?"":i,e=e===A?-1:e,u=u===A?"...":u,o=o===A?null:o,function(n,t,r,i,e,u,o,f){r=r===A?", ":r,i=i===A?"":i,e=e===A?"":e,u=u===A?-1:u,o=o===A?"...":o,f=f===A?null:f,t.e(i);var s=0,c=0,a=n.length;n:for(;c<a;){var h=n[c];if(c=c+1|0,(s=s+1|0)>1&&t.e(r),!(u<0||s<=u))break n;Jt(t,h,f)}return u>=0&&s>u&&t.e(o),t.e(e),t}(n,Bi(),t,r,i,e,u,o).toString()}function Rn(n){return n.length-1|0}function Hn(n,t){if(null==t){var r=0,i=n.length-1|0;if(r<=i)do{var e=r;if(r=r+1|0,null==n[e])return e}while(r<=i)}else{var u=0,o=n.length-1|0;if(u<=o)do{var f=u;if(u=u+1|0,le(t,n[f]))return f}while(u<=o)}return-1}function $n(n,t,r,i,e,u,o){return t=t===A?", ":t,r=r===A?"":r,i=i===A?"":i,e=e===A?-1:e,u=u===A?"...":u,o=o===A?null:o,Gn(n,Bi(),t,r,i,e,u,o).toString()}function Gn(n,t,r,i,e,u,o,f){r=r===A?", ":r,i=i===A?"":i,e=e===A?"":e,u=u===A?-1:u,o=o===A?"...":o,f=f===A?null:f,t.e(i);var s=0,c=n.f();n:for(;c.g();){var a=c.h();if((s=s+1|0)>1&&t.e(r),!(u<0||s<=u))break n;Jt(t,a,f)}return u>=0&&s>u&&t.e(o),t.e(e),t}function Un(n){if(n.i())throw xu("List is empty.");return n.j(0)}function Vn(n){return new tt(n)}function Qn(n){if(Ke(n,Di)){var t;switch(n.k()){case 0:t=Ct();break;case 1:t=qr(Ke(n,Fi)?n.j(0):n.f().h());break;default:t=Zn(n)}return t}return xt(Xn(n))}function Zn(n){return Hr(n)}function Yn(n){if(Ke(n,Di)&&n.k()<=1)return Qn(n);var t=Xn(n);return function(n){var t=(n.k()/2|0)-1|0;if(t<0)return br();var r=jt(n),i=0;if(i<=t)do{var e=i;i=i+1|0;var u=n.j(e);n.f4(e,n.j(r)),n.f4(r,u),r=r-1|0}while(e!==t)}(t),t}function Wn(n,t){if(!(t>=0))throw _u(ce("Requested element count "+t+" is less than zero."));return function(n,t){if(!(t>=0))throw _u(ce("Requested element count "+t+" is less than zero."));if(0===t)return Ct();if(Ke(n,Di)){if(t>=n.k())return Qn(n);if(1===t)return qr(function(n){if(Ke(n,Fi))return Un(n);var t=n.f();if(!t.g())throw xu("Collection is empty.");return t.h()}(n))}var r=0,i=Rr(),e=n.f();n:for(;e.g();){var u=e.h();if(i.d(u),(r=r+1|0)===t)break n}return xt(i)}(n,rt(n.k()-t|0,0))}function Kn(n,t){if(!(t>=0))throw _u(ce("Requested element count "+t+" is less than zero."));if(0===t)return Ct();var r=n.k();if(t>=r)return Qn(n);if(1===t)return qr(Jn(n));var i=Rr();if(Ke(n,bi)){var e=r-t|0;if(e<r)do{var u=e;e=e+1|0,i.d(n.j(u))}while(e<r)}else for(var o=n.l(r-t|0);o.g();){var f=o.h();i.d(f)}return i}function Xn(n){return Ke(n,Di)?Zn(n):nt(n,Or())}function Jn(n){if(n.i())throw xu("List is empty.");return n.j(jt(n))}function nt(n,t){for(var r=n.f();r.g();){var i=r.h();t.d(i)}return t}function tt(n){this.n_1=n}function rt(n,t){return n<t?t:n}function it(n,t){return n>t?t:n}function et(n,t){return Kt().q(n,t,-1)}function ut(n,t){return new Ft(n,t)}function ot(n){var t=n.f();if(!t.g())return Ct();var r=t.h();if(!t.g())return qr(r);var i=Or();for(i.d(r);t.g();)i.d(t.h());return i}function ft(n){this.r_1=n}function st(n,t){this.s_1=n,this.t_1=t}function ct(){}function at(n){this.x_1=n,this.w_1=0}function ht(n,t){this.a1_1=n,at.call(this,n),_t().b1(t,this.a1_1.k()),this.w_1=t}function lt(){t=this}function _t(){return null==t&&new lt,t}function vt(){_t(),ct.call(this)}function dt(n){this.h1_1=n}function gt(n,t){return t===n?"(this Map)":Vi(t)}function wt(n,t){var r;n:{for(var i=n.o().f();i.g();){var e=i.h();if(le(e.j1(),t)){r=e;break n}}r=null}return r}function bt(){r=this}function pt(){return null==r&&new bt,r}function mt(n){this.q1_1=n,ct.call(this)}function kt(){pt(),this.n1_1=null,this.o1_1=null}function qt(){i=this}function yt(){return null==i&&new qt,i}function Bt(n){return n.length>0?ou(n):Ct()}function Ct(){return null==e&&new Pt,e}function xt(n){switch(n.k()){case 0:return Ct();case 1:return qr(n.j(0));default:return n}}function jt(n){return n.k()-1|0}function Pt(){e=this,this.z1_1=new ke(-1478467534,-1720727600)}function It(n,t){this.b2_1=n,this.c2_1=t}function St(){u=this}function zt(){return null==u&&new St,u}function Tt(n,t){return Ke(n,Di)?n.k():t}function Et(n,t){if(Ke(t,Di))return n.m(t);for(var r=!1,i=t.f();i.g();){var e=i.h();n.d(e)&&(r=!0)}return r}function Lt(){}function Nt(n,t){this.h2_1=n,this.g2_1=n.i2_1.l(function(n,t){if(!(0<=t&&t<=n.k()))throw du("Position index "+t+" must be in range ["+Ve(0,n.k())+"].");return n.k()-t|0}(n,t))}function At(n){vt.call(this),this.i2_1=n}function Mt(n){this.k2_1=n,this.j2_1=n.l2_1.f()}function Ft(n,t){this.l2_1=n,this.m2_1=t}function Dt(n){for(;n.n2_1.g();){var t=n.n2_1.h();if(n.q2_1.t2_1(t)===n.q2_1.s2_1)return n.p2_1=t,n.o2_1=1,br()}n.o2_1=0}function Ot(n){this.q2_1=n,this.n2_1=n.r2_1.f(),this.o2_1=-1,this.p2_1=null}function Rt(n,t,r){t=t===A||t,this.r2_1=n,this.s2_1=t,this.t2_1=r}function Ht(){return null==o&&new $t,o}function $t(){o=this,this.u2_1=new ke(1993859828,793161749)}function Gt(n,t,r){return Ut(Ut(n,r)-Ut(t,r)|0,r)}function Ut(n,t){var r=n%t|0;return r>=0?r:r+t|0}function Vt(){f=this,this.p_1=new Zt(1,0)}function Qt(){return null==f&&new Vt,f}function Zt(n,t){Qt(),Xt.call(this,n,t,1)}function Yt(n,t,r){Lt.call(this),this.d3_1=r,this.e3_1=t,this.f3_1=this.d3_1>0?n<=t:n>=t,this.g3_1=this.f3_1?n:this.e3_1}function Wt(){s=this}function Kt(){return null==s&&new Wt,s}function Xt(n,t,r){if(Kt(),0===r)throw _u("Step must be non-zero.");if(r===mr().MIN_VALUE)throw _u("Step must be greater than Int.MIN_VALUE to avoid overflow on negation.");this.z2_1=n,this.a3_1=function(n,t,r){var i;if(r>0)i=n>=t?t:t-Gt(t,n,r)|0;else{if(!(r<0))throw _u("Step is zero.");i=n<=t?t:t+Gt(n,t,0|-r)|0}return i}(n,t,r),this.b3_1=r}function Jt(n,t,r){null!=r?n.e(r(t)):null==t||nu(t)?n.e(t):t instanceof Mi?n.i3(t.h3_1):n.e(Vi(t))}function nr(n,t,r){if(n===t)return!0;if(!(r=r!==A&&r))return!1;var i=xi(n),e=xi(t);return i===e||le(new Mi(ne(Li(i).toLowerCase(),0)),new Mi(ne(Li(e).toLowerCase(),0)))}function tr(n){return re(n)-1|0}function rr(n,t,r,i){return r=r===A?0:r,(i=i!==A&&i)||"string"!=typeof n?ir(n,t,r,re(n),i):n.indexOf(t,r)}function ir(n,t,r,i,e,u){var o=(u=u!==A&&u)?et(it(r,tr(n)),rt(i,0)):Ve(rt(r,0),it(i,re(n)));if("string"==typeof n&&"string"==typeof t){var f=o.z2_1,s=o.a3_1,c=o.b3_1;if(c>0&&f<=s||c<0&&s<=f)do{var a=f;if(f=f+c|0,Ti(t,0,n,a,re(t),e))return a}while(a!==s)}else{var h=o.z2_1,l=o.a3_1,_=o.b3_1;if(_>0&&h<=l||_<0&&l<=h)do{var v=h;if(h=h+_|0,fr(t,0,n,v,re(t),e))return v}while(v!==l)}return-1}function er(n){var t=0,r=re(n)-1|0,i=!1;n:for(;t<=r;){var e=ji(ne(n,i?r:t));if(i){if(!e)break n;r=r-1|0}else e?t=t+1|0:i=!0}return ie(n,t,r+1|0)}function ur(n,t){return ce(ie(n,t.y2(),t.c3()+1|0))}function or(n,t,r,i,e){r=r===A?0:r,i=i!==A&&i,sr(e=e===A?0:e);var u,o,f=ou(t);return new hr(n,r,e,(u=f,o=i,function(n,t){var r=function(n,t,r,i){if(!i&&1===t.k()){var e=function(n){if(Ke(n,Fi))return function(n){var t;switch(n.k()){case 0:throw xu("List is empty.");case 1:t=n.j(0);break;default:throw _u("List has more than one element.")}return t}(n);var t=n.f();if(!t.g())throw xu("Collection is empty.");var r=t.h();if(t.g())throw _u("Collection has more than one element.");return r}(t),u=rr(n,e,r);return u<0?null:_r(u,e)}var o=Ve(rt(r,0),re(n));if("string"==typeof n){var f=o.z2_1,s=o.a3_1,c=o.b3_1;if(c>0&&f<=s||c<0&&s<=f)do{var a,h=f;f=f+c|0;n:{for(var l=t.f();l.g();){var _=l.h();if(Ti(_,0,n,h,_.length,i)){a=_;break n}}a=null}if(null!=a)return _r(h,a)}while(h!==s)}else{var v=o.z2_1,d=o.a3_1,g=o.b3_1;if(g>0&&v<=d||g<0&&d<=v)do{var w,b=v;v=v+g|0;n:{for(var p=t.f();p.g();){var m=p.h();if(fr(m,0,n,b,m.length,i)){w=m;break n}}w=null}if(null!=w)return _r(b,w)}while(b!==d)}return null}(n,u,t,o);return null==r?null:_r(r.t3_1,r.u3_1.length)}))}function fr(n,t,r,i,e,u){if(i<0||t<0||t>(re(n)-e|0)||i>(re(r)-e|0))return!1;var o=0;if(o<e)do{var f=o;if(o=o+1|0,!nr(ne(n,t+f|0),ne(r,i+f|0),u))return!1}while(o<e);return!0}function sr(n){if(!(n>=0))throw _u(ce("Limit must be non-negative, but was "+n))}function cr(n){if(n.l3_1<0)n.j3_1=0,n.m3_1=null;else{var t;if(n.o3_1.r3_1>0?(n.n3_1=n.n3_1+1|0,t=n.n3_1>=n.o3_1.r3_1):t=!1,t||n.l3_1>re(n.o3_1.p3_1))n.m3_1=Ve(n.k3_1,tr(n.o3_1.p3_1)),n.l3_1=-1;else{var r=n.o3_1.s3_1(n.o3_1.p3_1,n.l3_1);if(null==r)n.m3_1=Ve(n.k3_1,tr(n.o3_1.p3_1)),n.l3_1=-1;else{var i=r.v3(),e=r.w3();n.m3_1=function(n,t){return t<=mr().MIN_VALUE?Qt().p_1:Ve(n,t-1|0)}(n.k3_1,i),n.k3_1=i+e|0,n.l3_1=n.k3_1+(0===e?1:0)|0}}n.j3_1=1}}function ar(n){this.o3_1=n,this.j3_1=-1,this.k3_1=function(n,t,r){if(0>r)throw _u("Cannot coerce value to an empty range: maximum "+r+" is less than minimum 0.");return n<0?0:n>r?r:n}(n.q3_1,0,re(n.p3_1)),this.l3_1=this.k3_1,this.m3_1=null,this.n3_1=0}function hr(n,t,r,i){this.p3_1=n,this.q3_1=t,this.r3_1=r,this.s3_1=i}function lr(n,t){this.t3_1=n,this.u3_1=t}function _r(n,t){return new lr(n,t)}function vr(){}function dr(){}function gr(){}function wr(){c=this}function br(){return null==c&&new wr,c}function pr(){a=this,this.MIN_VALUE=-2147483648,this.MAX_VALUE=2147483647,this.SIZE_BYTES=4,this.SIZE_BITS=32}function mr(){return null==a&&new pr,a}function kr(n){for(var t=[],r=n.f();r.g();)t.push(r.h());return t}function qr(n){return 0===(t=[n]).length?Or():Hr(new It(t,!0));var t}function yr(n){return n<0&&function(){throw Pu("Index overflow has happened.")}(),n}function Br(n){return void 0!==n.toArray?n.toArray():kr(n)}function Cr(n){return function(n,t){for(var r=0,i=n.length;r<i;){var e=n[r];r=r+1|0,t.d(e)}return t}(t=[n],(r=t.length,i=de(ve(ni)),function(n,t,r){Mr.call(r),ni.call(r),r.y5_1=function(n){return Kr(n,0,de(ve(Xr)))}(n)}(r,0,i),i));var t,r,i}function xr(){ct.call(this)}function jr(n){this.j4_1=n,this.h4_1=0,this.i4_1=-1}function Pr(n,t){this.n4_1=n,jr.call(this,n),_t().b1(t,this.n4_1.k()),this.h4_1=t}function Ir(){xr.call(this),this.o4_1=0}function Sr(n){this.r4_1=n}function zr(n){this.s4_1=n}function Tr(n,t){this.t4_1=n,this.u4_1=t}function Er(){Mr.call(this)}function Lr(n){this.x4_1=n,Mr.call(this)}function Nr(n){this.e5_1=n,xr.call(this)}function Ar(){kt.call(this),this.c5_1=null,this.d5_1=null}function Mr(){xr.call(this)}function Fr(){h=this;var n=Rr();n.c_1=!0,this.i5_1=n}function Dr(){return null==h&&new Fr,h}function Or(){return n=de(ve(Gr)),t=[],Gr.call(n,t),n;var n,t}function Rr(n){return t=de(ve(Gr)),r=[],Gr.call(t,r),t;var t,r}function Hr(n){return function(n,t){var r;return r=Br(n),Gr.call(t,r),t}(n,de(ve(Gr)))}function $r(n,t){return _t().e1(t,n.k()),t}function Gr(n){Dr(),Ir.call(this),this.b_1=n,this.c_1=!1}function Ur(n,t,r,i,e){if(r===i)return n;var u=(r+i|0)/2|0,o=Ur(n,t,r,u,e),f=Ur(n,t,u+1|0,i,e),s=o===t?n:t,c=r,a=u+1|0,h=r;if(h<=i)do{var l=h;if(h=h+1|0,c<=u&&a<=i){var _=o[c],v=f[a];e.compare(_,v)<=0?(s[l]=_,c=c+1|0):(s[l]=v,a=a+1|0)}else c<=u?(s[l]=o[c],c=c+1|0):(s[l]=f[a],a=a+1|0)}while(l!==i);return s}function Vr(n,t){return(3&n)-(3&t)|0}function Qr(){_=this}function Zr(n){this.n5_1=n,Er.call(this)}function Yr(n){return function(n,t){Ar.call(t),Xr.call(t),t.t5_1=n,t.u5_1=n.w5()}(new ui((null==_&&new Qr,_)),n),n}function Wr(){return Yr(de(ve(Xr)))}function Kr(n,t,r){if(Yr(r),!(n>=0))throw _u(ce("Negative initial capacity: "+n));if(!(t>=0))throw _u(ce("Non-positive load factor: "+t));return r}function Xr(){this.v5_1=null}function Jr(n,t){return Mr.call(t),ni.call(t),t.y5_1=n,t}function ni(){}function ti(n,t){var r=ii(n,n.h6_1.m5(t));if(null==r)return null;var i=r;if(null!=i&&Xe(i))return ri(i,n,t);var e=i;return n.h6_1.l5(e.j1(),t)?e:null}function ri(n,t,r){var i;n:{for(var e=0,u=n.length;e<u;){var o=n[e];if(e=e+1|0,t.h6_1.l5(o.j1(),r)){i=o;break n}}i=null}return i}function ii(n,t){var r=n.i6_1[t];return void 0===r?null:r}function ei(n){this.g6_1=n,this.z5_1=-1,this.a6_1=Object.keys(n.i6_1),this.b6_1=-1,this.c6_1=null,this.d6_1=!1,this.e6_1=-1,this.f6_1=null}function ui(n){this.h6_1=n,this.i6_1=this.k6(),this.j6_1=0}function oi(){}function fi(n){this.n6_1=n,this.l6_1=null,this.m6_1=null,this.m6_1=this.n6_1.y6_1.v6_1}function si(){v=this;var n,t=(_i(0,0,n=de(ve(vi))),n);t.x6_1=!0,this.e7_1=t}function ci(){return null==v&&new si,v}function ai(n,t,r){this.d7_1=n,Tr.call(this,t,r),this.b7_1=null,this.c7_1=null}function hi(n){this.y6_1=n,Er.call(this)}function li(){return Yr(n=de(ve(vi))),vi.call(n),n.w6_1=Wr(),n;var n}function _i(n,t,r){return Kr(n,t,r),vi.call(r),r.w6_1=Wr(),r}function vi(){ci(),this.v6_1=null,this.x6_1=!1}function di(){d=this;var n=gi(0),t=n.y5_1;(t instanceof vi?t:pe()).j5(),this.f7_1=n}function gi(n){return function(n,t){return function(n,t,r){Jr(function(n,t){return _i(n,t,de(ve(vi)))}(n,t),r),wi.call(r)}(n,0,t),t}(n,de(ve(wi)))}function wi(){null==d&&new di}function bi(){}function pi(){}function mi(n){pi.call(this),this.k7_1=n}function ki(){qi.call(this)}function qi(){pi.call(this),this.m7_1=""}function yi(){if(!w){w=!0;var n="undefined"!=typeof process&&process.versions&&!!process.versions.node;g=n?new mi(process.stdout):new ki}}function Bi(){return n=de(ve(Ci)),Ci.call(n,""),n;var n}function Ci(n){this.o7_1=void 0!==n?n:""}function xi(n){var t=Li(n).toUpperCase();return t.length>1?n:ne(t,0)}function ji(n){return function(n){return 9<=n&&n<=13||28<=n&&n<=32||160===n||n>4096&&(5760===n||8192<=n&&n<=8202||8232===n||8233===n||8239===n||8287===n||12288===n)}(n)}function Pi(){b=this,this.q7_1=new RegExp("[\\\\^$*+?.()|[\\]{}]","g"),this.r7_1=new RegExp("[\\\\$]","g"),this.s7_1=new RegExp("\\$","g")}function Ii(){return null==b&&new Pi,b}function Si(n,t){Ii(),this.v7_1=n,this.w7_1=function(n){if(Ke(n,Di)){var t;switch(n.k()){case 0:t=Ht();break;case 1:t=Cr(Ke(n,Fi)?n.j(0):n.f().h());break;default:t=nt(n,gi(n.k()))}return t}return function(n){switch(n.k()){case 0:return Ht();case 1:return Cr(n.f().h());default:return n}}(nt(n,(r=de(ve(wi)),Jr(li(),r),wi.call(r),r)));var r}(t),this.x7_1=new RegExp(n,$n(t,"","gu",A,A,A,zi)),this.y7_1=null,this.z7_1=null}function zi(n){return n.d8_1}function Ti(n,t,r,i,e,u){return fr(n,t,r,i,e,u=u!==A&&u)}function Ei(n,t){return n-t|0}function Li(n){return String.fromCharCode(n)}function Ni(){p=this,this.e8_1=0,this.f8_1=65535,this.g8_1=55296,this.h8_1=56319,this.i8_1=56320,this.j8_1=57343,this.k8_1=55296,this.l8_1=57343,this.m8_1=2,this.n8_1=16}function Ai(){return null==p&&new Ni,p}function Mi(n){Ai(),this.h3_1=n}function Fi(){}function Di(){}function Oi(){}function Ri(){}function Hi(){}function $i(){}function Gi(){m=this}function Ui(n,t){null==m&&new Gi,this.p8_1=n,this.q8_1=t}function Vi(n){var t=null==n?null:ce(n);return null==t?"null":t}function Qi(n){return new Zi(n)}function Zi(n){this.t8_1=n,this.s8_1=0}function Yi(){return Ji(),k}function Wi(){return Ji(),q}function Ki(){return Ji(),y}function Xi(){return Ji(),B}function Ji(){x||(x=!0,k=new ArrayBuffer(8),q=new Float64Array(Yi()),new Float32Array(Yi()),y=new Int32Array(Yi()),Wi()[0]=-1,B=0!==Ki()[0]?1:0,C=1-Xi()|0)}function ne(n,t){var r;if(te(n)){var i,e=n.charCodeAt(t);if(Ai(),e<0?i=!0:(Ai(),i=e>65535),i)throw _u("Invalid Char code: "+e);r=Ue(e)}else r=n.y3(t);return r}function te(n){return"string"==typeof n}function re(n){return te(n)?n.length:n.x3()}function ie(n,t,r){return te(n)?n.substring(t,r):n.z3(t,r)}function ee(n){return ce(n)}function ue(n,t){var r;switch(typeof n){case"number":r="number"==typeof t?oe(n,t):t instanceof ke?oe(n,t.w8()):fe(n,t);break;case"string":case"boolean":r=fe(n,t);break;default:r=function(n,t){return n.a4(t)}(n,t)}return r}function oe(n,t){var r;if(n<t)r=-1;else if(n>t)r=1;else if(n===t){var i;if(0!==n)i=0;else{var e=1/n;i=e===1/t?0:e<0?-1:1}r=i}else r=n!=n?t!=t?0:1:-1;return r}function fe(n,t){return n<t?-1:n>t?1:0}function se(n){if(!("kotlinHashCodeValue$"in n)){var t=4294967296*Math.random()|0,r=new Object;r.value=t,r.enumerable=!1,Object.defineProperty(n,"kotlinHashCodeValue$",r)}return n.kotlinHashCodeValue$}function ce(n){return null==n?"null":function(n){return!!Ye(n)||Fn(n)}(n)?"[...]":n.toString()}function ae(n){if(null==n)return 0;var t;switch(typeof n){case"object":t="function"==typeof n.hashCode?n.hashCode():se(n);break;case"function":t=se(n);break;case"number":t=function(n){return Ji(),(0|n)===n?Ge(n):(Wi()[0]=n,Mn(Ki()[(Ji(),C)],31)+Ki()[Xi()]|0)}(n);break;case"boolean":t=n?1:0;break;default:t=he(String(n))}return t}function he(n){var t=0,r=0,i=n.length-1|0;if(r<=i)do{var e=r;r=r+1|0;var u=n.charCodeAt(e);t=Mn(t,31)+u|0}while(e!==i);return t}function le(n,t){return null==n?null==t:null!=t&&("object"==typeof n&&"function"==typeof n.equals?n.equals(t):n!=n?t!=t:"number"==typeof n&&"number"==typeof t?n===t&&(0!==n||1/n==1/t):n===t)}function _e(n,t){null!=Error.captureStackTrace?Error.captureStackTrace(n,t):n.stack=(new Error).stack}function ve(n){return n.prototype}function de(n){return Object.create(n)}function ge(n,t,r){Error.call(n),function(n,t,r){var i=eu(Object.getPrototypeOf(n));if(!(1&i)){var e;if(null==t){var u;if(null!==t){var o=null==r?null:r.toString();u=null==o?A:o}else u=A;e=u}else e=t;n.message=e}2&i||(n.cause=r),n.name=Object.getPrototypeOf(n).constructor.name}(n,t,r)}function we(n){var t;return null==n?function(){throw Eu()}():t=n,t}function be(){throw Nu()}function pe(){throw Mu()}function me(){j=this,this.x8_1=new ke(0,-2147483648),this.y8_1=new ke(-1,2147483647),this.z8_1=8,this.a9_1=64}function ke(n,t){null==j&&new me,gr.call(this),this.u8_1=n,this.v8_1=t}function qe(){return $e(),P}function ye(){return $e(),I}function Be(){return $e(),S}function Ce(){return $e(),T}function xe(){return $e(),E}function je(n,t){if($e(),Te(n,t))return 0;var r=Ne(n),i=Ne(t);return r&&!i?-1:!r&&i?1:Ne(Ie(n,t))?-1:1}function Pe(n,t){$e();var r=n.v8_1>>>16|0,i=65535&n.v8_1,e=n.u8_1>>>16|0,u=65535&n.u8_1,o=t.v8_1>>>16|0,f=65535&t.v8_1,s=t.u8_1>>>16|0,c=0,a=0,h=0,l=0;return c=(c=c+((a=(a=a+((h=(h=h+((l=l+(u+(65535&t.u8_1)|0)|0)>>>16|0)|0)+(e+s|0)|0)>>>16|0)|0)+(i+f|0)|0)>>>16|0)|0)+(r+o|0)|0,new ke((h&=65535)<<16|(l&=65535),(c&=65535)<<16|(a&=65535))}function Ie(n,t){return $e(),Pe(n,t.e9())}function Se(n,t){if($e(),Ae(n))return qe();if(Ae(t))return qe();if(Te(n,Ce()))return Me(t)?Ce():qe();if(Te(t,Ce()))return Me(n)?Ce():qe();if(Ne(n))return Ne(t)?Se(Fe(n),Fe(t)):Fe(Se(Fe(n),t));if(Ne(t))return Fe(Se(n,Fe(t)));if(De(n,xe())&&De(t,xe()))return Oe(ze(n)*ze(t));var r=n.v8_1>>>16|0,i=65535&n.v8_1,e=n.u8_1>>>16|0,u=65535&n.u8_1,o=t.v8_1>>>16|0,f=65535&t.v8_1,s=t.u8_1>>>16|0,c=65535&t.u8_1,a=0,h=0,l=0,_=0;return l=l+((_=_+Mn(u,c)|0)>>>16|0)|0,_&=65535,h=(h=h+((l=l+Mn(e,c)|0)>>>16|0)|0)+((l=(l&=65535)+Mn(u,s)|0)>>>16|0)|0,l&=65535,a=(a=(a=a+((h=h+Mn(i,c)|0)>>>16|0)|0)+((h=(h&=65535)+Mn(e,s)|0)>>>16|0)|0)+((h=(h&=65535)+Mn(u,f)|0)>>>16|0)|0,h&=65535,a=a+(((Mn(r,c)+Mn(i,s)|0)+Mn(e,f)|0)+Mn(u,o)|0)|0,new ke(l<<16|_,(a&=65535)<<16|h)}function ze(n){return $e(),4294967296*n.v8_1+function(n){return $e(),n.u8_1>=0?n.u8_1:4294967296+n.u8_1}(n)}function Te(n,t){return $e(),n.v8_1===t.v8_1&&n.u8_1===t.u8_1}function Ee(n,t){if($e(),t<2||36<t)throw mu("radix out of range: "+t);if(Ae(n))return"0";if(Ne(n)){if(Te(n,Ce())){var r=Le(t),i=n.d9(r),e=Ie(Se(i,r),n).g9();return Ee(i,t)+e.toString(t)}return"-"+Ee(Fe(n),t)}for(var u=2===t?31:t<=10?9:t<=21?7:t<=35?6:5,o=Oe(Math.pow(t,u)),f=n,s="";;){var c=f.d9(o),a=Ie(f,Se(c,o)).g9().toString(t);if(Ae(f=c))return a+s;for(;a.length<u;)a="0"+a;s=a+s}}function Le(n){return $e(),new ke(n,n<0?-1:0)}function Ne(n){return $e(),n.v8_1<0}function Ae(n){return $e(),0===n.v8_1&&0===n.u8_1}function Me(n){return $e(),!(1&~n.u8_1)}function Fe(n){return $e(),n.e9()}function De(n,t){return $e(),je(n,t)<0}function Oe(n){if($e(),(t=n)!=t)return qe();if(n<=-0x8000000000000000)return Ce();if(n+1>=0x8000000000000000)return $e(),z;if(n<0)return Fe(Oe(-n));var t,r=4294967296;return new ke(n%r|0,n/r|0)}function Re(n,t){return $e(),je(n,t)>0}function He(n,t){return $e(),je(n,t)>=0}function $e(){L||(L=!0,P=Le(0),I=Le(1),S=Le(-1),z=new ke(-1,2147483647),T=new ke(0,-2147483648),E=Le(16777216))}function Ge(n){return n instanceof ke?n.g9():function(n){return n>2147483647?2147483647:n<-2147483648?-2147483648:0|n}(n)}function Ue(n){var t;return t=function(n){return n<<16>>16}(Ge(n)),function(n){return 65535&n}(t)}function Ve(n,t){return new Zt(n,t)}function Qe(n,t,r,i){return Ze("class",n,t,r,i,null)}function Ze(n,t,r,i,e,u){return{kind:n,simpleName:t,associatedObjectKey:r,associatedObjects:i,suspendArity:e,$kClass$:A,iid:u}}function Ye(n){return Array.isArray(n)}function We(n,t,r,i,e,u,o,f){null!=i&&(n.prototype=Object.create(i.prototype),n.prototype.constructor=n);var s=r(t,u,o,null==f?[]:f);n.$metadata$=s,null!=e&&((null!=s.iid?n:n.prototype).$imask$=function(n){for(var t=1,r=[],i=0,e=n.length;i<e;){var u=n[i];i=i+1|0;var o=t,f=u.prototype.$imask$,s=null==f?u.$imask$:f;null!=s&&(r.push(s),o=s.length);var c=u.$metadata$.iid,a=null==c?null:(l=void 0,v=1<<(31&(h=c)),(l=new Int32Array(1+(h>>5)|0))[_=h>>5]=l[_]|v,l);null!=a&&(r.push(a),o=Math.max(o,a.length)),o>t&&(t=o)}var h,l,_,v;return function(n,t){for(var r=0,i=new Int32Array(n);r<n;){for(var e=r,u=0,o=0,f=t.length;o<f;){var s=t[o];o=o+1|0,e<s.length&&(u|=s[e])}i[e]=u,r=r+1|0}return i}(t,r)}(e))}function Ke(n,t){return function(n,t){var r=n.$imask$;return null!=r&&function(n,t){var r=t>>5;if(r>n.length)return!1;var i=1<<(31&t);return!!(n[r]&i)}(r,t)}(n,t.$metadata$.iid)}function Xe(n){return!!Ye(n)&&!n.$type$}function Je(n){var t;switch(typeof n){case"string":case"number":case"boolean":case"function":t=!0;break;default:t=n instanceof Object}return t}function nu(n){return"string"==typeof n||Ke(n,vr)}function tu(n,t,r,i){return Ze("interface",n,t,r,i,(null==N&&(N=0),N=ru()+1|0,ru()))}function ru(){if(null!=N)return N;!function(){throw Du("lateinit property iid has not been initialized")}()}function iu(n,t,r,i){return Ze("object",n,t,r,i,null)}function eu(n){var t=n.constructor,r=null==t?null:t.$metadata$,i=null==r?null:r.errorInfo;if(null!=i)return i;var e,u=0;if(uu(n,"message")&&(u|=1),uu(n,"cause")&&(u|=2),3!==u){var o=(e=n,Object.getPrototypeOf(e));o!=Error.prototype&&(u|=eu(o))}return null!=r&&(r.errorInfo=u),u}function uu(n,t){return n.hasOwnProperty(t)}function ou(n){return new Gr(n)}function fu(n,t,r){for(var i=new Int32Array(r),e=0,u=0,o=0,f=0,s=n.length;f<s;){var c=ne(n,f);f=f+1|0;var a=t[c];if(u|=(31&a)<<o,a<32){var h=e;e=h+1|0,i[h]=u,u=0,o=0}else o=o+5|0}return i}function su(n,t){for(var r=0,i=n.length-1|0,e=-1,u=0;r<=i;)if(t>(u=n[e=(r+i|0)/2|0]))r=e+1|0;else{if(t===u)return e;i=e-1|0}return e-(t<u?1:0)|0}function cu(){M=this;var n="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",t=new Int32Array(128),r=0,i=re(n)-1|0;if(r<=i)do{var e=r;r=r+1|0,t[ne(n,e)]=e}while(r<=i);var u=fu("hCgBpCQGYHZH5BRpBPPPPPPRMP5BPPlCPP6BkEPPPPcPXPzBvBrB3BOiDoBHwD+E3DauCnFmBmB2D6E1BlBTiBmBlBP5BhBiBrBvBjBqBnBPRtBiCmCtBlB0BmB5BiB7BmBgEmChBZgCoEoGVpBSfRhBPqKQ2BwBYoFgB4CJuTiEvBuCuDrF5DgEgFlJ1DgFmBQtBsBRGsB+BPiBlD1EIjDPRPPPQPPPPPGQSQS/DxENVNU+B9zCwBwBPPCkDPNnBPqDYY1R8B7FkFgTgwGgwUwmBgKwBuBScmEP/BPPPPPPrBP8B7F1B/ErBqC6B7BiBmBfQsBUwCw/KwqIwLwETPcPjQgJxFgBlBsD",t,222),o=new Int32Array(u.length),f=0,s=u.length-1|0;if(f<=s)do{var c=f;f=f+1|0,o[c]=0===c?u[c]:o[c-1|0]+u[c]|0}while(f<=s);this.h9_1=o,this.i9_1=fu("aaMBXHYH5BRpBPPPPPPRMP5BPPlCPPzBDOOPPcPXPzBvBjB3BOhDmBBpB7DoDYxB+EiBP1DoExBkBQhBekBPmBgBhBctBiBMWOOXhCsBpBkBUV3Ba4BkB0DlCgBXgBtD4FSdBfPhBPpKP0BvBXjEQ2CGsT8DhBtCqDpFvD1D3E0IrD2EkBJrBDOBsB+BPiBlB1EIjDPPPPPPPPPPPGPPMNLsBNPNPKCvBvBPPCkDPBmBPhDXXgD4B6FzEgDguG9vUtkB9JcuBSckEP/BPPPPPPBPf4FrBjEhBpC3B5BKaWPrBOwCk/KsCuLqDHPbPxPsFtEaaqDL",t,222),this.j9_1=fu("GFjgggUHGGFFZZZmzpz5qB6s6020B60ptltB6smt2sB60mz22B1+vv+8BZZ5s2850BW5q1ymtB506smzBF3q1q1qB1q1q1+Bgii4wDTm74g3KiggxqM60q1q1Bq1o1q1BF1qlrqrBZ2q5wprBGFZWWZGHFsjiooLowgmOowjkwCkgoiIk7ligGogiioBkwkiYkzj2oNoi+sbkwj04DghhkQ8wgiYkgoioDsgnkwC4gikQ//v+85BkwvoIsgoyI4yguI0whiwEowri4CoghsJowgqYowgm4DkwgsY/nwnzPowhmYkg6wI8yggZswikwHgxgmIoxgqYkwgk4DkxgmIkgoioBsgssoBgzgyI8g9gL8g9kI0wgwJoxgkoC0wgioFkw/wI0w53iF4gioYowjmgBHGq1qkgwBF1q1q8qBHwghuIwghyKk0goQkwgoQk3goQHGFHkyg0pBgxj6IoinkxDswno7Ikwhz9Bo0gioB8z48Rwli0xN0mpjoX8w78pDwltoqKHFGGwwgsIHFH3q1q16BFHWFZ1q10q1B2qlwq1B1q10q1B2q1yq1B6q1gq1Biq1qhxBir1qp1Bqt1q1qB1g1q1+B//3q16B///q1qBH/qlqq9Bholqq9B1i00a1q10qD1op1HkwmigEigiy6Cptogq1Bixo1kDq7/j00B2qgoBWGFm1lz50B6s5q1+BGWhggzhwBFFhgk4//Bo2jigE8wguI8wguI8wgugUog1qoB4qjmIwwi2KgkYHHH4lBgiFWkgIWoghssMmz5smrBZ3q1y50B5sm7gzBtz1smzB5smz50BqzqtmzB5sgzqzBF2/9//5BowgoIwmnkzPkwgk4C8ys65BkgoqI0wgy6FghquZo2giY0ghiIsgh24B4ghsQ8QF/v1q1OFs0O8iCHHF1qggz/B8wg6Iznv+//B08QgohsjK0QGFk7hsQ4gB",t,222)}function au(){return null==M&&new cu,M}function hu(){F=this,this.k9_1=new Int32Array([170,186,688,704,736,837,890,7468,7544,7579,8305,8319,8336,8560,9424,11388,42652,42864,43e3,43868]),this.l9_1=new Int32Array([1,1,9,2,5,1,1,63,1,37,1,1,13,16,26,2,2,1,2,4])}function lu(){return null==F&&new hu,F}function _u(n){var t=function(n,t){return yu(n,t),vu.call(t),t}(n,de(ve(vu)));return _e(t,_u),t}function vu(){_e(this,vu)}function du(n){var t=function(n,t){return yu(n,t),gu.call(t),t}(n,de(ve(gu)));return _e(t,du),t}function gu(){_e(this,gu)}function wu(n){var t=function(n,t){return yu(n,t),bu.call(t),t}(n,de(ve(bu)));return _e(t,wu),t}function bu(){_e(this,bu)}function pu(n,t){return ge(t,n),ku.call(t),t}function mu(n){var t=pu(n,de(ve(ku)));return _e(t,mu),t}function ku(){_e(this,ku)}function qu(n){return function(n){ge(n),ku.call(n)}(n),Bu.call(n),n}function yu(n,t){return pu(n,t),Bu.call(t),t}function Bu(){_e(this,Bu)}function Cu(){var n,t=(qu(n=de(ve(ju))),ju.call(n),n);return _e(t,Cu),t}function xu(n){var t=function(n,t){return yu(n,t),ju.call(t),t}(n,de(ve(ju)));return _e(t,xu),t}function ju(){_e(this,ju)}function Pu(n){var t=function(n,t){return yu(n,t),Iu.call(t),t}(n,de(ve(Iu)));return _e(t,Pu),t}function Iu(){_e(this,Iu)}function Su(){var n,t=(qu(n=de(ve(Tu))),Tu.call(n),n);return _e(t,Su),t}function zu(n){var t=function(n,t){return yu(n,t),Tu.call(t),t}(n,de(ve(Tu)));return _e(t,zu),t}function Tu(){_e(this,Tu)}function Eu(){var n,t=(qu(n=de(ve(Lu))),Lu.call(n),n);return _e(t,Eu),t}function Lu(){_e(this,Lu)}function Nu(){var n,t=(qu(n=de(ve(Au))),Au.call(n),n);return _e(t,Nu),t}function Au(){_e(this,Au)}function Mu(){var n,t=(qu(n=de(ve(Fu))),Fu.call(n),n);return _e(t,Mu),t}function Fu(){_e(this,Fu)}function Du(n){var t=function(n,t){return yu(n,t),Ou.call(t),t}(n,de(ve(Ou)));return _e(t,Du),t}function Ou(){_e(this,Ou)}function Ru(n,t){var r,i=n.className;return(r="(^|.*\\s+)"+t+"($|\\s+.*)",function(n,t){return Si.call(t,n,Ht()),t}(r,de(ve(Si)))).a8(i)}function Hu(n,t){this.o9_1=n,this.p9_1=t}function $u(n){this.q9_1=n}function Gu(n,t,r){var i,e=Gf(),u=ro(),o=$f().ga(t),f=ro();if(0===re(r))i=Of();else{var s=n.ia_1,c=null==s?null:new $u(s).v9(r,"Copy reference to the clipboard");i=null==c?Of():c}return e.ja([u,o,f,i])}function Uu(n){n=n===A?null:n,this.ia_1=n}function Vu(n,t,r){to.call(this),this.ma_1=n,this.na_1=t,this.oa_1=r}function Qu(n,t){this.ra_1=n,this.sa_1=t}function Zu(n,t){to.call(this),this.va_1=n,this.wa_1=t}function Yu(n,t){to.call(this),this.xa_1=n,this.ya_1=t}function Wu(n){to.call(this),this.za_1=n}function Ku(n){to.call(this),this.ab_1=n}function Xu(n){to.call(this),this.bb_1=n}function Ju(n,t){to.call(this),this.cb_1=n,this.db_1=t}function no(n){to.call(this),this.eb_1=n}function to(){}function ro(){return so(),D}function io(){return so(),O}function eo(){return so(),R}function uo(){return so(),H}function oo(n){return so(),Gf().fb(us(fo),n)}function fo(n){return so(),n.gb(["invisible-text","text-for-copy"]),br()}function so(){$||($=!0,D=oo("`"),O=oo(" "),R=oo("("),H=oo(")"))}function co(n,t){to.call(this),this.hb_1=n,this.ib_1=t}function ao(n){to.call(this),this.jb_1=n}function ho(n,t){to.call(this),this.kb_1=n,this.lb_1=t}function lo(n){to.call(this),this.mb_1=n}function _o(n){to.call(this),this.nb_1=n}function vo(n){to.call(this),this.ob_1=n}function go(n,t,r){to.call(this),this.pb_1=n,this.qb_1=t,this.rb_1=r}function wo(n){to.call(this),this.sb_1=n}function bo(n){to.call(this),this.tb_1=n}function po(n){return n.xb_1.vb_1.k()}function mo(){if(Z)return br();Z=!0,G=new jo("Inputs",0,"Build configuration inputs"),U=new jo("ByMessage",1,"Problems grouped by message"),V=new jo("ByLocation",2,"Problems grouped by location"),Q=new jo("IncompatibleTasks",3,"Incompatible tasks")}function ko(n){Fc.call(this),this.yb_1=n}function qo(n){Fc.call(this),this.ac_1=n}function yo(n){Fc.call(this),this.bc_1=n}function Bo(n){Fc.call(this),this.cc_1=n}function Co(n){Po.call(this),this.dc_1=n}function xo(n,t,r,i,e,u,o,f){this.ec_1=n,this.fc_1=t,this.gc_1=r,this.hc_1=i,this.ic_1=e,this.jc_1=u,this.kc_1=o,this.lc_1=f}function jo(n,t,r){Ui.call(this,n,t),this.qc_1=r}function Po(){Oc.call(this)}function Io(n,t){var r=Hf(),i=us(Oo),e=Hf().y9(us(Ro),[]),u=function(n,t){var r,i=Hf(),e=us(Vo),u=Gf().ga("Learn more about the "),o=Yf();return i.y9(e,[u,o.fb(us((r=t,function(n){return n.bd(r.tc_1),br()})),t.sc_1),Gf().ga(".")])}(0,t.gc_1),o=Hf().y9(us(Ho),[zo(0,t)]),f=Hf();return r.y9(i,[e,u,o,f.y9(us($o),[No(0,Qo(),t.lc_1,po(t.jc_1)),No(0,Zo(),t.lc_1,po(t.hc_1)),No(0,Yo(),t.lc_1,po(t.ic_1)),No(0,Wo(),t.lc_1,po(t.kc_1))])])}function So(n,t){var r,i,e=Hf(),u=us(Go);switch(t.lc_1.q8_1){case 0:r=Mo(0,t.jc_1,((i=function(n){return new yo(n)}).callableName="<init>",i));break;case 3:r=Mo(0,t.kc_1,function(){var n=function(n){return new Bo(n)};return n.callableName="<init>",n}());break;case 1:r=Mo(0,t.hc_1,function(){var n=function(n){return new qo(n)};return n.callableName="<init>",n}());break;case 2:r=Mo(0,t.ic_1,function(){var n=function(n){return new ko(n)};return n.callableName="<init>",n}());break;default:be()}return e.y9(u,[r])}function zo(n,t){return Hf().ja([Lo(0,t),To(0,t)])}function To(n,t){for(var r=Hf(),i=t.fc_1,e=Or(),u=0,o=i.f();o.g();){var f=o.h(),s=u;u=s+1|0,Et(e,0===yr(s)?qr(Eo(Xo(),f)):Bt([Wf().ja([]),Eo(Xo(),f)]))}return r.ha(e)}function Eo(n,t){return Uf().ja([Uc(t)])}function Lo(n,t){return Rf().ja([$c().ka(t.ec_1)])}function No(n,t,r,i){var e,u,o;return Hf().y9(us((e=i,u=t,o=r,function(n){return n.t9("group-selector"),0===e?(n.t9("group-selector--disabled"),br()):u.equals(o)?(n.t9("group-selector--active"),br()):(n.u9(function(n){return function(t){return new Co(n)}}(u)),br()),br()})),[Gf().rc(t.qc_1,[Ao(0,i)])])}function Ao(n,t){return Gf().y9(us(Uo),[io(),eo(),Gf().ga(""+t),uo()])}function Mo(n,t,r){return function(n,t,r){var i,e=Hf(),u=Vf();return e.ja([u.ha(Ps(t,(i=r,function(n){var t,r=n.cd().ub_1;return r instanceof Zu?Kc(i,(Xo(),(t=function(n){return Fo(0,n)}).callableName="viewNode",t),n,r.va_1,r.wa_1,Rc()):r instanceof Yu?Kc(i,function(){var n=function(n){return Fo(0,n)};return n.callableName="viewNode",n}(Xo()),n,r.xa_1,r.ya_1,Hc()):r instanceof co?Kc(i,function(){var n=function(n){return Fo(0,n)};return n.callableName="viewNode",n}(Xo()),n,r.hb_1,r.ib_1,A,Ao(Xo(),n.cd().vb_1.k())):r instanceof Vu?Wc(i,n,r):Kc(i,function(){var n=function(n){return Fo(0,n)};return n.callableName="viewNode",n}(Xo()),n,r)})))])}(0,t.xb_1.uc().vc(),r)}function Fo(n,t){var r;return t instanceof ao?Vc((r=t,function(n){return n.ed("project "),n.fd(r.jb_1),br()})):t instanceof go?Vc(function(n){return function(t){return t.ed(n.pb_1+" "),t.fd(n.qb_1),t.ed(" of "),t.fd(n.rb_1),br()}}(t)):t instanceof vo?Vc(function(n){return function(t){return t.ed("system property "),t.fd(n.ob_1),br()}}(t)):t instanceof ho?Vc(function(n){return function(t){return t.ed("task "),t.fd(n.kb_1),t.ed(" of type "),t.fd(n.lb_1),br()}}(t)):t instanceof _o?Vc(function(n){return function(t){return t.ed("bean of type "),t.fd(n.nb_1),br()}}(t)):t instanceof wo?Vc(function(n){return function(t){return t.ed(n.sb_1),br()}}(t)):t instanceof bo?Vc(function(n){return function(t){return t.ed("class "),t.fd(n.tb_1),br()}}(t)):t instanceof no?Vc(function(n){return function(t){return t.ed(n.eb_1),br()}}(t)):t instanceof Wu?Uc(t.za_1):t instanceof Ju?Jo(t):Gf().ga(ce(t))}function Do(n){return n.t9("report-wrapper"),br()}function Oo(n){return n.t9("header"),br()}function Ro(n){return n.t9("gradle-logo"),br()}function Ho(n){return n.t9("title"),br()}function $o(n){return n.t9("groups"),br()}function Go(n){return n.t9("content"),br()}function Uo(n){return n.t9("group-selector__count"),br()}function Vo(n){return n.t9("learn-more"),br()}function Qo(){return mo(),G}function Zo(){return mo(),U}function Yo(){return mo(),V}function Wo(){return mo(),Q}function Ko(){Y=this}function Xo(){return null==Y&&new Ko,Y}function Jo(n){var t;return Yf().fb(us((t=n,function(n){return n.t9("documentation-button"),n.bd(t.cb_1),br()})),n.db_1)}function nf(n,t,r){this.kd_1=n,this.ld_1=t,this.md_1=r}function tf(n,t,r){this.nd_1=n,this.od_1=t,this.pd_1=r}function rf(n,t){for(var r=mf(n),i=t.trace,e=Rr(i.length),u=0,o=i.length;u<o;){var f,s=i[u];u=u+1|0,f=of(s),e.d(f)}return new nf(t,r,e)}function ef(n,t){var r,i=null==(r=t.kd_1.error)?null:ff(r);null==i||n.d(i)}function uf(n){return function(n,t,r){var i=null==n.error?null:new Zu(t,r);return null==i?new Yu(t,r):i}(n.kd_1,new Wu(n.ld_1),af(n.kd_1))}function of(n){var t;switch(n.kind){case"Project":t=new ao(n.path);break;case"Task":t=new ho(n.path,n.type);break;case"TaskPath":t=new lo(n.path);break;case"Bean":t=new _o(n.type);break;case"Field":t=new go("field",n.name,n.declaringType);break;case"InputProperty":t=new go("input property",n.name,n.task);break;case"OutputProperty":t=new go("output property",n.name,n.task);break;case"SystemProperty":t=new vo(n.name);break;case"PropertyUsage":t=new go("property",n.name,n.from);break;case"BuildLogic":t=new wo(n.location);break;case"BuildLogicClass":t=new bo(n.type);break;default:t=new no("Gradle runtime")}return t}function ff(n){var t=n.parts;if(null==t){var r=n.summary;return null==r?null:new Wu(mf(r))}for(var i=n.summary,e=null==i?null:mf(i),u=Or(),o=Qi(t);o.g();){var f=cf(o.h());null==f||u.d(f)}for(var s=$n(u,"\n"),c=Or(),a=Qi(t);a.g();){var h=sf(a.h());null==h||c.d(h)}return new Vu(e,s,c)}function sf(n){var t=cf(n);if(null==t)return null;var r,i,e=ot(new Rt(function(n,t,r,i){var e;return ut(or(n,["\r\n","\n","\r"],A,r=r!==A&&r,i=i===A?0:i),(e=n,function(n){return ur(e,n)}))}(t),!0,bf));return new Qu(e,(r=!(null==n.internalText),i=e.k(),r&&i>1?Cs():null))}function cf(n){var t=n.text;return null==t?n.internalText:t}function af(n){var t=n.documentationLink;return null==t?null:new Ju(t,"")}function hf(n,t){return new ds(lf(n,Ef().sd(t),Cs()))}function lf(n,t,r){return new js(n,function(n,t){var r,i=ut(Vn(n.o()),Nf);return ot(ut(new st(i,new _f(pf)),(r=t,function(n){return lf(n.v3(),n.w3().wd_1,r)})))}(t,1===Lf(t)?xs():Cs()),0===Lf(t)?Cs():r)}function _f(n){this.td_1=n}function vf(n){var t=Or(),r=n.ld_1,i=Un(r.ca_1).fa_1,e=ce(er(nu(i)?i:pe())),u=r.vd(function(n,t){var r;if(!(t>=0))throw _u(ce("Requested element count "+t+" is less than zero."));if(0===t)return Qn(n);if(Ke(n,Di)){var i=n.k()-t|0;if(i<=0)return Ct();if(1===i)return qr(function(n){if(Ke(n,Fi))return Jn(n);var t=n.f();if(!t.g())throw xu("Collection is empty.");for(var r=t.h();t.g();)r=t.h();return r}(n));if(r=Rr(),Ke(n,Fi)){if(Ke(n,bi)){var e=t,u=n.k();if(e<u)do{var o=e;e=e+1|0,r.d(n.j(o))}while(e<u)}else for(var f=n.l(t);f.g();){var s=f.h();r.d(s)}return r}}else r=Or();for(var c=0,a=n.f();a.g();){var h=a.h();c>=t?r.d(h):c=c+1|0}return xt(r)}(r.ca_1,1));return t.d(new co(new no(e),af(n.kd_1))),t.d(new Wu(u)),t.m(n.md_1),t.j5()}function df(n){var t=Or(),r=n.ld_1,i=r.vd(r.ca_1);return t.d(new Yu(new Wu(i),af(n.kd_1))),t.j5()}function gf(n){var t=Or();return t.d(uf(n)),t.m(n.md_1),ef(t,n),t.j5()}function wf(n){var t=Or();return t.m(new At(n.md_1)),t.d(uf(n)),ef(t,n),t.j5()}function bf(n){return re(n)>0}function pf(n,t){return function(n,t){return n===t?0:null==n?-1:null==t?1:ue(null!=n&&("string"==(i=typeof(r=n))||"boolean"===i||function(n){return"number"==typeof n||n instanceof ke}(r)||Ke(r,dr))?n:pe(),t);var r,i}(Vi(n.v3()),Vi(t.v3()))}function mf(n){var t;return Sf().qd((t=n,function(n){for(var r=t,i=0,e=r.length;i<e;){var u=r[i];i=i+1|0;var o=u.text;null==o||n.ed(o);var f=u.name;null==f||(n.fd(f),br())}return br()}))}function kf(n,t){return(0!==(r=n)?r.toString():"No")+" "+qf(t,n)+" "+yf(n)+" found";var r}function qf(n,t){return t<2?n:n+"s"}function yf(n){return n<=1?"was":"were"}function Bf(n,t){this.sc_1=n,this.tc_1=t}function Cf(n){jf.call(this),this.fa_1=n}function xf(n,t){jf.call(this),this.da_1=n,this.ea_1=t}function jf(){}function Pf(){this.dd_1=Or()}function If(){W=this}function Sf(){return null==W&&new If,W}function zf(n){Sf(),this.ca_1=n}function Tf(){K=this}function Ef(){return null==K&&new Tf,K}function Lf(n){return n.k()}function Nf(n){var t=n.j1(),r=n.i1();return _r(t,new Af(Ke(r,Ri)?r:pe()))}function Af(n){Ef(),this.wd_1=n}function Mf(n,t,r){var i;Df(t,n,r),i="Component mounted at #"+n.id+".",yi(),(yi(),g).j7(i)}function Ff(n){var t=document.getElementById(n);if(null==t)throw wu("'"+n+"' element missing");return t}function Df(n,t,r){var i,e,u;i=n.z9(r),e=t,u=function(n,t,r){return function(i){return Df(n,r,n.ba(i,t)),br()}}(n,r,t),_s(),e.innerHTML="",hs(e,i,u)}function Of(){return _s(),X}function Rf(){return _s(),J}function Hf(){return _s(),nn}function $f(){return _s(),tn}function Gf(){return _s(),rn}function Uf(){return _s(),en}function Vf(){return _s(),un}function Qf(){return _s(),on}function Zf(){return _s(),fn}function Yf(){return _s(),sn}function Wf(){return _s(),cn}function Kf(n){this.x9_1=n}function Xf(){an=this}function Jf(){return null==an&&new Xf,an}function ns(){hn=this,es.call(this)}function ts(){return null==hn&&new ns,hn}function rs(n,t,r,i){t=t===A?Ct():t,r=r===A?null:r,i=i===A?Ct():i,es.call(this),this.be_1=n,this.ce_1=t,this.de_1=r,this.ee_1=i}function is(){}function es(){Jf()}function us(n){_s();var t,r=Or();return n(new os((t=r,function(n){return t.d(n),br()}))),r}function os(n){this.r9_1=n}function fs(n,t){as.call(this),this.fe_1=n,this.ge_1=t}function ss(n){as.call(this),this.he_1=n}function cs(n,t){as.call(this),this.ie_1=n,this.je_1=t}function as(){}function hs(n,t,r){if(_s(),t instanceof rs)!function(n,t,r){var i=function(n,t,r){var i=n.createElement(t);return r(i),i}(we(n.ownerDocument),t,r);n.appendChild(i)}(n,t.be_1,(e=t,u=r,function(n){for(var t=e.ce_1.f();t.g();)ls(n,t.h(),u);var r=e.de_1;null==r||function(n,t){n.appendChild(we(n.ownerDocument).createTextNode(t))}(n,r);for(var i=e.ee_1.f();i.g();)hs(n,i.h(),u);return br()}));else if(t instanceof is){var i=t instanceof is?t:pe();hs(n,i.ke_1,function(n,t){return function(r){return n(t.le_1(r)),br()}}(r,i))}else if(le(t,ts()))return br();var e,u}function ls(n,t,r){var i,e;_s(),t instanceof cs?n.setAttribute(t.ie_1,t.je_1):t instanceof ss?function(n,t){for(var r=Or(),i=0,e=t.length;i<e;){var u=t[i];i=i+1|0,Ru(n,u)||r.d(u)}var o=r;if(!o.i()){var f=n.className,s=ce(er(nu(f)?f:pe())),c=Bi();c.p7(s),0!==re(s)&&c.p7(" "),Gn(o,c," "),n.className=c.toString()}}(n,[t.he_1]):t instanceof fs&&n.addEventListener(t.fe_1,(i=r,e=t,function(n){return n.stopPropagation(),i(e.ge_1(n)),br()}))}function _s(){ln||(ln=!0,X=ts(),new Kf("hr"),J=new Kf("h1"),new Kf("h2"),nn=new Kf("div"),new Kf("pre"),tn=new Kf("code"),rn=new Kf("span"),en=new Kf("small"),un=new Kf("ol"),on=new Kf("ul"),fn=new Kf("li"),sn=new Kf("a"),cn=new Kf("br"),new Kf("p"))}function vs(n){gs.call(this),this.ne_1=n}function ds(n){this.xb_1=n}function gs(){}function ws(n){return n.me(A,A,n.wb_1.ad())}function bs(){_n=this}function ps(){return null==_n&&new bs,_n}function ms(){if(gn)return br();gn=!0,vn=new ys("Collapsed",0),dn=new ys("Expanded",1)}function ks(n){Bs.call(this),this.ve_1=n}function qs(n,t,r){Bs.call(this),this.se_1=n,this.te_1=t,this.ue_1=r}function ys(n,t){Ui.call(this,n,t)}function Bs(){}function Cs(){return ms(),vn}function xs(){return ms(),dn}function js(n,t,r){t=t===A?Ct():t,r=r===A?Cs():r,this.ub_1=n,this.vb_1=t,this.wb_1=r}function Ps(n,t){return ot(ut(n,(r=t,function(n){return function(n,t){var r,i=n.cd(),e=Zf(),u=t(n),o=i.vb_1;r=null==(i.wb_1.equals(xs())&&!o.i()?o:null)?null:function(n,t){return Qf().ha(function(n,t){return Ps(n.vc(),t)}(n,t))}(n,t);var f=r;return e.ja([u,null==f?Of():f])}(n,r)})));var r}function Is(){if(xn)return br();xn=!0,kn=new Ss("ByMessage",0,"Messages"),qn=new Ss("ByGroup",1,"Group"),yn=new Ss("ByFileLocation",2,"File Locations"),Bn=new Ss("ByPluginLocation",3,"Plugin Locations"),Cn=new Ss("ByTaskLocation",4,"Task Locations")}function Ss(n,t,r){Ui.call(this,n,t),this.cf_1=r}function zs(n,t){this.df_1=n,this.ef_1=t}function Ts(n,t){this.ff_1=n,this.gf_1=t}function Es(n,t,r){ec();for(var i=Or(),e=li(),u=0,o=n.length;u<o;){var f=n[u];u=u+1|0;var s=f.locations;null==s||0===s.length?i.d(Os(f)):r(f,e)||i.d(Os(f))}var c=function(n,t,r){ec();for(var i=n.w1(),e=Rr(Tt(i,10)),u=i.f();u.g();){var o;o=u.h().t3_1,e.d(o)}var f=Zn(e);return t.i()||f.d(new js(new oc(Sf().rd("no location"),!0),t)),r>0&&f.d(Ns(r)),f}(e,i,t);return new ds(new js(new uc("text"),c))}function Ls(n){return ec(),t=n,function(n,r){var i,e=n.locations;if(null==e)i=null;else{for(var u=Or(),o=Qi(e);o.g();){var f=o.h();null!=t(f)&&u.d(f)}i=u}var s,c=i;if(null==c||c.i())s=!1;else{for(var a=c.f();a.g();){var h=a.h();As(r,we(t(h)),n,h)}s=!0}return s};var t}function Ns(n){return ec(),new js(new Wu(Sf().rd(n+" more problem"+(n>1?"s have":" has")+" been skipped")))}function As(n,t,r,i){ec();var e,u,o=n.v1(t);if(null==o){var f=Or(),s=_r(new js(new oc(Sf().qd((u=t,function(n){return n.fd(u),br()}))),f,xs()),f);n.h5(t,s),e=s}else e=o;e.u3_1.d(Os(r,i))}function Ms(n,t,r,i){var e,u;if(t=t===A?Or():t,r=r===A?li():r,i===A){var o=(ec(),mn);u=o+1|0,ec(),mn=u,e=o}else e=i;i=e,this.hf_1=n,this.if_1=t,this.jf_1=r,this.kf_1=i}function Fs(n,t){if(ec(),t.i())return null;for(var r,i=n,e=null,u=t.f();u.g();){var o=u.h();r=e;var f,s=i,c=o.ef_1+" ("+o.df_1+")",a=s.v1(c);if(null==a){var h=Or(),l=new Ms(new js(new oc(Sf().qd(Ys(o))),h,xs()),h);s.h5(c,l),f=l}else f=a;e=f,null==r||we(r).if_1.u(we(e).hf_1)||we(r).if_1.d(we(e).hf_1),i=we(e).jf_1}return e}function Ds(n,t){if(ec(),n.k()===t.length){var r;n:{var i=function(n,t){var r=t.length,i=Tt(n,10),e=Rr(Math.min(i,r)),u=0,o=n.f();t:for(;o.g();){var f,s=o.h();if(u>=r)break t;var c=u;u=c+1|0,f=_r(s,t[c]),e.d(f)}return e}(n,t);if(Ke(i,Di)&&i.i())r=!0;else{for(var e=i.f();e.g();){var u=e.h();if(u.t3_1.df_1!==u.u3_1.name||u.t3_1.ef_1!==u.u3_1.displayName){r=!1;break n}}r=!0}}return r}return!1}function Os(n,t,r){t=t===A?null:t,r=r!==A&&r,ec();var i=function(n,t,r){t=t===A?null:t,r=r!==A&&r,ec();var i=$s(function(n,t){return ec(),n&&null!=t.contextualLabel?we(t.contextualLabel):Rs(t)}(r,n),t).j5();return Hs(n,new Wu(i))}(n,t,r),e=function(n,t,r){r=r!==A&&r,ec();var i,e=n.problemDetails;if(null==e)i=null;else{var u,o=e[0].text,f=null==o?null:function(n,t,r,i){if(r=r!==A&&r,i=i===A?0:i,1===t.length){var e=t[0];if(0!==re(e))return function(n,t,r,i){sr(i);var e=0,u=rr(n,t,e,r);if(-1===u||1===i)return qr(ce(n));var o,f=i>0,s=Rr(f&&it(i,10));n:do{var c;if(c=ce(ie(n,e,u)),s.d(c),e=u+t.length|0,f&&s.k()===(i-1|0))break n;u=rr(n,t,e,r)}while(-1!==u);return o=ce(ie(n,e,re(n))),s.d(o),s}(n,e,r,i)}for(var u=function(n){return new ft(n)}(or(n,t,A,r,i)),o=Rr(Tt(u,10)),f=u.f();f.g();){var s;s=ur(n,f.h()),o.d(s)}return o}(o,["\n"]);if(null==f)u=null;else{for(var s=Rr(Tt(f,10)),c=f.f();c.g();){var a,h=c.h();a=Us(n)?Sf().qd(Ks(h)):Sf().rd(h),s.d(a)}u=s}var l,_=u;if(null==_)l=null;else{for(var v=Rr(Tt(_,10)),d=_.f();d.g();){var g;g=new js(new Wu(d.h())),v.d(g)}l=v}var w=null==l?null:Zn(l);i=null==w?Or():w}var b=i,p=null==b?Or():b;r||null==n.contextualLabel||p.d(new js(new Wu(Sf().rd(we(n.contextualLabel)))));var m=function(n){ec();var t=n.solutions;if(null==t||0===t.length)return null;for(var r=new Xu(Sf().rd("Solutions")),i=we(n.solutions),e=Rr(i.length),u=0,o=i.length;u<o;){var f,s=i[u];u=u+1|0,f=new js(new Ku(mf(s))),e.d(f)}return new js(r,e)}(n);null==m||p.d(m);var k,q=n.error,y=null==q?null:ff(q);if(null==y||p.d(new js(y)),t){var B=n.locations;k=!(null==B||0===B.length)}else k=!1;return k&&p.d(function(n){ec();var t,r=n.locations;if(null==r)t=null;else{for(var i=Rr(r.length),e=Qi(r);e.g();){var u,o=e.h();u=new js(new Wu(Sf().qd(Xs(o)))),i.d(u)}t=i}var f=t;return new js(new no("Locations"),null==f?Ct():f)}(n)),p}(n,null==t,r);return new js(i,e)}function Rs(n){return ec(),function(n){if(0===n.length)throw xu("Array is empty.");return n[Rn(n)]}(n.problemId).displayName}function Hs(n,t){var r;switch(ec(),n.severity){case"WARNING":var i=n.documentationLink;r=new Yu(t,null==i?null:new Ju(i,""));break;case"ERROR":var e=n.documentationLink;r=new Zu(t,null==e?null:new Ju(e,""));break;case"ADVICE":var u=n.documentationLink;r=new fc(t,null==u?null:new Ju(u,""));break;default:console.error("no severity "+n.severity),r=t}return r}function $s(n,t){t=t===A?null:t,ec();var r,i=new Pf;if(i.ed(n),null==t);else if(null!=t.line){var e=Gs(t);i.xd(e+(r=t,ec(),null==r.line||null==r.length?"":"-"+r.length),""+t.path+e),br()}else null!=t.taskPath?(i.fd(we(t.taskPath)),br()):null!=t.pluginId&&(i.fd(we(t.pluginId)),br());return i}function Gs(n){var t;if(ec(),null==n.line)t=null;else{var r,i=":"+n.line,e=n.column;t=i+(null==(r=null==e?null:":"+e)?"":r)}return null==t?"":t}function Us(n){var t;ec();var r,i=n.problemId;n:{for(var e=0,u=i.length;e<u;){var o=i[e];if(e=e+1|0,"compilation"===o.name){r=o;break n}}r=null}if(null!=r){var f,s=n.problemId;n:{for(var c=0,a=s.length;c<a;){var h=s[c];if(c=c+1|0,"java"===h.name){f=h;break n}}f=null}t=!(null==f)}else t=!1;return t}function Vs(n){return ec(),n.path}function Qs(n){return ec(),n.pluginId}function Zs(n){return ec(),n.taskPath}function Ys(n){return function(t){return t.ed(n.ef_1),t.fd(n.df_1),br()}}function Ws(n){return ec(),n.name}function Ks(n){return function(t){return t.xd(function(n,t,r,i){i=i!==A&&i;var e=new RegExp(Ii().t7(" "),i?"gui":"gu"),u=Ii().u7(" ");return n.replace(e,u)}(n),""),br()}}function Xs(n){return function(t){var r;return t.ed("- "),t.fd((r=n,ec(),null!=r.path?""+r.path+Gs(r):null!=r.taskPath?we(r.taskPath):"<undefined>")),br()}}function Js(){return Is(),kn}function nc(){return Is(),qn}function tc(){return Is(),yn}function rc(){return Is(),Bn}function ic(){return Is(),Cn}function ec(){jn||(jn=!0,wn=Ls(Vs),bn=Ls(Qs),pn=Ls(Zs),mn=0)}function uc(n){sc.call(this),this.lf_1=n}function oc(n,t){t=t!==A&&t,sc.call(this),this.mf_1=n,this.nf_1=t}function fc(n,t){t=t===A?null:t,to.call(this),this.of_1=n,this.pf_1=t}function sc(){to.call(this)}function cc(n){Fc.call(this),this.qf_1=n}function ac(n){Fc.call(this),this.rf_1=n}function hc(n){Fc.call(this),this.sf_1=n}function lc(n){Fc.call(this),this.tf_1=n}function _c(n){Fc.call(this),this.uf_1=n}function vc(n){gc.call(this),this.vf_1=n}function dc(n,t,r,i,e,u,o,f,s,c){this.wf_1=n,this.xf_1=t,this.yf_1=r,this.zf_1=i,this.ag_1=e,this.bg_1=u,this.cg_1=o,this.dg_1=f,this.eg_1=s,this.fg_1=c}function gc(){Oc.call(this)}function wc(n,t){var r=Or();po(t.zf_1)>0&&r.d(yc(0,Js(),t.fg_1,t.eg_1)),po(t.ag_1)>0&&r.d(yc(0,nc(),t.fg_1,t.eg_1)),po(t.bg_1)>0&&r.d(yc(0,tc(),t.fg_1,t.eg_1)),po(t.cg_1)>0&&r.d(yc(0,rc(),t.fg_1,t.eg_1)),po(t.dg_1)>0&&r.d(yc(0,ic(),t.fg_1,t.eg_1));var i=Hf(),e=us(jc),u=Hf().y9(us(Pc),[]),o=function(n,t){var r,i=Hf(),e=us(Ec),u=Gf().ga("Learn more about "),o=Yf();return i.y9(e,[u,o.fb(us((r=t,function(n){return n.bd(r.tc_1),br()})),t.sc_1),Gf().ga(".")])}(0,t.yf_1),f=Hf().y9(us(Ic),[pc(0,t)]),s=Hf();return i.y9(e,[u,o,f,s.zd(us(Sc),r)])}function bc(n,t){var r,i,e=Hf(),u=us(zc);switch(t.fg_1.q8_1){case 0:r=Bc(0,t.zf_1,((i=function(n){return new cc(n)}).callableName="<init>",i));break;case 1:r=Bc(0,t.ag_1,function(){var n=function(n){return new ac(n)};return n.callableName="<init>",n}());break;case 2:r=Bc(0,t.bg_1,function(){var n=function(n){return new hc(n)};return n.callableName="<init>",n}());break;case 3:r=Bc(0,t.cg_1,function(){var n=function(n){return new lc(n)};return n.callableName="<init>",n}());break;case 4:r=Bc(0,t.dg_1,function(){var n=function(n){return new _c(n)};return n.callableName="<init>",n}());break;default:be()}return e.y9(u,[r])}function pc(n,t){return Hf().ja([qc(0,t),mc(0,t)])}function mc(n,t){for(var r=Hf(),i=t.xf_1,e=Or(),u=0,o=i.f();o.g();){var f=o.h(),s=u;u=s+1|0,Et(e,0===yr(s)?qr(kc(Nc(),f)):Bt([Wf().ja([]),kc(Nc(),f)]))}return r.ha(e)}function kc(n,t){return Uf().ja([Uc(t)])}function qc(n,t){return Rf().ja([$c().ka(t.wf_1)])}function yc(n,t,r,i){var e,u,o,f;return Hf().y9(us((e=i,u=t,o=r,function(n){return n.t9("group-selector"),0===e?(n.t9("group-selector--disabled"),br()):u.equals(o)?(n.t9("group-selector--active"),br()):(n.u9(function(n){return function(t){return new vc(n)}}(u)),br()),br()})),[Gf().rc(t.cf_1,[(f=i,Gf().y9(us(Tc),[io(),eo(),Gf().ga(""+f),uo()]))])])}function Bc(n,t,r){return function(n,t,r){var i,e=Hf(),u=Vf();return e.ja([u.ha(Ps(t,(i=r,function(n){return function(n,t,r,i){var e,u;return t instanceof uc?Uc(Sf().rd(t.lf_1)):t instanceof oc?Hf().y9(us((u=t,function(n){return u.nf_1&&(n.t9("uncategorized"),br()),br()})),[Hf().ja([Qc(r,i),Uc(t.mf_1)])]):t instanceof Vu?Wc(i,r,t):t instanceof Wu?Uc(t.za_1):t instanceof Ku?Hf().ja([(sa(),Tn),Uc(t.ab_1)]):t instanceof Xu?Hf().ja([Qc(r,i),Uc(t.bb_1)]):t instanceof Zu?Kc(i,((e=function(n){return Cc(0,n)}).callableName="viewIt",e),r,t.va_1,t.wa_1,Rc()):t instanceof fc?Kc(i,function(){var n=function(n){return Cc(0,n)};return n.callableName="viewIt",n}(),r,t.of_1,t.pf_1,(sa(),Sn)):t instanceof Yu?Kc(i,function(){var n=function(n){return Cc(0,n)};return n.callableName="viewIt",n}(),r,t.xa_1,t.ya_1,Hc()):t instanceof no?Hf().ja([Qc(r,i),Uc(Sf().rd(t.eb_1))]):Gf().ga("Unknown node type viewNode: "+t)}(Nc(),n.cd().ub_1,n,i)})))])}(0,t.xb_1.uc().vc(),r)}function Cc(n,t){var r;if(t instanceof Ju)r=Jo(t);else if(t instanceof no)r=Uc(Sf().rd(t.eb_1));else if(t instanceof Wu)r=Uc(t.za_1);else{var i="Unknown node type viewIt: "+t;console.error(i),r=Gf().ga(i)}return r}function xc(n){return n.t9("report-wrapper"),br()}function jc(n){return n.t9("header"),br()}function Pc(n){return n.t9("gradle-logo"),br()}function Ic(n){return n.t9("title"),br()}function Sc(n){return n.t9("groups"),br()}function zc(n){return n.t9("content"),br()}function Tc(n){return n.t9("group-selector__count"),br()}function Ec(n){return n.t9("learn-more"),br()}function Lc(){Pn=this,document.title="Gradle - Problems Report"}function Nc(){return null==Pn&&new Lc,Pn}function Ac(n,t,r){return n.pe(t.zb().oe(),r)}function Mc(n){Oc.call(this),this.hd_1=n}function Fc(){Oc.call(this)}function Dc(n,t){Oc.call(this),this.wc_1=n,this.xc_1=t}function Oc(){}function Rc(){return sa(),In}function Hc(){return sa(),zn}function $c(){return sa(),En}function Gc(){return sa(),Ln}function Uc(n){return sa(),Gc().ka(n)}function Vc(n){return sa(),Gc().ka(Sf().qd(n))}function Qc(n,t){return sa(),n.cd().ye()?Xc(n,t):function(n){return sa(),Gf().fb(us(oa),Jc(n))}(n)}function Zc(n,t,r,i){var e,u,o;return sa(),Gf().fb(us((e=r,u=t,o=i,function(n){return n.t9("java-exception-part-toggle"),n.u9(function(n,t){return function(r){return new Dc(n,t())}}(u,o)),n.s9("Click to "+function(n){var t;switch(sa(),n.q8_1){case 0:t="show";break;case 1:t="hide";break;default:be()}return t}(e)),br()})),"("+n+" internal "+qf("line",n)+" "+function(n){var t;switch(sa(),n.q8_1){case 0:t="hidden";break;case 1:t="shown";break;default:be()}return t}(r)+")")}function Yc(n,t){t=t===A?Of():t,sa();for(var r=Qf(),i=Rr(Tt(n,10)),e=0,u=n.f();u.g();){var o,f=e;e=f+1|0,s=u.h(),c=(c=0===yr(f)?t:Of())===A?Of():c,sa(),o=Zf().ja([$f().ga(s),c]),i.d(o)}var s,c;return r.ha(i)}function Wc(n,t,r){sa();var i,e,u,o=Hf(),f=Xc(t,n),s=Gf().ga("Exception"),c=Gf().ja([(sa(),Nn).v9(r.na_1,"Copy exception to the clipboard")]),a=null==r.ma_1?null:Gf().ga(" "),h=null==a?Of():a,l=r.ma_1,_=null==l?null:Uc(l),v=null==_?Of():_;switch(t.cd().wb_1.q8_1){case 0:i=Of();break;case 1:i=function(n,t){sa();for(var r=Hf(),i=us(fa),e=n.oa_1,u=Rr(Tt(e,10)),o=0,f=e.f();f.g();){var s,c=f.h(),a=o;o=a+1|0;var h,l=yr(a);if(null!=c.sa_1){var _,v=Zc(c.ra_1.k(),l,c.sa_1,t),d=c.sa_1;switch(null==d?-1:d.q8_1){case 0:_=Yc(Kn(c.ra_1,1),v);break;case 1:_=Yc(c.ra_1,v);break;default:be()}h=_}else h=Yc(c.ra_1);s=h,u.d(s)}return r.zd(i,u)}(r,(e=n,u=t,function(){return e(new vs(u))}));break;default:be()}return o.ja([f,s,c,h,v,i])}function Kc(n,t,r,i,e,u,o){e=e===A?null:e,u=u===A?Of():u,o=o===A?Of():o,sa();var f=Hf(),s=Qc(r,n),c=t(i),a=null==e?null:t(e);return f.ja([s,u,c,null==a?Of():a,o])}function Xc(n,t){var r,i;return sa(),Gf().fb(us((r=n,i=t,function(n){return n.gb(["invisible-text","tree-btn"]),r.cd().wb_1===Cs()&&(n.t9("collapsed"),br()),r.cd().wb_1===xs()&&(n.t9("expanded"),br()),n.s9("Click to "+function(n){var t;switch(sa(),n.q8_1){case 0:t="expand";break;case 1:t="collapse";break;default:be()}return t}(r.cd().wb_1)),n.u9(function(n,t){return function(r){return n(new vs(t))}}(i,r)),br()})),Jc(n))}function Jc(n){return sa(),function(n,t){var r;if(!(t>=0))throw _u(ce("Count 'n' must be non-negative, but was "+t+"."));switch(t){case 0:r="";break;case 1:r=ce(n);break;default:var i="";if(0!==re(n))for(var e=ce(n),u=t;1&~u||(i+=e),0!=(u=u>>>1|0);)e+=e;return i}return r}("    ",n.we()-1|0)+"- "}function na(n){return sa(),n.gb(["invisible-text","error-icon"]),br()}function ta(n){return sa(),n.gb(["invisible-text","advice-icon"]),br()}function ra(n){return sa(),n.gb(["invisible-text","warning-icon"]),br()}function ia(n){return sa(),n.gb(["invisible-text","enum-icon"]),br()}function ea(n){return sa(),new Mc(n)}function ua(n){return sa(),new Mc(n)}function oa(n){return sa(),n.gb(["invisible-text","leaf-icon"]),br()}function fa(n){return sa(),n.t9("java-exception"),br()}function sa(){if(!An){An=!0;var n=Gf();In=n.fb(us(na),"[error] ");var t=Gf();Sn=t.fb(us(ta),"[advice] ");var r=Gf();zn=r.fb(us(ra),"[warn]  ");var i=Gf();Tn=i.fb(us(ia),"[enum]  "),En=new Uu,Ln=new Uu(ea),Nn=new $u(ua)}}return We(tt,A,Qe),We(ft,A,Qe),We(st,A,Qe),We(Di,"Collection",tu),We(ct,"AbstractCollection",Qe,A,[Di]),We(at,"IteratorImpl",Qe),We(ht,"ListIteratorImpl",Qe,at),We(lt,"Companion",iu),We(Fi,"List",tu,A,[Di]),We(vt,"AbstractList",Qe,ct,[ct,Fi]),We(dt,A,Qe),We(bt,"Companion",iu),We(mt,A,Qe,ct),We(Ri,"Map",tu),We(kt,"AbstractMap",Qe,A,[Ri]),We(qt,"Companion",iu),We(bi,"RandomAccess",tu),We(Pt,"EmptyList",iu,A,[Fi,bi]),We(It,"ArrayAsCollection",Qe,A,[Di]),We(St,"EmptyIterator",iu),We(Lt,"IntIterator",Qe),We(Nt,A,Qe),We(At,"ReversedListReadOnly",Qe,vt),We(Mt,A,Qe),We(Ft,"TransformingSequence",Qe),We(Ot,A,Qe),We(Rt,"FilteringSequence",Qe),We($i,"Set",tu,A,[Di]),We($t,"EmptySet",iu,A,[$i]),We(Vt,"Companion",iu),We(Xt,"IntProgression",Qe),We(Zt,"IntRange",Qe,Xt),We(Yt,"IntProgressionIterator",Qe,Lt),We(Wt,"Companion",iu),We(ar,A,Qe),We(hr,"DelimitedRangesSequence",Qe),We(lr,"Pair",Qe),We(vr,"CharSequence",tu),We(dr,"Comparable",tu),We(gr,"Number",Qe),We(wr,"Unit",iu),We(pr,"IntCompanionObject",iu),We(xr,"AbstractMutableCollection",Qe,ct,[ct,Di]),We(jr,"IteratorImpl",Qe),We(Pr,"ListIteratorImpl",Qe,jr),We(Ir,"AbstractMutableList",Qe,xr,[xr,Di,Fi]),We(Sr,A,Qe),We(zr,A,Qe),We(Oi,"Entry",tu),We(Hi,"MutableEntry",tu,A,[Oi]),We(Tr,"SimpleEntry",Qe,A,[Hi]),We(Mr,"AbstractMutableSet",Qe,xr,[xr,$i,Di]),We(Er,"AbstractEntrySet",Qe,Mr),We(Lr,A,Qe,Mr),We(Nr,A,Qe,xr),We(Ar,"AbstractMutableMap",Qe,kt,[kt,Ri]),We(Fr,"Companion",iu),We(Gr,"ArrayList",Qe,Ir,[Ir,Di,Fi,bi]),We(Qr,"HashCode",iu),We(Zr,"EntrySet",Qe,Er),We(Xr,"HashMap",Qe,Ar,[Ar,Ri]),We(ni,"HashSet",Qe,Mr,[Mr,$i,Di]),We(ei,A,Qe),We(oi,"InternalMap",tu),We(ui,"InternalHashCodeMap",Qe,A,[oi]),We(fi,"EntryIterator",Qe),We(si,"Companion",iu),We(ai,"ChainEntry",Qe,Tr),We(hi,"EntrySet",Qe,Er),We(vi,"LinkedHashMap",Qe,Xr,[Xr,Ri]),We(di,"Companion",iu),We(wi,"LinkedHashSet",Qe,ni,[ni,$i,Di]),We(pi,"BaseOutput",Qe),We(mi,"NodeJsOutput",Qe,pi),We(qi,"BufferedOutput",Qe,pi),We(ki,"BufferedOutputToConsoleLog",Qe,qi),We(Ci,"StringBuilder",Qe,A,[vr]),We(Pi,"Companion",iu),We(Si,"Regex",Qe),We(Ni,"Companion",iu),We(Mi,"Char",Qe,A,[dr]),We(Gi,"Companion",iu),We(Ui,"Enum",Qe,A,[dr]),We(Zi,A,Qe),We(me,"Companion",iu),We(ke,"Long",Qe,gr,[gr,dr]),We(cu,"Letter",iu),We(hu,"OtherLowercase",iu),We(ku,"Exception",Qe,Error),We(Bu,"RuntimeException",Qe,ku),We(vu,"IllegalArgumentException",Qe,Bu),We(gu,"IndexOutOfBoundsException",Qe,Bu),We(bu,"IllegalStateException",Qe,Bu),We(ju,"NoSuchElementException",Qe,Bu),We(Iu,"ArithmeticException",Qe,Bu),We(Tu,"UnsupportedOperationException",Qe,Bu),We(Lu,"NullPointerException",Qe,Bu),We(Au,"NoWhenBranchMatchedException",Qe,Bu),We(Fu,"ClassCastException",Qe,Bu),We(Ou,"UninitializedPropertyAccessException",Qe,Bu),We(Hu,"Model",Qe),We($u,"CopyButtonComponent",Qe),We(Uu,"PrettyTextComponent",Qe),We(to,"ProblemNode",Qe),We(Vu,"Exception",Qe,to),We(Qu,"StackTracePart",Qe),We(Zu,"Error",Qe,to),We(Yu,"Warning",Qe,to),We(Wu,"Message",Qe,to),We(Ku,"ListElement",Qe,to),We(Xu,"TreeNode",Qe,to),We(Ju,"Link",Qe,to),We(no,"Label",Qe,to),We(co,"Info",Qe,to),We(ao,"Project",Qe,to),We(ho,"Task",Qe,to),We(lo,"TaskPath",Qe,to),We(_o,"Bean",Qe,to),We(vo,"SystemProperty",Qe,to),We(go,"Property",Qe,to),We(wo,"BuildLogic",Qe,to),We(bo,"BuildLogicClass",Qe,to),We(Oc,"BaseIntent",Qe),We(Fc,"TreeIntent",Qe,Oc),We(ko,"TaskTreeIntent",Qe,Fc),We(qo,"MessageTreeIntent",Qe,Fc),We(yo,"InputTreeIntent",Qe,Fc),We(Bo,"IncompatibleTaskTreeIntent",Qe,Fc),We(Po,"Intent",Qe,Oc),We(Co,"SetTab",Qe,Po),We(xo,"Model",Qe),We(jo,"Tab",Qe,Ui),We(Ko,"ConfigurationCacheReportPage",iu),We(nf,"ImportedProblem",Qe),We(tf,"ImportedDiagnostics",Qe),We(_f,"sam$kotlin_Comparator$0",Qe),We(Bf,"LearnMore",Qe),We(jf,"Fragment",Qe),We(Cf,"Text",Qe,jf),We(xf,"Reference",Qe,jf),We(Pf,"Builder",Qe),We(If,"Companion",iu),We(zf,"PrettyText",Qe),We(Tf,"Companion",iu),We(Af,"Trie",Qe),We(Kf,"ViewFactory",Qe),We(Xf,"Companion",iu),We(es,"View",Qe),We(ns,"Empty",iu,es),We(rs,"Element",Qe,es),We(is,"MappedView",Qe,es),We(os,"Attributes",Qe),We(as,"Attribute",Qe),We(fs,"OnEvent",Qe,as),We(ss,"ClassName",Qe,as),We(cs,"Named",Qe,as),We(gs,"Intent",Qe),We(vs,"Toggle",Qe,gs),We(ds,"Model",Qe),We(bs,"TreeView",iu),We(Bs,"Focus",Qe),We(ks,"Original",Qe,Bs),We(qs,"Child",Qe,Bs),We(ys,"ViewState",Qe,Ui),We(js,"Tree",Qe),We(Ss,"Tab",Qe,Ui),We(zs,"ProblemIdElement",Qe),We(Ts,"ProblemSummary",Qe),We(Ms,"ProblemNodeGroup",Qe),We(sc,"ProblemApiNode",Qe,to),We(uc,"Text",Qe,sc),We(oc,"ProblemIdNode",Qe,sc),We(fc,"Advice",Qe,to),We(cc,"MessageTreeIntent",Qe,Fc),We(ac,"ProblemIdTreeIntent",Qe,Fc),We(hc,"FileLocationTreeIntent",Qe,Fc),We(lc,"PluginLocationTreeIntent",Qe,Fc),We(_c,"TaskLocationTreeIntent",Qe,Fc),We(gc,"Intent",Qe,Oc),We(vc,"SetTab",Qe,gc),We(dc,"Model",Qe),We(Lc,"ProblemsReportPage",iu),We(Mc,"Copy",Qe,Oc),We(Dc,"ToggleStackTracePart",Qe,Oc),ve(tt).f=function(){return this.n_1.f()},ve(ft).f=function(){return this.r_1.f()},ve(st).f=function(){var n,t,r=function(n,t){for(var r=n.f();r.g();){var i=r.h();t.d(i)}return t}(this.s_1,Or());return n=r,t=this.t_1,function(n,t){if(n.k()<=1)return br();var r=Br(n);!function(n,t){if(function(){if(null!=l)return l;l=!1;var n=[],t=0;if(t<600)do{var r=t;t=t+1|0,n.push(r)}while(t<600);var i=Vr;n.sort(i);var e=1,u=n.length;if(e<u)do{var o=e;e=e+1|0;var f=n[o-1|0],s=n[o];if((3&f)==(3&s)&&f>=s)return!1}while(e<u);return l=!0,!0}()){var r=(i=t,function(n,t){return i.compare(n,t)});n.sort(r)}else!function(n,t,r,i){var e=n.length,u=function(n){var t=0,r=n.length-1|0;if(t<=r)do{var i=t;t=t+1|0,n[i]=null}while(i!==r);return n}(Array(e)),o=Ur(n,u,0,r,i);if(o!==n){var f=0;if(f<=r)do{var s=f;f=f+1|0,n[s]=o[s]}while(s!==r)}}(n,0,Rn(n),t);var i}(r,t);var i=0,e=r.length;if(i<e)do{var u=i;i=i+1|0,n.f4(u,r[u])}while(i<e)}(n,t),r.f()},ve(ct).u=function(n){var t;n:if(Ke(this,Di)&&this.i())t=!1;else{for(var r=this.f();r.g();)if(le(r.h(),n)){t=!0;break n}t=!1}return t},ve(ct).v=function(n){var t;n:if(Ke(n,Di)&&n.i())t=!0;else{for(var r=n.f();r.g();){var i=r.h();if(!this.u(i)){t=!1;break n}}t=!0}return t},ve(ct).i=function(){return 0===this.k()},ve(ct).toString=function(){return $n(this,", ","[","]",A,A,(n=this,function(t){return t===n?"(this Collection)":Vi(t)}));var n},ve(ct).toArray=function(){return kr(this)},ve(at).g=function(){return this.w_1<this.x_1.k()},ve(at).h=function(){if(!this.g())throw Cu();var n=this.w_1;return this.w_1=n+1|0,this.x_1.j(n)},ve(ht).c1=function(){return this.w_1>0},ve(ht).d1=function(){if(!this.c1())throw Cu();return this.w_1=this.w_1-1|0,this.a1_1.j(this.w_1)},ve(lt).e1=function(n,t){if(n<0||n>=t)throw du("index: "+n+", size: "+t)},ve(lt).b1=function(n,t){if(n<0||n>t)throw du("index: "+n+", size: "+t)},ve(lt).f1=function(n){for(var t=1,r=n.f();r.g();){var i=r.h(),e=Mn(31,t),u=null==i?null:ae(i);t=e+(null==u?0:u)|0}return t},ve(lt).g1=function(n,t){if(n.k()!==t.k())return!1;for(var r=t.f(),i=n.f();i.g();)if(!le(i.h(),r.h()))return!1;return!0},ve(vt).f=function(){return new at(this)},ve(vt).l=function(n){return new ht(this,n)},ve(vt).equals=function(n){return n===this||!(null==n||!Ke(n,Fi))&&_t().g1(this,n)},ve(vt).hashCode=function(){return _t().f1(this)},ve(dt).g=function(){return this.h1_1.g()},ve(dt).h=function(){return this.h1_1.h().i1()},ve(bt).k1=function(n){var t=n.j1(),r=null==t?null:ae(t),i=null==r?0:r,e=n.i1(),u=null==e?null:ae(e);return i^(null==u?0:u)},ve(bt).l1=function(n){return Vi(n.j1())+"="+Vi(n.i1())},ve(bt).m1=function(n,t){return!(null==t||!Ke(t,Oi))&&!!le(n.j1(),t.j1())&&le(n.i1(),t.i1())},ve(mt).r1=function(n){return this.q1_1.s1(n)},ve(mt).u=function(n){return!(null!=n&&!Je(n))&&this.r1(null==n||Je(n)?n:pe())},ve(mt).f=function(){return new dt(this.q1_1.o().f())},ve(mt).k=function(){return this.q1_1.k()},ve(kt).t1=function(n){return!(null==wt(this,n))},ve(kt).s1=function(n){var t;n:{var r=this.o();if(Ke(r,Di)&&r.i())t=!1;else{for(var i=r.f();i.g();)if(le(i.h().i1(),n)){t=!0;break n}t=!1}}return t},ve(kt).u1=function(n){if(null==n||!Ke(n,Oi))return!1;var t=n.j1(),r=n.i1(),i=(Ke(this,Ri)?this:pe()).v1(t);return!(!le(r,i)||null==i&&!(Ke(this,Ri)?this:pe()).t1(t))},ve(kt).equals=function(n){if(n===this)return!0;if(null==n||!Ke(n,Ri))return!1;if(this.k()!==n.k())return!1;var t;n:{var r=n.o();if(Ke(r,Di)&&r.i())t=!0;else{for(var i=r.f();i.g();){var e=i.h();if(!this.u1(e)){t=!1;break n}}t=!0}}return t},ve(kt).v1=function(n){var t=wt(this,n);return null==t?null:t.i1()},ve(kt).hashCode=function(){return ae(this.o())},ve(kt).i=function(){return 0===this.k()},ve(kt).k=function(){return this.o().k()},ve(kt).toString=function(){var n;return $n(this.o(),", ","{","}",A,A,(n=this,function(t){return n.p1(t)}))},ve(kt).p1=function(n){return gt(this,n.j1())+"="+gt(this,n.i1())},ve(kt).w1=function(){return null==this.o1_1&&(this.o1_1=new mt(this)),we(this.o1_1)},ve(qt).x1=function(n){for(var t=0,r=n.f();r.g();){var i=r.h(),e=t,u=null==i?null:ae(i);t=e+(null==u?0:u)|0}return t},ve(qt).y1=function(n,t){return n.k()===t.k()&&n.v(t)},ve(Pt).equals=function(n){return!(null==n||!Ke(n,Fi))&&n.i()},ve(Pt).hashCode=function(){return 1},ve(Pt).toString=function(){return"[]"},ve(Pt).k=function(){return 0},ve(Pt).i=function(){return!0},ve(Pt).a2=function(n){return n.i()},ve(Pt).v=function(n){return this.a2(n)},ve(Pt).j=function(n){throw du("Empty list doesn't contain element at index "+n+".")},ve(Pt).f=function(){return zt()},ve(Pt).l=function(n){if(0!==n)throw du("Index: "+n);return zt()},ve(It).k=function(){return this.b2_1.length},ve(It).i=function(){return 0===this.b2_1.length},ve(It).d2=function(n){return function(n,t){return Hn(n,t)>=0}(this.b2_1,n)},ve(It).e2=function(n){var t;n:if(Ke(n,Di)&&n.i())t=!0;else{for(var r=n.f();r.g();){var i=r.h();if(!this.d2(i)){t=!1;break n}}t=!0}return t},ve(It).v=function(n){return this.e2(n)},ve(It).f=function(){return Qi(this.b2_1)},ve(St).g=function(){return!1},ve(St).c1=function(){return!1},ve(St).h=function(){throw Cu()},ve(St).d1=function(){throw Cu()},ve(Lt).h=function(){return this.f2()},ve(Nt).g=function(){return this.g2_1.c1()},ve(Nt).c1=function(){return this.g2_1.g()},ve(Nt).h=function(){return this.g2_1.d1()},ve(Nt).d1=function(){return this.g2_1.h()},ve(At).k=function(){return this.i2_1.k()},ve(At).j=function(n){return this.i2_1.j(function(n,t){if(!(0<=t&&t<=jt(n)))throw du("Element index "+t+" must be in range ["+Ve(0,jt(n))+"].");return jt(n)-t|0}(this,n))},ve(At).f=function(){return this.l(0)},ve(At).l=function(n){return new Nt(this,n)},ve(Mt).h=function(){return this.k2_1.m2_1(this.j2_1.h())},ve(Mt).g=function(){return this.j2_1.g()},ve(Ft).f=function(){return new Mt(this)},ve(Ot).h=function(){if(-1===this.o2_1&&Dt(this),0===this.o2_1)throw Cu();var n=this.p2_1;return this.p2_1=null,this.o2_1=-1,null==n||Je(n)?n:pe()},ve(Ot).g=function(){return-1===this.o2_1&&Dt(this),1===this.o2_1},ve(Rt).f=function(){return new Ot(this)},ve($t).equals=function(n){return!(null==n||!Ke(n,$i))&&n.i()},ve($t).hashCode=function(){return 0},ve($t).toString=function(){return"[]"},ve($t).k=function(){return 0},ve($t).i=function(){return!0},ve($t).a2=function(n){return n.i()},ve($t).v=function(n){return this.a2(n)},ve($t).f=function(){return zt()},ve(Zt).y2=function(){return this.z2_1},ve(Zt).c3=function(){return this.a3_1},ve(Zt).i=function(){return this.z2_1>this.a3_1},ve(Zt).equals=function(n){return n instanceof Zt&&(!(!this.i()||!n.i())||this.z2_1===n.z2_1&&this.a3_1===n.a3_1)},ve(Zt).hashCode=function(){return this.i()?-1:Mn(31,this.z2_1)+this.a3_1|0},ve(Zt).toString=function(){return this.z2_1+".."+this.a3_1},ve(Yt).g=function(){return this.f3_1},ve(Yt).f2=function(){var n=this.g3_1;if(n===this.e3_1){if(!this.f3_1)throw Cu();this.f3_1=!1}else this.g3_1=this.g3_1+this.d3_1|0;return n},ve(Wt).q=function(n,t,r){return new Xt(n,t,r)},ve(Xt).f=function(){return new Yt(this.z2_1,this.a3_1,this.b3_1)},ve(Xt).i=function(){return this.b3_1>0?this.z2_1>this.a3_1:this.z2_1<this.a3_1},ve(Xt).equals=function(n){return n instanceof Xt&&(!(!this.i()||!n.i())||this.z2_1===n.z2_1&&this.a3_1===n.a3_1&&this.b3_1===n.b3_1)},ve(Xt).hashCode=function(){return this.i()?-1:Mn(31,Mn(31,this.z2_1)+this.a3_1|0)+this.b3_1|0},ve(Xt).toString=function(){return this.b3_1>0?this.z2_1+".."+this.a3_1+" step "+this.b3_1:this.z2_1+" downTo "+this.a3_1+" step "+(0|-this.b3_1)},ve(ar).h=function(){if(-1===this.j3_1&&cr(this),0===this.j3_1)throw Cu();var n=this.m3_1,t=n instanceof Zt?n:pe();return this.m3_1=null,this.j3_1=-1,t},ve(ar).g=function(){return-1===this.j3_1&&cr(this),1===this.j3_1},ve(hr).f=function(){return new ar(this)},ve(lr).toString=function(){return"("+this.t3_1+", "+this.u3_1+")"},ve(lr).v3=function(){return this.t3_1},ve(lr).w3=function(){return this.u3_1},ve(lr).hashCode=function(){var n=null==this.t3_1?0:ae(this.t3_1);return Mn(n,31)+(null==this.u3_1?0:ae(this.u3_1))|0},ve(lr).equals=function(n){if(this===n)return!0;if(!(n instanceof lr))return!1;var t=n instanceof lr?n:pe();return!!le(this.t3_1,t.t3_1)&&!!le(this.u3_1,t.u3_1)},ve(wr).toString=function(){return"kotlin.Unit"},ve(pr).b4=function(){return this.MIN_VALUE},ve(pr).c4=function(){return this.MAX_VALUE},ve(pr).d4=function(){return this.SIZE_BYTES},ve(pr).e4=function(){return this.SIZE_BITS},ve(xr).m=function(n){this.g4();for(var t=!1,r=n.f();r.g();){var i=r.h();this.d(i)&&(t=!0)}return t},ve(xr).toJSON=function(){return this.toArray()},ve(xr).g4=function(){},ve(jr).g=function(){return this.h4_1<this.j4_1.k()},ve(jr).h=function(){if(!this.g())throw Cu();var n=this.h4_1;return this.h4_1=n+1|0,this.i4_1=n,this.j4_1.j(this.i4_1)},ve(Pr).c1=function(){return this.h4_1>0},ve(Pr).d1=function(){if(!this.c1())throw Cu();return this.h4_1=this.h4_1-1|0,this.i4_1=this.h4_1,this.n4_1.j(this.i4_1)},ve(Ir).d=function(n){return this.g4(),this.p4(this.k(),n),!0},ve(Ir).f=function(){return new jr(this)},ve(Ir).u=function(n){return this.q4(n)>=0},ve(Ir).q4=function(n){var t=0,r=jt(this);if(t<=r)do{var i=t;if(t=t+1|0,le(this.j(i),n))return i}while(i!==r);return-1},ve(Ir).l=function(n){return new Pr(this,n)},ve(Ir).equals=function(n){return n===this||!(null==n||!Ke(n,Fi))&&_t().g1(this,n)},ve(Ir).hashCode=function(){return _t().f1(this)},ve(Sr).g=function(){return this.r4_1.g()},ve(Sr).h=function(){return this.r4_1.h().j1()},ve(zr).g=function(){return this.s4_1.g()},ve(zr).h=function(){return this.s4_1.h().i1()},ve(Tr).j1=function(){return this.t4_1},ve(Tr).i1=function(){return this.u4_1},ve(Tr).v4=function(n){var t=this.u4_1;return this.u4_1=n,t},ve(Tr).hashCode=function(){return pt().k1(this)},ve(Tr).toString=function(){return pt().l1(this)},ve(Tr).equals=function(n){return pt().m1(this,n)},ve(Er).u=function(n){return this.w4(n)},ve(Lr).y4=function(n){throw zu("Add is not supported on keys")},ve(Lr).d=function(n){return this.y4(null==n||Je(n)?n:pe())},ve(Lr).z4=function(n){return this.x4_1.t1(n)},ve(Lr).u=function(n){return!(null!=n&&!Je(n))&&this.z4(null==n||Je(n)?n:pe())},ve(Lr).f=function(){return new Sr(this.x4_1.o().f())},ve(Lr).k=function(){return this.x4_1.k()},ve(Lr).g4=function(){return this.x4_1.g4()},ve(Nr).f5=function(n){throw zu("Add is not supported on values")},ve(Nr).d=function(n){return this.f5(null==n||Je(n)?n:pe())},ve(Nr).r1=function(n){return this.e5_1.s1(n)},ve(Nr).u=function(n){return!(null!=n&&!Je(n))&&this.r1(null==n||Je(n)?n:pe())},ve(Nr).f=function(){return new zr(this.e5_1.o().f())},ve(Nr).k=function(){return this.e5_1.k()},ve(Nr).g4=function(){return this.e5_1.g4()},ve(Ar).g5=function(){return null==this.c5_1&&(this.c5_1=new Lr(this)),we(this.c5_1)},ve(Ar).w1=function(){return null==this.d5_1&&(this.d5_1=new Nr(this)),we(this.d5_1)},ve(Ar).g4=function(){},ve(Mr).equals=function(n){return n===this||!(null==n||!Ke(n,$i))&&yt().y1(this,n)},ve(Mr).hashCode=function(){return yt().x1(this)},ve(Gr).j5=function(){return this.g4(),this.c_1=!0,this.k()>0?this:Dr().i5_1},ve(Gr).k=function(){return this.b_1.length},ve(Gr).j=function(n){var t=this.b_1[$r(this,n)];return null==t||Je(t)?t:pe()},ve(Gr).f4=function(n,t){this.g4(),$r(this,n);var r=this.b_1[n];this.b_1[n]=t;var i=r;return null==i||Je(i)?i:pe()},ve(Gr).d=function(n){return this.g4(),this.b_1.push(n),this.o4_1=this.o4_1+1|0,!0},ve(Gr).p4=function(n,t){this.g4(),this.b_1.splice(function(n,t){return _t().b1(t,n.k()),t}(this,n),0,t),this.o4_1=this.o4_1+1|0},ve(Gr).m=function(n){if(this.g4(),n.i())return!1;for(var t,r,i,e=(t=this,r=n.k(),i=t.k(),t.b_1.length=t.k()+r|0,i),u=0,o=n.f();o.g();){var f=o.h(),s=u;u=s+1|0;var c=yr(s);this.b_1[e+c|0]=f}return this.o4_1=this.o4_1+1|0,!0},ve(Gr).q4=function(n){return Hn(this.b_1,n)},ve(Gr).toString=function(){return On(this.b_1,", ","[","]",A,A,ee)},ve(Gr).k5=function(){return[].slice.call(this.b_1)},ve(Gr).toArray=function(){return this.k5()},ve(Gr).g4=function(){if(this.c_1)throw Su()},ve(Qr).l5=function(n,t){return le(n,t)},ve(Qr).m5=function(n){var t=null==n?null:ae(n);return null==t?0:t},ve(Zr).o5=function(n){throw zu("Add is not supported on entries")},ve(Zr).d=function(n){return this.o5(null!=n&&Ke(n,Hi)?n:pe())},ve(Zr).w4=function(n){return this.n5_1.u1(n)},ve(Zr).f=function(){return this.n5_1.t5_1.f()},ve(Zr).k=function(){return this.n5_1.k()},ve(Xr).t1=function(n){return this.t5_1.z4(n)},ve(Xr).s1=function(n){var t;n:{var r=this.t5_1;if(Ke(r,Di)&&r.i())t=!1;else{for(var i=r.f();i.g();){var e=i.h();if(this.u5_1.l5(e.i1(),n)){t=!0;break n}}t=!1}}return t},ve(Xr).o=function(){return null==this.v5_1&&(this.v5_1=this.x5()),we(this.v5_1)},ve(Xr).x5=function(){return new Zr(this)},ve(Xr).v1=function(n){return this.t5_1.v1(n)},ve(Xr).h5=function(n,t){return this.t5_1.h5(n,t)},ve(Xr).k=function(){return this.t5_1.k()},ve(ni).d=function(n){return null==this.y5_1.h5(n,this)},ve(ni).u=function(n){return this.y5_1.t1(n)},ve(ni).i=function(){return this.y5_1.i()},ve(ni).f=function(){return this.y5_1.g5().f()},ve(ni).k=function(){return this.y5_1.k()},ve(ei).g=function(){return-1===this.z5_1&&(this.z5_1=function(n){if(null!=n.c6_1&&n.d6_1){var t=n.c6_1.length;if(n.e6_1=n.e6_1+1|0,n.e6_1<t)return 0}if(n.b6_1=n.b6_1+1|0,n.b6_1<n.a6_1.length){n.c6_1=n.g6_1.i6_1[n.a6_1[n.b6_1]];var r=n,i=n.c6_1;return r.d6_1=null!=i&&Xe(i),n.e6_1=0,0}return n.c6_1=null,1}(this)),0===this.z5_1},ve(ei).h=function(){if(!this.g())throw Cu();var n=this.d6_1?this.c6_1[this.e6_1]:this.c6_1;return this.f6_1=n,this.z5_1=-1,n},ve(ui).w5=function(){return this.h6_1},ve(ui).k=function(){return this.j6_1},ve(ui).h5=function(n,t){var r=this.h6_1.m5(n),i=ii(this,r);if(null==i)this.i6_1[r]=new Tr(n,t);else{if(null==i||!Xe(i)){var e,u=i;return this.h6_1.l5(u.j1(),n)?u.v4(t):(e=[u,new Tr(n,t)],this.i6_1[r]=e,this.j6_1=this.j6_1+1|0,null)}var o=i,f=ri(o,this,n);if(null!=f)return f.v4(t);o.push(new Tr(n,t))}return this.j6_1=this.j6_1+1|0,null},ve(ui).z4=function(n){return!(null==ti(this,n))},ve(ui).v1=function(n){var t=ti(this,n);return null==t?null:t.i1()},ve(ui).f=function(){return new ei(this)},ve(fi).g=function(){return!(null===this.m6_1)},ve(fi).h=function(){if(!this.g())throw Cu();var n=we(this.m6_1);this.l6_1=n;var t,r=n.b7_1;return t=r!==this.n6_1.y6_1.v6_1?r:null,this.m6_1=t,n},ve(ai).v4=function(n){return this.d7_1.g4(),ve(Tr).v4.call(this,n)},ve(hi).o5=function(n){throw zu("Add is not supported on entries")},ve(hi).d=function(n){return this.o5(null!=n&&Ke(n,Hi)?n:pe())},ve(hi).w4=function(n){return this.y6_1.u1(n)},ve(hi).f=function(){return new fi(this)},ve(hi).k=function(){return this.y6_1.k()},ve(hi).g4=function(){return this.y6_1.g4()},ve(vi).j5=function(){var n;if(this.g4(),this.x6_1=!0,this.k()>0)n=this;else{var t=ci().e7_1;n=Ke(t,Ri)?t:pe()}return n},ve(vi).t1=function(n){return this.w6_1.t1(n)},ve(vi).s1=function(n){var t=this.v6_1;if(null==t)return!1;var r=t;do{if(le(r.i1(),n))return!0;r=we(r.b7_1)}while(r!==this.v6_1);return!1},ve(vi).x5=function(){return new hi(this)},ve(vi).v1=function(n){var t=this.w6_1.v1(n);return null==t?null:t.i1()},ve(vi).h5=function(n,t){this.g4();var r=this.w6_1.v1(n);if(null==r){var i=new ai(this,n,t);return this.w6_1.h5(n,i),function(n,t){if(null!=n.b7_1||null!=n.c7_1)throw wu(ce("Check failed."));var r=t.v6_1;if(null==r)t.v6_1=n,n.b7_1=n,n.c7_1=n;else{var i=r.c7_1;if(null==i)throw wu(ce("Required value was null."));var e=i;n.c7_1=e,n.b7_1=r,r.c7_1=n,e.b7_1=n}}(i,this),null}return r.v4(t)},ve(vi).k=function(){return this.w6_1.k()},ve(vi).g4=function(){if(this.x6_1)throw Su()},ve(wi).g4=function(){return this.y5_1.g4()},ve(pi).h7=function(){this.i7("\n")},ve(pi).j7=function(n){this.i7(n),this.h7()},ve(mi).i7=function(n){var t=String(n);this.k7_1.write(t)},ve(ki).i7=function(n){var t=String(n),r=t.lastIndexOf("\n",0);if(r>=0){var i=this.m7_1;this.m7_1=i+t.substring(0,r),this.n7();var e=r+1|0;t=t.substring(e)}this.m7_1=this.m7_1+t},ve(ki).n7=function(){console.log(this.m7_1),this.m7_1=""},ve(qi).i7=function(n){var t=this.m7_1;this.m7_1=t+String(n)},ve(Ci).x3=function(){return this.o7_1.length},ve(Ci).y3=function(n){var t=this.o7_1;if(!(n>=0&&n<=tr(t)))throw du("index: "+n+", length: "+this.x3()+"}");return ne(t,n)},ve(Ci).z3=function(n,t){return this.o7_1.substring(n,t)},ve(Ci).i3=function(n){return this.o7_1=this.o7_1+new Mi(n),this},ve(Ci).e=function(n){return this.o7_1=this.o7_1+Vi(n),this},ve(Ci).p7=function(n){var t=this.o7_1;return this.o7_1=t+(null==n?"null":n),this},ve(Ci).toString=function(){return this.o7_1},ve(Pi).t7=function(n){var t=this.q7_1;return n.replace(t,"\\$&")},ve(Pi).u7=function(n){var t=this.s7_1;return n.replace(t,"$$$$")},ve(Si).a8=function(n){this.x7_1.lastIndex=0;var t=this.x7_1.exec(ce(n));return null!=t&&0===t.index&&this.x7_1.lastIndex===re(n)},ve(Si).toString=function(){return this.x7_1.toString()},ve(Mi).o8=function(n){return Ei(this.h3_1,n)},ve(Mi).a4=function(n){return function(n,t){return Ei(n.h3_1,t instanceof Mi?t.h3_1:pe())}(this,n)},ve(Mi).equals=function(n){return function(n,t){return t instanceof Mi&&n===t.h3_1}(this.h3_1,n)},ve(Mi).hashCode=function(){return this.h3_1},ve(Mi).toString=function(){return Li(this.h3_1)},ve(Ui).r8=function(n){return ue(this.q8_1,n.q8_1)},ve(Ui).a4=function(n){return this.r8(n instanceof Ui?n:pe())},ve(Ui).equals=function(n){return this===n},ve(Ui).hashCode=function(){return se(this)},ve(Ui).toString=function(){return this.p8_1},ve(Zi).g=function(){return!(this.s8_1===this.t8_1.length)},ve(Zi).h=function(){if(this.s8_1===this.t8_1.length)throw xu(""+this.s8_1);var n=this.s8_1;return this.s8_1=n+1|0,this.t8_1[n]},ve(ke).b9=function(n){return je(this,n)},ve(ke).a4=function(n){return this.b9(n instanceof ke?n:pe())},ve(ke).c9=function(n){return Pe(this,n)},ve(ke).d9=function(n){return function(n,t){if($e(),Ae(t))throw mu("division by zero");if(Ae(n))return qe();if(Te(n,Ce())){if(Te(t,ye())||Te(t,Be()))return Ce();if(Te(t,Ce()))return ye();var r=function(n){$e();return new ke(n.u8_1>>>1|n.v8_1<<31,n.v8_1>>1)}(n),i=function(n){$e();return new ke(n.u8_1<<1,n.v8_1<<1|n.u8_1>>>31)}(r.d9(t));return Te(i,qe())?Ne(t)?ye():Be():Pe(i,Ie(n,Se(t,i)).d9(t))}if(Te(t,Ce()))return qe();if(Ne(n))return Ne(t)?Fe(n).d9(Fe(t)):Fe(Fe(n).d9(t));if(Ne(t))return Fe(n.d9(Fe(t)));for(var e=qe(),u=n;He(u,t);){for(var o=ze(u)/ze(t),f=Math.max(1,Math.floor(o)),s=Math.ceil(Math.log(f)/Math.LN2),c=s<=48?1:Math.pow(2,s-48),a=Oe(f),h=Se(a,t);Ne(h)||Re(h,u);)h=Se(a=Oe(f-=c),t);Ae(a)&&(a=ye()),e=Pe(e,a),u=Ie(u,h)}return e}(this,n)},ve(ke).e9=function(){return this.f9().c9(new ke(1,0))},ve(ke).f9=function(){return new ke(~this.u8_1,~this.v8_1)},ve(ke).g9=function(){return this.u8_1},ve(ke).w8=function(){return ze(this)},ve(ke).valueOf=function(){return this.w8()},ve(ke).equals=function(n){return n instanceof ke&&Te(this,n)},ve(ke).hashCode=function(){return $e(),this.u8_1^this.v8_1},ve(ke).toString=function(){return Ee(this,10)},ve(Hu).toString=function(){return"Model(text="+this.o9_1+", tooltip="+this.p9_1+")"},ve(Hu).hashCode=function(){var n=he(this.o9_1);return Mn(n,31)+he(this.p9_1)|0},ve(Hu).equals=function(n){if(this===n)return!0;if(!(n instanceof Hu))return!1;var t=n instanceof Hu?n:pe();return this.o9_1===t.o9_1&&this.p9_1===t.p9_1},ve($u).v9=function(n,t){return this.w9(new Hu(n,t))},ve($u).w9=function(n){var t,r;return Uf().y9(us((t=n,r=this,function(n){return n.s9(t.p9_1),n.t9("copy-button"),n.u9(function(n,t){return function(r){return n.q9_1(t.o9_1)}}(r,t)),br()})),[])},ve($u).z9=function(n){return this.w9(n instanceof Hu?n:pe())},ve($u).aa=function(n,t){return t},ve($u).ba=function(n,t){var r=null==n||Je(n)?n:pe();return this.aa(r,t instanceof Hu?t:pe())},ve(Uu).ka=function(n){return function(n,t){for(var r=Gf(),i=t.ca_1,e=Rr(Tt(i,10)),u=i.f();u.g();){var o,f,s=u.h();s instanceof Cf?f=Gf().ga(s.fa_1):s instanceof xf?f=Gu(n,s.da_1,s.ea_1):be(),o=f,e.d(o)}return r.ha(e)}(this,n)},ve(Uu).z9=function(n){return this.ka(n instanceof zf?n:pe())},ve(Uu).la=function(n,t){return t},ve(Uu).ba=function(n,t){var r=null==n||Je(n)?n:pe();return this.la(r,t instanceof zf?t:pe())},ve(Vu).pa=function(n,t,r){return new Vu(n,t,r)},ve(Vu).qa=function(n,t,r,i){return n=n===A?this.ma_1:n,t=t===A?this.na_1:t,r=r===A?this.oa_1:r,i===A?this.pa(n,t,r):i.pa.call(this,n,t,r)},ve(Vu).toString=function(){return"Exception(summary="+this.ma_1+", fullText="+this.na_1+", parts="+this.oa_1+")"},ve(Vu).hashCode=function(){var n=null==this.ma_1?0:this.ma_1.hashCode();return n=Mn(n,31)+he(this.na_1)|0,Mn(n,31)+ae(this.oa_1)|0},ve(Vu).equals=function(n){if(this===n)return!0;if(!(n instanceof Vu))return!1;var t=n instanceof Vu?n:pe();return!!le(this.ma_1,t.ma_1)&&this.na_1===t.na_1&&!!le(this.oa_1,t.oa_1)},ve(Qu).ta=function(n,t){return new Qu(n,t)},ve(Qu).ua=function(n,t,r){return n=n===A?this.ra_1:n,t=t===A?this.sa_1:t,r===A?this.ta(n,t):r.ta.call(this,n,t)},ve(Qu).toString=function(){return"StackTracePart(lines="+this.ra_1+", state="+this.sa_1+")"},ve(Qu).hashCode=function(){var n=ae(this.ra_1);return Mn(n,31)+(null==this.sa_1?0:this.sa_1.hashCode())|0},ve(Qu).equals=function(n){if(this===n)return!0;if(!(n instanceof Qu))return!1;var t=n instanceof Qu?n:pe();return!!le(this.ra_1,t.ra_1)&&!!le(this.sa_1,t.sa_1)},ve(Zu).toString=function(){return"Error(label="+this.va_1+", docLink="+this.wa_1+")"},ve(Zu).hashCode=function(){var n=ae(this.va_1);return Mn(n,31)+(null==this.wa_1?0:ae(this.wa_1))|0},ve(Zu).equals=function(n){if(this===n)return!0;if(!(n instanceof Zu))return!1;var t=n instanceof Zu?n:pe();return!!le(this.va_1,t.va_1)&&!!le(this.wa_1,t.wa_1)},ve(Yu).toString=function(){return"Warning(label="+this.xa_1+", docLink="+this.ya_1+")"},ve(Yu).hashCode=function(){var n=ae(this.xa_1);return Mn(n,31)+(null==this.ya_1?0:ae(this.ya_1))|0},ve(Yu).equals=function(n){if(this===n)return!0;if(!(n instanceof Yu))return!1;var t=n instanceof Yu?n:pe();return!!le(this.xa_1,t.xa_1)&&!!le(this.ya_1,t.ya_1)},ve(Wu).toString=function(){return"Message(prettyText="+this.za_1+")"},ve(Wu).hashCode=function(){return this.za_1.hashCode()},ve(Wu).equals=function(n){if(this===n)return!0;if(!(n instanceof Wu))return!1;var t=n instanceof Wu?n:pe();return!!this.za_1.equals(t.za_1)},ve(Ku).toString=function(){return"ListElement(prettyText="+this.ab_1+")"},ve(Ku).hashCode=function(){return this.ab_1.hashCode()},ve(Ku).equals=function(n){if(this===n)return!0;if(!(n instanceof Ku))return!1;var t=n instanceof Ku?n:pe();return!!this.ab_1.equals(t.ab_1)},ve(Xu).toString=function(){return"TreeNode(prettyText="+this.bb_1+")"},ve(Xu).hashCode=function(){return this.bb_1.hashCode()},ve(Xu).equals=function(n){if(this===n)return!0;if(!(n instanceof Xu))return!1;var t=n instanceof Xu?n:pe();return!!this.bb_1.equals(t.bb_1)},ve(Ju).toString=function(){return"Link(href="+this.cb_1+", label="+this.db_1+")"},ve(Ju).hashCode=function(){var n=he(this.cb_1);return Mn(n,31)+he(this.db_1)|0},ve(Ju).equals=function(n){if(this===n)return!0;if(!(n instanceof Ju))return!1;var t=n instanceof Ju?n:pe();return this.cb_1===t.cb_1&&this.db_1===t.db_1},ve(no).toString=function(){return"Label(text="+this.eb_1+")"},ve(no).hashCode=function(){return he(this.eb_1)},ve(no).equals=function(n){if(this===n)return!0;if(!(n instanceof no))return!1;var t=n instanceof no?n:pe();return this.eb_1===t.eb_1},ve(co).toString=function(){return"Info(label="+this.hb_1+", docLink="+this.ib_1+")"},ve(co).hashCode=function(){var n=ae(this.hb_1);return Mn(n,31)+(null==this.ib_1?0:ae(this.ib_1))|0},ve(co).equals=function(n){if(this===n)return!0;if(!(n instanceof co))return!1;var t=n instanceof co?n:pe();return!!le(this.hb_1,t.hb_1)&&!!le(this.ib_1,t.ib_1)},ve(ao).toString=function(){return"Project(path="+this.jb_1+")"},ve(ao).hashCode=function(){return he(this.jb_1)},ve(ao).equals=function(n){if(this===n)return!0;if(!(n instanceof ao))return!1;var t=n instanceof ao?n:pe();return this.jb_1===t.jb_1},ve(ho).toString=function(){return"Task(path="+this.kb_1+", type="+this.lb_1+")"},ve(ho).hashCode=function(){var n=he(this.kb_1);return Mn(n,31)+he(this.lb_1)|0},ve(ho).equals=function(n){if(this===n)return!0;if(!(n instanceof ho))return!1;var t=n instanceof ho?n:pe();return this.kb_1===t.kb_1&&this.lb_1===t.lb_1},ve(lo).toString=function(){return"TaskPath(path="+this.mb_1+")"},ve(lo).hashCode=function(){return he(this.mb_1)},ve(lo).equals=function(n){if(this===n)return!0;if(!(n instanceof lo))return!1;var t=n instanceof lo?n:pe();return this.mb_1===t.mb_1},ve(_o).toString=function(){return"Bean(type="+this.nb_1+")"},ve(_o).hashCode=function(){return he(this.nb_1)},ve(_o).equals=function(n){if(this===n)return!0;if(!(n instanceof _o))return!1;var t=n instanceof _o?n:pe();return this.nb_1===t.nb_1},ve(vo).toString=function(){return"SystemProperty(name="+this.ob_1+")"},ve(vo).hashCode=function(){return he(this.ob_1)},ve(vo).equals=function(n){if(this===n)return!0;if(!(n instanceof vo))return!1;var t=n instanceof vo?n:pe();return this.ob_1===t.ob_1},ve(go).toString=function(){return"Property(kind="+this.pb_1+", name="+this.qb_1+", owner="+this.rb_1+")"},ve(go).hashCode=function(){var n=he(this.pb_1);return n=Mn(n,31)+he(this.qb_1)|0,Mn(n,31)+he(this.rb_1)|0},ve(go).equals=function(n){if(this===n)return!0;if(!(n instanceof go))return!1;var t=n instanceof go?n:pe();return this.pb_1===t.pb_1&&this.qb_1===t.qb_1&&this.rb_1===t.rb_1},ve(wo).toString=function(){return"BuildLogic(location="+this.sb_1+")"},ve(wo).hashCode=function(){return he(this.sb_1)},ve(wo).equals=function(n){if(this===n)return!0;if(!(n instanceof wo))return!1;var t=n instanceof wo?n:pe();return this.sb_1===t.sb_1},ve(bo).toString=function(){return"BuildLogicClass(type="+this.tb_1+")"},ve(bo).hashCode=function(){return he(this.tb_1)},ve(bo).equals=function(n){if(this===n)return!0;if(!(n instanceof bo))return!1;var t=n instanceof bo?n:pe();return this.tb_1===t.tb_1},ve(ko).zb=function(){return this.yb_1},ve(ko).toString=function(){return"TaskTreeIntent(delegate="+this.yb_1+")"},ve(ko).hashCode=function(){return ae(this.yb_1)},ve(ko).equals=function(n){if(this===n)return!0;if(!(n instanceof ko))return!1;var t=n instanceof ko?n:pe();return!!le(this.yb_1,t.yb_1)},ve(qo).zb=function(){return this.ac_1},ve(qo).toString=function(){return"MessageTreeIntent(delegate="+this.ac_1+")"},ve(qo).hashCode=function(){return ae(this.ac_1)},ve(qo).equals=function(n){if(this===n)return!0;if(!(n instanceof qo))return!1;var t=n instanceof qo?n:pe();return!!le(this.ac_1,t.ac_1)},ve(yo).zb=function(){return this.bc_1},ve(yo).toString=function(){return"InputTreeIntent(delegate="+this.bc_1+")"},ve(yo).hashCode=function(){return ae(this.bc_1)},ve(yo).equals=function(n){if(this===n)return!0;if(!(n instanceof yo))return!1;var t=n instanceof yo?n:pe();return!!le(this.bc_1,t.bc_1)},ve(Bo).zb=function(){return this.cc_1},ve(Bo).toString=function(){return"IncompatibleTaskTreeIntent(delegate="+this.cc_1+")"},ve(Bo).hashCode=function(){return ae(this.cc_1)},ve(Bo).equals=function(n){if(this===n)return!0;if(!(n instanceof Bo))return!1;var t=n instanceof Bo?n:pe();return!!le(this.cc_1,t.cc_1)},ve(Co).toString=function(){return"SetTab(tab="+this.dc_1+")"},ve(Co).hashCode=function(){return this.dc_1.hashCode()},ve(Co).equals=function(n){if(this===n)return!0;if(!(n instanceof Co))return!1;var t=n instanceof Co?n:pe();return!!this.dc_1.equals(t.dc_1)},ve(xo).mc=function(n,t,r,i,e,u,o,f){return new xo(n,t,r,i,e,u,o,f)},ve(xo).nc=function(n,t,r,i,e,u,o,f,s){return n=n===A?this.ec_1:n,t=t===A?this.fc_1:t,r=r===A?this.gc_1:r,i=i===A?this.hc_1:i,e=e===A?this.ic_1:e,u=u===A?this.jc_1:u,o=o===A?this.kc_1:o,f=f===A?this.lc_1:f,s===A?this.mc(n,t,r,i,e,u,o,f):s.mc.call(this,n,t,r,i,e,u,o,f)},ve(xo).toString=function(){return"Model(heading="+this.ec_1+", summary="+this.fc_1+", learnMore="+this.gc_1+", messageTree="+this.hc_1+", locationTree="+this.ic_1+", inputTree="+this.jc_1+", incompatibleTaskTree="+this.kc_1+", tab="+this.lc_1+")"},ve(xo).hashCode=function(){var n=this.ec_1.hashCode();return n=Mn(n,31)+ae(this.fc_1)|0,n=Mn(n,31)+this.gc_1.hashCode()|0,n=Mn(n,31)+this.hc_1.hashCode()|0,n=Mn(n,31)+this.ic_1.hashCode()|0,n=Mn(n,31)+this.jc_1.hashCode()|0,n=Mn(n,31)+this.kc_1.hashCode()|0,Mn(n,31)+this.lc_1.hashCode()|0},ve(xo).equals=function(n){if(this===n)return!0;if(!(n instanceof xo))return!1;var t=n instanceof xo?n:pe();return!!(this.ec_1.equals(t.ec_1)&&le(this.fc_1,t.fc_1)&&this.gc_1.equals(t.gc_1)&&this.hc_1.equals(t.hc_1)&&this.ic_1.equals(t.ic_1)&&this.jc_1.equals(t.jc_1)&&this.kc_1.equals(t.kc_1)&&this.lc_1.equals(t.lc_1))},ve(Ko).gd=function(n,t){var r,i;return n instanceof ko?r=t.nc(A,A,A,A,ps().id(n.yb_1,t.ic_1)):n instanceof qo?r=t.nc(A,A,A,ps().id(n.ac_1,t.hc_1)):n instanceof yo?r=t.nc(A,A,A,A,A,ps().id(n.bc_1,t.jc_1)):n instanceof Bo?r=t.nc(A,A,A,A,A,A,ps().id(n.cc_1,t.kc_1)):n instanceof Dc?r=function(n,t,r,i){var e;return r instanceof qo?e=n.nc(A,A,A,Ac(n.hc_1,r,i)):r instanceof ko?e=n.nc(A,A,A,A,Ac(n.ic_1,r,i)):r instanceof yo?e=n.nc(A,A,A,A,A,Ac(n.jc_1,r,i)):r instanceof Bo?e=n.nc(A,A,A,A,A,A,Ac(n.kc_1,r,i)):(console.error("Unhandled tree intent: "+r),e=n),e}(t,0,n.xc_1,(i=n,function(n){var t;if(!(n instanceof Vu))throw _u(ce("Failed requirement."));for(var r=n.oa_1,e=i.wc_1,u=Rr(Tt(r,10)),o=0,f=r.f();f.g();){var s,c,a=f.h(),h=o;if(o=h+1|0,e===yr(h)){var l=a.sa_1;c=a.ua(A,null==l?null:l.ad())}else c=a;s=c,u.d(s)}return t=u,n.qa(A,A,t)})):n instanceof Mc?(window.navigator.clipboard.writeText(n.hd_1),r=t):n instanceof Co?r=t.nc(A,A,A,A,A,A,A,n.dc_1):(console.error("Unhandled intent: "+n),r=t),r},ve(Ko).ba=function(n,t){var r=n instanceof Oc?n:pe();return this.gd(r,t instanceof xo?t:pe())},ve(Ko).jd=function(n){return Hf().y9(us(Do),[Io(0,n),So(0,n)])},ve(Ko).z9=function(n){return this.jd(n instanceof xo?n:pe())},ve(nf).toString=function(){return"ImportedProblem(problem="+this.kd_1+", message="+this.ld_1+", trace="+this.md_1+")"},ve(nf).hashCode=function(){var n=ae(this.kd_1);return n=Mn(n,31)+this.ld_1.hashCode()|0,Mn(n,31)+ae(this.md_1)|0},ve(nf).equals=function(n){if(this===n)return!0;if(!(n instanceof nf))return!1;var t=n instanceof nf?n:pe();return!!le(this.kd_1,t.kd_1)&&!!this.ld_1.equals(t.ld_1)&&!!le(this.md_1,t.md_1)},ve(_f).ud=function(n,t){return this.td_1(n,t)},ve(_f).compare=function(n,t){return this.ud(n,t)},ve(Bf).toString=function(){return"LearnMore(text="+this.sc_1+", documentationLink="+this.tc_1+")"},ve(Bf).hashCode=function(){var n=he(this.sc_1);return Mn(n,31)+he(this.tc_1)|0},ve(Bf).equals=function(n){if(this===n)return!0;if(!(n instanceof Bf))return!1;var t=n instanceof Bf?n:pe();return this.sc_1===t.sc_1&&this.tc_1===t.tc_1},ve(Cf).toString=function(){return"Text(text="+this.fa_1+")"},ve(Cf).hashCode=function(){return he(this.fa_1)},ve(Cf).equals=function(n){if(this===n)return!0;if(!(n instanceof Cf))return!1;var t=n instanceof Cf?n:pe();return this.fa_1===t.fa_1},ve(xf).toString=function(){return"Reference(name="+this.da_1+", clipboardString="+this.ea_1+")"},ve(xf).hashCode=function(){var n=he(this.da_1);return Mn(n,31)+he(this.ea_1)|0},ve(xf).equals=function(n){if(this===n)return!0;if(!(n instanceof xf))return!1;var t=n instanceof xf?n:pe();return this.da_1===t.da_1&&this.ea_1===t.ea_1},ve(Pf).ed=function(n){return this.dd_1.d(new Cf(n)),this},ve(Pf).xd=function(n,t){return this.dd_1.d(new xf(n,t)),this},ve(Pf).fd=function(n,t,r){return t=t===A?n:t,r===A?this.xd(n,t):r.xd.call(this,n,t)},ve(Pf).j5=function(){return new zf(Qn(this.dd_1))},ve(If).rd=function(n){return new zf(qr(new Cf(n)))},ve(If).qd=function(n){var t=new Pf;return n(t),t.j5()},ve(zf).vd=function(n){return new zf(n)},ve(zf).toString=function(){return"PrettyText(fragments="+this.ca_1+")"},ve(zf).hashCode=function(){return ae(this.ca_1)},ve(zf).equals=function(n){if(this===n)return!0;if(!(n instanceof zf))return!1;var t=n instanceof zf?n:pe();return!!le(this.ca_1,t.ca_1)},ve(Tf).sd=function(n){return function(n){for(var t=Wr(),r=n.f();r.g();)for(var i=t,e=r.h().f();e.g();){var u,o=e.h(),f=i,s=f.v1(o);if(null==s){var c=Wr();f.h5(o,c),u=c}else u=s;i=u instanceof Xr?u:pe()}return t}(n)},ve(Af).toString=function(){return"Trie(nestedMaps="+this.wd_1+")"},ve(Af).hashCode=function(){return ae(this.wd_1)},ve(Af).equals=function(n){return function(n,t){return t instanceof Af&&!!le(n,t instanceof Af?t.wd_1:pe())}(this.wd_1,n)},ve(Kf).ga=function(n){return Jf().yd(this.x9_1,A,n)},ve(Kf).ha=function(n){return Jf().yd(this.x9_1,A,A,n)},ve(Kf).ja=function(n){return Jf().yd(this.x9_1,A,A,ou(n))},ve(Kf).y9=function(n,t){return Jf().yd(this.x9_1,n,A,ou(t))},ve(Kf).zd=function(n,t){return Jf().yd(this.x9_1,n,A,t)},ve(Kf).fb=function(n,t){return Jf().yd(this.x9_1,n,t)},ve(Kf).rc=function(n,t){return Jf().yd(this.x9_1,A,n,ou(t))},ve(Kf).toString=function(){return"ViewFactory(elementName="+this.x9_1+")"},ve(Kf).hashCode=function(){return he(this.x9_1)},ve(Kf).equals=function(n){if(this===n)return!0;if(!(n instanceof Kf))return!1;var t=n instanceof Kf?n:pe();return this.x9_1===t.x9_1},ve(Xf).ae=function(n,t,r,i){return new rs(n,t,r,i)},ve(Xf).yd=function(n,t,r,i,e){return t=t===A?Ct():t,r=r===A?null:r,i=i===A?Ct():i,e===A?this.ae(n,t,r,i):e.ae.call(this,n,t,r,i)},ve(rs).toString=function(){return"Element(elementName="+this.be_1+", attributes="+this.ce_1+", innerText="+this.de_1+", children="+this.ee_1+")"},ve(rs).hashCode=function(){var n=he(this.be_1);return n=Mn(n,31)+ae(this.ce_1)|0,n=Mn(n,31)+(null==this.de_1?0:he(this.de_1))|0,Mn(n,31)+ae(this.ee_1)|0},ve(rs).equals=function(n){if(this===n)return!0;if(!(n instanceof rs))return!1;var t=n instanceof rs?n:pe();return this.be_1===t.be_1&&!!le(this.ce_1,t.ce_1)&&this.de_1==t.de_1&&!!le(this.ee_1,t.ee_1)},ve(os).u9=function(n){return this.r9_1(new fs("click",n))},ve(os).t9=function(n){return this.r9_1(new ss(n))},ve(os).gb=function(n){for(var t=0,r=n.length;t<r;){var i=n[t];t=t+1|0,this.r9_1(new ss(i))}return br()},ve(os).s9=function(n){return this.r9_1(new cs("title",n))},ve(os).bd=function(n){return this.r9_1(new cs("href",n))},ve(vs).oe=function(){return this.ne_1},ve(vs).toString=function(){return"Toggle(focus="+this.ne_1+")"},ve(vs).hashCode=function(){return ae(this.ne_1)},ve(vs).equals=function(n){if(this===n)return!0;if(!(n instanceof vs))return!1;var t=n instanceof vs?n:pe();return!!le(this.ne_1,t.ne_1)},ve(ds).pe=function(n,t){return this.re(n.qe((r=t,function(n){return n.me(r(n.ub_1))})));var r},ve(ds).re=function(n){return new ds(n)},ve(ds).toString=function(){return"Model(tree="+this.xb_1+")"},ve(ds).hashCode=function(){return this.xb_1.hashCode()},ve(ds).equals=function(n){if(this===n)return!0;if(!(n instanceof ds))return!1;var t=n instanceof ds?n:pe();return!!this.xb_1.equals(t.xb_1)},ve(bs).id=function(n,t){var r;if(n instanceof vs){var i=n.oe();r=t.re(i.qe(ws))}else be();return r},ve(ks).cd=function(){return this.ve_1},ve(ks).we=function(){return 0},ve(ks).qe=function(n){return n(this.ve_1)},ve(ks).toString=function(){return"Original(tree="+this.ve_1+")"},ve(ks).hashCode=function(){return this.ve_1.hashCode()},ve(ks).equals=function(n){if(this===n)return!0;if(!(n instanceof ks))return!1;var t=n instanceof ks?n:pe();return!!this.ve_1.equals(t.ve_1)},ve(qs).cd=function(){return this.ue_1},ve(qs).we=function(){return this.se_1.we()+1|0},ve(qs).qe=function(n){return this.se_1.qe((t=this,r=n,function(n){for(var i,e=n.vb_1,u=t.te_1,o=Rr(Tt(e,10)),f=0,s=e.f();s.g();){var c,a=s.h(),h=f;f=h+1|0,c=u===yr(h)?r(a):a,o.d(c)}return i=o,n.me(A,i)}));var t,r},ve(qs).toString=function(){return"Child(parent="+this.se_1+", index="+this.te_1+", tree="+this.ue_1+")"},ve(qs).hashCode=function(){var n=ae(this.se_1);return n=Mn(n,31)+this.te_1|0,Mn(n,31)+this.ue_1.hashCode()|0},ve(qs).equals=function(n){if(this===n)return!0;if(!(n instanceof qs))return!1;var t=n instanceof qs?n:pe();return!!le(this.se_1,t.se_1)&&this.te_1===t.te_1&&!!this.ue_1.equals(t.ue_1)},ve(ys).ad=function(){var n;switch(this.q8_1){case 0:n=xs();break;case 1:n=Cs();break;default:be()}return n},ve(Bs).vc=function(){var n,t;return ut(Vn(Ve(0,this.cd().vb_1.k()-1|0)),(n=this,(t=function(t){return n.xe(t)}).callableName="child",t))},ve(Bs).xe=function(n){return new qs(this,n,this.cd().vb_1.j(n))},ve(js).uc=function(){return new ks(this)},ve(js).ye=function(){return!this.vb_1.i()},ve(js).ze=function(n,t,r){return new js(n,t,r)},ve(js).me=function(n,t,r,i){return n=n===A?this.ub_1:n,t=t===A?this.vb_1:t,r=r===A?this.wb_1:r,i===A?this.ze(n,t,r):i.ze.call(this,n,t,r)},ve(js).toString=function(){return"Tree(label="+this.ub_1+", children="+this.vb_1+", state="+this.wb_1+")"},ve(js).hashCode=function(){var n=null==this.ub_1?0:ae(this.ub_1);return n=Mn(n,31)+ae(this.vb_1)|0,Mn(n,31)+this.wb_1.hashCode()|0},ve(js).equals=function(n){if(this===n)return!0;if(!(n instanceof js))return!1;var t=n instanceof js?n:pe();return!!le(this.ub_1,t.ub_1)&&!!le(this.vb_1,t.vb_1)&&!!this.wb_1.equals(t.wb_1)},ve(zs).toString=function(){return"ProblemIdElement(name="+this.df_1+", displayName="+this.ef_1+")"},ve(zs).hashCode=function(){var n=he(this.df_1);return Mn(n,31)+he(this.ef_1)|0},ve(zs).equals=function(n){if(this===n)return!0;if(!(n instanceof zs))return!1;var t=n instanceof zs?n:pe();return this.df_1===t.df_1&&this.ef_1===t.ef_1},ve(Ts).toString=function(){return"ProblemSummary(problemId="+this.ff_1+", count="+this.gf_1+")"},ve(Ts).hashCode=function(){var n=ae(this.ff_1);return Mn(n,31)+this.gf_1|0},ve(Ts).equals=function(n){if(this===n)return!0;if(!(n instanceof Ts))return!1;var t=n instanceof Ts?n:pe();return!!le(this.ff_1,t.ff_1)&&this.gf_1===t.gf_1},ve(Ms).toString=function(){return"ProblemNodeGroup(tree="+this.hf_1+", children="+this.if_1+", childGroups="+this.jf_1+", id="+this.kf_1+")"},ve(Ms).hashCode=function(){var n=this.hf_1.hashCode();return n=Mn(n,31)+ae(this.if_1)|0,n=Mn(n,31)+ae(this.jf_1)|0,Mn(n,31)+this.kf_1|0},ve(Ms).equals=function(n){if(this===n)return!0;if(!(n instanceof Ms))return!1;var t=n instanceof Ms?n:pe();return!!this.hf_1.equals(t.hf_1)&&!!le(this.if_1,t.if_1)&&!!le(this.jf_1,t.jf_1)&&this.kf_1===t.kf_1},ve(uc).toString=function(){return"Text(text="+this.lf_1+")"},ve(uc).hashCode=function(){return he(this.lf_1)},ve(uc).equals=function(n){if(this===n)return!0;if(!(n instanceof uc))return!1;var t=n instanceof uc?n:pe();return this.lf_1===t.lf_1},ve(oc).toString=function(){return"ProblemIdNode(prettyText="+this.mf_1+", separator="+this.nf_1+")"},ve(oc).hashCode=function(){var n=this.mf_1.hashCode();return Mn(n,31)+(0|this.nf_1)|0},ve(oc).equals=function(n){if(this===n)return!0;if(!(n instanceof oc))return!1;var t=n instanceof oc?n:pe();return!!this.mf_1.equals(t.mf_1)&&this.nf_1===t.nf_1},ve(fc).toString=function(){return"Advice(label="+this.of_1+", docLink="+this.pf_1+")"},ve(fc).hashCode=function(){var n=ae(this.of_1);return Mn(n,31)+(null==this.pf_1?0:ae(this.pf_1))|0},ve(fc).equals=function(n){if(this===n)return!0;if(!(n instanceof fc))return!1;var t=n instanceof fc?n:pe();return!!le(this.of_1,t.of_1)&&!!le(this.pf_1,t.pf_1)},ve(cc).zb=function(){return this.qf_1},ve(cc).toString=function(){return"MessageTreeIntent(delegate="+this.qf_1+")"},ve(cc).hashCode=function(){return ae(this.qf_1)},ve(cc).equals=function(n){if(this===n)return!0;if(!(n instanceof cc))return!1;var t=n instanceof cc?n:pe();return!!le(this.qf_1,t.qf_1)},ve(ac).zb=function(){return this.rf_1},ve(ac).toString=function(){return"ProblemIdTreeIntent(delegate="+this.rf_1+")"},ve(ac).hashCode=function(){return ae(this.rf_1)},ve(ac).equals=function(n){if(this===n)return!0;if(!(n instanceof ac))return!1;var t=n instanceof ac?n:pe();return!!le(this.rf_1,t.rf_1)},ve(hc).zb=function(){return this.sf_1},ve(hc).toString=function(){return"FileLocationTreeIntent(delegate="+this.sf_1+")"},ve(hc).hashCode=function(){return ae(this.sf_1)},ve(hc).equals=function(n){if(this===n)return!0;if(!(n instanceof hc))return!1;var t=n instanceof hc?n:pe();return!!le(this.sf_1,t.sf_1)},ve(lc).zb=function(){return this.tf_1},ve(lc).toString=function(){return"PluginLocationTreeIntent(delegate="+this.tf_1+")"},ve(lc).hashCode=function(){return ae(this.tf_1)},ve(lc).equals=function(n){if(this===n)return!0;if(!(n instanceof lc))return!1;var t=n instanceof lc?n:pe();return!!le(this.tf_1,t.tf_1)},ve(_c).zb=function(){return this.uf_1},ve(_c).toString=function(){return"TaskLocationTreeIntent(delegate="+this.uf_1+")"},ve(_c).hashCode=function(){return ae(this.uf_1)},ve(_c).equals=function(n){if(this===n)return!0;if(!(n instanceof _c))return!1;var t=n instanceof _c?n:pe();return!!le(this.uf_1,t.uf_1)},ve(vc).toString=function(){return"SetTab(tab="+this.vf_1+")"},ve(vc).hashCode=function(){return this.vf_1.hashCode()},ve(vc).equals=function(n){if(this===n)return!0;if(!(n instanceof vc))return!1;var t=n instanceof vc?n:pe();return!!this.vf_1.equals(t.vf_1)},ve(dc).gg=function(n,t,r,i,e,u,o,f,s,c){return new dc(n,t,r,i,e,u,o,f,s,c)},ve(dc).hg=function(n,t,r,i,e,u,o,f,s,c,a){return n=n===A?this.wf_1:n,t=t===A?this.xf_1:t,r=r===A?this.yf_1:r,i=i===A?this.zf_1:i,e=e===A?this.ag_1:e,u=u===A?this.bg_1:u,o=o===A?this.cg_1:o,f=f===A?this.dg_1:f,s=s===A?this.eg_1:s,c=c===A?this.fg_1:c,a===A?this.gg(n,t,r,i,e,u,o,f,s,c):a.gg.call(this,n,t,r,i,e,u,o,f,s,c)},ve(dc).toString=function(){return"Model(heading="+this.wf_1+", summary="+this.xf_1+", learnMore="+this.yf_1+", messageTree="+this.zf_1+", problemIdTree="+this.ag_1+", fileLocationTree="+this.bg_1+", pluginLocationTree="+this.cg_1+", taskLocationTree="+this.dg_1+", problemCount="+this.eg_1+", tab="+this.fg_1+")"},ve(dc).hashCode=function(){var n=this.wf_1.hashCode();return n=Mn(n,31)+ae(this.xf_1)|0,n=Mn(n,31)+this.yf_1.hashCode()|0,n=Mn(n,31)+this.zf_1.hashCode()|0,n=Mn(n,31)+this.ag_1.hashCode()|0,n=Mn(n,31)+this.bg_1.hashCode()|0,n=Mn(n,31)+this.cg_1.hashCode()|0,n=Mn(n,31)+this.dg_1.hashCode()|0,n=Mn(n,31)+this.eg_1|0,Mn(n,31)+this.fg_1.hashCode()|0},ve(dc).equals=function(n){if(this===n)return!0;if(!(n instanceof dc))return!1;var t=n instanceof dc?n:pe();return!!(this.wf_1.equals(t.wf_1)&&le(this.xf_1,t.xf_1)&&this.yf_1.equals(t.yf_1)&&this.zf_1.equals(t.zf_1)&&this.ag_1.equals(t.ag_1)&&this.bg_1.equals(t.bg_1)&&this.cg_1.equals(t.cg_1)&&this.dg_1.equals(t.dg_1)&&this.eg_1===t.eg_1&&this.fg_1.equals(t.fg_1))},ve(Lc).ig=function(n,t){var r,i;return n instanceof hc?r=t.hg(A,A,A,A,A,ps().id(n.sf_1,t.bg_1)):n instanceof lc?r=t.hg(A,A,A,A,A,A,ps().id(n.tf_1,t.cg_1)):n instanceof _c?r=t.hg(A,A,A,A,A,A,A,ps().id(n.uf_1,t.dg_1)):n instanceof ac?r=t.hg(A,A,A,A,ps().id(n.rf_1,t.ag_1)):n instanceof cc?r=t.hg(A,A,A,ps().id(n.qf_1,t.zf_1)):n instanceof Dc?r=function(n,t,r,i){var e;return r instanceof cc?e=n.hg(A,A,A,Ac(n.zf_1,r,i)):r instanceof ac?e=n.hg(A,A,A,A,Ac(n.ag_1,r,i)):r instanceof hc?e=n.hg(A,A,A,A,A,Ac(n.bg_1,r,i)):r instanceof lc?e=n.hg(A,A,A,A,A,A,Ac(n.cg_1,r,i)):r instanceof _c?e=n.hg(A,A,A,A,A,A,A,Ac(n.dg_1,r,i)):(console.error("Unhandled tree intent: "+r),e=n),e}(t,0,n.xc_1,(i=n,function(n){var t;if(!(n instanceof Vu))throw _u(ce("Failed requirement."));for(var r=n.oa_1,e=i.wc_1,u=Rr(Tt(r,10)),o=0,f=r.f();f.g();){var s,c,a=f.h(),h=o;if(o=h+1|0,e===yr(h)){var l=a.sa_1;c=a.ua(A,null==l?null:l.ad())}else c=a;s=c,u.d(s)}return t=u,n.qa(A,A,t)})):n instanceof Mc?(window.navigator.clipboard.writeText(n.hd_1),r=t):n instanceof vc?r=t.hg(A,A,A,A,A,A,A,A,A,n.vf_1):(console.error("Unhandled intent: "+n),r=t),r},ve(Lc).ba=function(n,t){var r=n instanceof Oc?n:pe();return this.ig(r,t instanceof dc?t:pe())},ve(Lc).jg=function(n){return Hf().y9(us(xc),[wc(0,n),bc(0,n)])},ve(Lc).z9=function(n){return this.jg(n instanceof dc?n:pe())},ve(Mc).toString=function(){return"Copy(text="+this.hd_1+")"},ve(Mc).hashCode=function(){return he(this.hd_1)},ve(Mc).equals=function(n){if(this===n)return!0;if(!(n instanceof Mc))return!1;var t=n instanceof Mc?n:pe();return this.hd_1===t.hd_1},ve(Dc).toString=function(){return"ToggleStackTracePart(partIndex="+this.wc_1+", location="+this.xc_1+")"},ve(Dc).hashCode=function(){var n=this.wc_1;return Mn(n,31)+ae(this.xc_1)|0},ve(Dc).equals=function(n){if(this===n)return!0;if(!(n instanceof Dc))return!1;var t=n instanceof Dc?n:pe();return this.wc_1===t.wc_1&&!!le(this.xc_1,t.xc_1)},ve(ui).k6=function(){var n=Object.create(null);return n.foo=1,delete n.foo,br(),n},l=null,function(){var n=configurationCacheProblems();if(null==n.problemsReport)Mf(Ff("report"),Xo(),function(n){var t,r,i,e,u,o,f,s,c,a,h=function(n){for(var t=Or(),r=Or(),i=Or(),e=0,u=n.length;e<u;){var o=n[e];e=e+1|0;var f,s=o.input,c=null==s?null:r.d(rf(s,o));if(null==c){var a=o.incompatibleTask;f=null==a?null:i.d(rf(a,o))}else f=c;if(null==f){var h=we(o.problem);t.d(rf(h,o))}}return new tf(t,r,i)}(n.diagnostics),l=n.totalProblemCount;return new xo((f=(t=n).buildName,s=t.requestedTasks,c=null==s?null:rr(s," ",A,r=r!==A&&r)>=0,a=null==c||c,Sf().qd((i=t,e=f,u=s,o=a,function(n){n.ed(function(n){var t;if(re(n)>0){var r,i=ne(n,0);r=function(n){return 97<=n&&n<=122||!(Ei(n,128)<0)&&function(n){var t;return t=1===function(n){var t=n,r=su(au().h9_1,t),i=au().h9_1[r],e=(i+au().i9_1[r]|0)-1|0,u=au().j9_1[r];if(t>e)return 0;var o=3&u;if(0===o){var f=2,s=i,c=0;if(c<=1)do{if(c=c+1|0,(s=s+(u>>f&127)|0)>t)return 3;if((s=s+(u>>(f=f+7|0)&127)|0)>t)return 0;f=f+7|0}while(c<=1);return 3}if(u<=7)return o;var a=t-i|0;return u>>Mn(2,u<=31?a%2|0:a)&3}(n)||function(n){var t=su(lu().k9_1,n);return t>=0&&n<(lu().k9_1[t]+lu().l9_1[t]|0)}(n),t}(n)}(i)?function(n){return function(n){var t=Li(n).toUpperCase();if(t.length>1){var r;if(329===n)r=t;else{var i=ne(t,0),e=t.substring(1).toLowerCase();r=Li(i)+e}return r}return Li(function(n){return function(n){var t=n;return 452<=t&&t<=460||497<=t&&t<=499?Ue(Mn(3,(t+1|0)/3|0)):4304<=t&&t<=4346||4349<=t&&t<=4351?n:xi(n)}(n)}(n))}(n)}(i):Li(i),t=ce(r)+n.substring(1)}else t=n;return t}(i.cacheAction)+" the configuration cache for ");var t=e;null==t||n.fd(t),null==e||n.ed(" build and ");var r=u;return null==(null==r?null:n.fd(r))&&n.ed("default"),n.ed(o?" tasks":" task"),br()}))),function(n,t){var r=n.cacheActionDescription,i=null==r?null:mf(r),e=Sf().rd(function(n){var t=n.od_1.k(),r=kf(t,"build configuration input");return t>0?r+" and will cause the cache to be discarded when "+(t<=1?"its":"their")+" value change":r}(t)),u=Sf().rd(function(n,t){var r=n.totalProblemCount,i=t.nd_1.k(),e=kf(r,"problem");return r>i?e+", only the first "+i+" "+yf(i)+" included in this report":e}(n,t));return function(n,t){for(var r=0,i=n.length;r<i;){var e=n[r];r=r+1|0,null!=e&&t.d(e)}return t}([i,e,u],Or())}(n,h),new Bf("Gradle Configuration Cache",n.documentationLink),hf(new no(Zo().qc_1),ut(Vn(h.nd_1),gf)),hf(new no(Yo().qc_1),function(n){return ut(Vn(n),wf)}(h.nd_1)),hf(new no(Qo().qc_1),ut(Vn(h.od_1),vf)),hf(new no(Wo().qc_1),ut(Vn(h.pd_1),df)),0===l?Qo():Zo())}(n));else{var t=n.problemsReport;Mf(Ff("report"),Nc(),function(n,t){ec();for(var r=n.summaries,i=Rr(r.length),e=0,u=r.length;e<u;){var o,f=r[e];e=e+1|0;for(var s=f.problemId,c=Rr(s.length),a=0,h=s.length;a<h;){var l,_=s[a];a=a+1|0,l=new zs(_.name,_.displayName),c.d(l)}o=new Ts(c,f.count),i.d(o)}for(var v=i,d=function(n,t){ec();for(var r=li(),i=0,e=n.length;i<e;){var u=n[i];i=i+1|0;var o,f=(a=u.problemId,ec(),On(a,":",A,A,A,A,Ws)),s=r.v1(f);if(null==s){var c=Or();r.h5(f,c),o=c}else o=s;o.d(u)}for(var a,h=r.o(),l=Rr(Tt(h,10)),_=h.f();_.g();){for(var v,d=_.h(),g=d.i1(),w=Rr(Tt(g,10)),b=g.f();b.g();){var p;p=Os(b.h(),null,!0),w.d(p)}var m,k=Zn(w),q=Un(d.i1()),y=Hs(q,new Wu($s(Rs(q)).ed(" ("+d.i1().k()+")").j5()));n:{for(var B=t.f();B.g();){var C=B.h();if(Ds(C.ff_1,q.problemId)){m=C;break n}}m=null}var x=m;null==x||k.d(Ns(x.gf_1)),v=new js(y,k),l.d(v)}var j=l;return new ds(new js(new uc("message tree root"),j))}(t,v),g=function(n,t){ec();for(var r=function(){ec();var n=Or();return new Ms(new js(new oc(Sf().rd("Ungrouped"),!0),n),n,li())}(),i=li(),e=0,u=n.length;e<u;){var o=n[e];e=e+1|0;for(var f=Yn(Dn(o.problemId,1)),s=Rr(Tt(f,10)),c=f.f();c.g();){var a,h=c.h();a=new zs(h.name,h.displayName),s.d(a)}var l=Fs(i,s),_=Os(o);null==l?r.if_1.d(_):l.if_1.d(_)}for(var v=Rr(Tt(t,10)),d=t.f();d.g();){var g,w=d.h();g=new Ts(Yn(Wn(w.ff_1,1)),w.gf_1),v.d(g)}for(var b=li(),p=v.f();p.g();){var m,k=p.h(),q=k.ff_1,y=b.v1(q);if(null==y){var B=Or();b.h5(q,B),m=B}else m=y;m.d(k)}for(var C=b.o(),x=Rr(Tt(C,10)),j=C.f();j.g();){for(var P,I=j.h(),S=I.j1(),z=0,T=I.i1().f();T.g();)z=z+T.h().gf_1|0;P=new Ts(S,z),x.d(P)}for(var E=x.f();E.g();){var L=E.h(),N=Fs(i,L.ff_1),A=null==N?null:N.if_1;null==A||A.d(Ns(L.gf_1))}for(var M=i.w1(),F=Rr(Tt(M,10)),D=M.f();D.g();){var O;O=D.h().hf_1,F.d(O)}var R=function(n,t){var r=Rr(n.k());return r.m(n),r.d(t),r}(F,r.hf_1);return new ds(new js(new uc("group tree root"),R))}(t,v),w=0,b=v.f();b.g();)w=w+b.h().gf_1|0;for(var p=Es(t,w,(ec(),wn)),m=0,k=v.f();k.g();)m=m+k.h().gf_1|0;for(var q=Es(t,m,(ec(),bn)),y=0,B=v.f();B.g();)y=y+B.h().gf_1|0;var C=Es(t,y,(ec(),pn));return new dc(Sf().rd("Problems Report"),function(n,t){ec();var r,i,e,u=n.description,o=null==u?null:qr(mf(u));return r=null==o?qr(Sf().qd((i=t,e=n,function(n){n.ed(i.length+" problems have been reported during the execution");var t=e.buildName;null==t||(n.ed(" of build "),n.fd(t));var r=e.requestedTasks;return null==r||(n.ed(" for the following tasks:"),n.fd(r),br()),br()}))):o,r}(n,t),new Bf("reporting problems",n.documentationLink),d,g,p,q,C,t.length,function(n,t,r,i,e){return ec(),po(r)>0?tc():po(n)>0?Js():po(t)>0?nc():po(i)>0?rc():po(e)>0?ic():Js()}(d,g,p,q,C))}(t,n.diagnostics))}}(),n}(void 0===this["configuration-cache-report"]?{}:this["configuration-cache-report"])}}[70](),{}))));
//# sourceMappingURL=configuration-cache-report.js.map
                </script>

</body>
</html>
````

## File: android/gradle.properties
````
org.gradle.jvmargs=-Xmx8G -XX:MaxMetaspaceSize=4G -XX:ReservedCodeCacheSize=512m -XX:+HeapDumpOnOutOfMemoryError
android.useAndroidX=true
````

## File: android/gradle/wrapper/gradle-wrapper.properties
````
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.14-all.zip
````

## File: android/settings.gradle.kts
````kotlin
pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.11.1" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

include(":app")
````

## File: ios/.gitignore
````
**/dgph
*.mode1v3
*.mode2v3
*.moved-aside
*.pbxuser
*.perspectivev3
**/*sync/
.sconsign.dblite
.tags*
**/.vagrant/
**/DerivedData/
Icon?
**/Pods/
**/.symlinks/
profile
xcuserdata
**/.generated/
Flutter/App.framework
Flutter/Flutter.framework
Flutter/Flutter.podspec
Flutter/Generated.xcconfig
Flutter/ephemeral/
Flutter/app.flx
Flutter/app.zip
Flutter/flutter_assets/
Flutter/flutter_export_environment.sh
ServiceDefinitions.json
Runner/GeneratedPluginRegistrant.*

# Exceptions to above rules.
!default.mode1v3
!default.mode2v3
!default.pbxuser
!default.perspectivev3
````

## File: ios/Flutter/AppFrameworkInfo.plist
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleDevelopmentRegion</key>
  <string>en</string>
  <key>CFBundleExecutable</key>
  <string>App</string>
  <key>CFBundleIdentifier</key>
  <string>io.flutter.flutter.app</string>
  <key>CFBundleInfoDictionaryVersion</key>
  <string>6.0</string>
  <key>CFBundleName</key>
  <string>App</string>
  <key>CFBundlePackageType</key>
  <string>FMWK</string>
  <key>CFBundleShortVersionString</key>
  <string>1.0</string>
  <key>CFBundleSignature</key>
  <string>????</string>
  <key>CFBundleVersion</key>
  <string>1.0</string>
</dict>
</plist>
````

## File: ios/Flutter/Debug.xcconfig
````
#include "Generated.xcconfig"
````

## File: ios/Flutter/Release.xcconfig
````
#include "Generated.xcconfig"
````

## File: ios/Runner.xcodeproj/project.pbxproj
````
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 54;
	objects = {

/* Begin PBXBuildFile section */
		1498D2341E8E89220040F4C2 /* GeneratedPluginRegistrant.m in Sources */ = {isa = PBXBuildFile; fileRef = 1498D2331E8E89220040F4C2 /* GeneratedPluginRegistrant.m */; };
		331C808B294A63AB00263BE5 /* RunnerTests.swift in Sources */ = {isa = PBXBuildFile; fileRef = 331C807B294A618700263BE5 /* RunnerTests.swift */; };
		3B3967161E833CAA004F5970 /* AppFrameworkInfo.plist in Resources */ = {isa = PBXBuildFile; fileRef = 3B3967151E833CAA004F5970 /* AppFrameworkInfo.plist */; };
		74858FAF1ED2DC5600515810 /* AppDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 74858FAE1ED2DC5600515810 /* AppDelegate.swift */; };
		7884E8682EC3CC0700C636F2 /* SceneDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 7884E8672EC3CC0400C636F2 /* SceneDelegate.swift */; };
		97C146FC1CF9000F007C117D /* Main.storyboard in Resources */ = {isa = PBXBuildFile; fileRef = 97C146FA1CF9000F007C117D /* Main.storyboard */; };
		97C146FE1CF9000F007C117D /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 97C146FD1CF9000F007C117D /* Assets.xcassets */; };
		97C147011CF9000F007C117D /* LaunchScreen.storyboard in Resources */ = {isa = PBXBuildFile; fileRef = 97C146FF1CF9000F007C117D /* LaunchScreen.storyboard */; };
/* End PBXBuildFile section */

/* Begin PBXContainerItemProxy section */
		331C8085294A63A400263BE5 /* PBXContainerItemProxy */ = {
			isa = PBXContainerItemProxy;
			containerPortal = 97C146E61CF9000F007C117D /* Project object */;
			proxyType = 1;
			remoteGlobalIDString = 97C146ED1CF9000F007C117D;
			remoteInfo = Runner;
		};
/* End PBXContainerItemProxy section */

/* Begin PBXCopyFilesBuildPhase section */
		9705A1C41CF9048500538489 /* Embed Frameworks */ = {
			isa = PBXCopyFilesBuildPhase;
			buildActionMask = 2147483647;
			dstPath = "";
			dstSubfolderSpec = 10;
			files = (
			);
			name = "Embed Frameworks";
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXCopyFilesBuildPhase section */

/* Begin PBXFileReference section */
		1498D2321E8E86230040F4C2 /* GeneratedPluginRegistrant.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GeneratedPluginRegistrant.h; sourceTree = "<group>"; };
		1498D2331E8E89220040F4C2 /* GeneratedPluginRegistrant.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = GeneratedPluginRegistrant.m; sourceTree = "<group>"; };
		331C807B294A618700263BE5 /* RunnerTests.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RunnerTests.swift; sourceTree = "<group>"; };
		331C8081294A63A400263BE5 /* RunnerTests.xctest */ = {isa = PBXFileReference; explicitFileType = wrapper.cfbundle; includeInIndex = 0; path = RunnerTests.xctest; sourceTree = BUILT_PRODUCTS_DIR; };
		3B3967151E833CAA004F5970 /* AppFrameworkInfo.plist */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.plist.xml; name = AppFrameworkInfo.plist; path = Flutter/AppFrameworkInfo.plist; sourceTree = "<group>"; };
		74858FAD1ED2DC5600515810 /* Runner-Bridging-Header.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = "Runner-Bridging-Header.h"; sourceTree = "<group>"; };
		74858FAE1ED2DC5600515810 /* AppDelegate.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = AppDelegate.swift; sourceTree = "<group>"; };
		7884E8672EC3CC0400C636F2 /* SceneDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SceneDelegate.swift; sourceTree = "<group>"; };
		7AFA3C8E1D35360C0083082E /* Release.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; name = Release.xcconfig; path = Flutter/Release.xcconfig; sourceTree = "<group>"; };
		9740EEB21CF90195004384FC /* Debug.xcconfig */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.xcconfig; name = Debug.xcconfig; path = Flutter/Debug.xcconfig; sourceTree = "<group>"; };
		9740EEB31CF90195004384FC /* Generated.xcconfig */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.xcconfig; name = Generated.xcconfig; path = Flutter/Generated.xcconfig; sourceTree = "<group>"; };
		97C146EE1CF9000F007C117D /* Runner.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = Runner.app; sourceTree = BUILT_PRODUCTS_DIR; };
		97C146FB1CF9000F007C117D /* Base */ = {isa = PBXFileReference; lastKnownFileType = file.storyboard; name = Base; path = Base.lproj/Main.storyboard; sourceTree = "<group>"; };
		97C146FD1CF9000F007C117D /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
		97C147001CF9000F007C117D /* Base */ = {isa = PBXFileReference; lastKnownFileType = file.storyboard; name = Base; path = Base.lproj/LaunchScreen.storyboard; sourceTree = "<group>"; };
		97C147021CF9000F007C117D /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = Info.plist; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		97C146EB1CF9000F007C117D /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		331C8082294A63A400263BE5 /* RunnerTests */ = {
			isa = PBXGroup;
			children = (
				331C807B294A618700263BE5 /* RunnerTests.swift */,
			);
			path = RunnerTests;
			sourceTree = "<group>";
		};
		9740EEB11CF90186004384FC /* Flutter */ = {
			isa = PBXGroup;
			children = (
				3B3967151E833CAA004F5970 /* AppFrameworkInfo.plist */,
				9740EEB21CF90195004384FC /* Debug.xcconfig */,
				7AFA3C8E1D35360C0083082E /* Release.xcconfig */,
				9740EEB31CF90195004384FC /* Generated.xcconfig */,
			);
			name = Flutter;
			sourceTree = "<group>";
		};
		97C146E51CF9000F007C117D = {
			isa = PBXGroup;
			children = (
				9740EEB11CF90186004384FC /* Flutter */,
				97C146F01CF9000F007C117D /* Runner */,
				97C146EF1CF9000F007C117D /* Products */,
				331C8082294A63A400263BE5 /* RunnerTests */,
			);
			sourceTree = "<group>";
		};
		97C146EF1CF9000F007C117D /* Products */ = {
			isa = PBXGroup;
			children = (
				97C146EE1CF9000F007C117D /* Runner.app */,
				331C8081294A63A400263BE5 /* RunnerTests.xctest */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		97C146F01CF9000F007C117D /* Runner */ = {
			isa = PBXGroup;
			children = (
				97C146FA1CF9000F007C117D /* Main.storyboard */,
				97C146FD1CF9000F007C117D /* Assets.xcassets */,
				97C146FF1CF9000F007C117D /* LaunchScreen.storyboard */,
				97C147021CF9000F007C117D /* Info.plist */,
				1498D2321E8E86230040F4C2 /* GeneratedPluginRegistrant.h */,
				1498D2331E8E89220040F4C2 /* GeneratedPluginRegistrant.m */,
				74858FAE1ED2DC5600515810 /* AppDelegate.swift */,
				7884E8672EC3CC0400C636F2 /* SceneDelegate.swift */,
				74858FAD1ED2DC5600515810 /* Runner-Bridging-Header.h */,
			);
			path = Runner;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		331C8080294A63A400263BE5 /* RunnerTests */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 331C8087294A63A400263BE5 /* Build configuration list for PBXNativeTarget "RunnerTests" */;
			buildPhases = (
				331C807D294A63A400263BE5 /* Sources */,
				331C807F294A63A400263BE5 /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
				331C8086294A63A400263BE5 /* PBXTargetDependency */,
			);
			name = RunnerTests;
			productName = RunnerTests;
			productReference = 331C8081294A63A400263BE5 /* RunnerTests.xctest */;
			productType = "com.apple.product-type.bundle.unit-test";
		};
		97C146ED1CF9000F007C117D /* Runner */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 97C147051CF9000F007C117D /* Build configuration list for PBXNativeTarget "Runner" */;
			buildPhases = (
				9740EEB61CF901F6004384FC /* Run Script */,
				97C146EA1CF9000F007C117D /* Sources */,
				97C146EB1CF9000F007C117D /* Frameworks */,
				97C146EC1CF9000F007C117D /* Resources */,
				9705A1C41CF9048500538489 /* Embed Frameworks */,
				3B06AD1E1E4923F5004D2608 /* Thin Binary */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = Runner;
			productName = Runner;
			productReference = 97C146EE1CF9000F007C117D /* Runner.app */;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		97C146E61CF9000F007C117D /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = YES;
				LastUpgradeCheck = 1510;
				ORGANIZATIONNAME = "";
				TargetAttributes = {
					331C8080294A63A400263BE5 = {
						CreatedOnToolsVersion = 14.0;
						TestTargetID = 97C146ED1CF9000F007C117D;
					};
					97C146ED1CF9000F007C117D = {
						CreatedOnToolsVersion = 7.3.1;
						LastSwiftMigration = 1100;
					};
				};
			};
			buildConfigurationList = 97C146E91CF9000F007C117D /* Build configuration list for PBXProject "Runner" */;
			compatibilityVersion = "Xcode 9.3";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = 97C146E51CF9000F007C117D;
			productRefGroup = 97C146EF1CF9000F007C117D /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				97C146ED1CF9000F007C117D /* Runner */,
				331C8080294A63A400263BE5 /* RunnerTests */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		331C807F294A63A400263BE5 /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		97C146EC1CF9000F007C117D /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				97C147011CF9000F007C117D /* LaunchScreen.storyboard in Resources */,
				3B3967161E833CAA004F5970 /* AppFrameworkInfo.plist in Resources */,
				97C146FE1CF9000F007C117D /* Assets.xcassets in Resources */,
				97C146FC1CF9000F007C117D /* Main.storyboard in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXShellScriptBuildPhase section */
		3B06AD1E1E4923F5004D2608 /* Thin Binary */ = {
			isa = PBXShellScriptBuildPhase;
			alwaysOutOfDate = 1;
			buildActionMask = 2147483647;
			files = (
			);
			inputPaths = (
				"${TARGET_BUILD_DIR}/${INFOPLIST_PATH}",
			);
			name = "Thin Binary";
			outputPaths = (
			);
			runOnlyForDeploymentPostprocessing = 0;
			shellPath = /bin/sh;
			shellScript = "/bin/sh \"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh\" embed_and_thin";
		};
		9740EEB61CF901F6004384FC /* Run Script */ = {
			isa = PBXShellScriptBuildPhase;
			alwaysOutOfDate = 1;
			buildActionMask = 2147483647;
			files = (
			);
			inputPaths = (
			);
			name = "Run Script";
			outputPaths = (
			);
			runOnlyForDeploymentPostprocessing = 0;
			shellPath = /bin/sh;
			shellScript = "/bin/sh \"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh\" build";
		};
/* End PBXShellScriptBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		331C807D294A63A400263BE5 /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				331C808B294A63AB00263BE5 /* RunnerTests.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		97C146EA1CF9000F007C117D /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				74858FAF1ED2DC5600515810 /* AppDelegate.swift in Sources */,
				1498D2341E8E89220040F4C2 /* GeneratedPluginRegistrant.m in Sources */,
				7884E8682EC3CC0700C636F2 /* SceneDelegate.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin PBXTargetDependency section */
		331C8086294A63A400263BE5 /* PBXTargetDependency */ = {
			isa = PBXTargetDependency;
			target = 97C146ED1CF9000F007C117D /* Runner */;
			targetProxy = 331C8085294A63A400263BE5 /* PBXContainerItemProxy */;
		};
/* End PBXTargetDependency section */

/* Begin PBXVariantGroup section */
		97C146FA1CF9000F007C117D /* Main.storyboard */ = {
			isa = PBXVariantGroup;
			children = (
				97C146FB1CF9000F007C117D /* Base */,
			);
			name = Main.storyboard;
			sourceTree = "<group>";
		};
		97C146FF1CF9000F007C117D /* LaunchScreen.storyboard */ = {
			isa = PBXVariantGroup;
			children = (
				97C147001CF9000F007C117D /* Base */,
			);
			name = LaunchScreen.storyboard;
			sourceTree = "<group>";
		};
/* End PBXVariantGroup section */

/* Begin XCBuildConfiguration section */
		249021D3217E4FDB00AE95B9 /* Profile */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++0x";
				CLANG_CXX_LIBRARY = "libc++";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = NO;
				GCC_C_LANGUAGE_STANDARD = gnu99;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 13.0;
				MTL_ENABLE_DEBUG_INFO = NO;
				SDKROOT = iphoneos;
				SUPPORTED_PLATFORMS = iphoneos;
				TARGETED_DEVICE_FAMILY = "1,2";
				VALIDATE_PRODUCT = YES;
			};
			name = Profile;
		};
		249021D4217E4FDB00AE95B9 /* Profile */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 7AFA3C8E1D35360C0083082E /* Release.xcconfig */;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CLANG_ENABLE_MODULES = YES;
				CURRENT_PROJECT_VERSION = "$(FLUTTER_BUILD_NUMBER)";
				ENABLE_BITCODE = NO;
				INFOPLIST_FILE = Runner/Info.plist;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_OBJC_BRIDGING_HEADER = "Runner/Runner-Bridging-Header.h";
				SWIFT_VERSION = 5.0;
				VERSIONING_SYSTEM = "apple-generic";
			};
			name = Profile;
		};
		331C8088294A63A400263BE5 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = "$(TEST_HOST)";
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				GENERATE_INFOPLIST_FILE = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice.RunnerTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
				SWIFT_VERSION = 5.0;
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/Runner.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/Runner";
			};
			name = Debug;
		};
		331C8089294A63A400263BE5 /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = "$(TEST_HOST)";
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				GENERATE_INFOPLIST_FILE = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice.RunnerTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_VERSION = 5.0;
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/Runner.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/Runner";
			};
			name = Release;
		};
		331C808A294A63A400263BE5 /* Profile */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = "$(TEST_HOST)";
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				GENERATE_INFOPLIST_FILE = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice.RunnerTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_VERSION = 5.0;
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/Runner.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/Runner";
			};
			name = Profile;
		};
		97C147031CF9000F007C117D /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++0x";
				CLANG_CXX_LIBRARY = "libc++";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_TESTABILITY = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = NO;
				GCC_C_LANGUAGE_STANDARD = gnu99;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"$(inherited)",
				);
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 13.0;
				MTL_ENABLE_DEBUG_INFO = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Debug;
		};
		97C147041CF9000F007C117D /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++0x";
				CLANG_CXX_LIBRARY = "libc++";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				"CODE_SIGN_IDENTITY[sdk=iphoneos*]" = "iPhone Developer";
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = NO;
				GCC_C_LANGUAGE_STANDARD = gnu99;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 13.0;
				MTL_ENABLE_DEBUG_INFO = NO;
				SDKROOT = iphoneos;
				SUPPORTED_PLATFORMS = iphoneos;
				SWIFT_COMPILATION_MODE = wholemodule;
				SWIFT_OPTIMIZATION_LEVEL = "-O";
				TARGETED_DEVICE_FAMILY = "1,2";
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
		97C147061CF9000F007C117D /* Debug */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 9740EEB21CF90195004384FC /* Debug.xcconfig */;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CLANG_ENABLE_MODULES = YES;
				CURRENT_PROJECT_VERSION = "$(FLUTTER_BUILD_NUMBER)";
				ENABLE_BITCODE = NO;
				INFOPLIST_FILE = Runner/Info.plist;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_OBJC_BRIDGING_HEADER = "Runner/Runner-Bridging-Header.h";
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
				SWIFT_VERSION = 5.0;
				VERSIONING_SYSTEM = "apple-generic";
			};
			name = Debug;
		};
		97C147071CF9000F007C117D /* Release */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 7AFA3C8E1D35360C0083082E /* Release.xcconfig */;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CLANG_ENABLE_MODULES = YES;
				CURRENT_PROJECT_VERSION = "$(FLUTTER_BUILD_NUMBER)";
				ENABLE_BITCODE = NO;
				INFOPLIST_FILE = Runner/Info.plist;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_OBJC_BRIDGING_HEADER = "Runner/Runner-Bridging-Header.h";
				SWIFT_VERSION = 5.0;
				VERSIONING_SYSTEM = "apple-generic";
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		331C8087294A63A400263BE5 /* Build configuration list for PBXNativeTarget "RunnerTests" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				331C8088294A63A400263BE5 /* Debug */,
				331C8089294A63A400263BE5 /* Release */,
				331C808A294A63A400263BE5 /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		97C146E91CF9000F007C117D /* Build configuration list for PBXProject "Runner" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				97C147031CF9000F007C117D /* Debug */,
				97C147041CF9000F007C117D /* Release */,
				249021D3217E4FDB00AE95B9 /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		97C147051CF9000F007C117D /* Build configuration list for PBXNativeTarget "Runner" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				97C147061CF9000F007C117D /* Debug */,
				97C147071CF9000F007C117D /* Release */,
				249021D4217E4FDB00AE95B9 /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = 97C146E61CF9000F007C117D /* Project object */;
}
````

## File: ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata
````
<?xml version="1.0" encoding="UTF-8"?>
<Workspace
   version = "1.0">
   <FileRef
      location = "self:">
   </FileRef>
</Workspace>
````

## File: ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>IDEDidComputeMac32BitWarning</key>
	<true/>
</dict>
</plist>
````

## File: ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>PreviewsEnabled</key>
	<false/>
</dict>
</plist>
````

## File: ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme
````
<?xml version="1.0" encoding="UTF-8"?>
<Scheme
   LastUpgradeVersion = "1510"
   version = "1.3">
   <BuildAction
      parallelizeBuildables = "YES"
      buildImplicitDependencies = "YES">
      <BuildActionEntries>
         <BuildActionEntry
            buildForTesting = "YES"
            buildForRunning = "YES"
            buildForProfiling = "YES"
            buildForArchiving = "YES"
            buildForAnalyzing = "YES">
            <BuildableReference
               BuildableIdentifier = "primary"
               BlueprintIdentifier = "97C146ED1CF9000F007C117D"
               BuildableName = "Runner.app"
               BlueprintName = "Runner"
               ReferencedContainer = "container:Runner.xcodeproj">
            </BuildableReference>
         </BuildActionEntry>
      </BuildActionEntries>
   </BuildAction>
   <TestAction
      buildConfiguration = "Debug"
      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
      customLLDBInitFile = "$(SRCROOT)/Flutter/ephemeral/flutter_lldbinit"
      shouldUseLaunchSchemeArgsEnv = "YES">
      <MacroExpansion>
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "97C146ED1CF9000F007C117D"
            BuildableName = "Runner.app"
            BlueprintName = "Runner"
            ReferencedContainer = "container:Runner.xcodeproj">
         </BuildableReference>
      </MacroExpansion>
      <Testables>
         <TestableReference
            skipped = "NO"
            parallelizable = "YES">
            <BuildableReference
               BuildableIdentifier = "primary"
               BlueprintIdentifier = "331C8080294A63A400263BE5"
               BuildableName = "RunnerTests.xctest"
               BlueprintName = "RunnerTests"
               ReferencedContainer = "container:Runner.xcodeproj">
            </BuildableReference>
         </TestableReference>
      </Testables>
   </TestAction>
   <LaunchAction
      buildConfiguration = "Debug"
      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
      customLLDBInitFile = "$(SRCROOT)/Flutter/ephemeral/flutter_lldbinit"
      launchStyle = "0"
      useCustomWorkingDirectory = "NO"
      ignoresPersistentStateOnLaunch = "NO"
      debugDocumentVersioning = "YES"
      debugServiceExtension = "internal"
      enableGPUValidationMode = "1"
      allowLocationSimulation = "YES">
      <BuildableProductRunnable
         runnableDebuggingMode = "0">
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "97C146ED1CF9000F007C117D"
            BuildableName = "Runner.app"
            BlueprintName = "Runner"
            ReferencedContainer = "container:Runner.xcodeproj">
         </BuildableReference>
      </BuildableProductRunnable>
   </LaunchAction>
   <ProfileAction
      buildConfiguration = "Profile"
      shouldUseLaunchSchemeArgsEnv = "YES"
      savedToolIdentifier = ""
      useCustomWorkingDirectory = "NO"
      debugDocumentVersioning = "YES">
      <BuildableProductRunnable
         runnableDebuggingMode = "0">
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "97C146ED1CF9000F007C117D"
            BuildableName = "Runner.app"
            BlueprintName = "Runner"
            ReferencedContainer = "container:Runner.xcodeproj">
         </BuildableReference>
      </BuildableProductRunnable>
   </ProfileAction>
   <AnalyzeAction
      buildConfiguration = "Debug">
   </AnalyzeAction>
   <ArchiveAction
      buildConfiguration = "Release"
      revealArchiveInOrganizer = "YES">
   </ArchiveAction>
</Scheme>
````

## File: ios/Runner.xcworkspace/contents.xcworkspacedata
````
<?xml version="1.0" encoding="UTF-8"?>
<Workspace
   version = "1.0">
   <FileRef
      location = "group:Runner.xcodeproj">
   </FileRef>
</Workspace>
````

## File: ios/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>IDEDidComputeMac32BitWarning</key>
	<true/>
</dict>
</plist>
````

## File: ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>PreviewsEnabled</key>
	<false/>
</dict>
</plist>
````

## File: ios/Runner/AppDelegate.swift
````swift
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}
````

## File: ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json
````json
{
  "images" : [
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-App-20x20@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-App-20x20@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-App-29x29@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-App-29x29@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-App-29x29@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-App-40x40@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-App-40x40@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-App-60x60@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-App-60x60@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-App-20x20@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-App-20x20@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-App-29x29@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-App-29x29@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-App-40x40@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-App-40x40@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-App-76x76@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-App-76x76@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "83.5x83.5",
      "idiom" : "ipad",
      "filename" : "Icon-App-83.5x83.5@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "1024x1024",
      "idiom" : "ios-marketing",
      "filename" : "Icon-App-1024x1024@1x.png",
      "scale" : "1x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
````

## File: ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json
````json
{
  "images" : [
    {
      "idiom" : "universal",
      "filename" : "LaunchImage.png",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "filename" : "LaunchImage@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "filename" : "LaunchImage@3x.png",
      "scale" : "3x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
````

## File: ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md
````markdown
# Launch Screen Assets

You can customize the launch screen with your own desired assets by replacing the image files in this directory.

You can also do it by opening your Flutter project's Xcode project with `open ios/Runner.xcworkspace`, selecting `Runner/Assets.xcassets` in the Project Navigator and dropping in the desired images.
````

## File: ios/Runner/Base.lproj/LaunchScreen.storyboard
````
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="12121" systemVersion="16G29" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" launchScreen="YES" colorMatched="YES" initialViewController="01J-lp-oVM">
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="12089"/>
    </dependencies>
    <scenes>
        <!--View Controller-->
        <scene sceneID="EHf-IW-A2E">
            <objects>
                <viewController id="01J-lp-oVM" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="Ydg-fD-yQy"/>
                        <viewControllerLayoutGuide type="bottom" id="xbc-2k-c8Z"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="Ze5-6b-2t3">
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <imageView opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" image="LaunchImage" translatesAutoresizingMaskIntoConstraints="NO" id="YRO-k0-Ey4">
                            </imageView>
                        </subviews>
                        <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                        <constraints>
                            <constraint firstItem="YRO-k0-Ey4" firstAttribute="centerX" secondItem="Ze5-6b-2t3" secondAttribute="centerX" id="1a2-6s-vTC"/>
                            <constraint firstItem="YRO-k0-Ey4" firstAttribute="centerY" secondItem="Ze5-6b-2t3" secondAttribute="centerY" id="4X2-HB-R7a"/>
                        </constraints>
                    </view>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="iYj-Kq-Ea1" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="53" y="375"/>
        </scene>
    </scenes>
    <resources>
        <image name="LaunchImage" width="168" height="185"/>
    </resources>
</document>
````

## File: ios/Runner/Base.lproj/Main.storyboard
````
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="10117" systemVersion="15F34" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" initialViewController="BYZ-38-t0r">
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="10085"/>
    </dependencies>
    <scenes>
        <!--Flutter View Controller-->
        <scene sceneID="tne-QT-ifu">
            <objects>
                <viewController id="BYZ-38-t0r" customClass="FlutterViewController" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="y3c-jy-aDJ"/>
                        <viewControllerLayoutGuide type="bottom" id="wfy-db-euE"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="8bC-Xf-vdC">
                        <rect key="frame" x="0.0" y="0.0" width="600" height="600"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="calibratedWhite"/>
                    </view>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="dkx-z0-nzr" sceneMemberID="firstResponder"/>
            </objects>
        </scene>
    </scenes>
</document>
````

## File: ios/Runner/Info.plist
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CADisableMinimumFrameDurationOnPhone</key>
	<true/>

	<key>CFBundleDevelopmentRegion</key>
	<string>$(DEVELOPMENT_LANGUAGE)</string>
	<key>CFBundleDisplayName</key>
	<string>AI Chat</string>
	<key>CFBundleExecutable</key>
	<string>$(EXECUTABLE_NAME)</string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>AIChat</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>$(FLUTTER_BUILD_NAME)</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>$(FLUTTER_BUILD_NUMBER)</string>

	<key>LSRequiresIPhoneOS</key>
	<true/>

	<key>NSPhotoLibraryUsageDescription</key>
	<string>需要访问相册以选择图片作为聊天附件。</string>
	<key>NSCameraUsageDescription</key>
	<string>需要使用相机拍摄图片并作为聊天附件发送。</string>
	<key>NSPhotoLibraryAddUsageDescription</key>
	<string>需要保存图片到相册时使用。</string>

	<key>UIApplicationSceneManifest</key>
	<dict>
		<key>UIApplicationSupportsMultipleScenes</key>
		<false/>
		<key>UISceneConfigurations</key>
		<dict>
			<key>UIWindowSceneSessionRoleApplication</key>
			<array>
				<dict>
					<key>UISceneClassName</key>
					<string>UIWindowScene</string>
					<key>UISceneConfigurationName</key>
					<string>flutter</string>
					<key>UISceneDelegateClassName</key>
					<string>$(PRODUCT_MODULE_NAME).SceneDelegate</string>
					<key>UISceneStoryboardFile</key>
					<string>Main</string>
				</dict>
			</array>
		</dict>
	</dict>

	<key>UIApplicationSupportsIndirectInputEvents</key>
	<true/>
	<key>UILaunchStoryboardName</key>
	<string>LaunchScreen</string>
	<key>UIMainStoryboardFile</key>
	<string>Main</string>

	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
	</array>

	<key>UISupportedInterfaceOrientations~ipad</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationPortraitUpsideDown</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
</dict>
</plist>
````

## File: ios/Runner/Runner-Bridging-Header.h
````c
#import "GeneratedPluginRegistrant.h"
````

## File: ios/Runner/SceneDelegate.swift
````swift
import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {

}
````

## File: ios/RunnerTests/RunnerTests.swift
````swift
import Flutter
import UIKit
import XCTest

class RunnerTests: XCTestCase {

  func testExample() {
    // If you add code to the Runner application, consider adding tests here.
    // See https://developer.apple.com/documentation/xctest for more information about using XCTest.
  }

}
````

## File: lib/core/models/api_message.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_message.freezed.dart';
part 'api_message.g.dart';

@Freezed(unionKey: 'runtimeType')
class ApiMessageContentPart with _$ApiMessageContentPart {
  const factory ApiMessageContentPart.text({
    @Default('text') String type,
    required String text,
  }) = ApiMessageTextPart;

  const factory ApiMessageContentPart.imageUrl({
    @Default('image_url') String type,
    @JsonKey(name: 'image_url') required ApiImageUrl imageUrl,
  }) = ApiMessageImageUrlPart;

  factory ApiMessageContentPart.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageContentPartFromJson(json);
}

@freezed
class ApiImageUrl with _$ApiImageUrl {
  const factory ApiImageUrl({
    required String url,
  }) = _ApiImageUrl;

  factory ApiImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ApiImageUrlFromJson(json);
}

@freezed
class ApiMessage with _$ApiMessage {
  const factory ApiMessage({
    required String role,
    String? content,
    String? reasoning,
    @Default([]) List<ApiMessageContentPart> parts,
  }) = _ApiMessage;

  factory ApiMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageFromJson(json);
}
````

## File: lib/core/models/api_message.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiMessageContentPart _$ApiMessageContentPartFromJson(
  Map<String, dynamic> json,
) {
  switch (json['runtimeType']) {
    case 'text':
      return ApiMessageTextPart.fromJson(json);
    case 'imageUrl':
      return ApiMessageImageUrlPart.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'ApiMessageContentPart',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$ApiMessageContentPart {
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, String text) text,
    required TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )
    imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, String text)? text,
    TResult? Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, String text)? text,
    TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiMessageTextPart value) text,
    required TResult Function(ApiMessageImageUrlPart value) imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiMessageTextPart value)? text,
    TResult? Function(ApiMessageImageUrlPart value)? imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiMessageTextPart value)? text,
    TResult Function(ApiMessageImageUrlPart value)? imageUrl,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this ApiMessageContentPart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiMessageContentPartCopyWith<ApiMessageContentPart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiMessageContentPartCopyWith<$Res> {
  factory $ApiMessageContentPartCopyWith(
    ApiMessageContentPart value,
    $Res Function(ApiMessageContentPart) then,
  ) = _$ApiMessageContentPartCopyWithImpl<$Res, ApiMessageContentPart>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$ApiMessageContentPartCopyWithImpl<
  $Res,
  $Val extends ApiMessageContentPart
>
    implements $ApiMessageContentPartCopyWith<$Res> {
  _$ApiMessageContentPartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiMessageTextPartImplCopyWith<$Res>
    implements $ApiMessageContentPartCopyWith<$Res> {
  factory _$$ApiMessageTextPartImplCopyWith(
    _$ApiMessageTextPartImpl value,
    $Res Function(_$ApiMessageTextPartImpl) then,
  ) = __$$ApiMessageTextPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String text});
}

/// @nodoc
class __$$ApiMessageTextPartImplCopyWithImpl<$Res>
    extends _$ApiMessageContentPartCopyWithImpl<$Res, _$ApiMessageTextPartImpl>
    implements _$$ApiMessageTextPartImplCopyWith<$Res> {
  __$$ApiMessageTextPartImplCopyWithImpl(
    _$ApiMessageTextPartImpl _value,
    $Res Function(_$ApiMessageTextPartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? text = null}) {
    return _then(
      _$ApiMessageTextPartImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiMessageTextPartImpl implements ApiMessageTextPart {
  const _$ApiMessageTextPartImpl({
    this.type = 'text',
    required this.text,
    final String? $type,
  }) : $type = $type ?? 'text';

  factory _$ApiMessageTextPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMessageTextPartImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  final String text;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiMessageContentPart.text(type: $type, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMessageTextPartImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMessageTextPartImplCopyWith<_$ApiMessageTextPartImpl> get copyWith =>
      __$$ApiMessageTextPartImplCopyWithImpl<_$ApiMessageTextPartImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, String text) text,
    required TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )
    imageUrl,
  }) {
    return text(type, this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, String text)? text,
    TResult? Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
  }) {
    return text?.call(type, this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, String text)? text,
    TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(type, this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiMessageTextPart value) text,
    required TResult Function(ApiMessageImageUrlPart value) imageUrl,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiMessageTextPart value)? text,
    TResult? Function(ApiMessageImageUrlPart value)? imageUrl,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiMessageTextPart value)? text,
    TResult Function(ApiMessageImageUrlPart value)? imageUrl,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMessageTextPartImplToJson(this);
  }
}

abstract class ApiMessageTextPart implements ApiMessageContentPart {
  const factory ApiMessageTextPart({
    final String type,
    required final String text,
  }) = _$ApiMessageTextPartImpl;

  factory ApiMessageTextPart.fromJson(Map<String, dynamic> json) =
      _$ApiMessageTextPartImpl.fromJson;

  @override
  String get type;
  String get text;

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMessageTextPartImplCopyWith<_$ApiMessageTextPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiMessageImageUrlPartImplCopyWith<$Res>
    implements $ApiMessageContentPartCopyWith<$Res> {
  factory _$$ApiMessageImageUrlPartImplCopyWith(
    _$ApiMessageImageUrlPartImpl value,
    $Res Function(_$ApiMessageImageUrlPartImpl) then,
  ) = __$$ApiMessageImageUrlPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, @JsonKey(name: 'image_url') ApiImageUrl imageUrl});

  $ApiImageUrlCopyWith<$Res> get imageUrl;
}

/// @nodoc
class __$$ApiMessageImageUrlPartImplCopyWithImpl<$Res>
    extends
        _$ApiMessageContentPartCopyWithImpl<$Res, _$ApiMessageImageUrlPartImpl>
    implements _$$ApiMessageImageUrlPartImplCopyWith<$Res> {
  __$$ApiMessageImageUrlPartImplCopyWithImpl(
    _$ApiMessageImageUrlPartImpl _value,
    $Res Function(_$ApiMessageImageUrlPartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? imageUrl = null}) {
    return _then(
      _$ApiMessageImageUrlPartImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as ApiImageUrl,
      ),
    );
  }

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiImageUrlCopyWith<$Res> get imageUrl {
    return $ApiImageUrlCopyWith<$Res>(_value.imageUrl, (value) {
      return _then(_value.copyWith(imageUrl: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiMessageImageUrlPartImpl implements ApiMessageImageUrlPart {
  const _$ApiMessageImageUrlPartImpl({
    this.type = 'image_url',
    @JsonKey(name: 'image_url') required this.imageUrl,
    final String? $type,
  }) : $type = $type ?? 'imageUrl';

  factory _$ApiMessageImageUrlPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMessageImageUrlPartImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey(name: 'image_url')
  final ApiImageUrl imageUrl;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiMessageContentPart.imageUrl(type: $type, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMessageImageUrlPartImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, imageUrl);

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMessageImageUrlPartImplCopyWith<_$ApiMessageImageUrlPartImpl>
  get copyWith =>
      __$$ApiMessageImageUrlPartImplCopyWithImpl<_$ApiMessageImageUrlPartImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, String text) text,
    required TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )
    imageUrl,
  }) {
    return imageUrl(type, this.imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, String text)? text,
    TResult? Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
  }) {
    return imageUrl?.call(type, this.imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, String text)? text,
    TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
    required TResult orElse(),
  }) {
    if (imageUrl != null) {
      return imageUrl(type, this.imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiMessageTextPart value) text,
    required TResult Function(ApiMessageImageUrlPart value) imageUrl,
  }) {
    return imageUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiMessageTextPart value)? text,
    TResult? Function(ApiMessageImageUrlPart value)? imageUrl,
  }) {
    return imageUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiMessageTextPart value)? text,
    TResult Function(ApiMessageImageUrlPart value)? imageUrl,
    required TResult orElse(),
  }) {
    if (imageUrl != null) {
      return imageUrl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMessageImageUrlPartImplToJson(this);
  }
}

abstract class ApiMessageImageUrlPart implements ApiMessageContentPart {
  const factory ApiMessageImageUrlPart({
    final String type,
    @JsonKey(name: 'image_url') required final ApiImageUrl imageUrl,
  }) = _$ApiMessageImageUrlPartImpl;

  factory ApiMessageImageUrlPart.fromJson(Map<String, dynamic> json) =
      _$ApiMessageImageUrlPartImpl.fromJson;

  @override
  String get type;
  @JsonKey(name: 'image_url')
  ApiImageUrl get imageUrl;

  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMessageImageUrlPartImplCopyWith<_$ApiMessageImageUrlPartImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ApiImageUrl _$ApiImageUrlFromJson(Map<String, dynamic> json) {
  return _ApiImageUrl.fromJson(json);
}

/// @nodoc
mixin _$ApiImageUrl {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this ApiImageUrl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiImageUrlCopyWith<ApiImageUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiImageUrlCopyWith<$Res> {
  factory $ApiImageUrlCopyWith(
    ApiImageUrl value,
    $Res Function(ApiImageUrl) then,
  ) = _$ApiImageUrlCopyWithImpl<$Res, ApiImageUrl>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$ApiImageUrlCopyWithImpl<$Res, $Val extends ApiImageUrl>
    implements $ApiImageUrlCopyWith<$Res> {
  _$ApiImageUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null}) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiImageUrlImplCopyWith<$Res>
    implements $ApiImageUrlCopyWith<$Res> {
  factory _$$ApiImageUrlImplCopyWith(
    _$ApiImageUrlImpl value,
    $Res Function(_$ApiImageUrlImpl) then,
  ) = __$$ApiImageUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$ApiImageUrlImplCopyWithImpl<$Res>
    extends _$ApiImageUrlCopyWithImpl<$Res, _$ApiImageUrlImpl>
    implements _$$ApiImageUrlImplCopyWith<$Res> {
  __$$ApiImageUrlImplCopyWithImpl(
    _$ApiImageUrlImpl _value,
    $Res Function(_$ApiImageUrlImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null}) {
    return _then(
      _$ApiImageUrlImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiImageUrlImpl implements _ApiImageUrl {
  const _$ApiImageUrlImpl({required this.url});

  factory _$ApiImageUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiImageUrlImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'ApiImageUrl(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiImageUrlImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiImageUrlImplCopyWith<_$ApiImageUrlImpl> get copyWith =>
      __$$ApiImageUrlImplCopyWithImpl<_$ApiImageUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiImageUrlImplToJson(this);
  }
}

abstract class _ApiImageUrl implements ApiImageUrl {
  const factory _ApiImageUrl({required final String url}) = _$ApiImageUrlImpl;

  factory _ApiImageUrl.fromJson(Map<String, dynamic> json) =
      _$ApiImageUrlImpl.fromJson;

  @override
  String get url;

  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiImageUrlImplCopyWith<_$ApiImageUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiMessage _$ApiMessageFromJson(Map<String, dynamic> json) {
  return _ApiMessage.fromJson(json);
}

/// @nodoc
mixin _$ApiMessage {
  String get role => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get reasoning => throw _privateConstructorUsedError;
  List<ApiMessageContentPart> get parts => throw _privateConstructorUsedError;

  /// Serializes this ApiMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiMessageCopyWith<ApiMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiMessageCopyWith<$Res> {
  factory $ApiMessageCopyWith(
    ApiMessage value,
    $Res Function(ApiMessage) then,
  ) = _$ApiMessageCopyWithImpl<$Res, ApiMessage>;
  @useResult
  $Res call({
    String role,
    String? content,
    String? reasoning,
    List<ApiMessageContentPart> parts,
  });
}

/// @nodoc
class _$ApiMessageCopyWithImpl<$Res, $Val extends ApiMessage>
    implements $ApiMessageCopyWith<$Res> {
  _$ApiMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? reasoning = freezed,
    Object? parts = null,
  }) {
    return _then(
      _value.copyWith(
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasoning: freezed == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String?,
            parts: null == parts
                ? _value.parts
                : parts // ignore: cast_nullable_to_non_nullable
                      as List<ApiMessageContentPart>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiMessageImplCopyWith<$Res>
    implements $ApiMessageCopyWith<$Res> {
  factory _$$ApiMessageImplCopyWith(
    _$ApiMessageImpl value,
    $Res Function(_$ApiMessageImpl) then,
  ) = __$$ApiMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String role,
    String? content,
    String? reasoning,
    List<ApiMessageContentPart> parts,
  });
}

/// @nodoc
class __$$ApiMessageImplCopyWithImpl<$Res>
    extends _$ApiMessageCopyWithImpl<$Res, _$ApiMessageImpl>
    implements _$$ApiMessageImplCopyWith<$Res> {
  __$$ApiMessageImplCopyWithImpl(
    _$ApiMessageImpl _value,
    $Res Function(_$ApiMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? reasoning = freezed,
    Object? parts = null,
  }) {
    return _then(
      _$ApiMessageImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoning: freezed == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String?,
        parts: null == parts
            ? _value._parts
            : parts // ignore: cast_nullable_to_non_nullable
                  as List<ApiMessageContentPart>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiMessageImpl implements _ApiMessage {
  const _$ApiMessageImpl({
    required this.role,
    this.content,
    this.reasoning,
    final List<ApiMessageContentPart> parts = const [],
  }) : _parts = parts;

  factory _$ApiMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMessageImplFromJson(json);

  @override
  final String role;
  @override
  final String? content;
  @override
  final String? reasoning;
  final List<ApiMessageContentPart> _parts;
  @override
  @JsonKey()
  List<ApiMessageContentPart> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  @override
  String toString() {
    return 'ApiMessage(role: $role, content: $content, reasoning: $reasoning, parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    role,
    content,
    reasoning,
    const DeepCollectionEquality().hash(_parts),
  );

  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMessageImplCopyWith<_$ApiMessageImpl> get copyWith =>
      __$$ApiMessageImplCopyWithImpl<_$ApiMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMessageImplToJson(this);
  }
}

abstract class _ApiMessage implements ApiMessage {
  const factory _ApiMessage({
    required final String role,
    final String? content,
    final String? reasoning,
    final List<ApiMessageContentPart> parts,
  }) = _$ApiMessageImpl;

  factory _ApiMessage.fromJson(Map<String, dynamic> json) =
      _$ApiMessageImpl.fromJson;

  @override
  String get role;
  @override
  String? get content;
  @override
  String? get reasoning;
  @override
  List<ApiMessageContentPart> get parts;

  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMessageImplCopyWith<_$ApiMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/api_message.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiMessageTextPartImpl _$$ApiMessageTextPartImplFromJson(
  Map<String, dynamic> json,
) => _$ApiMessageTextPartImpl(
  type: json['type'] as String? ?? 'text',
  text: json['text'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ApiMessageTextPartImplToJson(
  _$ApiMessageTextPartImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'text': instance.text,
  'runtimeType': instance.$type,
};

_$ApiMessageImageUrlPartImpl _$$ApiMessageImageUrlPartImplFromJson(
  Map<String, dynamic> json,
) => _$ApiMessageImageUrlPartImpl(
  type: json['type'] as String? ?? 'image_url',
  imageUrl: ApiImageUrl.fromJson(json['image_url'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ApiMessageImageUrlPartImplToJson(
  _$ApiMessageImageUrlPartImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'image_url': instance.imageUrl,
  'runtimeType': instance.$type,
};

_$ApiImageUrlImpl _$$ApiImageUrlImplFromJson(Map<String, dynamic> json) =>
    _$ApiImageUrlImpl(url: json['url'] as String);

Map<String, dynamic> _$$ApiImageUrlImplToJson(_$ApiImageUrlImpl instance) =>
    <String, dynamic>{'url': instance.url};

_$ApiMessageImpl _$$ApiMessageImplFromJson(Map<String, dynamic> json) =>
    _$ApiMessageImpl(
      role: json['role'] as String,
      content: json['content'] as String?,
      reasoning: json['reasoning'] as String?,
      parts:
          (json['parts'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ApiMessageContentPart.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ApiMessageImplToJson(_$ApiMessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'reasoning': instance.reasoning,
      'parts': instance.parts,
    };
````

## File: lib/core/models/app_config_store.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'app_config.dart';

part 'app_config_store.freezed.dart';
part 'app_config_store.g.dart';

@freezed
class ConfigProfile with _$ConfigProfile {
  const factory ConfigProfile({
    required String id,
    required String name,
    required AppConfig config,
  }) = _ConfigProfile;

  factory ConfigProfile.fromJson(Map<String, dynamic> json) =>
      _$ConfigProfileFromJson(json);
}

@freezed
class AppConfigStore with _$AppConfigStore {
  const factory AppConfigStore({
    required String activeProfileId,
    @Default([]) List<ConfigProfile> profiles,
  }) = _AppConfigStore;

  factory AppConfigStore.fromJson(Map<String, dynamic> json) =>
      _$AppConfigStoreFromJson(json);

  factory AppConfigStore.defaultStore() => AppConfigStore(
        activeProfileId: 'default',
        profiles: [
          ConfigProfile(
            id: 'default',
            name: '默认配置',
            config: AppConfig.defaultConfig(),
          ),
        ],
      );
}
````

## File: lib/core/models/app_config_store.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConfigProfile _$ConfigProfileFromJson(Map<String, dynamic> json) {
  return _ConfigProfile.fromJson(json);
}

/// @nodoc
mixin _$ConfigProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AppConfig get config => throw _privateConstructorUsedError;

  /// Serializes this ConfigProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigProfileCopyWith<ConfigProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigProfileCopyWith<$Res> {
  factory $ConfigProfileCopyWith(
    ConfigProfile value,
    $Res Function(ConfigProfile) then,
  ) = _$ConfigProfileCopyWithImpl<$Res, ConfigProfile>;
  @useResult
  $Res call({String id, String name, AppConfig config});

  $AppConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ConfigProfileCopyWithImpl<$Res, $Val extends ConfigProfile>
    implements $ConfigProfileCopyWith<$Res> {
  _$ConfigProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? config = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as AppConfig,
          )
          as $Val,
    );
  }

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppConfigCopyWith<$Res> get config {
    return $AppConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfigProfileImplCopyWith<$Res>
    implements $ConfigProfileCopyWith<$Res> {
  factory _$$ConfigProfileImplCopyWith(
    _$ConfigProfileImpl value,
    $Res Function(_$ConfigProfileImpl) then,
  ) = __$$ConfigProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, AppConfig config});

  @override
  $AppConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ConfigProfileImplCopyWithImpl<$Res>
    extends _$ConfigProfileCopyWithImpl<$Res, _$ConfigProfileImpl>
    implements _$$ConfigProfileImplCopyWith<$Res> {
  __$$ConfigProfileImplCopyWithImpl(
    _$ConfigProfileImpl _value,
    $Res Function(_$ConfigProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? config = null}) {
    return _then(
      _$ConfigProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        config: null == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as AppConfig,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigProfileImpl implements _ConfigProfile {
  const _$ConfigProfileImpl({
    required this.id,
    required this.name,
    required this.config,
  });

  factory _$ConfigProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final AppConfig config;

  @override
  String toString() {
    return 'ConfigProfile(id: $id, name: $name, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.config, config) || other.config == config));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, config);

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigProfileImplCopyWith<_$ConfigProfileImpl> get copyWith =>
      __$$ConfigProfileImplCopyWithImpl<_$ConfigProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigProfileImplToJson(this);
  }
}

abstract class _ConfigProfile implements ConfigProfile {
  const factory _ConfigProfile({
    required final String id,
    required final String name,
    required final AppConfig config,
  }) = _$ConfigProfileImpl;

  factory _ConfigProfile.fromJson(Map<String, dynamic> json) =
      _$ConfigProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  AppConfig get config;

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigProfileImplCopyWith<_$ConfigProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppConfigStore _$AppConfigStoreFromJson(Map<String, dynamic> json) {
  return _AppConfigStore.fromJson(json);
}

/// @nodoc
mixin _$AppConfigStore {
  String get activeProfileId => throw _privateConstructorUsedError;
  List<ConfigProfile> get profiles => throw _privateConstructorUsedError;

  /// Serializes this AppConfigStore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigStoreCopyWith<AppConfigStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigStoreCopyWith<$Res> {
  factory $AppConfigStoreCopyWith(
    AppConfigStore value,
    $Res Function(AppConfigStore) then,
  ) = _$AppConfigStoreCopyWithImpl<$Res, AppConfigStore>;
  @useResult
  $Res call({String activeProfileId, List<ConfigProfile> profiles});
}

/// @nodoc
class _$AppConfigStoreCopyWithImpl<$Res, $Val extends AppConfigStore>
    implements $AppConfigStoreCopyWith<$Res> {
  _$AppConfigStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeProfileId = null, Object? profiles = null}) {
    return _then(
      _value.copyWith(
            activeProfileId: null == activeProfileId
                ? _value.activeProfileId
                : activeProfileId // ignore: cast_nullable_to_non_nullable
                      as String,
            profiles: null == profiles
                ? _value.profiles
                : profiles // ignore: cast_nullable_to_non_nullable
                      as List<ConfigProfile>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppConfigStoreImplCopyWith<$Res>
    implements $AppConfigStoreCopyWith<$Res> {
  factory _$$AppConfigStoreImplCopyWith(
    _$AppConfigStoreImpl value,
    $Res Function(_$AppConfigStoreImpl) then,
  ) = __$$AppConfigStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String activeProfileId, List<ConfigProfile> profiles});
}

/// @nodoc
class __$$AppConfigStoreImplCopyWithImpl<$Res>
    extends _$AppConfigStoreCopyWithImpl<$Res, _$AppConfigStoreImpl>
    implements _$$AppConfigStoreImplCopyWith<$Res> {
  __$$AppConfigStoreImplCopyWithImpl(
    _$AppConfigStoreImpl _value,
    $Res Function(_$AppConfigStoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeProfileId = null, Object? profiles = null}) {
    return _then(
      _$AppConfigStoreImpl(
        activeProfileId: null == activeProfileId
            ? _value.activeProfileId
            : activeProfileId // ignore: cast_nullable_to_non_nullable
                  as String,
        profiles: null == profiles
            ? _value._profiles
            : profiles // ignore: cast_nullable_to_non_nullable
                  as List<ConfigProfile>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigStoreImpl implements _AppConfigStore {
  const _$AppConfigStoreImpl({
    required this.activeProfileId,
    final List<ConfigProfile> profiles = const [],
  }) : _profiles = profiles;

  factory _$AppConfigStoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigStoreImplFromJson(json);

  @override
  final String activeProfileId;
  final List<ConfigProfile> _profiles;
  @override
  @JsonKey()
  List<ConfigProfile> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  @override
  String toString() {
    return 'AppConfigStore(activeProfileId: $activeProfileId, profiles: $profiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigStoreImpl &&
            (identical(other.activeProfileId, activeProfileId) ||
                other.activeProfileId == activeProfileId) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    activeProfileId,
    const DeepCollectionEquality().hash(_profiles),
  );

  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigStoreImplCopyWith<_$AppConfigStoreImpl> get copyWith =>
      __$$AppConfigStoreImplCopyWithImpl<_$AppConfigStoreImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigStoreImplToJson(this);
  }
}

abstract class _AppConfigStore implements AppConfigStore {
  const factory _AppConfigStore({
    required final String activeProfileId,
    final List<ConfigProfile> profiles,
  }) = _$AppConfigStoreImpl;

  factory _AppConfigStore.fromJson(Map<String, dynamic> json) =
      _$AppConfigStoreImpl.fromJson;

  @override
  String get activeProfileId;
  @override
  List<ConfigProfile> get profiles;

  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigStoreImplCopyWith<_$AppConfigStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/app_config_store.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigProfileImpl _$$ConfigProfileImplFromJson(Map<String, dynamic> json) =>
    _$ConfigProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      config: AppConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConfigProfileImplToJson(_$ConfigProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'config': instance.config,
    };

_$AppConfigStoreImpl _$$AppConfigStoreImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigStoreImpl(
      activeProfileId: json['activeProfileId'] as String,
      profiles:
          (json['profiles'] as List<dynamic>?)
              ?.map((e) => ConfigProfile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AppConfigStoreImplToJson(
  _$AppConfigStoreImpl instance,
) => <String, dynamic>{
  'activeProfileId': instance.activeProfileId,
  'profiles': instance.profiles,
};
````

## File: lib/core/models/app_config.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'model_info.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

List<ModelInfo>? _modelsFromJson(List<dynamic>? json) =>
    json?.map((e) => ModelInfo.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _modelsToJson(List<ModelInfo>? models) =>
    models?.map((e) => e.toJson()).toList();

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig({
    required String baseUrl,
    required String apiKey,
    String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    List<ModelInfo>? availableModels,
    @Default('system') String theme,
    @Default('v1/models') String modelsPath,
    @Default('v1/chat/completions') String chatPath,
    @Default('chat_completions') String apiMode,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  factory AppConfig.defaultConfig() => const AppConfig(
        baseUrl: 'https://api.openai.com',
        apiKey: '',
        theme: 'system',
        modelsPath: 'v1/models',
        chatPath: 'v1/chat/completions',
        apiMode: 'chat_completions',
      );
}
````

## File: lib/core/models/app_config.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  String get baseUrl => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;
  String? get selectedModel => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
  List<ModelInfo>? get availableModels => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  String get modelsPath => throw _privateConstructorUsedError;
  String get chatPath => throw _privateConstructorUsedError;
  String get apiMode => throw _privateConstructorUsedError;

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call({
    String baseUrl,
    String apiKey,
    String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    List<ModelInfo>? availableModels,
    String theme,
    String modelsPath,
    String chatPath,
    String apiMode,
  });
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? selectedModel = freezed,
    Object? availableModels = freezed,
    Object? theme = null,
    Object? modelsPath = null,
    Object? chatPath = null,
    Object? apiMode = null,
  }) {
    return _then(
      _value.copyWith(
            baseUrl: null == baseUrl
                ? _value.baseUrl
                : baseUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            apiKey: null == apiKey
                ? _value.apiKey
                : apiKey // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedModel: freezed == selectedModel
                ? _value.selectedModel
                : selectedModel // ignore: cast_nullable_to_non_nullable
                      as String?,
            availableModels: freezed == availableModels
                ? _value.availableModels
                : availableModels // ignore: cast_nullable_to_non_nullable
                      as List<ModelInfo>?,
            theme: null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as String,
            modelsPath: null == modelsPath
                ? _value.modelsPath
                : modelsPath // ignore: cast_nullable_to_non_nullable
                      as String,
            chatPath: null == chatPath
                ? _value.chatPath
                : chatPath // ignore: cast_nullable_to_non_nullable
                      as String,
            apiMode: null == apiMode
                ? _value.apiMode
                : apiMode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
    _$AppConfigImpl value,
    $Res Function(_$AppConfigImpl) then,
  ) = __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String baseUrl,
    String apiKey,
    String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    List<ModelInfo>? availableModels,
    String theme,
    String modelsPath,
    String chatPath,
    String apiMode,
  });
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
    _$AppConfigImpl _value,
    $Res Function(_$AppConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? selectedModel = freezed,
    Object? availableModels = freezed,
    Object? theme = null,
    Object? modelsPath = null,
    Object? chatPath = null,
    Object? apiMode = null,
  }) {
    return _then(
      _$AppConfigImpl(
        baseUrl: null == baseUrl
            ? _value.baseUrl
            : baseUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        apiKey: null == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedModel: freezed == selectedModel
            ? _value.selectedModel
            : selectedModel // ignore: cast_nullable_to_non_nullable
                  as String?,
        availableModels: freezed == availableModels
            ? _value._availableModels
            : availableModels // ignore: cast_nullable_to_non_nullable
                  as List<ModelInfo>?,
        theme: null == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as String,
        modelsPath: null == modelsPath
            ? _value.modelsPath
            : modelsPath // ignore: cast_nullable_to_non_nullable
                  as String,
        chatPath: null == chatPath
            ? _value.chatPath
            : chatPath // ignore: cast_nullable_to_non_nullable
                  as String,
        apiMode: null == apiMode
            ? _value.apiMode
            : apiMode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  const _$AppConfigImpl({
    required this.baseUrl,
    required this.apiKey,
    this.selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    final List<ModelInfo>? availableModels,
    this.theme = 'system',
    this.modelsPath = 'v1/models',
    this.chatPath = 'v1/chat/completions',
    this.apiMode = 'chat_completions',
  }) : _availableModels = availableModels;

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  @override
  final String baseUrl;
  @override
  final String apiKey;
  @override
  final String? selectedModel;
  final List<ModelInfo>? _availableModels;
  @override
  @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
  List<ModelInfo>? get availableModels {
    final value = _availableModels;
    if (value == null) return null;
    if (_availableModels is EqualUnmodifiableListView) return _availableModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final String modelsPath;
  @override
  @JsonKey()
  final String chatPath;
  @override
  @JsonKey()
  final String apiMode;

  @override
  String toString() {
    return 'AppConfig(baseUrl: $baseUrl, apiKey: $apiKey, selectedModel: $selectedModel, availableModels: $availableModels, theme: $theme, modelsPath: $modelsPath, chatPath: $chatPath, apiMode: $apiMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.selectedModel, selectedModel) ||
                other.selectedModel == selectedModel) &&
            const DeepCollectionEquality().equals(
              other._availableModels,
              _availableModels,
            ) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.modelsPath, modelsPath) ||
                other.modelsPath == modelsPath) &&
            (identical(other.chatPath, chatPath) ||
                other.chatPath == chatPath) &&
            (identical(other.apiMode, apiMode) || other.apiMode == apiMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    baseUrl,
    apiKey,
    selectedModel,
    const DeepCollectionEquality().hash(_availableModels),
    theme,
    modelsPath,
    chatPath,
    apiMode,
  );

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(this);
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig({
    required final String baseUrl,
    required final String apiKey,
    final String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    final List<ModelInfo>? availableModels,
    final String theme,
    final String modelsPath,
    final String chatPath,
    final String apiMode,
  }) = _$AppConfigImpl;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  String get baseUrl;
  @override
  String get apiKey;
  @override
  String? get selectedModel;
  @override
  @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
  List<ModelInfo>? get availableModels;
  @override
  String get theme;
  @override
  String get modelsPath;
  @override
  String get chatPath;
  @override
  String get apiMode;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/app_config.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      baseUrl: json['baseUrl'] as String,
      apiKey: json['apiKey'] as String,
      selectedModel: json['selectedModel'] as String?,
      availableModels: _modelsFromJson(json['availableModels'] as List?),
      theme: json['theme'] as String? ?? 'system',
      modelsPath: json['modelsPath'] as String? ?? 'v1/models',
      chatPath: json['chatPath'] as String? ?? 'v1/chat/completions',
      apiMode: json['apiMode'] as String? ?? 'chat_completions',
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'apiKey': instance.apiKey,
      'selectedModel': instance.selectedModel,
      'availableModels': _modelsToJson(instance.availableModels),
      'theme': instance.theme,
      'modelsPath': instance.modelsPath,
      'chatPath': instance.chatPath,
      'apiMode': instance.apiMode,
    };
````

## File: lib/core/models/attachment.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    required String id,
    required String name,
    required String relativePath,
    @Default(false) bool isImage,
    String? mimeType,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}
````

## File: lib/core/models/attachment.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
mixin _$Attachment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get relativePath => throw _privateConstructorUsedError;
  bool get isImage => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;

  /// Serializes this Attachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
    Attachment value,
    $Res Function(Attachment) then,
  ) = _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
  $Res call({
    String id,
    String name,
    String relativePath,
    bool isImage,
    String? mimeType,
  });
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? relativePath = null,
    Object? isImage = null,
    Object? mimeType = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            relativePath: null == relativePath
                ? _value.relativePath
                : relativePath // ignore: cast_nullable_to_non_nullable
                      as String,
            isImage: null == isImage
                ? _value.isImage
                : isImage // ignore: cast_nullable_to_non_nullable
                      as bool,
            mimeType: freezed == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttachmentImplCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$AttachmentImplCopyWith(
    _$AttachmentImpl value,
    $Res Function(_$AttachmentImpl) then,
  ) = __$$AttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String relativePath,
    bool isImage,
    String? mimeType,
  });
}

/// @nodoc
class __$$AttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$AttachmentImpl>
    implements _$$AttachmentImplCopyWith<$Res> {
  __$$AttachmentImplCopyWithImpl(
    _$AttachmentImpl _value,
    $Res Function(_$AttachmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? relativePath = null,
    Object? isImage = null,
    Object? mimeType = freezed,
  }) {
    return _then(
      _$AttachmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        relativePath: null == relativePath
            ? _value.relativePath
            : relativePath // ignore: cast_nullable_to_non_nullable
                  as String,
        isImage: null == isImage
            ? _value.isImage
            : isImage // ignore: cast_nullable_to_non_nullable
                  as bool,
        mimeType: freezed == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentImpl implements _Attachment {
  const _$AttachmentImpl({
    required this.id,
    required this.name,
    required this.relativePath,
    this.isImage = false,
    this.mimeType,
  });

  factory _$AttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String relativePath;
  @override
  @JsonKey()
  final bool isImage;
  @override
  final String? mimeType;

  @override
  String toString() {
    return 'Attachment(id: $id, name: $name, relativePath: $relativePath, isImage: $isImage, mimeType: $mimeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.relativePath, relativePath) ||
                other.relativePath == relativePath) &&
            (identical(other.isImage, isImage) || other.isImage == isImage) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, relativePath, isImage, mimeType);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      __$$AttachmentImplCopyWithImpl<_$AttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentImplToJson(this);
  }
}

abstract class _Attachment implements Attachment {
  const factory _Attachment({
    required final String id,
    required final String name,
    required final String relativePath,
    final bool isImage,
    final String? mimeType,
  }) = _$AttachmentImpl;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$AttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get relativePath;
  @override
  bool get isImage;
  @override
  String? get mimeType;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/attachment.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      relativePath: json['relativePath'] as String,
      isImage: json['isImage'] as bool? ?? false,
      mimeType: json['mimeType'] as String?,
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'relativePath': instance.relativePath,
      'isImage': instance.isImage,
      'mimeType': instance.mimeType,
    };
````

## File: lib/core/models/chat_chunk.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_chunk.freezed.dart';

@freezed
class ChatChunk with _$ChatChunk {
  const factory ChatChunk({
    String? content,          // 正式内容片段
    String? reasoningContent, // 思考过程片段
    required bool isDone,     // 是否结束
    String? error,            // 错误信息
  }) = _ChatChunk;
}
````

## File: lib/core/models/chat_chunk.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_chunk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatChunk {
  String? get content => throw _privateConstructorUsedError; // 正式内容片段
  String? get reasoningContent => throw _privateConstructorUsedError; // 思考过程片段
  bool get isDone => throw _privateConstructorUsedError; // 是否结束
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatChunkCopyWith<ChatChunk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatChunkCopyWith<$Res> {
  factory $ChatChunkCopyWith(ChatChunk value, $Res Function(ChatChunk) then) =
      _$ChatChunkCopyWithImpl<$Res, ChatChunk>;
  @useResult
  $Res call({
    String? content,
    String? reasoningContent,
    bool isDone,
    String? error,
  });
}

/// @nodoc
class _$ChatChunkCopyWithImpl<$Res, $Val extends ChatChunk>
    implements $ChatChunkCopyWith<$Res> {
  _$ChatChunkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? reasoningContent = freezed,
    Object? isDone = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasoningContent: freezed == reasoningContent
                ? _value.reasoningContent
                : reasoningContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDone: null == isDone
                ? _value.isDone
                : isDone // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatChunkImplCopyWith<$Res>
    implements $ChatChunkCopyWith<$Res> {
  factory _$$ChatChunkImplCopyWith(
    _$ChatChunkImpl value,
    $Res Function(_$ChatChunkImpl) then,
  ) = __$$ChatChunkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? content,
    String? reasoningContent,
    bool isDone,
    String? error,
  });
}

/// @nodoc
class __$$ChatChunkImplCopyWithImpl<$Res>
    extends _$ChatChunkCopyWithImpl<$Res, _$ChatChunkImpl>
    implements _$$ChatChunkImplCopyWith<$Res> {
  __$$ChatChunkImplCopyWithImpl(
    _$ChatChunkImpl _value,
    $Res Function(_$ChatChunkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? reasoningContent = freezed,
    Object? isDone = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ChatChunkImpl(
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoningContent: freezed == reasoningContent
            ? _value.reasoningContent
            : reasoningContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDone: null == isDone
            ? _value.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChatChunkImpl implements _ChatChunk {
  const _$ChatChunkImpl({
    this.content,
    this.reasoningContent,
    required this.isDone,
    this.error,
  });

  @override
  final String? content;
  // 正式内容片段
  @override
  final String? reasoningContent;
  // 思考过程片段
  @override
  final bool isDone;
  // 是否结束
  @override
  final String? error;

  @override
  String toString() {
    return 'ChatChunk(content: $content, reasoningContent: $reasoningContent, isDone: $isDone, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatChunkImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoningContent, reasoningContent) ||
                other.reasoningContent == reasoningContent) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, content, reasoningContent, isDone, error);

  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatChunkImplCopyWith<_$ChatChunkImpl> get copyWith =>
      __$$ChatChunkImplCopyWithImpl<_$ChatChunkImpl>(this, _$identity);
}

abstract class _ChatChunk implements ChatChunk {
  const factory _ChatChunk({
    final String? content,
    final String? reasoningContent,
    required final bool isDone,
    final String? error,
  }) = _$ChatChunkImpl;

  @override
  String? get content; // 正式内容片段
  @override
  String? get reasoningContent; // 思考过程片段
  @override
  bool get isDone; // 是否结束
  @override
  String? get error;

  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatChunkImplCopyWith<_$ChatChunkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/chat_round.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'attachment.dart';

part 'chat_round.freezed.dart';
part 'chat_round.g.dart';

@freezed
class ChatRound with _$ChatRound {
  const factory ChatRound({
    required String id,
    String? parentId,
    required int createdAt,
    required String userContent,
    @Default([]) List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    @Default(false) bool isIncomplete,
    @Default(false) bool hasUnseenUpdate,
  }) = _ChatRound;

  factory ChatRound.fromJson(Map<String, dynamic> json) =>
      _$ChatRoundFromJson(json);
}
````

## File: lib/core/models/chat_round.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatRound _$ChatRoundFromJson(Map<String, dynamic> json) {
  return _ChatRound.fromJson(json);
}

/// @nodoc
mixin _$ChatRound {
  String get id => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get userContent => throw _privateConstructorUsedError;
  List<Attachment> get userAttachments => throw _privateConstructorUsedError;
  String? get assistantThinking => throw _privateConstructorUsedError;
  String? get assistantContent => throw _privateConstructorUsedError;
  bool get isIncomplete => throw _privateConstructorUsedError;
  bool get hasUnseenUpdate => throw _privateConstructorUsedError;

  /// Serializes this ChatRound to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoundCopyWith<ChatRound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoundCopyWith<$Res> {
  factory $ChatRoundCopyWith(ChatRound value, $Res Function(ChatRound) then) =
      _$ChatRoundCopyWithImpl<$Res, ChatRound>;
  @useResult
  $Res call({
    String id,
    String? parentId,
    int createdAt,
    String userContent,
    List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    bool isIncomplete,
    bool hasUnseenUpdate,
  });
}

/// @nodoc
class _$ChatRoundCopyWithImpl<$Res, $Val extends ChatRound>
    implements $ChatRoundCopyWith<$Res> {
  _$ChatRoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? createdAt = null,
    Object? userContent = null,
    Object? userAttachments = null,
    Object? assistantThinking = freezed,
    Object? assistantContent = freezed,
    Object? isIncomplete = null,
    Object? hasUnseenUpdate = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            userContent: null == userContent
                ? _value.userContent
                : userContent // ignore: cast_nullable_to_non_nullable
                      as String,
            userAttachments: null == userAttachments
                ? _value.userAttachments
                : userAttachments // ignore: cast_nullable_to_non_nullable
                      as List<Attachment>,
            assistantThinking: freezed == assistantThinking
                ? _value.assistantThinking
                : assistantThinking // ignore: cast_nullable_to_non_nullable
                      as String?,
            assistantContent: freezed == assistantContent
                ? _value.assistantContent
                : assistantContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            isIncomplete: null == isIncomplete
                ? _value.isIncomplete
                : isIncomplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasUnseenUpdate: null == hasUnseenUpdate
                ? _value.hasUnseenUpdate
                : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatRoundImplCopyWith<$Res>
    implements $ChatRoundCopyWith<$Res> {
  factory _$$ChatRoundImplCopyWith(
    _$ChatRoundImpl value,
    $Res Function(_$ChatRoundImpl) then,
  ) = __$$ChatRoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? parentId,
    int createdAt,
    String userContent,
    List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    bool isIncomplete,
    bool hasUnseenUpdate,
  });
}

/// @nodoc
class __$$ChatRoundImplCopyWithImpl<$Res>
    extends _$ChatRoundCopyWithImpl<$Res, _$ChatRoundImpl>
    implements _$$ChatRoundImplCopyWith<$Res> {
  __$$ChatRoundImplCopyWithImpl(
    _$ChatRoundImpl _value,
    $Res Function(_$ChatRoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? createdAt = null,
    Object? userContent = null,
    Object? userAttachments = null,
    Object? assistantThinking = freezed,
    Object? assistantContent = freezed,
    Object? isIncomplete = null,
    Object? hasUnseenUpdate = null,
  }) {
    return _then(
      _$ChatRoundImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        userContent: null == userContent
            ? _value.userContent
            : userContent // ignore: cast_nullable_to_non_nullable
                  as String,
        userAttachments: null == userAttachments
            ? _value._userAttachments
            : userAttachments // ignore: cast_nullable_to_non_nullable
                  as List<Attachment>,
        assistantThinking: freezed == assistantThinking
            ? _value.assistantThinking
            : assistantThinking // ignore: cast_nullable_to_non_nullable
                  as String?,
        assistantContent: freezed == assistantContent
            ? _value.assistantContent
            : assistantContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        isIncomplete: null == isIncomplete
            ? _value.isIncomplete
            : isIncomplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasUnseenUpdate: null == hasUnseenUpdate
            ? _value.hasUnseenUpdate
            : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoundImpl implements _ChatRound {
  const _$ChatRoundImpl({
    required this.id,
    this.parentId,
    required this.createdAt,
    required this.userContent,
    final List<Attachment> userAttachments = const [],
    this.assistantThinking,
    this.assistantContent,
    this.isIncomplete = false,
    this.hasUnseenUpdate = false,
  }) : _userAttachments = userAttachments;

  factory _$ChatRoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoundImplFromJson(json);

  @override
  final String id;
  @override
  final String? parentId;
  @override
  final int createdAt;
  @override
  final String userContent;
  final List<Attachment> _userAttachments;
  @override
  @JsonKey()
  List<Attachment> get userAttachments {
    if (_userAttachments is EqualUnmodifiableListView) return _userAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAttachments);
  }

  @override
  final String? assistantThinking;
  @override
  final String? assistantContent;
  @override
  @JsonKey()
  final bool isIncomplete;
  @override
  @JsonKey()
  final bool hasUnseenUpdate;

  @override
  String toString() {
    return 'ChatRound(id: $id, parentId: $parentId, createdAt: $createdAt, userContent: $userContent, userAttachments: $userAttachments, assistantThinking: $assistantThinking, assistantContent: $assistantContent, isIncomplete: $isIncomplete, hasUnseenUpdate: $hasUnseenUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userContent, userContent) ||
                other.userContent == userContent) &&
            const DeepCollectionEquality().equals(
              other._userAttachments,
              _userAttachments,
            ) &&
            (identical(other.assistantThinking, assistantThinking) ||
                other.assistantThinking == assistantThinking) &&
            (identical(other.assistantContent, assistantContent) ||
                other.assistantContent == assistantContent) &&
            (identical(other.isIncomplete, isIncomplete) ||
                other.isIncomplete == isIncomplete) &&
            (identical(other.hasUnseenUpdate, hasUnseenUpdate) ||
                other.hasUnseenUpdate == hasUnseenUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentId,
    createdAt,
    userContent,
    const DeepCollectionEquality().hash(_userAttachments),
    assistantThinking,
    assistantContent,
    isIncomplete,
    hasUnseenUpdate,
  );

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoundImplCopyWith<_$ChatRoundImpl> get copyWith =>
      __$$ChatRoundImplCopyWithImpl<_$ChatRoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoundImplToJson(this);
  }
}

abstract class _ChatRound implements ChatRound {
  const factory _ChatRound({
    required final String id,
    final String? parentId,
    required final int createdAt,
    required final String userContent,
    final List<Attachment> userAttachments,
    final String? assistantThinking,
    final String? assistantContent,
    final bool isIncomplete,
    final bool hasUnseenUpdate,
  }) = _$ChatRoundImpl;

  factory _ChatRound.fromJson(Map<String, dynamic> json) =
      _$ChatRoundImpl.fromJson;

  @override
  String get id;
  @override
  String? get parentId;
  @override
  int get createdAt;
  @override
  String get userContent;
  @override
  List<Attachment> get userAttachments;
  @override
  String? get assistantThinking;
  @override
  String? get assistantContent;
  @override
  bool get isIncomplete;
  @override
  bool get hasUnseenUpdate;

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoundImplCopyWith<_$ChatRoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/chat_round.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoundImpl _$$ChatRoundImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoundImpl(
      id: json['id'] as String,
      parentId: json['parentId'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
      userContent: json['userContent'] as String,
      userAttachments:
          (json['userAttachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      assistantThinking: json['assistantThinking'] as String?,
      assistantContent: json['assistantContent'] as String?,
      isIncomplete: json['isIncomplete'] as bool? ?? false,
      hasUnseenUpdate: json['hasUnseenUpdate'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatRoundImplToJson(_$ChatRoundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'createdAt': instance.createdAt,
      'userContent': instance.userContent,
      'userAttachments': instance.userAttachments,
      'assistantThinking': instance.assistantThinking,
      'assistantContent': instance.assistantContent,
      'isIncomplete': instance.isIncomplete,
      'hasUnseenUpdate': instance.hasUnseenUpdate,
    };
````

## File: lib/core/utils/sse_parser.dart
````dart
import '../models/sse_event.dart';

/// 标准 SSE 解析器
///
/// 负责：
/// - 处理 HTTP 分块不等于 SSE 事件边界的问题
/// - 支持 event/id/data/retry
/// - 支持多行 data 拼接
/// - 以空行作为一个 SSE event 的结束
class SseParser {
  String _buffer = '';

  final List<String> _dataLines = [];
  String? _event;
  String? _id;

  /// 输入任意一段文本，输出当前能够完整解析出的 SSE 事件列表
  List<SseEvent> addChunk(String chunk) {
    _buffer += chunk;
    final events = <SseEvent>[];

    while (true) {
      final newlineIndex = _buffer.indexOf('\n');
      if (newlineIndex == -1) break;

      var line = _buffer.substring(0, newlineIndex);
      _buffer = _buffer.substring(newlineIndex + 1);

      if (line.endsWith('\r')) {
        line = line.substring(0, line.length - 1);
      }

      // 空行 => 一个事件结束
      if (line.isEmpty) {
        final event = _flushEvent();
        if (event != null) {
          events.add(event);
        }
        continue;
      }

      // 注释行
      if (line.startsWith(':')) {
        continue;
      }

      final colonIndex = line.indexOf(':');
      String field;
      String value;

      if (colonIndex == -1) {
        field = line;
        value = '';
      } else {
        field = line.substring(0, colonIndex);
        value = line.substring(colonIndex + 1);
        if (value.startsWith(' ')) {
          value = value.substring(1);
        }
      }

      switch (field) {
        case 'event':
          _event = value;
          break;
        case 'data':
          _dataLines.add(value);
          break;
        case 'id':
          _id = value;
          break;
        case 'retry':
          // 目前不处理自动重试时间
          break;
        default:
          // 未知字段忽略
          break;
      }
    }

    return events;
  }

  /// 在底层流结束时调用，尝试 flush 最后一个未结束事件
  SseEvent? close() {
    return _flushEvent();
  }

  SseEvent? _flushEvent() {
    if (_dataLines.isEmpty && _event == null && _id == null) {
      return null;
    }

    final event = SseEvent(
      id: _id,
      event: _event,
      data: _dataLines.join('\n'),
    );

    _dataLines.clear();
    _event = null;
    _id = null;

    return event;
  }
}
````

## File: lib/presentation/models/pending_attachment.dart
````dart
class PendingAttachment {
  final String id;
  final String name;
  final String path;
  final bool isImage;
  final String? mimeType;

  const PendingAttachment({
    required this.id,
    required this.name,
    required this.path,
    required this.isImage,
    this.mimeType,
  });
}
````

## File: linux/.gitignore
````
flutter/ephemeral
````

## File: linux/CMakeLists.txt
````
# Project-level configuration.
cmake_minimum_required(VERSION 3.13)
project(runner LANGUAGES CXX)

# The name of the executable created for the application. Change this to change
# the on-disk name of your application.
set(BINARY_NAME "aiservice")
# The unique GTK application identifier for this application. See:
# https://wiki.gnome.org/HowDoI/ChooseApplicationID
set(APPLICATION_ID "com.example.aiservice")

# Explicitly opt in to modern CMake behaviors to avoid warnings with recent
# versions of CMake.
cmake_policy(SET CMP0063 NEW)

# Load bundled libraries from the lib/ directory relative to the binary.
set(CMAKE_INSTALL_RPATH "$ORIGIN/lib")

# Root filesystem for cross-building.
if(FLUTTER_TARGET_PLATFORM_SYSROOT)
  set(CMAKE_SYSROOT ${FLUTTER_TARGET_PLATFORM_SYSROOT})
  set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()

# Define build configuration options.
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE "Debug" CACHE
    STRING "Flutter build mode" FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    "Debug" "Profile" "Release")
endif()

# Compilation settings that should be applied to most targets.
#
# Be cautious about adding new options here, as plugins use this function by
# default. In most cases, you should add new options to specific targets instead
# of modifying this function.
function(APPLY_STANDARD_SETTINGS TARGET)
  target_compile_features(${TARGET} PUBLIC cxx_std_14)
  target_compile_options(${TARGET} PRIVATE -Wall -Werror)
  target_compile_options(${TARGET} PRIVATE "$<$<NOT:$<CONFIG:Debug>>:-O3>")
  target_compile_definitions(${TARGET} PRIVATE "$<$<NOT:$<CONFIG:Debug>>:NDEBUG>")
endfunction()

# Flutter library and tool build rules.
set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
add_subdirectory(${FLUTTER_MANAGED_DIR})

# System-level dependencies.
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK REQUIRED IMPORTED_TARGET gtk+-3.0)

# Application build; see runner/CMakeLists.txt.
add_subdirectory("runner")

# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)

# Only the install-generated bundle's copy of the executable will launch
# correctly, since the resources must in the right relative locations. To avoid
# people trying to run the unbundled copy, put it in a subdirectory instead of
# the default top-level location.
set_target_properties(${BINARY_NAME}
  PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/intermediates_do_not_run"
)


# Generated plugin build rules, which manage building the plugins and adding
# them to the application.
include(flutter/generated_plugins.cmake)


# === Installation ===
# By default, "installing" just makes a relocatable bundle in the build
# directory.
set(BUILD_BUNDLE_DIR "${PROJECT_BINARY_DIR}/bundle")
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${BUILD_BUNDLE_DIR}" CACHE PATH "..." FORCE)
endif()

# Start with a clean build bundle directory every time.
install(CODE "
  file(REMOVE_RECURSE \"${BUILD_BUNDLE_DIR}/\")
  " COMPONENT Runtime)

set(INSTALL_BUNDLE_DATA_DIR "${CMAKE_INSTALL_PREFIX}/data")
set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib")

install(TARGETS ${BINARY_NAME} RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_ICU_DATA_FILE}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
  COMPONENT Runtime)

foreach(bundled_library ${PLUGIN_BUNDLED_LIBRARIES})
  install(FILES "${bundled_library}"
    DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
endforeach(bundled_library)

# Copy the native assets provided by the build.dart from all packages.
set(NATIVE_ASSETS_DIR "${PROJECT_BUILD_DIR}native_assets/linux/")
install(DIRECTORY "${NATIVE_ASSETS_DIR}"
   DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
   COMPONENT Runtime)

# Fully re-copy the assets directory on each build to avoid having stale files
# from a previous install.
set(FLUTTER_ASSET_DIR_NAME "flutter_assets")
install(CODE "
  file(REMOVE_RECURSE \"${INSTALL_BUNDLE_DATA_DIR}/${FLUTTER_ASSET_DIR_NAME}\")
  " COMPONENT Runtime)
install(DIRECTORY "${PROJECT_BUILD_DIR}/${FLUTTER_ASSET_DIR_NAME}"
  DESTINATION "${INSTALL_BUNDLE_DATA_DIR}" COMPONENT Runtime)

# Install the AOT library on non-Debug builds only.
if(NOT CMAKE_BUILD_TYPE MATCHES "Debug")
  install(FILES "${AOT_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
endif()
````

## File: linux/flutter/CMakeLists.txt
````
# This file controls Flutter-level build steps. It should not be edited.
cmake_minimum_required(VERSION 3.10)

set(EPHEMERAL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ephemeral")

# Configuration provided via flutter tool.
include(${EPHEMERAL_DIR}/generated_config.cmake)

# TODO: Move the rest of this into files in ephemeral. See
# https://github.com/flutter/flutter/issues/57146.

# Serves the same purpose as list(TRANSFORM ... PREPEND ...),
# which isn't available in 3.10.
function(list_prepend LIST_NAME PREFIX)
    set(NEW_LIST "")
    foreach(element ${${LIST_NAME}})
        list(APPEND NEW_LIST "${PREFIX}${element}")
    endforeach(element)
    set(${LIST_NAME} "${NEW_LIST}" PARENT_SCOPE)
endfunction()

# === Flutter Library ===
# System-level dependencies.
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK REQUIRED IMPORTED_TARGET gtk+-3.0)
pkg_check_modules(GLIB REQUIRED IMPORTED_TARGET glib-2.0)
pkg_check_modules(GIO REQUIRED IMPORTED_TARGET gio-2.0)

set(FLUTTER_LIBRARY "${EPHEMERAL_DIR}/libflutter_linux_gtk.so")

# Published to parent scope for install step.
set(FLUTTER_LIBRARY ${FLUTTER_LIBRARY} PARENT_SCOPE)
set(FLUTTER_ICU_DATA_FILE "${EPHEMERAL_DIR}/icudtl.dat" PARENT_SCOPE)
set(PROJECT_BUILD_DIR "${PROJECT_DIR}/build/" PARENT_SCOPE)
set(AOT_LIBRARY "${PROJECT_DIR}/build/lib/libapp.so" PARENT_SCOPE)

list(APPEND FLUTTER_LIBRARY_HEADERS
  "fl_basic_message_channel.h"
  "fl_binary_codec.h"
  "fl_binary_messenger.h"
  "fl_dart_project.h"
  "fl_engine.h"
  "fl_json_message_codec.h"
  "fl_json_method_codec.h"
  "fl_message_codec.h"
  "fl_method_call.h"
  "fl_method_channel.h"
  "fl_method_codec.h"
  "fl_method_response.h"
  "fl_plugin_registrar.h"
  "fl_plugin_registry.h"
  "fl_standard_message_codec.h"
  "fl_standard_method_codec.h"
  "fl_string_codec.h"
  "fl_value.h"
  "fl_view.h"
  "flutter_linux.h"
)
list_prepend(FLUTTER_LIBRARY_HEADERS "${EPHEMERAL_DIR}/flutter_linux/")
add_library(flutter INTERFACE)
target_include_directories(flutter INTERFACE
  "${EPHEMERAL_DIR}"
)
target_link_libraries(flutter INTERFACE "${FLUTTER_LIBRARY}")
target_link_libraries(flutter INTERFACE
  PkgConfig::GTK
  PkgConfig::GLIB
  PkgConfig::GIO
)
add_dependencies(flutter flutter_assemble)

# === Flutter tool backend ===
# _phony_ is a non-existent file to force this command to run every time,
# since currently there's no way to get a full input/output list from the
# flutter tool.
add_custom_command(
  OUTPUT ${FLUTTER_LIBRARY} ${FLUTTER_LIBRARY_HEADERS}
    ${CMAKE_CURRENT_BINARY_DIR}/_phony_
  COMMAND ${CMAKE_COMMAND} -E env
    ${FLUTTER_TOOL_ENVIRONMENT}
    "${FLUTTER_ROOT}/packages/flutter_tools/bin/tool_backend.sh"
      ${FLUTTER_TARGET_PLATFORM} ${CMAKE_BUILD_TYPE}
  VERBATIM
)
add_custom_target(flutter_assemble DEPENDS
  "${FLUTTER_LIBRARY}"
  ${FLUTTER_LIBRARY_HEADERS}
)
````

## File: linux/flutter/generated_plugin_registrant.cc
````cpp
//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_linux/file_selector_plugin.h>
#include <sqlite3_flutter_libs/sqlite3_flutter_libs_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) file_selector_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FileSelectorPlugin");
  file_selector_plugin_register_with_registrar(file_selector_linux_registrar);
  g_autoptr(FlPluginRegistrar) sqlite3_flutter_libs_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "Sqlite3FlutterLibsPlugin");
  sqlite3_flutter_libs_plugin_register_with_registrar(sqlite3_flutter_libs_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
````

## File: linux/flutter/generated_plugin_registrant.h
````c
//
//  Generated file. Do not edit.
//

// clang-format off

#ifndef GENERATED_PLUGIN_REGISTRANT_
#define GENERATED_PLUGIN_REGISTRANT_

#include <flutter_linux/flutter_linux.h>

// Registers Flutter plugins.
void fl_register_plugins(FlPluginRegistry* registry);

#endif  // GENERATED_PLUGIN_REGISTRANT_
````

## File: linux/flutter/generated_plugins.cmake
````cmake
#
# Generated file, do not edit.
#

list(APPEND FLUTTER_PLUGIN_LIST
  file_selector_linux
  sqlite3_flutter_libs
  url_launcher_linux
)

list(APPEND FLUTTER_FFI_PLUGIN_LIST
)

set(PLUGIN_BUNDLED_LIBRARIES)

foreach(plugin ${FLUTTER_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/linux plugins/${plugin})
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)

foreach(ffi_plugin ${FLUTTER_FFI_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${ffi_plugin}/linux plugins/${ffi_plugin})
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${ffi_plugin}_bundled_libraries})
endforeach(ffi_plugin)
````

## File: linux/runner/CMakeLists.txt
````
cmake_minimum_required(VERSION 3.13)
project(runner LANGUAGES CXX)

# Define the application target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the application should be added here.
add_executable(${BINARY_NAME}
  "main.cc"
  "my_application.cc"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
)

# Apply the standard set of build settings. This can be removed for applications
# that need different build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions for the application ID.
add_definitions(-DAPPLICATION_ID="${APPLICATION_ID}")

# Add dependency libraries. Add any application-specific dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter)
target_link_libraries(${BINARY_NAME} PRIVATE PkgConfig::GTK)

target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")
````

## File: linux/runner/main.cc
````cpp
#include "my_application.h"

int main(int argc, char** argv) {
  g_autoptr(MyApplication) app = my_application_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
````

## File: linux/runner/my_application.cc
````cpp
#include "my_application.h"

#include <flutter_linux/flutter_linux.h>
#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>
#endif

#include "flutter/generated_plugin_registrant.h"

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

// Called when first Flutter frame received.
static void first_frame_cb(MyApplication* self, FlView* view) {
  gtk_widget_show(gtk_widget_get_toplevel(GTK_WIDGET(view)));
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);
  GtkWindow* window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));

  // Use a header bar when running in GNOME as this is the common style used
  // by applications and is the setup most users will be using (e.g. Ubuntu
  // desktop).
  // If running on X and not using GNOME then just use a traditional title bar
  // in case the window manager does more exotic layout, e.g. tiling.
  // If running on Wayland assume the header bar will work (may need changing
  // if future cases occur).
  gboolean use_header_bar = TRUE;
#ifdef GDK_WINDOWING_X11
  GdkScreen* screen = gtk_window_get_screen(window);
  if (GDK_IS_X11_SCREEN(screen)) {
    const gchar* wm_name = gdk_x11_screen_get_window_manager_name(screen);
    if (g_strcmp0(wm_name, "GNOME Shell") != 0) {
      use_header_bar = FALSE;
    }
  }
#endif
  if (use_header_bar) {
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
    gtk_widget_show(GTK_WIDGET(header_bar));
    gtk_header_bar_set_title(header_bar, "aiservice");
    gtk_header_bar_set_show_close_button(header_bar, TRUE);
    gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  } else {
    gtk_window_set_title(window, "aiservice");
  }

  gtk_window_set_default_size(window, 1280, 720);

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(
      project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  GdkRGBA background_color;
  // Background defaults to black, override it here if necessary, e.g. #00000000
  // for transparent.
  gdk_rgba_parse(&background_color, "#000000");
  fl_view_set_background_color(view, &background_color);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  // Show the window when Flutter renders.
  // Requires the view to be realized so we can start rendering.
  g_signal_connect_swapped(view, "first-frame", G_CALLBACK(first_frame_cb),
                           self);
  gtk_widget_realize(GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  gtk_widget_grab_focus(GTK_WIDGET(view));
}

// Implements GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application,
                                                  gchar*** arguments,
                                                  int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
    g_warning("Failed to register: %s", error->message);
    *exit_status = 1;
    return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  return TRUE;
}

// Implements GApplication::startup.
static void my_application_startup(GApplication* application) {
  // MyApplication* self = MY_APPLICATION(object);

  // Perform any actions required at application startup.

  G_APPLICATION_CLASS(my_application_parent_class)->startup(application);
}

// Implements GApplication::shutdown.
static void my_application_shutdown(GApplication* application) {
  // MyApplication* self = MY_APPLICATION(object);

  // Perform any actions required at application shutdown.

  G_APPLICATION_CLASS(my_application_parent_class)->shutdown(application);
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line =
      my_application_local_command_line;
  G_APPLICATION_CLASS(klass)->startup = my_application_startup;
  G_APPLICATION_CLASS(klass)->shutdown = my_application_shutdown;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {}

MyApplication* my_application_new() {
  // Set the program name to the application ID, which helps various systems
  // like GTK and desktop environments map this running application to its
  // corresponding .desktop file. This ensures better integration by allowing
  // the application to be recognized beyond its binary name.
  g_set_prgname(APPLICATION_ID);

  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", APPLICATION_ID, "flags",
                                     G_APPLICATION_NON_UNIQUE, nullptr));
}
````

## File: linux/runner/my_application.h
````c
#ifndef FLUTTER_MY_APPLICATION_H_
#define FLUTTER_MY_APPLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication,
                     my_application,
                     MY,
                     APPLICATION,
                     GtkApplication)

/**
 * my_application_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #MyApplication.
 */
MyApplication* my_application_new();

#endif  // FLUTTER_MY_APPLICATION_H_
````

## File: macos/.gitignore
````
# Flutter-related
**/Flutter/ephemeral/
**/Pods/

# Xcode-related
**/dgph
**/xcuserdata/
````

## File: macos/Flutter/Flutter-Debug.xcconfig
````
#include "ephemeral/Flutter-Generated.xcconfig"
````

## File: macos/Flutter/Flutter-Release.xcconfig
````
#include "ephemeral/Flutter-Generated.xcconfig"
````

## File: macos/Runner.xcodeproj/project.pbxproj
````
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 54;
	objects = {

/* Begin PBXAggregateTarget section */
		33CC111A2044C6BA0003C045 /* Flutter Assemble */ = {
			isa = PBXAggregateTarget;
			buildConfigurationList = 33CC111B2044C6BA0003C045 /* Build configuration list for PBXAggregateTarget "Flutter Assemble" */;
			buildPhases = (
				33CC111E2044C6BF0003C045 /* ShellScript */,
			);
			dependencies = (
			);
			name = "Flutter Assemble";
			productName = FLX;
		};
/* End PBXAggregateTarget section */

/* Begin PBXBuildFile section */
		331C80D8294CF71000263BE5 /* RunnerTests.swift in Sources */ = {isa = PBXBuildFile; fileRef = 331C80D7294CF71000263BE5 /* RunnerTests.swift */; };
		335BBD1B22A9A15E00E9071D /* GeneratedPluginRegistrant.swift in Sources */ = {isa = PBXBuildFile; fileRef = 335BBD1A22A9A15E00E9071D /* GeneratedPluginRegistrant.swift */; };
		33CC10F12044A3C60003C045 /* AppDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 33CC10F02044A3C60003C045 /* AppDelegate.swift */; };
		33CC10F32044A3C60003C045 /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 33CC10F22044A3C60003C045 /* Assets.xcassets */; };
		33CC10F62044A3C60003C045 /* MainMenu.xib in Resources */ = {isa = PBXBuildFile; fileRef = 33CC10F42044A3C60003C045 /* MainMenu.xib */; };
		33CC11132044BFA00003C045 /* MainFlutterWindow.swift in Sources */ = {isa = PBXBuildFile; fileRef = 33CC11122044BFA00003C045 /* MainFlutterWindow.swift */; };
/* End PBXBuildFile section */

/* Begin PBXContainerItemProxy section */
		331C80D9294CF71000263BE5 /* PBXContainerItemProxy */ = {
			isa = PBXContainerItemProxy;
			containerPortal = 33CC10E52044A3C60003C045 /* Project object */;
			proxyType = 1;
			remoteGlobalIDString = 33CC10EC2044A3C60003C045;
			remoteInfo = Runner;
		};
		33CC111F2044C79F0003C045 /* PBXContainerItemProxy */ = {
			isa = PBXContainerItemProxy;
			containerPortal = 33CC10E52044A3C60003C045 /* Project object */;
			proxyType = 1;
			remoteGlobalIDString = 33CC111A2044C6BA0003C045;
			remoteInfo = FLX;
		};
/* End PBXContainerItemProxy section */

/* Begin PBXCopyFilesBuildPhase section */
		33CC110E2044A8840003C045 /* Bundle Framework */ = {
			isa = PBXCopyFilesBuildPhase;
			buildActionMask = 2147483647;
			dstPath = "";
			dstSubfolderSpec = 10;
			files = (
			);
			name = "Bundle Framework";
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXCopyFilesBuildPhase section */

/* Begin PBXFileReference section */
		331C80D5294CF71000263BE5 /* RunnerTests.xctest */ = {isa = PBXFileReference; explicitFileType = wrapper.cfbundle; includeInIndex = 0; path = RunnerTests.xctest; sourceTree = BUILT_PRODUCTS_DIR; };
		331C80D7294CF71000263BE5 /* RunnerTests.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RunnerTests.swift; sourceTree = "<group>"; };
		333000ED22D3DE5D00554162 /* Warnings.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; path = Warnings.xcconfig; sourceTree = "<group>"; };
		335BBD1A22A9A15E00E9071D /* GeneratedPluginRegistrant.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = GeneratedPluginRegistrant.swift; sourceTree = "<group>"; };
		33CC10ED2044A3C60003C045 /* aiservice.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = "aiservice.app"; sourceTree = BUILT_PRODUCTS_DIR; };
		33CC10F02044A3C60003C045 /* AppDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppDelegate.swift; sourceTree = "<group>"; };
		33CC10F22044A3C60003C045 /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; name = Assets.xcassets; path = Runner/Assets.xcassets; sourceTree = "<group>"; };
		33CC10F52044A3C60003C045 /* Base */ = {isa = PBXFileReference; lastKnownFileType = file.xib; name = Base; path = Base.lproj/MainMenu.xib; sourceTree = "<group>"; };
		33CC10F72044A3C60003C045 /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; name = Info.plist; path = Runner/Info.plist; sourceTree = "<group>"; };
		33CC11122044BFA00003C045 /* MainFlutterWindow.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainFlutterWindow.swift; sourceTree = "<group>"; };
		33CEB47222A05771004F2AC0 /* Flutter-Debug.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; path = "Flutter-Debug.xcconfig"; sourceTree = "<group>"; };
		33CEB47422A05771004F2AC0 /* Flutter-Release.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; path = "Flutter-Release.xcconfig"; sourceTree = "<group>"; };
		33CEB47722A0578A004F2AC0 /* Flutter-Generated.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; name = "Flutter-Generated.xcconfig"; path = "ephemeral/Flutter-Generated.xcconfig"; sourceTree = "<group>"; };
		33E51913231747F40026EE4D /* DebugProfile.entitlements */ = {isa = PBXFileReference; lastKnownFileType = text.plist.entitlements; path = DebugProfile.entitlements; sourceTree = "<group>"; };
		33E51914231749380026EE4D /* Release.entitlements */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.plist.entitlements; path = Release.entitlements; sourceTree = "<group>"; };
		33E5194F232828860026EE4D /* AppInfo.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; path = AppInfo.xcconfig; sourceTree = "<group>"; };
		7AFA3C8E1D35360C0083082E /* Release.xcconfig */ = {isa = PBXFileReference; lastKnownFileType = text.xcconfig; path = Release.xcconfig; sourceTree = "<group>"; };
		9740EEB21CF90195004384FC /* Debug.xcconfig */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.xcconfig; path = Debug.xcconfig; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		331C80D2294CF70F00263BE5 /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		33CC10EA2044A3C60003C045 /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		331C80D6294CF71000263BE5 /* RunnerTests */ = {
			isa = PBXGroup;
			children = (
				331C80D7294CF71000263BE5 /* RunnerTests.swift */,
			);
			path = RunnerTests;
			sourceTree = "<group>";
		};
		33BA886A226E78AF003329D5 /* Configs */ = {
			isa = PBXGroup;
			children = (
				33E5194F232828860026EE4D /* AppInfo.xcconfig */,
				9740EEB21CF90195004384FC /* Debug.xcconfig */,
				7AFA3C8E1D35360C0083082E /* Release.xcconfig */,
				333000ED22D3DE5D00554162 /* Warnings.xcconfig */,
			);
			path = Configs;
			sourceTree = "<group>";
		};
		33CC10E42044A3C60003C045 = {
			isa = PBXGroup;
			children = (
				33FAB671232836740065AC1E /* Runner */,
				33CEB47122A05771004F2AC0 /* Flutter */,
				331C80D6294CF71000263BE5 /* RunnerTests */,
				33CC10EE2044A3C60003C045 /* Products */,
				D73912EC22F37F3D000D13A0 /* Frameworks */,
			);
			sourceTree = "<group>";
		};
		33CC10EE2044A3C60003C045 /* Products */ = {
			isa = PBXGroup;
			children = (
				33CC10ED2044A3C60003C045 /* aiservice.app */,
				331C80D5294CF71000263BE5 /* RunnerTests.xctest */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		33CC11242044D66E0003C045 /* Resources */ = {
			isa = PBXGroup;
			children = (
				33CC10F22044A3C60003C045 /* Assets.xcassets */,
				33CC10F42044A3C60003C045 /* MainMenu.xib */,
				33CC10F72044A3C60003C045 /* Info.plist */,
			);
			name = Resources;
			path = ..;
			sourceTree = "<group>";
		};
		33CEB47122A05771004F2AC0 /* Flutter */ = {
			isa = PBXGroup;
			children = (
				335BBD1A22A9A15E00E9071D /* GeneratedPluginRegistrant.swift */,
				33CEB47222A05771004F2AC0 /* Flutter-Debug.xcconfig */,
				33CEB47422A05771004F2AC0 /* Flutter-Release.xcconfig */,
				33CEB47722A0578A004F2AC0 /* Flutter-Generated.xcconfig */,
			);
			path = Flutter;
			sourceTree = "<group>";
		};
		33FAB671232836740065AC1E /* Runner */ = {
			isa = PBXGroup;
			children = (
				33CC10F02044A3C60003C045 /* AppDelegate.swift */,
				33CC11122044BFA00003C045 /* MainFlutterWindow.swift */,
				33E51913231747F40026EE4D /* DebugProfile.entitlements */,
				33E51914231749380026EE4D /* Release.entitlements */,
				33CC11242044D66E0003C045 /* Resources */,
				33BA886A226E78AF003329D5 /* Configs */,
			);
			path = Runner;
			sourceTree = "<group>";
		};
		D73912EC22F37F3D000D13A0 /* Frameworks */ = {
			isa = PBXGroup;
			children = (
			);
			name = Frameworks;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		331C80D4294CF70F00263BE5 /* RunnerTests */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 331C80DE294CF71000263BE5 /* Build configuration list for PBXNativeTarget "RunnerTests" */;
			buildPhases = (
				331C80D1294CF70F00263BE5 /* Sources */,
				331C80D2294CF70F00263BE5 /* Frameworks */,
				331C80D3294CF70F00263BE5 /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
				331C80DA294CF71000263BE5 /* PBXTargetDependency */,
			);
			name = RunnerTests;
			productName = RunnerTests;
			productReference = 331C80D5294CF71000263BE5 /* RunnerTests.xctest */;
			productType = "com.apple.product-type.bundle.unit-test";
		};
		33CC10EC2044A3C60003C045 /* Runner */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 33CC10FB2044A3C60003C045 /* Build configuration list for PBXNativeTarget "Runner" */;
			buildPhases = (
				33CC10E92044A3C60003C045 /* Sources */,
				33CC10EA2044A3C60003C045 /* Frameworks */,
				33CC10EB2044A3C60003C045 /* Resources */,
				33CC110E2044A8840003C045 /* Bundle Framework */,
				3399D490228B24CF009A79C7 /* ShellScript */,
			);
			buildRules = (
			);
			dependencies = (
				33CC11202044C79F0003C045 /* PBXTargetDependency */,
			);
			name = Runner;
			productName = Runner;
			productReference = 33CC10ED2044A3C60003C045 /* aiservice.app */;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		33CC10E52044A3C60003C045 /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = YES;
				LastSwiftUpdateCheck = 0920;
				LastUpgradeCheck = 1510;
				ORGANIZATIONNAME = "";
				TargetAttributes = {
					331C80D4294CF70F00263BE5 = {
						CreatedOnToolsVersion = 14.0;
						TestTargetID = 33CC10EC2044A3C60003C045;
					};
					33CC10EC2044A3C60003C045 = {
						CreatedOnToolsVersion = 9.2;
						LastSwiftMigration = 1100;
						ProvisioningStyle = Automatic;
						SystemCapabilities = {
							com.apple.Sandbox = {
								enabled = 1;
							};
						};
					};
					33CC111A2044C6BA0003C045 = {
						CreatedOnToolsVersion = 9.2;
						ProvisioningStyle = Manual;
					};
				};
			};
			buildConfigurationList = 33CC10E82044A3C60003C045 /* Build configuration list for PBXProject "Runner" */;
			compatibilityVersion = "Xcode 9.3";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = 33CC10E42044A3C60003C045;
			productRefGroup = 33CC10EE2044A3C60003C045 /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				33CC10EC2044A3C60003C045 /* Runner */,
				331C80D4294CF70F00263BE5 /* RunnerTests */,
				33CC111A2044C6BA0003C045 /* Flutter Assemble */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		331C80D3294CF70F00263BE5 /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		33CC10EB2044A3C60003C045 /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				33CC10F32044A3C60003C045 /* Assets.xcassets in Resources */,
				33CC10F62044A3C60003C045 /* MainMenu.xib in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXShellScriptBuildPhase section */
		3399D490228B24CF009A79C7 /* ShellScript */ = {
			isa = PBXShellScriptBuildPhase;
			alwaysOutOfDate = 1;
			buildActionMask = 2147483647;
			files = (
			);
			inputFileListPaths = (
			);
			inputPaths = (
			);
			outputFileListPaths = (
			);
			outputPaths = (
			);
			runOnlyForDeploymentPostprocessing = 0;
			shellPath = /bin/sh;
			shellScript = "echo \"$PRODUCT_NAME.app\" > \"$PROJECT_DIR\"/Flutter/ephemeral/.app_filename && \"$FLUTTER_ROOT\"/packages/flutter_tools/bin/macos_assemble.sh embed\n";
		};
		33CC111E2044C6BF0003C045 /* ShellScript */ = {
			isa = PBXShellScriptBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			inputFileListPaths = (
				Flutter/ephemeral/FlutterInputs.xcfilelist,
			);
			inputPaths = (
				Flutter/ephemeral/tripwire,
			);
			outputFileListPaths = (
				Flutter/ephemeral/FlutterOutputs.xcfilelist,
			);
			outputPaths = (
			);
			runOnlyForDeploymentPostprocessing = 0;
			shellPath = /bin/sh;
			shellScript = "\"$FLUTTER_ROOT\"/packages/flutter_tools/bin/macos_assemble.sh && touch Flutter/ephemeral/tripwire";
		};
/* End PBXShellScriptBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		331C80D1294CF70F00263BE5 /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				331C80D8294CF71000263BE5 /* RunnerTests.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		33CC10E92044A3C60003C045 /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				33CC11132044BFA00003C045 /* MainFlutterWindow.swift in Sources */,
				33CC10F12044A3C60003C045 /* AppDelegate.swift in Sources */,
				335BBD1B22A9A15E00E9071D /* GeneratedPluginRegistrant.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin PBXTargetDependency section */
		331C80DA294CF71000263BE5 /* PBXTargetDependency */ = {
			isa = PBXTargetDependency;
			target = 33CC10EC2044A3C60003C045 /* Runner */;
			targetProxy = 331C80D9294CF71000263BE5 /* PBXContainerItemProxy */;
		};
		33CC11202044C79F0003C045 /* PBXTargetDependency */ = {
			isa = PBXTargetDependency;
			target = 33CC111A2044C6BA0003C045 /* Flutter Assemble */;
			targetProxy = 33CC111F2044C79F0003C045 /* PBXContainerItemProxy */;
		};
/* End PBXTargetDependency section */

/* Begin PBXVariantGroup section */
		33CC10F42044A3C60003C045 /* MainMenu.xib */ = {
			isa = PBXVariantGroup;
			children = (
				33CC10F52044A3C60003C045 /* Base */,
			);
			name = MainMenu.xib;
			path = Runner;
			sourceTree = "<group>";
		};
/* End PBXVariantGroup section */

/* Begin XCBuildConfiguration section */
		331C80DB294CF71000263BE5 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = "$(TEST_HOST)";
				CURRENT_PROJECT_VERSION = 1;
				GENERATE_INFOPLIST_FILE = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice.RunnerTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_VERSION = 5.0;
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/aiservice.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/aiservice";
			};
			name = Debug;
		};
		331C80DC294CF71000263BE5 /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = "$(TEST_HOST)";
				CURRENT_PROJECT_VERSION = 1;
				GENERATE_INFOPLIST_FILE = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice.RunnerTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_VERSION = 5.0;
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/aiservice.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/aiservice";
			};
			name = Release;
		};
		331C80DD294CF71000263BE5 /* Profile */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = "$(TEST_HOST)";
				CURRENT_PROJECT_VERSION = 1;
				GENERATE_INFOPLIST_FILE = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice.RunnerTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_VERSION = 5.0;
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/aiservice.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/aiservice";
			};
			name = Profile;
		};
		338D0CE9231458BD00FA5F75 /* Profile */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 7AFA3C8E1D35360C0083082E /* Release.xcconfig */;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++14";
				CLANG_CXX_LIBRARY = "libc++";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CODE_SIGN_IDENTITY = "-";
				COPY_PHASE_STRIP = NO;
				DEAD_CODE_STRIPPING = YES;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = NO;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				MACOSX_DEPLOYMENT_TARGET = 10.15;
				MTL_ENABLE_DEBUG_INFO = NO;
				SDKROOT = macosx;
				SWIFT_COMPILATION_MODE = wholemodule;
				SWIFT_OPTIMIZATION_LEVEL = "-O";
			};
			name = Profile;
		};
		338D0CEA231458BD00FA5F75 /* Profile */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 33E5194F232828860026EE4D /* AppInfo.xcconfig */;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CLANG_ENABLE_MODULES = YES;
				CODE_SIGN_ENTITLEMENTS = Runner/DebugProfile.entitlements;
				CODE_SIGN_STYLE = Automatic;
				COMBINE_HIDPI_IMAGES = YES;
				INFOPLIST_FILE = Runner/Info.plist;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/../Frameworks",
				);
				PROVISIONING_PROFILE_SPECIFIER = "";
				SWIFT_VERSION = 5.0;
			};
			name = Profile;
		};
		338D0CEB231458BD00FA5F75 /* Profile */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				CODE_SIGN_STYLE = Manual;
				PRODUCT_NAME = "$(TARGET_NAME)";
			};
			name = Profile;
		};
		33CC10F92044A3C60003C045 /* Debug */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 9740EEB21CF90195004384FC /* Debug.xcconfig */;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++14";
				CLANG_CXX_LIBRARY = "libc++";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CODE_SIGN_IDENTITY = "-";
				COPY_PHASE_STRIP = NO;
				DEAD_CODE_STRIPPING = YES;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_TESTABILITY = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = NO;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"$(inherited)",
				);
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				MACOSX_DEPLOYMENT_TARGET = 10.15;
				MTL_ENABLE_DEBUG_INFO = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = macosx;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
			};
			name = Debug;
		};
		33CC10FA2044A3C60003C045 /* Release */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 7AFA3C8E1D35360C0083082E /* Release.xcconfig */;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++14";
				CLANG_CXX_LIBRARY = "libc++";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CODE_SIGN_IDENTITY = "-";
				COPY_PHASE_STRIP = NO;
				DEAD_CODE_STRIPPING = YES;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = NO;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				MACOSX_DEPLOYMENT_TARGET = 10.15;
				MTL_ENABLE_DEBUG_INFO = NO;
				SDKROOT = macosx;
				SWIFT_COMPILATION_MODE = wholemodule;
				SWIFT_OPTIMIZATION_LEVEL = "-O";
			};
			name = Release;
		};
		33CC10FC2044A3C60003C045 /* Debug */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 33E5194F232828860026EE4D /* AppInfo.xcconfig */;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CLANG_ENABLE_MODULES = YES;
				CODE_SIGN_ENTITLEMENTS = Runner/DebugProfile.entitlements;
				CODE_SIGN_STYLE = Automatic;
				COMBINE_HIDPI_IMAGES = YES;
				INFOPLIST_FILE = Runner/Info.plist;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/../Frameworks",
				);
				PROVISIONING_PROFILE_SPECIFIER = "";
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
				SWIFT_VERSION = 5.0;
			};
			name = Debug;
		};
		33CC10FD2044A3C60003C045 /* Release */ = {
			isa = XCBuildConfiguration;
			baseConfigurationReference = 33E5194F232828860026EE4D /* AppInfo.xcconfig */;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CLANG_ENABLE_MODULES = YES;
				CODE_SIGN_ENTITLEMENTS = Runner/Release.entitlements;
				CODE_SIGN_STYLE = Automatic;
				COMBINE_HIDPI_IMAGES = YES;
				INFOPLIST_FILE = Runner/Info.plist;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/../Frameworks",
				);
				PROVISIONING_PROFILE_SPECIFIER = "";
				SWIFT_VERSION = 5.0;
			};
			name = Release;
		};
		33CC111C2044C6BA0003C045 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				CODE_SIGN_STYLE = Manual;
				PRODUCT_NAME = "$(TARGET_NAME)";
			};
			name = Debug;
		};
		33CC111D2044C6BA0003C045 /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				CODE_SIGN_STYLE = Automatic;
				PRODUCT_NAME = "$(TARGET_NAME)";
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		331C80DE294CF71000263BE5 /* Build configuration list for PBXNativeTarget "RunnerTests" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				331C80DB294CF71000263BE5 /* Debug */,
				331C80DC294CF71000263BE5 /* Release */,
				331C80DD294CF71000263BE5 /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		33CC10E82044A3C60003C045 /* Build configuration list for PBXProject "Runner" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				33CC10F92044A3C60003C045 /* Debug */,
				33CC10FA2044A3C60003C045 /* Release */,
				338D0CE9231458BD00FA5F75 /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		33CC10FB2044A3C60003C045 /* Build configuration list for PBXNativeTarget "Runner" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				33CC10FC2044A3C60003C045 /* Debug */,
				33CC10FD2044A3C60003C045 /* Release */,
				338D0CEA231458BD00FA5F75 /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		33CC111B2044C6BA0003C045 /* Build configuration list for PBXAggregateTarget "Flutter Assemble" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				33CC111C2044C6BA0003C045 /* Debug */,
				33CC111D2044C6BA0003C045 /* Release */,
				338D0CEB231458BD00FA5F75 /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = 33CC10E52044A3C60003C045 /* Project object */;
}
````

## File: macos/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>IDEDidComputeMac32BitWarning</key>
	<true/>
</dict>
</plist>
````

## File: macos/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme
````
<?xml version="1.0" encoding="UTF-8"?>
<Scheme
   LastUpgradeVersion = "1510"
   version = "1.3">
   <BuildAction
      parallelizeBuildables = "YES"
      buildImplicitDependencies = "YES">
      <BuildActionEntries>
         <BuildActionEntry
            buildForTesting = "YES"
            buildForRunning = "YES"
            buildForProfiling = "YES"
            buildForArchiving = "YES"
            buildForAnalyzing = "YES">
            <BuildableReference
               BuildableIdentifier = "primary"
               BlueprintIdentifier = "33CC10EC2044A3C60003C045"
               BuildableName = "aiservice.app"
               BlueprintName = "Runner"
               ReferencedContainer = "container:Runner.xcodeproj">
            </BuildableReference>
         </BuildActionEntry>
      </BuildActionEntries>
   </BuildAction>
   <TestAction
      buildConfiguration = "Debug"
      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
      shouldUseLaunchSchemeArgsEnv = "YES">
      <MacroExpansion>
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "33CC10EC2044A3C60003C045"
            BuildableName = "aiservice.app"
            BlueprintName = "Runner"
            ReferencedContainer = "container:Runner.xcodeproj">
         </BuildableReference>
      </MacroExpansion>
      <Testables>
         <TestableReference
            skipped = "NO"
            parallelizable = "YES">
            <BuildableReference
               BuildableIdentifier = "primary"
               BlueprintIdentifier = "331C80D4294CF70F00263BE5"
               BuildableName = "RunnerTests.xctest"
               BlueprintName = "RunnerTests"
               ReferencedContainer = "container:Runner.xcodeproj">
            </BuildableReference>
         </TestableReference>
      </Testables>
   </TestAction>
   <LaunchAction
      buildConfiguration = "Debug"
      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
      launchStyle = "0"
      useCustomWorkingDirectory = "NO"
      ignoresPersistentStateOnLaunch = "NO"
      debugDocumentVersioning = "YES"
      debugServiceExtension = "internal"
      enableGPUValidationMode = "1"
      allowLocationSimulation = "YES">
      <BuildableProductRunnable
         runnableDebuggingMode = "0">
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "33CC10EC2044A3C60003C045"
            BuildableName = "aiservice.app"
            BlueprintName = "Runner"
            ReferencedContainer = "container:Runner.xcodeproj">
         </BuildableReference>
      </BuildableProductRunnable>
   </LaunchAction>
   <ProfileAction
      buildConfiguration = "Profile"
      shouldUseLaunchSchemeArgsEnv = "YES"
      savedToolIdentifier = ""
      useCustomWorkingDirectory = "NO"
      debugDocumentVersioning = "YES">
      <BuildableProductRunnable
         runnableDebuggingMode = "0">
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "33CC10EC2044A3C60003C045"
            BuildableName = "aiservice.app"
            BlueprintName = "Runner"
            ReferencedContainer = "container:Runner.xcodeproj">
         </BuildableReference>
      </BuildableProductRunnable>
   </ProfileAction>
   <AnalyzeAction
      buildConfiguration = "Debug">
   </AnalyzeAction>
   <ArchiveAction
      buildConfiguration = "Release"
      revealArchiveInOrganizer = "YES">
   </ArchiveAction>
</Scheme>
````

## File: macos/Runner.xcworkspace/contents.xcworkspacedata
````
<?xml version="1.0" encoding="UTF-8"?>
<Workspace
   version = "1.0">
   <FileRef
      location = "group:Runner.xcodeproj">
   </FileRef>
</Workspace>
````

## File: macos/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>IDEDidComputeMac32BitWarning</key>
	<true/>
</dict>
</plist>
````

## File: macos/Runner/AppDelegate.swift
````swift
import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
````

## File: macos/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json
````json
{
  "images" : [
    {
      "size" : "16x16",
      "idiom" : "mac",
      "filename" : "app_icon_16.png",
      "scale" : "1x"
    },
    {
      "size" : "16x16",
      "idiom" : "mac",
      "filename" : "app_icon_32.png",
      "scale" : "2x"
    },
    {
      "size" : "32x32",
      "idiom" : "mac",
      "filename" : "app_icon_32.png",
      "scale" : "1x"
    },
    {
      "size" : "32x32",
      "idiom" : "mac",
      "filename" : "app_icon_64.png",
      "scale" : "2x"
    },
    {
      "size" : "128x128",
      "idiom" : "mac",
      "filename" : "app_icon_128.png",
      "scale" : "1x"
    },
    {
      "size" : "128x128",
      "idiom" : "mac",
      "filename" : "app_icon_256.png",
      "scale" : "2x"
    },
    {
      "size" : "256x256",
      "idiom" : "mac",
      "filename" : "app_icon_256.png",
      "scale" : "1x"
    },
    {
      "size" : "256x256",
      "idiom" : "mac",
      "filename" : "app_icon_512.png",
      "scale" : "2x"
    },
    {
      "size" : "512x512",
      "idiom" : "mac",
      "filename" : "app_icon_512.png",
      "scale" : "1x"
    },
    {
      "size" : "512x512",
      "idiom" : "mac",
      "filename" : "app_icon_1024.png",
      "scale" : "2x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
````

## File: macos/Runner/Base.lproj/MainMenu.xib
````
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.Cocoa.XIB" version="3.0" toolsVersion="14490.70" targetRuntime="MacOSX.Cocoa" propertyAccessControl="none" useAutolayout="YES" customObjectInstantitationMethod="direct">
    <dependencies>
        <deployment identifier="macosx"/>
        <plugIn identifier="com.apple.InterfaceBuilder.CocoaPlugin" version="14490.70"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <objects>
        <customObject id="-2" userLabel="File's Owner" customClass="NSApplication">
            <connections>
                <outlet property="delegate" destination="Voe-Tx-rLC" id="GzC-gU-4Uq"/>
            </connections>
        </customObject>
        <customObject id="-1" userLabel="First Responder" customClass="FirstResponder"/>
        <customObject id="-3" userLabel="Application" customClass="NSObject"/>
        <customObject id="Voe-Tx-rLC" customClass="AppDelegate" customModule="Runner" customModuleProvider="target">
            <connections>
                <outlet property="applicationMenu" destination="uQy-DD-JDr" id="XBo-yE-nKs"/>
                <outlet property="mainFlutterWindow" destination="QvC-M9-y7g" id="gIp-Ho-8D9"/>
            </connections>
        </customObject>
        <customObject id="YLy-65-1bz" customClass="NSFontManager"/>
        <menu title="Main Menu" systemMenu="main" id="AYu-sK-qS6">
            <items>
                <menuItem title="APP_NAME" id="1Xt-HY-uBw">
                    <modifierMask key="keyEquivalentModifierMask"/>
                    <menu key="submenu" title="APP_NAME" systemMenu="apple" id="uQy-DD-JDr">
                        <items>
                            <menuItem title="About APP_NAME" id="5kV-Vb-QxS">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <connections>
                                    <action selector="orderFrontStandardAboutPanel:" target="-1" id="Exp-CZ-Vem"/>
                                </connections>
                            </menuItem>
                            <menuItem isSeparatorItem="YES" id="VOq-y0-SEH"/>
                            <menuItem title="Preferences…" keyEquivalent="," id="BOF-NM-1cW"/>
                            <menuItem isSeparatorItem="YES" id="wFC-TO-SCJ"/>
                            <menuItem title="Services" id="NMo-om-nkz">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <menu key="submenu" title="Services" systemMenu="services" id="hz9-B4-Xy5"/>
                            </menuItem>
                            <menuItem isSeparatorItem="YES" id="4je-JR-u6R"/>
                            <menuItem title="Hide APP_NAME" keyEquivalent="h" id="Olw-nP-bQN">
                                <connections>
                                    <action selector="hide:" target="-1" id="PnN-Uc-m68"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Hide Others" keyEquivalent="h" id="Vdr-fp-XzO">
                                <modifierMask key="keyEquivalentModifierMask" option="YES" command="YES"/>
                                <connections>
                                    <action selector="hideOtherApplications:" target="-1" id="VT4-aY-XCT"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Show All" id="Kd2-mp-pUS">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <connections>
                                    <action selector="unhideAllApplications:" target="-1" id="Dhg-Le-xox"/>
                                </connections>
                            </menuItem>
                            <menuItem isSeparatorItem="YES" id="kCx-OE-vgT"/>
                            <menuItem title="Quit APP_NAME" keyEquivalent="q" id="4sb-4s-VLi">
                                <connections>
                                    <action selector="terminate:" target="-1" id="Te7-pn-YzF"/>
                                </connections>
                            </menuItem>
                        </items>
                    </menu>
                </menuItem>
                <menuItem title="Edit" id="5QF-Oa-p0T">
                    <modifierMask key="keyEquivalentModifierMask"/>
                    <menu key="submenu" title="Edit" id="W48-6f-4Dl">
                        <items>
                            <menuItem title="Undo" keyEquivalent="z" id="dRJ-4n-Yzg">
                                <connections>
                                    <action selector="undo:" target="-1" id="M6e-cu-g7V"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Redo" keyEquivalent="Z" id="6dh-zS-Vam">
                                <connections>
                                    <action selector="redo:" target="-1" id="oIA-Rs-6OD"/>
                                </connections>
                            </menuItem>
                            <menuItem isSeparatorItem="YES" id="WRV-NI-Exz"/>
                            <menuItem title="Cut" keyEquivalent="x" id="uRl-iY-unG">
                                <connections>
                                    <action selector="cut:" target="-1" id="YJe-68-I9s"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Copy" keyEquivalent="c" id="x3v-GG-iWU">
                                <connections>
                                    <action selector="copy:" target="-1" id="G1f-GL-Joy"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Paste" keyEquivalent="v" id="gVA-U4-sdL">
                                <connections>
                                    <action selector="paste:" target="-1" id="UvS-8e-Qdg"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Paste and Match Style" keyEquivalent="V" id="WeT-3V-zwk">
                                <modifierMask key="keyEquivalentModifierMask" option="YES" command="YES"/>
                                <connections>
                                    <action selector="pasteAsPlainText:" target="-1" id="cEh-KX-wJQ"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Delete" id="pa3-QI-u2k">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <connections>
                                    <action selector="delete:" target="-1" id="0Mk-Ml-PaM"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Select All" keyEquivalent="a" id="Ruw-6m-B2m">
                                <connections>
                                    <action selector="selectAll:" target="-1" id="VNm-Mi-diN"/>
                                </connections>
                            </menuItem>
                            <menuItem isSeparatorItem="YES" id="uyl-h8-XO2"/>
                            <menuItem title="Find" id="4EN-yA-p0u">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <menu key="submenu" title="Find" id="1b7-l0-nxx">
                                    <items>
                                        <menuItem title="Find…" tag="1" keyEquivalent="f" id="Xz5-n4-O0W">
                                            <connections>
                                                <action selector="performFindPanelAction:" target="-1" id="cD7-Qs-BN4"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Find and Replace…" tag="12" keyEquivalent="f" id="YEy-JH-Tfz">
                                            <modifierMask key="keyEquivalentModifierMask" option="YES" command="YES"/>
                                            <connections>
                                                <action selector="performFindPanelAction:" target="-1" id="WD3-Gg-5AJ"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Find Next" tag="2" keyEquivalent="g" id="q09-fT-Sye">
                                            <connections>
                                                <action selector="performFindPanelAction:" target="-1" id="NDo-RZ-v9R"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Find Previous" tag="3" keyEquivalent="G" id="OwM-mh-QMV">
                                            <connections>
                                                <action selector="performFindPanelAction:" target="-1" id="HOh-sY-3ay"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Use Selection for Find" tag="7" keyEquivalent="e" id="buJ-ug-pKt">
                                            <connections>
                                                <action selector="performFindPanelAction:" target="-1" id="U76-nv-p5D"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Jump to Selection" keyEquivalent="j" id="S0p-oC-mLd">
                                            <connections>
                                                <action selector="centerSelectionInVisibleArea:" target="-1" id="IOG-6D-g5B"/>
                                            </connections>
                                        </menuItem>
                                    </items>
                                </menu>
                            </menuItem>
                            <menuItem title="Spelling and Grammar" id="Dv1-io-Yv7">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <menu key="submenu" title="Spelling" id="3IN-sU-3Bg">
                                    <items>
                                        <menuItem title="Show Spelling and Grammar" keyEquivalent=":" id="HFo-cy-zxI">
                                            <connections>
                                                <action selector="showGuessPanel:" target="-1" id="vFj-Ks-hy3"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Check Document Now" keyEquivalent=";" id="hz2-CU-CR7">
                                            <connections>
                                                <action selector="checkSpelling:" target="-1" id="fz7-VC-reM"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem isSeparatorItem="YES" id="bNw-od-mp5"/>
                                        <menuItem title="Check Spelling While Typing" id="rbD-Rh-wIN">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleContinuousSpellChecking:" target="-1" id="7w6-Qz-0kB"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Check Grammar With Spelling" id="mK6-2p-4JG">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleGrammarChecking:" target="-1" id="muD-Qn-j4w"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Correct Spelling Automatically" id="78Y-hA-62v">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleAutomaticSpellingCorrection:" target="-1" id="2lM-Qi-WAP"/>
                                            </connections>
                                        </menuItem>
                                    </items>
                                </menu>
                            </menuItem>
                            <menuItem title="Substitutions" id="9ic-FL-obx">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <menu key="submenu" title="Substitutions" id="FeM-D8-WVr">
                                    <items>
                                        <menuItem title="Show Substitutions" id="z6F-FW-3nz">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="orderFrontSubstitutionsPanel:" target="-1" id="oku-mr-iSq"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem isSeparatorItem="YES" id="gPx-C9-uUO"/>
                                        <menuItem title="Smart Copy/Paste" id="9yt-4B-nSM">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleSmartInsertDelete:" target="-1" id="3IJ-Se-DZD"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Smart Quotes" id="hQb-2v-fYv">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleAutomaticQuoteSubstitution:" target="-1" id="ptq-xd-QOA"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Smart Dashes" id="rgM-f4-ycn">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleAutomaticDashSubstitution:" target="-1" id="oCt-pO-9gS"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Smart Links" id="cwL-P1-jid">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleAutomaticLinkDetection:" target="-1" id="Gip-E3-Fov"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Data Detectors" id="tRr-pd-1PS">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleAutomaticDataDetection:" target="-1" id="R1I-Nq-Kbl"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Text Replacement" id="HFQ-gK-NFA">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="toggleAutomaticTextReplacement:" target="-1" id="DvP-Fe-Py6"/>
                                            </connections>
                                        </menuItem>
                                    </items>
                                </menu>
                            </menuItem>
                            <menuItem title="Transformations" id="2oI-Rn-ZJC">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <menu key="submenu" title="Transformations" id="c8a-y6-VQd">
                                    <items>
                                        <menuItem title="Make Upper Case" id="vmV-6d-7jI">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="uppercaseWord:" target="-1" id="sPh-Tk-edu"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Make Lower Case" id="d9M-CD-aMd">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="lowercaseWord:" target="-1" id="iUZ-b5-hil"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Capitalize" id="UEZ-Bs-lqG">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="capitalizeWord:" target="-1" id="26H-TL-nsh"/>
                                            </connections>
                                        </menuItem>
                                    </items>
                                </menu>
                            </menuItem>
                            <menuItem title="Speech" id="xrE-MZ-jX0">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <menu key="submenu" title="Speech" id="3rS-ZA-NoH">
                                    <items>
                                        <menuItem title="Start Speaking" id="Ynk-f8-cLZ">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="startSpeaking:" target="-1" id="654-Ng-kyl"/>
                                            </connections>
                                        </menuItem>
                                        <menuItem title="Stop Speaking" id="Oyz-dy-DGm">
                                            <modifierMask key="keyEquivalentModifierMask"/>
                                            <connections>
                                                <action selector="stopSpeaking:" target="-1" id="dX8-6p-jy9"/>
                                            </connections>
                                        </menuItem>
                                    </items>
                                </menu>
                            </menuItem>
                        </items>
                    </menu>
                </menuItem>
                <menuItem title="View" id="H8h-7b-M4v">
                    <modifierMask key="keyEquivalentModifierMask"/>
                    <menu key="submenu" title="View" id="HyV-fh-RgO">
                        <items>
                            <menuItem title="Enter Full Screen" keyEquivalent="f" id="4J7-dP-txa">
                                <modifierMask key="keyEquivalentModifierMask" control="YES" command="YES"/>
                                <connections>
                                    <action selector="toggleFullScreen:" target="-1" id="dU3-MA-1Rq"/>
                                </connections>
                            </menuItem>
                        </items>
                    </menu>
                </menuItem>
                <menuItem title="Window" id="aUF-d1-5bR">
                    <modifierMask key="keyEquivalentModifierMask"/>
                    <menu key="submenu" title="Window" systemMenu="window" id="Td7-aD-5lo">
                        <items>
                            <menuItem title="Minimize" keyEquivalent="m" id="OY7-WF-poV">
                                <connections>
                                    <action selector="performMiniaturize:" target="-1" id="VwT-WD-YPe"/>
                                </connections>
                            </menuItem>
                            <menuItem title="Zoom" id="R4o-n2-Eq4">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <connections>
                                    <action selector="performZoom:" target="-1" id="DIl-cC-cCs"/>
                                </connections>
                            </menuItem>
                            <menuItem isSeparatorItem="YES" id="eu3-7i-yIM"/>
                            <menuItem title="Bring All to Front" id="LE2-aR-0XJ">
                                <modifierMask key="keyEquivalentModifierMask"/>
                                <connections>
                                    <action selector="arrangeInFront:" target="-1" id="DRN-fu-gQh"/>
                                </connections>
                            </menuItem>
                        </items>
                    </menu>
                </menuItem>
                <menuItem title="Help" id="EPT-qC-fAb">
                    <modifierMask key="keyEquivalentModifierMask"/>
                    <menu key="submenu" title="Help" systemMenu="help" id="rJ0-wn-3NY"/>
                </menuItem>
            </items>
            <point key="canvasLocation" x="142" y="-258"/>
        </menu>
        <window title="APP_NAME" allowsToolTipsWhenApplicationIsInactive="NO" autorecalculatesKeyViewLoop="NO" releasedWhenClosed="NO" animationBehavior="default" id="QvC-M9-y7g" customClass="MainFlutterWindow" customModule="Runner" customModuleProvider="target">
            <windowStyleMask key="styleMask" titled="YES" closable="YES" miniaturizable="YES" resizable="YES"/>
            <rect key="contentRect" x="335" y="390" width="800" height="600"/>
            <rect key="screenRect" x="0.0" y="0.0" width="2560" height="1577"/>
            <view key="contentView" wantsLayer="YES" id="EiT-Mj-1SZ">
                <rect key="frame" x="0.0" y="0.0" width="800" height="600"/>
                <autoresizingMask key="autoresizingMask"/>
            </view>
        </window>
    </objects>
</document>
````

## File: macos/Runner/Configs/AppInfo.xcconfig
````
// Application-level settings for the Runner target.
//
// This may be replaced with something auto-generated from metadata (e.g., pubspec.yaml) in the
// future. If not, the values below would default to using the project name when this becomes a
// 'flutter create' template.

// The application's name. By default this is also the title of the Flutter window.
PRODUCT_NAME = aiservice

// The application's bundle identifier
PRODUCT_BUNDLE_IDENTIFIER = com.example.aiservice

// The copyright displayed in application information
PRODUCT_COPYRIGHT = Copyright © 2026 com.example. All rights reserved.
````

## File: macos/Runner/Configs/Debug.xcconfig
````
#include "../../Flutter/Flutter-Debug.xcconfig"
#include "Warnings.xcconfig"
````

## File: macos/Runner/Configs/Release.xcconfig
````
#include "../../Flutter/Flutter-Release.xcconfig"
#include "Warnings.xcconfig"
````

## File: macos/Runner/Configs/Warnings.xcconfig
````
WARNING_CFLAGS = -Wall -Wconditional-uninitialized -Wnullable-to-nonnull-conversion -Wmissing-method-return-type -Woverlength-strings
GCC_WARN_UNDECLARED_SELECTOR = YES
CLANG_UNDEFINED_BEHAVIOR_SANITIZER_NULLABILITY = YES
CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE
CLANG_WARN__DUPLICATE_METHOD_MATCH = YES
CLANG_WARN_PRAGMA_PACK = YES
CLANG_WARN_STRICT_PROTOTYPES = YES
CLANG_WARN_COMMA = YES
GCC_WARN_STRICT_SELECTOR_MATCH = YES
CLANG_WARN_OBJC_REPEATED_USE_OF_WEAK = YES
CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES
GCC_WARN_SHADOW = YES
CLANG_WARN_UNREACHABLE_CODE = YES
````

## File: macos/Runner/DebugProfile.entitlements
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.security.app-sandbox</key>
	<true/>
	<key>com.apple.security.cs.allow-jit</key>
	<true/>
	<key>com.apple.security.network.server</key>
	<true/>
</dict>
</plist>
````

## File: macos/Runner/Info.plist
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>$(DEVELOPMENT_LANGUAGE)</string>
	<key>CFBundleExecutable</key>
	<string>$(EXECUTABLE_NAME)</string>
	<key>CFBundleIconFile</key>
	<string></string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$(PRODUCT_NAME)</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>$(FLUTTER_BUILD_NAME)</string>
	<key>CFBundleVersion</key>
	<string>$(FLUTTER_BUILD_NUMBER)</string>
	<key>LSMinimumSystemVersion</key>
	<string>$(MACOSX_DEPLOYMENT_TARGET)</string>
	<key>NSHumanReadableCopyright</key>
	<string>$(PRODUCT_COPYRIGHT)</string>
	<key>NSMainNibFile</key>
	<string>MainMenu</string>
	<key>NSPrincipalClass</key>
	<string>NSApplication</string>
</dict>
</plist>
````

## File: macos/Runner/MainFlutterWindow.swift
````swift
import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
````

## File: macos/Runner/Release.entitlements
````
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.security.app-sandbox</key>
	<true/>
</dict>
</plist>
````

## File: macos/RunnerTests/RunnerTests.swift
````swift
import Cocoa
import FlutterMacOS
import XCTest

class RunnerTests: XCTestCase {

  func testExample() {
    // If you add code to the Runner application, consider adding tests here.
    // See https://developer.apple.com/documentation/xctest for more information about using XCTest.
  }

}
````

## File: README.md
````markdown
# aiservice

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
````

## File: web/index.html
````html
<!DOCTYPE html>
<html>
<head>
  <!--
    If you are serving your web app in a path other than the root, change the
    href value below to reflect the base path you are serving from.

    The path provided below has to start and end with a slash "/" in order for
    it to work correctly.

    For more details:
    * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base

    This is a placeholder for base href that will be replaced by the value of
    the `--base-href` argument provided to `flutter build`.
  -->
  <base href="$FLUTTER_BASE_HREF">

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="A new Flutter project.">

  <!-- iOS meta tags & icons -->
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="aiservice">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="favicon.png"/>

  <title>aiservice</title>
  <link rel="manifest" href="manifest.json">
</head>
<body>
  <!--
    You can customize the "flutter_bootstrap.js" script.
    This is useful to provide a custom configuration to the Flutter loader
    or to give the user feedback during the initialization process.

    For more details:
    * https://docs.flutter.dev/platform-integration/web/initialization
  -->
  <script src="flutter_bootstrap.js" async></script>
</body>
</html>
````

## File: web/manifest.json
````json
{
    "name": "aiservice",
    "short_name": "aiservice",
    "start_url": ".",
    "display": "standalone",
    "background_color": "#0175C2",
    "theme_color": "#0175C2",
    "description": "A new Flutter project.",
    "orientation": "portrait-primary",
    "prefer_related_applications": false,
    "icons": [
        {
            "src": "icons/Icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-512.png",
            "sizes": "512x512",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-maskable-192.png",
            "sizes": "192x192",
            "type": "image/png",
            "purpose": "maskable"
        },
        {
            "src": "icons/Icon-maskable-512.png",
            "sizes": "512x512",
            "type": "image/png",
            "purpose": "maskable"
        }
    ]
}
````

## File: windows/.gitignore
````
flutter/ephemeral/

# Visual Studio user-specific files.
*.suo
*.user
*.userosscache
*.sln.docstates

# Visual Studio build-related files.
x64/
x86/

# Visual Studio cache files
# files ending in .cache can be ignored
*.[Cc]ache
# but keep track of directories ending in .cache
!*.[Cc]ache/
````

## File: windows/CMakeLists.txt
````
# Project-level configuration.
cmake_minimum_required(VERSION 3.14)
project(aiservice LANGUAGES CXX)

# The name of the executable created for the application. Change this to change
# the on-disk name of your application.
set(BINARY_NAME "aiservice")

# Explicitly opt in to modern CMake behaviors to avoid warnings with recent
# versions of CMake.
cmake_policy(VERSION 3.14...3.25)

# Define build configuration option.
get_property(IS_MULTICONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(IS_MULTICONFIG)
  set(CMAKE_CONFIGURATION_TYPES "Debug;Profile;Release"
    CACHE STRING "" FORCE)
else()
  if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE "Debug" CACHE
      STRING "Flutter build mode" FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
      "Debug" "Profile" "Release")
  endif()
endif()
# Define settings for the Profile build mode.
set(CMAKE_EXE_LINKER_FLAGS_PROFILE "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
set(CMAKE_SHARED_LINKER_FLAGS_PROFILE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
set(CMAKE_C_FLAGS_PROFILE "${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_RELEASE}")

# Use Unicode for all projects.
add_definitions(-DUNICODE -D_UNICODE)

# Compilation settings that should be applied to most targets.
#
# Be cautious about adding new options here, as plugins use this function by
# default. In most cases, you should add new options to specific targets instead
# of modifying this function.
function(APPLY_STANDARD_SETTINGS TARGET)
  target_compile_features(${TARGET} PUBLIC cxx_std_17)
  target_compile_options(${TARGET} PRIVATE /W4 /WX /wd"4100")
  target_compile_options(${TARGET} PRIVATE /EHsc)
  target_compile_definitions(${TARGET} PRIVATE "_HAS_EXCEPTIONS=0")
  target_compile_definitions(${TARGET} PRIVATE "$<$<CONFIG:Debug>:_DEBUG>")
endfunction()

# Flutter library and tool build rules.
set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
add_subdirectory(${FLUTTER_MANAGED_DIR})

# Application build; see runner/CMakeLists.txt.
add_subdirectory("runner")


# Generated plugin build rules, which manage building the plugins and adding
# them to the application.
include(flutter/generated_plugins.cmake)


# === Installation ===
# Support files are copied into place next to the executable, so that it can
# run in place. This is done instead of making a separate bundle (as on Linux)
# so that building and running from within Visual Studio will work.
set(BUILD_BUNDLE_DIR "$<TARGET_FILE_DIR:${BINARY_NAME}>")
# Make the "install" step default, as it's required to run.
set(CMAKE_VS_INCLUDE_INSTALL_TO_DEFAULT_BUILD 1)
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${BUILD_BUNDLE_DIR}" CACHE PATH "..." FORCE)
endif()

set(INSTALL_BUNDLE_DATA_DIR "${CMAKE_INSTALL_PREFIX}/data")
set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}")

install(TARGETS ${BINARY_NAME} RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_ICU_DATA_FILE}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
  COMPONENT Runtime)

if(PLUGIN_BUNDLED_LIBRARIES)
  install(FILES "${PLUGIN_BUNDLED_LIBRARIES}"
    DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
endif()

# Copy the native assets provided by the build.dart from all packages.
set(NATIVE_ASSETS_DIR "${PROJECT_BUILD_DIR}native_assets/windows/")
install(DIRECTORY "${NATIVE_ASSETS_DIR}"
   DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
   COMPONENT Runtime)

# Fully re-copy the assets directory on each build to avoid having stale files
# from a previous install.
set(FLUTTER_ASSET_DIR_NAME "flutter_assets")
install(CODE "
  file(REMOVE_RECURSE \"${INSTALL_BUNDLE_DATA_DIR}/${FLUTTER_ASSET_DIR_NAME}\")
  " COMPONENT Runtime)
install(DIRECTORY "${PROJECT_BUILD_DIR}/${FLUTTER_ASSET_DIR_NAME}"
  DESTINATION "${INSTALL_BUNDLE_DATA_DIR}" COMPONENT Runtime)

# Install the AOT library on non-Debug builds only.
install(FILES "${AOT_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  CONFIGURATIONS Profile;Release
  COMPONENT Runtime)
````

## File: windows/flutter/CMakeLists.txt
````
# This file controls Flutter-level build steps. It should not be edited.
cmake_minimum_required(VERSION 3.14)

set(EPHEMERAL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ephemeral")

# Configuration provided via flutter tool.
include(${EPHEMERAL_DIR}/generated_config.cmake)

# TODO: Move the rest of this into files in ephemeral. See
# https://github.com/flutter/flutter/issues/57146.
set(WRAPPER_ROOT "${EPHEMERAL_DIR}/cpp_client_wrapper")

# Set fallback configurations for older versions of the flutter tool.
if (NOT DEFINED FLUTTER_TARGET_PLATFORM)
  set(FLUTTER_TARGET_PLATFORM "windows-x64")
endif()

# === Flutter Library ===
set(FLUTTER_LIBRARY "${EPHEMERAL_DIR}/flutter_windows.dll")

# Published to parent scope for install step.
set(FLUTTER_LIBRARY ${FLUTTER_LIBRARY} PARENT_SCOPE)
set(FLUTTER_ICU_DATA_FILE "${EPHEMERAL_DIR}/icudtl.dat" PARENT_SCOPE)
set(PROJECT_BUILD_DIR "${PROJECT_DIR}/build/" PARENT_SCOPE)
set(AOT_LIBRARY "${PROJECT_DIR}/build/windows/app.so" PARENT_SCOPE)

list(APPEND FLUTTER_LIBRARY_HEADERS
  "flutter_export.h"
  "flutter_windows.h"
  "flutter_messenger.h"
  "flutter_plugin_registrar.h"
  "flutter_texture_registrar.h"
)
list(TRANSFORM FLUTTER_LIBRARY_HEADERS PREPEND "${EPHEMERAL_DIR}/")
add_library(flutter INTERFACE)
target_include_directories(flutter INTERFACE
  "${EPHEMERAL_DIR}"
)
target_link_libraries(flutter INTERFACE "${FLUTTER_LIBRARY}.lib")
add_dependencies(flutter flutter_assemble)

# === Wrapper ===
list(APPEND CPP_WRAPPER_SOURCES_CORE
  "core_implementations.cc"
  "standard_codec.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_CORE PREPEND "${WRAPPER_ROOT}/")
list(APPEND CPP_WRAPPER_SOURCES_PLUGIN
  "plugin_registrar.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_PLUGIN PREPEND "${WRAPPER_ROOT}/")
list(APPEND CPP_WRAPPER_SOURCES_APP
  "flutter_engine.cc"
  "flutter_view_controller.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_APP PREPEND "${WRAPPER_ROOT}/")

# Wrapper sources needed for a plugin.
add_library(flutter_wrapper_plugin STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_PLUGIN}
)
apply_standard_settings(flutter_wrapper_plugin)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  POSITION_INDEPENDENT_CODE ON)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_link_libraries(flutter_wrapper_plugin PUBLIC flutter)
target_include_directories(flutter_wrapper_plugin PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_plugin flutter_assemble)

# Wrapper sources needed for the runner.
add_library(flutter_wrapper_app STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_APP}
)
apply_standard_settings(flutter_wrapper_app)
target_link_libraries(flutter_wrapper_app PUBLIC flutter)
target_include_directories(flutter_wrapper_app PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_app flutter_assemble)

# === Flutter tool backend ===
# _phony_ is a non-existent file to force this command to run every time,
# since currently there's no way to get a full input/output list from the
# flutter tool.
set(PHONY_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/_phony_")
set_source_files_properties("${PHONY_OUTPUT}" PROPERTIES SYMBOLIC TRUE)
add_custom_command(
  OUTPUT ${FLUTTER_LIBRARY} ${FLUTTER_LIBRARY_HEADERS}
    ${CPP_WRAPPER_SOURCES_CORE} ${CPP_WRAPPER_SOURCES_PLUGIN}
    ${CPP_WRAPPER_SOURCES_APP}
    ${PHONY_OUTPUT}
  COMMAND ${CMAKE_COMMAND} -E env
    ${FLUTTER_TOOL_ENVIRONMENT}
    "${FLUTTER_ROOT}/packages/flutter_tools/bin/tool_backend.bat"
      ${FLUTTER_TARGET_PLATFORM} $<CONFIG>
  VERBATIM
)
add_custom_target(flutter_assemble DEPENDS
  "${FLUTTER_LIBRARY}"
  ${FLUTTER_LIBRARY_HEADERS}
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_PLUGIN}
  ${CPP_WRAPPER_SOURCES_APP}
)
````

## File: windows/flutter/generated_plugin_registrant.h
````c
//
//  Generated file. Do not edit.
//

// clang-format off

#ifndef GENERATED_PLUGIN_REGISTRANT_
#define GENERATED_PLUGIN_REGISTRANT_

#include <flutter/plugin_registry.h>

// Registers Flutter plugins.
void RegisterPlugins(flutter::PluginRegistry* registry);

#endif  // GENERATED_PLUGIN_REGISTRANT_
````

## File: windows/runner/CMakeLists.txt
````
cmake_minimum_required(VERSION 3.14)
project(runner LANGUAGES CXX)

# Define the application target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the application should be added here.
add_executable(${BINARY_NAME} WIN32
  "flutter_window.cpp"
  "main.cpp"
  "utils.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
  "Runner.rc"
  "runner.exe.manifest"
)

# Apply the standard set of build settings. This can be removed for applications
# that need different build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions for the build version.
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION=\"${FLUTTER_VERSION}\"")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MAJOR=${FLUTTER_VERSION_MAJOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MINOR=${FLUTTER_VERSION_MINOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_PATCH=${FLUTTER_VERSION_PATCH}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_BUILD=${FLUTTER_VERSION_BUILD}")

# Disable Windows macros that collide with C++ standard library functions.
target_compile_definitions(${BINARY_NAME} PRIVATE "NOMINMAX")

# Add dependency libraries and include directories. Add any application-specific
# dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter flutter_wrapper_app)
target_link_libraries(${BINARY_NAME} PRIVATE "dwmapi.lib")
target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")

# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)
````

## File: windows/runner/flutter_window.cpp
````cpp
#include "flutter_window.h"

#include <optional>

#include "flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
````

## File: windows/runner/flutter_window.h
````c
#ifndef RUNNER_FLUTTER_WINDOW_H_
#define RUNNER_FLUTTER_WINDOW_H_

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>

#include <memory>

#include "win32_window.h"

// A window that does nothing but host a Flutter view.
class FlutterWindow : public Win32Window {
 public:
  // Creates a new FlutterWindow hosting a Flutter view running |project|.
  explicit FlutterWindow(const flutter::DartProject& project);
  virtual ~FlutterWindow();

 protected:
  // Win32Window:
  bool OnCreate() override;
  void OnDestroy() override;
  LRESULT MessageHandler(HWND window, UINT const message, WPARAM const wparam,
                         LPARAM const lparam) noexcept override;

 private:
  // The project to run.
  flutter::DartProject project_;

  // The Flutter instance hosted by this window.
  std::unique_ptr<flutter::FlutterViewController> flutter_controller_;
};

#endif  // RUNNER_FLUTTER_WINDOW_H_
````

## File: windows/runner/main.cpp
````cpp
#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include "flutter_window.h"
#include "utils.h"

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.Create(L"aiservice", origin, size)) {
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
````

## File: windows/runner/resource.h
````c
//{{NO_DEPENDENCIES}}
// Microsoft Visual C++ generated include file.
// Used by Runner.rc
//
#define IDI_APP_ICON                    101

// Next default values for new objects
//
#ifdef APSTUDIO_INVOKED
#ifndef APSTUDIO_READONLY_SYMBOLS
#define _APS_NEXT_RESOURCE_VALUE        102
#define _APS_NEXT_COMMAND_VALUE         40001
#define _APS_NEXT_CONTROL_VALUE         1001
#define _APS_NEXT_SYMED_VALUE           101
#endif
#endif
````

## File: windows/runner/runner.exe.manifest
````
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
  <application xmlns="urn:schemas-microsoft-com:asm.v3">
    <windowsSettings>
      <dpiAwareness xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">PerMonitorV2</dpiAwareness>
    </windowsSettings>
  </application>
  <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1">
    <application>
      <!-- Windows 10 and Windows 11 -->
      <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}"/>
    </application>
  </compatibility>
</assembly>
````

## File: windows/runner/Runner.rc
````
// Microsoft Visual C++ generated resource script.
//
#pragma code_page(65001)
#include "resource.h"

#define APSTUDIO_READONLY_SYMBOLS
/////////////////////////////////////////////////////////////////////////////
//
// Generated from the TEXTINCLUDE 2 resource.
//
#include "winres.h"

/////////////////////////////////////////////////////////////////////////////
#undef APSTUDIO_READONLY_SYMBOLS

/////////////////////////////////////////////////////////////////////////////
// English (United States) resources

#if !defined(AFX_RESOURCE_DLL) || defined(AFX_TARG_ENU)
LANGUAGE LANG_ENGLISH, SUBLANG_ENGLISH_US

#ifdef APSTUDIO_INVOKED
/////////////////////////////////////////////////////////////////////////////
//
// TEXTINCLUDE
//

1 TEXTINCLUDE
BEGIN
    "resource.h\0"
END

2 TEXTINCLUDE
BEGIN
    "#include ""winres.h""\r\n"
    "\0"
END

3 TEXTINCLUDE
BEGIN
    "\r\n"
    "\0"
END

#endif    // APSTUDIO_INVOKED


/////////////////////////////////////////////////////////////////////////////
//
// Icon
//

// Icon with lowest ID value placed first to ensure application icon
// remains consistent on all systems.
IDI_APP_ICON            ICON                    "resources\\app_icon.ico"


/////////////////////////////////////////////////////////////////////////////
//
// Version
//

#if defined(FLUTTER_VERSION_MAJOR) && defined(FLUTTER_VERSION_MINOR) && defined(FLUTTER_VERSION_PATCH) && defined(FLUTTER_VERSION_BUILD)
#define VERSION_AS_NUMBER FLUTTER_VERSION_MAJOR,FLUTTER_VERSION_MINOR,FLUTTER_VERSION_PATCH,FLUTTER_VERSION_BUILD
#else
#define VERSION_AS_NUMBER 1,0,0,0
#endif

#if defined(FLUTTER_VERSION)
#define VERSION_AS_STRING FLUTTER_VERSION
#else
#define VERSION_AS_STRING "1.0.0"
#endif

VS_VERSION_INFO VERSIONINFO
 FILEVERSION VERSION_AS_NUMBER
 PRODUCTVERSION VERSION_AS_NUMBER
 FILEFLAGSMASK VS_FFI_FILEFLAGSMASK
#ifdef _DEBUG
 FILEFLAGS VS_FF_DEBUG
#else
 FILEFLAGS 0x0L
#endif
 FILEOS VOS__WINDOWS32
 FILETYPE VFT_APP
 FILESUBTYPE 0x0L
BEGIN
    BLOCK "StringFileInfo"
    BEGIN
        BLOCK "040904e4"
        BEGIN
            VALUE "CompanyName", "com.example" "\0"
            VALUE "FileDescription", "aiservice" "\0"
            VALUE "FileVersion", VERSION_AS_STRING "\0"
            VALUE "InternalName", "aiservice" "\0"
            VALUE "LegalCopyright", "Copyright (C) 2026 com.example. All rights reserved." "\0"
            VALUE "OriginalFilename", "aiservice.exe" "\0"
            VALUE "ProductName", "aiservice" "\0"
            VALUE "ProductVersion", VERSION_AS_STRING "\0"
        END
    END
    BLOCK "VarFileInfo"
    BEGIN
        VALUE "Translation", 0x409, 1252
    END
END

#endif    // English (United States) resources
/////////////////////////////////////////////////////////////////////////////



#ifndef APSTUDIO_INVOKED
/////////////////////////////////////////////////////////////////////////////
//
// Generated from the TEXTINCLUDE 3 resource.
//


/////////////////////////////////////////////////////////////////////////////
#endif    // not APSTUDIO_INVOKED
````

## File: windows/runner/utils.cpp
````cpp
#include "utils.h"

#include <flutter_windows.h>
#include <io.h>
#include <stdio.h>
#include <windows.h>

#include <iostream>

void CreateAndAttachConsole() {
  if (::AllocConsole()) {
    FILE *unused;
    if (freopen_s(&unused, "CONOUT$", "w", stdout)) {
      _dup2(_fileno(stdout), 1);
    }
    if (freopen_s(&unused, "CONOUT$", "w", stderr)) {
      _dup2(_fileno(stdout), 2);
    }
    std::ios::sync_with_stdio();
    FlutterDesktopResyncOutputStreams();
  }
}

std::vector<std::string> GetCommandLineArguments() {
  // Convert the UTF-16 command line arguments to UTF-8 for the Engine to use.
  int argc;
  wchar_t** argv = ::CommandLineToArgvW(::GetCommandLineW(), &argc);
  if (argv == nullptr) {
    return std::vector<std::string>();
  }

  std::vector<std::string> command_line_arguments;

  // Skip the first argument as it's the binary name.
  for (int i = 1; i < argc; i++) {
    command_line_arguments.push_back(Utf8FromUtf16(argv[i]));
  }

  ::LocalFree(argv);

  return command_line_arguments;
}

std::string Utf8FromUtf16(const wchar_t* utf16_string) {
  if (utf16_string == nullptr) {
    return std::string();
  }
  unsigned int target_length = ::WideCharToMultiByte(
      CP_UTF8, WC_ERR_INVALID_CHARS, utf16_string,
      -1, nullptr, 0, nullptr, nullptr)
    -1; // remove the trailing null character
  int input_length = (int)wcslen(utf16_string);
  std::string utf8_string;
  if (target_length == 0 || target_length > utf8_string.max_size()) {
    return utf8_string;
  }
  utf8_string.resize(target_length);
  int converted_length = ::WideCharToMultiByte(
      CP_UTF8, WC_ERR_INVALID_CHARS, utf16_string,
      input_length, utf8_string.data(), target_length, nullptr, nullptr);
  if (converted_length == 0) {
    return std::string();
  }
  return utf8_string;
}
````

## File: windows/runner/utils.h
````c
#ifndef RUNNER_UTILS_H_
#define RUNNER_UTILS_H_

#include <string>
#include <vector>

// Creates a console for the process, and redirects stdout and stderr to
// it for both the runner and the Flutter library.
void CreateAndAttachConsole();

// Takes a null-terminated wchar_t* encoded in UTF-16 and returns a std::string
// encoded in UTF-8. Returns an empty std::string on failure.
std::string Utf8FromUtf16(const wchar_t* utf16_string);

// Gets the command line arguments passed in as a std::vector<std::string>,
// encoded in UTF-8. Returns an empty std::vector<std::string> on failure.
std::vector<std::string> GetCommandLineArguments();

#endif  // RUNNER_UTILS_H_
````

## File: windows/runner/win32_window.cpp
````cpp
#include "win32_window.h"

#include <dwmapi.h>
#include <flutter_windows.h>

#include "resource.h"

namespace {

/// Window attribute that enables dark mode window decorations.
///
/// Redefined in case the developer's machine has a Windows SDK older than
/// version 10.0.22000.0.
/// See: https://docs.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwmwindowattribute
#ifndef DWMWA_USE_IMMERSIVE_DARK_MODE
#define DWMWA_USE_IMMERSIVE_DARK_MODE 20
#endif

constexpr const wchar_t kWindowClassName[] = L"FLUTTER_RUNNER_WIN32_WINDOW";

/// Registry key for app theme preference.
///
/// A value of 0 indicates apps should use dark mode. A non-zero or missing
/// value indicates apps should use light mode.
constexpr const wchar_t kGetPreferredBrightnessRegKey[] =
  L"Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize";
constexpr const wchar_t kGetPreferredBrightnessRegValue[] = L"AppsUseLightTheme";

// The number of Win32Window objects that currently exist.
static int g_active_window_count = 0;

using EnableNonClientDpiScaling = BOOL __stdcall(HWND hwnd);

// Scale helper to convert logical scaler values to physical using passed in
// scale factor
int Scale(int source, double scale_factor) {
  return static_cast<int>(source * scale_factor);
}

// Dynamically loads the |EnableNonClientDpiScaling| from the User32 module.
// This API is only needed for PerMonitor V1 awareness mode.
void EnableFullDpiSupportIfAvailable(HWND hwnd) {
  HMODULE user32_module = LoadLibraryA("User32.dll");
  if (!user32_module) {
    return;
  }
  auto enable_non_client_dpi_scaling =
      reinterpret_cast<EnableNonClientDpiScaling*>(
          GetProcAddress(user32_module, "EnableNonClientDpiScaling"));
  if (enable_non_client_dpi_scaling != nullptr) {
    enable_non_client_dpi_scaling(hwnd);
  }
  FreeLibrary(user32_module);
}

}  // namespace

// Manages the Win32Window's window class registration.
class WindowClassRegistrar {
 public:
  ~WindowClassRegistrar() = default;

  // Returns the singleton registrar instance.
  static WindowClassRegistrar* GetInstance() {
    if (!instance_) {
      instance_ = new WindowClassRegistrar();
    }
    return instance_;
  }

  // Returns the name of the window class, registering the class if it hasn't
  // previously been registered.
  const wchar_t* GetWindowClass();

  // Unregisters the window class. Should only be called if there are no
  // instances of the window.
  void UnregisterWindowClass();

 private:
  WindowClassRegistrar() = default;

  static WindowClassRegistrar* instance_;

  bool class_registered_ = false;
};

WindowClassRegistrar* WindowClassRegistrar::instance_ = nullptr;

const wchar_t* WindowClassRegistrar::GetWindowClass() {
  if (!class_registered_) {
    WNDCLASS window_class{};
    window_class.hCursor = LoadCursor(nullptr, IDC_ARROW);
    window_class.lpszClassName = kWindowClassName;
    window_class.style = CS_HREDRAW | CS_VREDRAW;
    window_class.cbClsExtra = 0;
    window_class.cbWndExtra = 0;
    window_class.hInstance = GetModuleHandle(nullptr);
    window_class.hIcon =
        LoadIcon(window_class.hInstance, MAKEINTRESOURCE(IDI_APP_ICON));
    window_class.hbrBackground = 0;
    window_class.lpszMenuName = nullptr;
    window_class.lpfnWndProc = Win32Window::WndProc;
    RegisterClass(&window_class);
    class_registered_ = true;
  }
  return kWindowClassName;
}

void WindowClassRegistrar::UnregisterWindowClass() {
  UnregisterClass(kWindowClassName, nullptr);
  class_registered_ = false;
}

Win32Window::Win32Window() {
  ++g_active_window_count;
}

Win32Window::~Win32Window() {
  --g_active_window_count;
  Destroy();
}

bool Win32Window::Create(const std::wstring& title,
                         const Point& origin,
                         const Size& size) {
  Destroy();

  const wchar_t* window_class =
      WindowClassRegistrar::GetInstance()->GetWindowClass();

  const POINT target_point = {static_cast<LONG>(origin.x),
                              static_cast<LONG>(origin.y)};
  HMONITOR monitor = MonitorFromPoint(target_point, MONITOR_DEFAULTTONEAREST);
  UINT dpi = FlutterDesktopGetDpiForMonitor(monitor);
  double scale_factor = dpi / 96.0;

  HWND window = CreateWindow(
      window_class, title.c_str(), WS_OVERLAPPEDWINDOW,
      Scale(origin.x, scale_factor), Scale(origin.y, scale_factor),
      Scale(size.width, scale_factor), Scale(size.height, scale_factor),
      nullptr, nullptr, GetModuleHandle(nullptr), this);

  if (!window) {
    return false;
  }

  UpdateTheme(window);

  return OnCreate();
}

bool Win32Window::Show() {
  return ShowWindow(window_handle_, SW_SHOWNORMAL);
}

// static
LRESULT CALLBACK Win32Window::WndProc(HWND const window,
                                      UINT const message,
                                      WPARAM const wparam,
                                      LPARAM const lparam) noexcept {
  if (message == WM_NCCREATE) {
    auto window_struct = reinterpret_cast<CREATESTRUCT*>(lparam);
    SetWindowLongPtr(window, GWLP_USERDATA,
                     reinterpret_cast<LONG_PTR>(window_struct->lpCreateParams));

    auto that = static_cast<Win32Window*>(window_struct->lpCreateParams);
    EnableFullDpiSupportIfAvailable(window);
    that->window_handle_ = window;
  } else if (Win32Window* that = GetThisFromHandle(window)) {
    return that->MessageHandler(window, message, wparam, lparam);
  }

  return DefWindowProc(window, message, wparam, lparam);
}

LRESULT
Win32Window::MessageHandler(HWND hwnd,
                            UINT const message,
                            WPARAM const wparam,
                            LPARAM const lparam) noexcept {
  switch (message) {
    case WM_DESTROY:
      window_handle_ = nullptr;
      Destroy();
      if (quit_on_close_) {
        PostQuitMessage(0);
      }
      return 0;

    case WM_DPICHANGED: {
      auto newRectSize = reinterpret_cast<RECT*>(lparam);
      LONG newWidth = newRectSize->right - newRectSize->left;
      LONG newHeight = newRectSize->bottom - newRectSize->top;

      SetWindowPos(hwnd, nullptr, newRectSize->left, newRectSize->top, newWidth,
                   newHeight, SWP_NOZORDER | SWP_NOACTIVATE);

      return 0;
    }
    case WM_SIZE: {
      RECT rect = GetClientArea();
      if (child_content_ != nullptr) {
        // Size and position the child window.
        MoveWindow(child_content_, rect.left, rect.top, rect.right - rect.left,
                   rect.bottom - rect.top, TRUE);
      }
      return 0;
    }

    case WM_ACTIVATE:
      if (child_content_ != nullptr) {
        SetFocus(child_content_);
      }
      return 0;

    case WM_DWMCOLORIZATIONCOLORCHANGED:
      UpdateTheme(hwnd);
      return 0;
  }

  return DefWindowProc(window_handle_, message, wparam, lparam);
}

void Win32Window::Destroy() {
  OnDestroy();

  if (window_handle_) {
    DestroyWindow(window_handle_);
    window_handle_ = nullptr;
  }
  if (g_active_window_count == 0) {
    WindowClassRegistrar::GetInstance()->UnregisterWindowClass();
  }
}

Win32Window* Win32Window::GetThisFromHandle(HWND const window) noexcept {
  return reinterpret_cast<Win32Window*>(
      GetWindowLongPtr(window, GWLP_USERDATA));
}

void Win32Window::SetChildContent(HWND content) {
  child_content_ = content;
  SetParent(content, window_handle_);
  RECT frame = GetClientArea();

  MoveWindow(content, frame.left, frame.top, frame.right - frame.left,
             frame.bottom - frame.top, true);

  SetFocus(child_content_);
}

RECT Win32Window::GetClientArea() {
  RECT frame;
  GetClientRect(window_handle_, &frame);
  return frame;
}

HWND Win32Window::GetHandle() {
  return window_handle_;
}

void Win32Window::SetQuitOnClose(bool quit_on_close) {
  quit_on_close_ = quit_on_close;
}

bool Win32Window::OnCreate() {
  // No-op; provided for subclasses.
  return true;
}

void Win32Window::OnDestroy() {
  // No-op; provided for subclasses.
}

void Win32Window::UpdateTheme(HWND const window) {
  DWORD light_mode;
  DWORD light_mode_size = sizeof(light_mode);
  LSTATUS result = RegGetValue(HKEY_CURRENT_USER, kGetPreferredBrightnessRegKey,
                               kGetPreferredBrightnessRegValue,
                               RRF_RT_REG_DWORD, nullptr, &light_mode,
                               &light_mode_size);

  if (result == ERROR_SUCCESS) {
    BOOL enable_dark_mode = light_mode == 0;
    DwmSetWindowAttribute(window, DWMWA_USE_IMMERSIVE_DARK_MODE,
                          &enable_dark_mode, sizeof(enable_dark_mode));
  }
}
````

## File: windows/runner/win32_window.h
````c
#ifndef RUNNER_WIN32_WINDOW_H_
#define RUNNER_WIN32_WINDOW_H_

#include <windows.h>

#include <functional>
#include <memory>
#include <string>

// A class abstraction for a high DPI-aware Win32 Window. Intended to be
// inherited from by classes that wish to specialize with custom
// rendering and input handling
class Win32Window {
 public:
  struct Point {
    unsigned int x;
    unsigned int y;
    Point(unsigned int x, unsigned int y) : x(x), y(y) {}
  };

  struct Size {
    unsigned int width;
    unsigned int height;
    Size(unsigned int width, unsigned int height)
        : width(width), height(height) {}
  };

  Win32Window();
  virtual ~Win32Window();

  // Creates a win32 window with |title| that is positioned and sized using
  // |origin| and |size|. New windows are created on the default monitor. Window
  // sizes are specified to the OS in physical pixels, hence to ensure a
  // consistent size this function will scale the inputted width and height as
  // as appropriate for the default monitor. The window is invisible until
  // |Show| is called. Returns true if the window was created successfully.
  bool Create(const std::wstring& title, const Point& origin, const Size& size);

  // Show the current window. Returns true if the window was successfully shown.
  bool Show();

  // Release OS resources associated with window.
  void Destroy();

  // Inserts |content| into the window tree.
  void SetChildContent(HWND content);

  // Returns the backing Window handle to enable clients to set icon and other
  // window properties. Returns nullptr if the window has been destroyed.
  HWND GetHandle();

  // If true, closing this window will quit the application.
  void SetQuitOnClose(bool quit_on_close);

  // Return a RECT representing the bounds of the current client area.
  RECT GetClientArea();

 protected:
  // Processes and route salient window messages for mouse handling,
  // size change and DPI. Delegates handling of these to member overloads that
  // inheriting classes can handle.
  virtual LRESULT MessageHandler(HWND window,
                                 UINT const message,
                                 WPARAM const wparam,
                                 LPARAM const lparam) noexcept;

  // Called when CreateAndShow is called, allowing subclass window-related
  // setup. Subclasses should return false if setup fails.
  virtual bool OnCreate();

  // Called when Destroy is called.
  virtual void OnDestroy();

 private:
  friend class WindowClassRegistrar;

  // OS callback called by message pump. Handles the WM_NCCREATE message which
  // is passed when the non-client area is being created and enables automatic
  // non-client DPI scaling so that the non-client area automatically
  // responds to changes in DPI. All other messages are handled by
  // MessageHandler.
  static LRESULT CALLBACK WndProc(HWND const window,
                                  UINT const message,
                                  WPARAM const wparam,
                                  LPARAM const lparam) noexcept;

  // Retrieves a class instance pointer for |window|
  static Win32Window* GetThisFromHandle(HWND const window) noexcept;

  // Update the window frame's theme to match the system theme.
  static void UpdateTheme(HWND const window);

  bool quit_on_close_ = false;

  // window handle for top level window.
  HWND window_handle_ = nullptr;

  // window handle for hosted content.
  HWND child_content_ = nullptr;
};

#endif  // RUNNER_WIN32_WINDOW_H_
````

## File: lib/data/data_sources/api_builders/api_request_builder.dart
````dart
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ApiUriUtils {
  static Uri buildNormalizedUri(String base, String path) {
    final normalizedBase = base.trim().replaceAll(RegExp(r'/+$'), '');
    final normalizedPath = path.trim().replaceAll(RegExp(r'^/+'), '');
    return Uri.parse('$normalizedBase/$normalizedPath');
  }
}

/// 构建请求所需的上下文
class ApiBuildContext {
  final String model;
  final List<ApiMessage> context;
  final bool enableReasoning;
  final String apiKey;
  final String baseUrl;
  final String chatPath;
  final String modelsPath;

  ApiBuildContext({
    required this.model,
    required this.context,
    required this.enableReasoning,
    required this.apiKey,
    required this.baseUrl,
    required this.chatPath,
    required this.modelsPath,
  });
}

/// API 请求构建器接口
abstract class ApiRequestBuilder {
  /// 构建请求 Headers
  Map<String, String> buildHeaders(ApiBuildContext ctx);

  /// 构建请求 URI
  Uri buildUri(ApiBuildContext ctx);
  Uri buildModelsUri(ApiBuildContext ctx);
  
  /// 构建请求 Body
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx);

  /// 解析模型列表响应
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json);
}
````

## File: lib/data/data_sources/chat_source_router.dart
````dart
import '../../core/models/app_config.dart';
import 'chat_source.dart';
import 'local_chat_source.dart';
import 'remote_chat_source.dart';

class ChatSourceRouter {
  final RemoteChatSource remote;
  final LocalChatSource local;

  ChatSourceRouter(this.remote, this.local);

  ChatSource getSource(String apiMode) {
    return apiMode == 'local' ? local : remote;
  }
  
  ChatSource getSourceFromConfig(AppConfig config) {
    return getSource(config.apiMode);
  }
}
````

## File: lib/data/data_sources/chat_source.dart
````dart
import '../../core/models/app_config.dart';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/models/model_info.dart';

abstract class ChatSource {
  Future<List<ModelInfo>> fetchModels(AppConfig config);
  Stream<ChatChunk> chatStream({
    required AppConfig config,
    required List<ApiMessage> context,
  });
}
````

## File: lib/data/data_sources/local_chat_source.dart
````dart
import 'dart:async';
import 'package:flutter_llama/flutter_llama.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/models/model_info.dart';
import 'chat_source.dart';

class LocalChatSource implements ChatSource {
  static final FlutterLlama _llama = FlutterLlama.instance;
  static String? _loadedModelPath;
  static bool _isLoaded = false;

  @override
  Future<List<ModelInfo>> fetchModels(AppConfig config) async {
    return []; 
  }

  @override
  Stream<ChatChunk> chatStream({
    required AppConfig config,
    required List<ApiMessage> context,
  }) async* {
    final modelPath = config.selectedModel?.trim() ?? '';
    if (modelPath.isEmpty) {
      yield const ChatChunk(isDone: true, error: '未选择本地模型');
      return;
    }

    final prompt = _buildPromptFromContext(context);

    if (!_isLoaded || _loadedModelPath != modelPath) {
      if (_isLoaded) await _llama.unloadModel();
      try {
        final loadConfig = LlamaConfig(
          modelPath: modelPath,
          nThreads: 4,
          nGpuLayers: -1,
          contextSize: 16384,
          batchSize: 512,
          useGpu: true,
          verbose: false,
        );
        final success = await _llama.loadModel(loadConfig);
        if (!success) {
          yield const ChatChunk(isDone: true, error: '模型加载失败');
          return;
        }
        _isLoaded = true;
        _loadedModelPath = modelPath;
      } catch (e) {
        yield ChatChunk(isDone: true, error: '加载模型异常：$e');
        return;
      }
    }

    final params = GenerationParams(prompt: prompt);
    try {
      await for (final token in _llama.generateStream(params)) {
        yield ChatChunk(content: token, isDone: false);
      }
      yield const ChatChunk(isDone: true);
    } catch (e) {
      yield ChatChunk(isDone: true, error: '生成失败：$e');
    }
  }

  String _buildPromptFromContext(List<ApiMessage> context) {
    final buffer = StringBuffer();
    int round = 0;
    for (final msg in context) {
      if (msg.role == 'user') {
        round++;
        String text = msg.content ?? '';
        if (text.isEmpty && msg.parts.isNotEmpty) {
          final textParts = msg.parts.whereType<ApiMessageTextPart>();
          text = textParts.map((p) => p.text).join('\n');
        }
        if (text.isNotEmpty) {
          buffer.writeln('User $round: $text');
        }
      } else if (msg.role == 'assistant') {
        String text = msg.content ?? '';
        if (text.isNotEmpty) {
          buffer.writeln('Assistant $round: $text');
        }
      }
    }
    buffer.write('Assistant $round: ');
    return buffer.toString();
  }
}
````

## File: lib/data/data_sources/sse_event_decoder.dart
````dart
import 'dart:convert';
import '../../core/models/chat_chunk.dart';
import '../../core/models/sse_event.dart';

/// 按不同 API 协议把 SSEEvent 解释成统一的 ChatChunk
class SseEventDecoder {
  static ChatChunk? decode({
    required String apiMode,
    required SseEvent event,
  }) {
    final data = event.data.trim();
    if (data.isEmpty) return null;

    if (data == '[DONE]') {
      return const ChatChunk(isDone: true);
    }

    switch (apiMode) {
      case 'responses':
        return _decodeResponses(event);
      case 'google':
        return _decodeGoogle(event);
      case 'chat_completions':
      default:
        return _decodeChatCompletions(event);
    }
  }

  static ChatChunk? _decodeGoogle(SseEvent event) {
    try {
      final json = jsonDecode(event.data) as Map<String, dynamic>;

      // 检查错误
      if (json['error'] != null) {
        return ChatChunk(
          isDone: true,
          error: _extractErrorMessage(json['error']),
        );
      }

      // 检查 promptFeedback 拦截
      final promptFeedback = json['promptFeedback'] as Map<String, dynamic>?;
      if (promptFeedback != null && promptFeedback['blockReason'] != null) {
        return ChatChunk(
          isDone: true,
          error: 'Prompt blocked: ${promptFeedback['blockReason']}',
        );
      }

      final candidates = json['candidates'] as List<dynamic>?;
      if (candidates == null || candidates.isEmpty) {
        // 某些块可能只包含 usageMetadata，忽略
        return null;
      }

      final candidate = candidates.first as Map<String, dynamic>;
      final content = candidate['content'] as Map<String, dynamic>?;
      final finishReason = candidate['finishReason'] as String?;

      String text = '';

      if (content != null) {
        final parts = content['parts'] as List<dynamic>?;
        if (parts != null) {
          for (final part in parts) {
            if (part is Map<String, dynamic>) {
              text += part['text'] as String? ?? '';
            }
          }
        }
      }

      // 如果有 finishReason，表示结束
      if (finishReason != null) {
        return ChatChunk(
          content: text.isEmpty ? null : text,
          isDone: true,
        );
      }

      if (text.isEmpty) return null;

      return ChatChunk(
        content: text,
        isDone: false,
      );
    } catch (e) {
      return null;
    }
  }

  static ChatChunk? _decodeChatCompletions(SseEvent event) {
    final json = jsonDecode(event.data) as Map<String, dynamic>;

    if (json['error'] != null) {
      return ChatChunk(
        isDone: true,
        error: _extractErrorMessage(json['error']),
      );
    }

    final choices = json['choices'] as List<dynamic>?;
    if (choices == null || choices.isEmpty) return null;

    final choice = choices.first as Map<String, dynamic>;
    final delta = (choice['delta'] as Map<String, dynamic>?) ??
        (choice['message'] as Map<String, dynamic>?);

    if (delta == null) return null;

    final content = delta['content'] as String?;
    final reasoning = (delta['reasoning_content'] as String?) ??
        (delta['reasoning'] as String?);

    // 某些服务会发 finish_reason 但没有内容
    final finishReason = choice['finish_reason'];
    if ((content == null || content.isEmpty) &&
        (reasoning == null || reasoning.isEmpty) &&
        finishReason != null) {
      return const ChatChunk(isDone: false);
    }

    if (content != null || reasoning != null) {
      return ChatChunk(
        content: content,
        reasoningContent: reasoning,
        isDone: false,
      );
    }

    return null;
  }

  static ChatChunk? _decodeResponses(SseEvent event) {
    final json = jsonDecode(event.data) as Map<String, dynamic>;
    final type = json['type'] as String?;

    switch (type) {
      case 'response.output_text.delta':
        final delta = json['delta'] as String?;
        if (delta == null || delta.isEmpty) return null;
        return ChatChunk(content: delta, isDone: false);

      case 'response.reasoning_summary_text.delta':
      case 'response.reasoning_text.delta':
        final delta = json['delta'] as String?;
        if (delta == null || delta.isEmpty) return null;
        return ChatChunk(reasoningContent: delta, isDone: false);

      case 'response.completed':
        return const ChatChunk(isDone: true);

      case 'response.error':
        return ChatChunk(
          isDone: true,
          error: _extractErrorMessage(json['error']),
        );

      default:
        return null;
    }
  }

  static String _extractErrorMessage(dynamic error) {
    if (error == null) return '未知错误';
    if (error is String) return error;
    if (error is Map<String, dynamic>) {
      if (error['message'] != null) return error['message'].toString();
      if (error['error'] != null) return error['error'].toString();
      return error.toString();
    }
    return error.toString();
  }
}
````

## File: lib/domain/models/tree_node.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node.freezed.dart';
part 'tree_node.g.dart';

@freezed
class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String id,
    String? parentId,
    required List<TreeNode> children,
    required int depth,
  }) = _TreeNode;

  factory TreeNode.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeFromJson(json);
}

@freezed
class TreePath with _$TreePath {
  const factory TreePath({
    required List<TreeNode> nodes,
    required TreeNode targetNode,
  }) = _TreePath;

  factory TreePath.fromJson(Map<String, dynamic> json) =>
      _$TreePathFromJson(json);
}
````

## File: lib/domain/models/tree_node.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) {
  return _TreeNode.fromJson(json);
}

/// @nodoc
mixin _$TreeNode {
  String get id => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  List<TreeNode> get children => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;

  /// Serializes this TreeNode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeNodeCopyWith<TreeNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeNodeCopyWith<$Res> {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) then) =
      _$TreeNodeCopyWithImpl<$Res, TreeNode>;
  @useResult
  $Res call({String id, String? parentId, List<TreeNode> children, int depth});
}

/// @nodoc
class _$TreeNodeCopyWithImpl<$Res, $Val extends TreeNode>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? children = null,
    Object? depth = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            children: null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<TreeNode>,
            depth: null == depth
                ? _value.depth
                : depth // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TreeNodeImplCopyWith<$Res>
    implements $TreeNodeCopyWith<$Res> {
  factory _$$TreeNodeImplCopyWith(
    _$TreeNodeImpl value,
    $Res Function(_$TreeNodeImpl) then,
  ) = __$$TreeNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? parentId, List<TreeNode> children, int depth});
}

/// @nodoc
class __$$TreeNodeImplCopyWithImpl<$Res>
    extends _$TreeNodeCopyWithImpl<$Res, _$TreeNodeImpl>
    implements _$$TreeNodeImplCopyWith<$Res> {
  __$$TreeNodeImplCopyWithImpl(
    _$TreeNodeImpl _value,
    $Res Function(_$TreeNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? children = null,
    Object? depth = null,
  }) {
    return _then(
      _$TreeNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<TreeNode>,
        depth: null == depth
            ? _value.depth
            : depth // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeImpl implements _TreeNode {
  const _$TreeNodeImpl({
    required this.id,
    this.parentId,
    required final List<TreeNode> children,
    required this.depth,
  }) : _children = children;

  factory _$TreeNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeImplFromJson(json);

  @override
  final String id;
  @override
  final String? parentId;
  final List<TreeNode> _children;
  @override
  List<TreeNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final int depth;

  @override
  String toString() {
    return 'TreeNode(id: $id, parentId: $parentId, children: $children, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentId,
    const DeepCollectionEquality().hash(_children),
    depth,
  );

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      __$$TreeNodeImplCopyWithImpl<_$TreeNodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeImplToJson(this);
  }
}

abstract class _TreeNode implements TreeNode {
  const factory _TreeNode({
    required final String id,
    final String? parentId,
    required final List<TreeNode> children,
    required final int depth,
  }) = _$TreeNodeImpl;

  factory _TreeNode.fromJson(Map<String, dynamic> json) =
      _$TreeNodeImpl.fromJson;

  @override
  String get id;
  @override
  String? get parentId;
  @override
  List<TreeNode> get children;
  @override
  int get depth;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TreePath _$TreePathFromJson(Map<String, dynamic> json) {
  return _TreePath.fromJson(json);
}

/// @nodoc
mixin _$TreePath {
  List<TreeNode> get nodes => throw _privateConstructorUsedError;
  TreeNode get targetNode => throw _privateConstructorUsedError;

  /// Serializes this TreePath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreePathCopyWith<TreePath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreePathCopyWith<$Res> {
  factory $TreePathCopyWith(TreePath value, $Res Function(TreePath) then) =
      _$TreePathCopyWithImpl<$Res, TreePath>;
  @useResult
  $Res call({List<TreeNode> nodes, TreeNode targetNode});

  $TreeNodeCopyWith<$Res> get targetNode;
}

/// @nodoc
class _$TreePathCopyWithImpl<$Res, $Val extends TreePath>
    implements $TreePathCopyWith<$Res> {
  _$TreePathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nodes = null, Object? targetNode = null}) {
    return _then(
      _value.copyWith(
            nodes: null == nodes
                ? _value.nodes
                : nodes // ignore: cast_nullable_to_non_nullable
                      as List<TreeNode>,
            targetNode: null == targetNode
                ? _value.targetNode
                : targetNode // ignore: cast_nullable_to_non_nullable
                      as TreeNode,
          )
          as $Val,
    );
  }

  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TreeNodeCopyWith<$Res> get targetNode {
    return $TreeNodeCopyWith<$Res>(_value.targetNode, (value) {
      return _then(_value.copyWith(targetNode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TreePathImplCopyWith<$Res>
    implements $TreePathCopyWith<$Res> {
  factory _$$TreePathImplCopyWith(
    _$TreePathImpl value,
    $Res Function(_$TreePathImpl) then,
  ) = __$$TreePathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TreeNode> nodes, TreeNode targetNode});

  @override
  $TreeNodeCopyWith<$Res> get targetNode;
}

/// @nodoc
class __$$TreePathImplCopyWithImpl<$Res>
    extends _$TreePathCopyWithImpl<$Res, _$TreePathImpl>
    implements _$$TreePathImplCopyWith<$Res> {
  __$$TreePathImplCopyWithImpl(
    _$TreePathImpl _value,
    $Res Function(_$TreePathImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nodes = null, Object? targetNode = null}) {
    return _then(
      _$TreePathImpl(
        nodes: null == nodes
            ? _value._nodes
            : nodes // ignore: cast_nullable_to_non_nullable
                  as List<TreeNode>,
        targetNode: null == targetNode
            ? _value.targetNode
            : targetNode // ignore: cast_nullable_to_non_nullable
                  as TreeNode,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TreePathImpl implements _TreePath {
  const _$TreePathImpl({
    required final List<TreeNode> nodes,
    required this.targetNode,
  }) : _nodes = nodes;

  factory _$TreePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreePathImplFromJson(json);

  final List<TreeNode> _nodes;
  @override
  List<TreeNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  final TreeNode targetNode;

  @override
  String toString() {
    return 'TreePath(nodes: $nodes, targetNode: $targetNode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreePathImpl &&
            const DeepCollectionEquality().equals(other._nodes, _nodes) &&
            (identical(other.targetNode, targetNode) ||
                other.targetNode == targetNode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_nodes),
    targetNode,
  );

  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreePathImplCopyWith<_$TreePathImpl> get copyWith =>
      __$$TreePathImplCopyWithImpl<_$TreePathImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreePathImplToJson(this);
  }
}

abstract class _TreePath implements TreePath {
  const factory _TreePath({
    required final List<TreeNode> nodes,
    required final TreeNode targetNode,
  }) = _$TreePathImpl;

  factory _TreePath.fromJson(Map<String, dynamic> json) =
      _$TreePathImpl.fromJson;

  @override
  List<TreeNode> get nodes;
  @override
  TreeNode get targetNode;

  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreePathImplCopyWith<_$TreePathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/domain/models/tree_node.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreeNodeImpl _$$TreeNodeImplFromJson(Map<String, dynamic> json) =>
    _$TreeNodeImpl(
      id: json['id'] as String,
      parentId: json['parentId'] as String?,
      children: (json['children'] as List<dynamic>)
          .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      depth: (json['depth'] as num).toInt(),
    );

Map<String, dynamic> _$$TreeNodeImplToJson(_$TreeNodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'children': instance.children,
      'depth': instance.depth,
    };

_$TreePathImpl _$$TreePathImplFromJson(Map<String, dynamic> json) =>
    _$TreePathImpl(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetNode: TreeNode.fromJson(json['targetNode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TreePathImplToJson(_$TreePathImpl instance) =>
    <String, dynamic>{
      'nodes': instance.nodes,
      'targetNode': instance.targetNode,
    };
````

## File: lib/domain/services/attachment_preparer.dart
````dart
import 'dart:io';
import '../../core/models/attachment.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../presentation/models/pending_attachment.dart';

Future<List<Attachment>> savePendingAttachments(
  ConversationRepository repository,
  List<PendingAttachment> pending,
) async {
  final result = <Attachment>[];

  for (final item in pending) {
    final bytes = await File(item.path).readAsBytes();
    final relativePath = await repository.saveAttachment(bytes, item.name);

    result.add(
      Attachment(
        id: item.id,
        name: item.name,
        relativePath: relativePath,
        isImage: item.isImage,
        mimeType: item.mimeType,
      ),
    );
  }

  return result;
}
````

## File: lib/presentation/models/input_state.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'pending_attachment.dart';

part 'input_state.freezed.dart';

@freezed
class InputState with _$InputState {
  const factory InputState({
    /// 输入框文本
    @Default('') String text,

    /// 附件列表
    @Default([]) List<PendingAttachment> attachments,
  }) = _InputState;
}

/// 扩展方法：计算是否允许发送
extension InputStateX on InputState {
  bool get canSend => text.trim().isNotEmpty || attachments.isNotEmpty;
}
````

## File: lib/presentation/models/input_state.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InputState {
  /// 输入框文本
  String get text => throw _privateConstructorUsedError;

  /// 附件列表
  List<PendingAttachment> get attachments => throw _privateConstructorUsedError;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputStateCopyWith<InputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputStateCopyWith<$Res> {
  factory $InputStateCopyWith(
    InputState value,
    $Res Function(InputState) then,
  ) = _$InputStateCopyWithImpl<$Res, InputState>;
  @useResult
  $Res call({String text, List<PendingAttachment> attachments});
}

/// @nodoc
class _$InputStateCopyWithImpl<$Res, $Val extends InputState>
    implements $InputStateCopyWith<$Res> {
  _$InputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? attachments = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<PendingAttachment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InputStateImplCopyWith<$Res>
    implements $InputStateCopyWith<$Res> {
  factory _$$InputStateImplCopyWith(
    _$InputStateImpl value,
    $Res Function(_$InputStateImpl) then,
  ) = __$$InputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, List<PendingAttachment> attachments});
}

/// @nodoc
class __$$InputStateImplCopyWithImpl<$Res>
    extends _$InputStateCopyWithImpl<$Res, _$InputStateImpl>
    implements _$$InputStateImplCopyWith<$Res> {
  __$$InputStateImplCopyWithImpl(
    _$InputStateImpl _value,
    $Res Function(_$InputStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? attachments = null}) {
    return _then(
      _$InputStateImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<PendingAttachment>,
      ),
    );
  }
}

/// @nodoc

class _$InputStateImpl implements _InputState {
  const _$InputStateImpl({
    this.text = '',
    final List<PendingAttachment> attachments = const [],
  }) : _attachments = attachments;

  /// 输入框文本
  @override
  @JsonKey()
  final String text;

  /// 附件列表
  final List<PendingAttachment> _attachments;

  /// 附件列表
  @override
  @JsonKey()
  List<PendingAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'InputState(text: $text, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputStateImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    text,
    const DeepCollectionEquality().hash(_attachments),
  );

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputStateImplCopyWith<_$InputStateImpl> get copyWith =>
      __$$InputStateImplCopyWithImpl<_$InputStateImpl>(this, _$identity);
}

abstract class _InputState implements InputState {
  const factory _InputState({
    final String text,
    final List<PendingAttachment> attachments,
  }) = _$InputStateImpl;

  /// 输入框文本
  @override
  String get text;

  /// 附件列表
  @override
  List<PendingAttachment> get attachments;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputStateImplCopyWith<_$InputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/presentation/widgets/common/declarative_text_field.dart
````dart
import 'package:flutter/cupertino.dart';

/// 声明式受控文本输入框
/// 自动与外部 value 同步，无需手动管理 TextEditingController
class DeclarativeCupertinoTextField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool obscureText;

  const DeclarativeCupertinoTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.placeholder,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  State<DeclarativeCupertinoTextField> createState() => _DeclarativeCupertinoTextFieldState();
}

class _DeclarativeCupertinoTextFieldState extends State<DeclarativeCupertinoTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(DeclarativeCupertinoTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      final selection = _controller.selection;
      _controller.text = widget.value;
      // 尽量保持光标位置
      if (selection.isValid && selection.baseOffset <= widget.value.length) {
        _controller.selection = selection;
      } else {
        _controller.selection = TextSelection.collapsed(offset: widget.value.length);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      placeholder: widget.placeholder,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
    );
  }
}
````

## File: lib/presentation/widgets/markdown_parser.dart
````dart
/// Markdown 块级节点类型
enum MarkdownBlockType {
  heading,
  paragraph,
  code,
  table,
}

/// 内联元素类型
enum InlineType { text, bold }

/// 内联片段
class InlineSpan {
  final InlineType type;
  final String text;

  const InlineSpan(this.type, this.text);
}

/// 表格行
class TableRowData {
  final List<String> cells;
  TableRowData(this.cells);
}

/// 块级节点
class MarkdownBlock {
  final MarkdownBlockType type;
  final int? level; // 标题级别 1-6
  final String? text; // 段落/标题/代码的文本内容
  final String? codeLanguage;
  final List<TableRowData>? tableRows; // 表格数据，第一行为表头

  MarkdownBlock.heading(this.level, this.text)
      : type = MarkdownBlockType.heading,
        codeLanguage = null,
        tableRows = null;

  MarkdownBlock.paragraph(this.text)
      : type = MarkdownBlockType.paragraph,
        level = null,
        codeLanguage = null,
        tableRows = null;

  MarkdownBlock.code(this.text, {this.codeLanguage})
      : type = MarkdownBlockType.code,
        level = null,
        tableRows = null;

  MarkdownBlock.table(this.tableRows)
      : type = MarkdownBlockType.table,
        level = null,
        text = null,
        codeLanguage = null;
}

/// Markdown 解析器（仅支持标题、粗体、代码块、表格）
class MarkdownParser {
  /// 解析完整文本
  static List<MarkdownBlock> parse(String data) {
    final lines = data.split('\n');
    final blocks = <MarkdownBlock>[];
    int i = 0;
    final n = lines.length;

    while (i < n) {
      final line = lines[i];
      // 空行跳过
      if (line.trim().isEmpty) {
        i++;
        continue;
      }

      // 标题
      final headingMatch = RegExp(r'^(#{1,6})\s+(.*)$').firstMatch(line);
      if (headingMatch != null) {
        final level = headingMatch.group(1)!.length;
        final text = headingMatch.group(2)!;
        blocks.add(MarkdownBlock.heading(level, text));
        i++;
        continue;
      }

      // 代码块
      if (line.trim().startsWith('```')) {
        final lang = line.trim().substring(3).trim();
        final codeLines = <String>[];
        i++;
        while (i < n && !lines[i].trim().startsWith('```')) {
          codeLines.add(lines[i]);
          i++;
        }
        i++; // 跳过结束 ```
        final codeText = codeLines.join('\n');
        blocks.add(MarkdownBlock.code(codeText, codeLanguage: lang.isEmpty ? null : lang));
        continue;
      }

      // 表格：以 | 开头和结尾的行，且下一行是分隔行（|---|...）或者连续收集
      if (line.trim().startsWith('|') && line.trim().endsWith('|')) {
        final tableLines = <String>[];
        // 收集所有表格行直到遇到空行或非表格行
        while (i < n && lines[i].trim().startsWith('|') && lines[i].trim().endsWith('|')) {
          tableLines.add(lines[i].trim());
          i++;
        }
        final rows = _parseTable(tableLines);
        if (rows != null && rows.isNotEmpty) {
          blocks.add(MarkdownBlock.table(rows));
        }
        continue;
      }

      // 普通段落
      blocks.add(MarkdownBlock.paragraph(line));
      i++;
    }

    return blocks;
  }

  /// 解析表格，返回行列表（第一行为表头）
  static List<TableRowData>? _parseTable(List<String> lines) {
    if (lines.length < 2) return null;

    // 分隔行校验
    final separatorLine = lines[1];
    if (!_isTableSeparator(separatorLine)) return null;

    final rows = <TableRowData>[];
    // 表头
    rows.add(TableRowData(_splitTableRow(lines[0])));
    // 数据行
    for (int i = 2; i < lines.length; i++) {
      rows.add(TableRowData(_splitTableRow(lines[i])));
    }
    return rows;
  }

  static bool _isTableSeparator(String line) {
    return RegExp(r'^\|[\s\-:|]+\|$').hasMatch(line);
  }

  static List<String> _splitTableRow(String line) {
    // 去掉首尾的 |，然后按 | 分割
    final trimmed = line.substring(1, line.length - 1);
    return trimmed.split('|').map((s) => s.trim()).toList();
  }

  /// 解析内联格式（粗体、斜体），返回 InlineSpan 列表
  static List<InlineSpan> parseInline(String text) {
    final spans = <InlineSpan>[];
    final buffer = StringBuffer();
    bool inBold = false;
    int i = 0;
    final len = text.length;

    while (i < len) {
      // 粗体 **
      if (i + 1 < len && text[i] == '*' && text[i + 1] == '*') {
        _flushBuffer(buffer, spans, inBold);
        inBold = !inBold;
        i += 2;
        continue;
      }
      buffer.write(text[i]);
      i++;
    }
    _flushBuffer(buffer, spans, inBold);
    return spans;
  }

  static void _flushBuffer(StringBuffer buffer, List<InlineSpan> spans, bool inBold) {
    if (buffer.isEmpty) return;
    final text = buffer.toString();
    buffer.clear();
    if (inBold) {
      spans.add(InlineSpan(InlineType.bold, text));
    } 
    else {
      spans.add(InlineSpan(InlineType.text, text));
    }
  }
}
````

## File: macos/Flutter/GeneratedPluginRegistrant.swift
````swift
//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import file_picker
import file_selector_macos
import flutter_llama
import share_plus
import sqlite3_flutter_libs

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FilePickerPlugin.register(with: registry.registrar(forPlugin: "FilePickerPlugin"))
  FileSelectorPlugin.register(with: registry.registrar(forPlugin: "FileSelectorPlugin"))
  FlutterLlamaPlugin.register(with: registry.registrar(forPlugin: "FlutterLlamaPlugin"))
  SharePlusMacosPlugin.register(with: registry.registrar(forPlugin: "SharePlusMacosPlugin"))
  Sqlite3FlutterLibsPlugin.register(with: registry.registrar(forPlugin: "Sqlite3FlutterLibsPlugin"))
}
````

## File: windows/flutter/generated_plugin_registrant.cc
````cpp
//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_windows/file_selector_windows.h>
#include <share_plus/share_plus_windows_plugin_c_api.h>
#include <sqlite3_flutter_libs/sqlite3_flutter_libs_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  SharePlusWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SharePlusWindowsPluginCApi"));
  Sqlite3FlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("Sqlite3FlutterLibsPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
````

## File: windows/flutter/generated_plugins.cmake
````cmake
#
# Generated file, do not edit.
#

list(APPEND FLUTTER_PLUGIN_LIST
  file_selector_windows
  share_plus
  sqlite3_flutter_libs
  url_launcher_windows
)

list(APPEND FLUTTER_FFI_PLUGIN_LIST
)

set(PLUGIN_BUNDLED_LIBRARIES)

foreach(plugin ${FLUTTER_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin})
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)

foreach(ffi_plugin ${FLUTTER_FFI_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${ffi_plugin}/windows plugins/${ffi_plugin})
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${ffi_plugin}_bundled_libraries})
endforeach(ffi_plugin)
````

## File: android/app/src/main/AndroidManifest.xml
````xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- 网络权限 -->
    <uses-permission android:name="android.permission.INTERNET"/>
    
    <!-- 存储权限（Android 10+ 需要动态申请） -->
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" 
                     android:maxSdkVersion="32"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" 
                     android:maxSdkVersion="32"/>

    <application
        android:label="AI Chat"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:enableOnBackInvokedCallback="true">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <!-- 指定 Flutter 主题 -->
            <meta-data
                android:name="io.flutter.embedding.android.NormalTheme"
                android:resource="@style/NormalTheme"/>
            
            <!-- 启动器 Intent -->
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        
        <!-- Flutter 嵌入版本 -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2"/>
    </application>
</manifest>
````

## File: lib/core/constants/app_constants.dart
````dart
abstract class AppConstants {
  // 文件夹名称
  static const String dirAttachments = 'attachments';

  // 配置键
  static const String keyBaseUrl = 'baseUrl';
  static const String keyApiKey = 'apiKey';
  static const String keyTheme = 'theme';
  static const String keyModel = 'selectedModel';

  // 默认值
  static const String defaultBaseUrl = 'https://api.openai.com';
  static const String defaultTheme = 'system';
}
````

## File: lib/core/models/generation_event.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_event.freezed.dart';

/// 生成过程中的统一事件
@freezed
class GenerationEvent with _$GenerationEvent {
  const factory GenerationEvent.partial({
    required String content,
    required String reasoning,
  }) = PartialGeneration;

  const factory GenerationEvent.completed({
    required String content,
    required String reasoning,
  }) = CompletedGeneration;

  const factory GenerationEvent.failed({
    required String error,
    @Default('') String content,
    @Default('') String reasoning,
  }) = FailedGeneration;
}
````

## File: lib/core/models/generation_event.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GenerationEvent {
  String get content => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationEventCopyWith<GenerationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationEventCopyWith<$Res> {
  factory $GenerationEventCopyWith(
    GenerationEvent value,
    $Res Function(GenerationEvent) then,
  ) = _$GenerationEventCopyWithImpl<$Res, GenerationEvent>;
  @useResult
  $Res call({String content, String reasoning});
}

/// @nodoc
class _$GenerationEventCopyWithImpl<$Res, $Val extends GenerationEvent>
    implements $GenerationEventCopyWith<$Res> {
  _$GenerationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? reasoning = null}) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            reasoning: null == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PartialGenerationImplCopyWith<$Res>
    implements $GenerationEventCopyWith<$Res> {
  factory _$$PartialGenerationImplCopyWith(
    _$PartialGenerationImpl value,
    $Res Function(_$PartialGenerationImpl) then,
  ) = __$$PartialGenerationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String reasoning});
}

/// @nodoc
class __$$PartialGenerationImplCopyWithImpl<$Res>
    extends _$GenerationEventCopyWithImpl<$Res, _$PartialGenerationImpl>
    implements _$$PartialGenerationImplCopyWith<$Res> {
  __$$PartialGenerationImplCopyWithImpl(
    _$PartialGenerationImpl _value,
    $Res Function(_$PartialGenerationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? reasoning = null}) {
    return _then(
      _$PartialGenerationImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PartialGenerationImpl implements PartialGeneration {
  const _$PartialGenerationImpl({
    required this.content,
    required this.reasoning,
  });

  @override
  final String content;
  @override
  final String reasoning;

  @override
  String toString() {
    return 'GenerationEvent.partial(content: $content, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartialGenerationImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, reasoning);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartialGenerationImplCopyWith<_$PartialGenerationImpl> get copyWith =>
      __$$PartialGenerationImplCopyWithImpl<_$PartialGenerationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) {
    return partial(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) {
    return partial?.call(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
    required TResult orElse(),
  }) {
    if (partial != null) {
      return partial(content, reasoning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) {
    return partial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) {
    return partial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) {
    if (partial != null) {
      return partial(this);
    }
    return orElse();
  }
}

abstract class PartialGeneration implements GenerationEvent {
  const factory PartialGeneration({
    required final String content,
    required final String reasoning,
  }) = _$PartialGenerationImpl;

  @override
  String get content;
  @override
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartialGenerationImplCopyWith<_$PartialGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedGenerationImplCopyWith<$Res>
    implements $GenerationEventCopyWith<$Res> {
  factory _$$CompletedGenerationImplCopyWith(
    _$CompletedGenerationImpl value,
    $Res Function(_$CompletedGenerationImpl) then,
  ) = __$$CompletedGenerationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String reasoning});
}

/// @nodoc
class __$$CompletedGenerationImplCopyWithImpl<$Res>
    extends _$GenerationEventCopyWithImpl<$Res, _$CompletedGenerationImpl>
    implements _$$CompletedGenerationImplCopyWith<$Res> {
  __$$CompletedGenerationImplCopyWithImpl(
    _$CompletedGenerationImpl _value,
    $Res Function(_$CompletedGenerationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? reasoning = null}) {
    return _then(
      _$CompletedGenerationImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CompletedGenerationImpl implements CompletedGeneration {
  const _$CompletedGenerationImpl({
    required this.content,
    required this.reasoning,
  });

  @override
  final String content;
  @override
  final String reasoning;

  @override
  String toString() {
    return 'GenerationEvent.completed(content: $content, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedGenerationImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, reasoning);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedGenerationImplCopyWith<_$CompletedGenerationImpl> get copyWith =>
      __$$CompletedGenerationImplCopyWithImpl<_$CompletedGenerationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) {
    return completed(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) {
    return completed?.call(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(content, reasoning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class CompletedGeneration implements GenerationEvent {
  const factory CompletedGeneration({
    required final String content,
    required final String reasoning,
  }) = _$CompletedGenerationImpl;

  @override
  String get content;
  @override
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletedGenerationImplCopyWith<_$CompletedGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedGenerationImplCopyWith<$Res>
    implements $GenerationEventCopyWith<$Res> {
  factory _$$FailedGenerationImplCopyWith(
    _$FailedGenerationImpl value,
    $Res Function(_$FailedGenerationImpl) then,
  ) = __$$FailedGenerationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error, String content, String reasoning});
}

/// @nodoc
class __$$FailedGenerationImplCopyWithImpl<$Res>
    extends _$GenerationEventCopyWithImpl<$Res, _$FailedGenerationImpl>
    implements _$$FailedGenerationImplCopyWith<$Res> {
  __$$FailedGenerationImplCopyWithImpl(
    _$FailedGenerationImpl _value,
    $Res Function(_$FailedGenerationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? content = null,
    Object? reasoning = null,
  }) {
    return _then(
      _$FailedGenerationImpl(
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FailedGenerationImpl implements FailedGeneration {
  const _$FailedGenerationImpl({
    required this.error,
    this.content = '',
    this.reasoning = '',
  });

  @override
  final String error;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String reasoning;

  @override
  String toString() {
    return 'GenerationEvent.failed(error: $error, content: $content, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedGenerationImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, content, reasoning);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedGenerationImplCopyWith<_$FailedGenerationImpl> get copyWith =>
      __$$FailedGenerationImplCopyWithImpl<_$FailedGenerationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) {
    return failed(error, content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) {
    return failed?.call(error, content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error, content, reasoning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedGeneration implements GenerationEvent {
  const factory FailedGeneration({
    required final String error,
    final String content,
    final String reasoning,
  }) = _$FailedGenerationImpl;

  String get error;
  @override
  String get content;
  @override
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedGenerationImplCopyWith<_$FailedGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/model_info.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_info.freezed.dart';
part 'model_info.g.dart';

@freezed
class ModelInfo with _$ModelInfo {
  const factory ModelInfo({
    required String id,

    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  }) = _ModelInfo;

  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);
}
````

## File: lib/core/models/model_info.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) {
  return _ModelInfo.fromJson(json);
}

/// @nodoc
mixin _$ModelInfo {
  String get id => throw _privateConstructorUsedError;
  bool? get overrideSupportsReasoning => throw _privateConstructorUsedError;
  bool? get overrideSupportsVision => throw _privateConstructorUsedError;

  /// Serializes this ModelInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModelInfoCopyWith<ModelInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelInfoCopyWith<$Res> {
  factory $ModelInfoCopyWith(ModelInfo value, $Res Function(ModelInfo) then) =
      _$ModelInfoCopyWithImpl<$Res, ModelInfo>;
  @useResult
  $Res call({
    String id,
    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  });
}

/// @nodoc
class _$ModelInfoCopyWithImpl<$Res, $Val extends ModelInfo>
    implements $ModelInfoCopyWith<$Res> {
  _$ModelInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? overrideSupportsReasoning = freezed,
    Object? overrideSupportsVision = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            overrideSupportsReasoning: freezed == overrideSupportsReasoning
                ? _value.overrideSupportsReasoning
                : overrideSupportsReasoning // ignore: cast_nullable_to_non_nullable
                      as bool?,
            overrideSupportsVision: freezed == overrideSupportsVision
                ? _value.overrideSupportsVision
                : overrideSupportsVision // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ModelInfoImplCopyWith<$Res>
    implements $ModelInfoCopyWith<$Res> {
  factory _$$ModelInfoImplCopyWith(
    _$ModelInfoImpl value,
    $Res Function(_$ModelInfoImpl) then,
  ) = __$$ModelInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  });
}

/// @nodoc
class __$$ModelInfoImplCopyWithImpl<$Res>
    extends _$ModelInfoCopyWithImpl<$Res, _$ModelInfoImpl>
    implements _$$ModelInfoImplCopyWith<$Res> {
  __$$ModelInfoImplCopyWithImpl(
    _$ModelInfoImpl _value,
    $Res Function(_$ModelInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? overrideSupportsReasoning = freezed,
    Object? overrideSupportsVision = freezed,
  }) {
    return _then(
      _$ModelInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        overrideSupportsReasoning: freezed == overrideSupportsReasoning
            ? _value.overrideSupportsReasoning
            : overrideSupportsReasoning // ignore: cast_nullable_to_non_nullable
                  as bool?,
        overrideSupportsVision: freezed == overrideSupportsVision
            ? _value.overrideSupportsVision
            : overrideSupportsVision // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelInfoImpl implements _ModelInfo {
  const _$ModelInfoImpl({
    required this.id,
    this.overrideSupportsReasoning,
    this.overrideSupportsVision,
  });

  factory _$ModelInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelInfoImplFromJson(json);

  @override
  final String id;
  @override
  final bool? overrideSupportsReasoning;
  @override
  final bool? overrideSupportsVision;

  @override
  String toString() {
    return 'ModelInfo(id: $id, overrideSupportsReasoning: $overrideSupportsReasoning, overrideSupportsVision: $overrideSupportsVision)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                  other.overrideSupportsReasoning,
                  overrideSupportsReasoning,
                ) ||
                other.overrideSupportsReasoning == overrideSupportsReasoning) &&
            (identical(other.overrideSupportsVision, overrideSupportsVision) ||
                other.overrideSupportsVision == overrideSupportsVision));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    overrideSupportsReasoning,
    overrideSupportsVision,
  );

  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelInfoImplCopyWith<_$ModelInfoImpl> get copyWith =>
      __$$ModelInfoImplCopyWithImpl<_$ModelInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelInfoImplToJson(this);
  }
}

abstract class _ModelInfo implements ModelInfo {
  const factory _ModelInfo({
    required final String id,
    final bool? overrideSupportsReasoning,
    final bool? overrideSupportsVision,
  }) = _$ModelInfoImpl;

  factory _ModelInfo.fromJson(Map<String, dynamic> json) =
      _$ModelInfoImpl.fromJson;

  @override
  String get id;
  @override
  bool? get overrideSupportsReasoning;
  @override
  bool? get overrideSupportsVision;

  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModelInfoImplCopyWith<_$ModelInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/model_info.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelInfoImpl _$$ModelInfoImplFromJson(Map<String, dynamic> json) =>
    _$ModelInfoImpl(
      id: json['id'] as String,
      overrideSupportsReasoning: json['overrideSupportsReasoning'] as bool?,
      overrideSupportsVision: json['overrideSupportsVision'] as bool?,
    );

Map<String, dynamic> _$$ModelInfoImplToJson(_$ModelInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'overrideSupportsReasoning': instance.overrideSupportsReasoning,
      'overrideSupportsVision': instance.overrideSupportsVision,
    };
````

## File: lib/core/models/session.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'chat_round.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    required String title,
    required int createdAt,
    required int updatedAt,
    required List<ChatRound> rounds,
    SessionConfig? config,
    @Default(false) bool hasUnseenUpdate,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}

@freezed
class SessionConfig with _$SessionConfig {
  const factory SessionConfig({
    String? model,
    double? temperature,
    bool? enableReasoning,
  }) = _SessionConfig;

  factory SessionConfig.fromJson(Map<String, dynamic> json) =>
      _$SessionConfigFromJson(json);
}
````

## File: lib/core/models/session.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  List<ChatRound> get rounds => throw _privateConstructorUsedError;
  SessionConfig? get config => throw _privateConstructorUsedError;
  bool get hasUnseenUpdate => throw _privateConstructorUsedError;

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call({
    String id,
    String title,
    int createdAt,
    int updatedAt,
    List<ChatRound> rounds,
    SessionConfig? config,
    bool hasUnseenUpdate,
  });

  $SessionConfigCopyWith<$Res>? get config;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rounds = null,
    Object? config = freezed,
    Object? hasUnseenUpdate = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as int,
            rounds: null == rounds
                ? _value.rounds
                : rounds // ignore: cast_nullable_to_non_nullable
                      as List<ChatRound>,
            config: freezed == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as SessionConfig?,
            hasUnseenUpdate: null == hasUnseenUpdate
                ? _value.hasUnseenUpdate
                : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }

    return $SessionConfigCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
    _$SessionImpl value,
    $Res Function(_$SessionImpl) then,
  ) = __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    int createdAt,
    int updatedAt,
    List<ChatRound> rounds,
    SessionConfig? config,
    bool hasUnseenUpdate,
  });

  @override
  $SessionConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
    _$SessionImpl _value,
    $Res Function(_$SessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rounds = null,
    Object? config = freezed,
    Object? hasUnseenUpdate = null,
  }) {
    return _then(
      _$SessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as int,
        rounds: null == rounds
            ? _value._rounds
            : rounds // ignore: cast_nullable_to_non_nullable
                  as List<ChatRound>,
        config: freezed == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as SessionConfig?,
        hasUnseenUpdate: null == hasUnseenUpdate
            ? _value.hasUnseenUpdate
            : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  const _$SessionImpl({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required final List<ChatRound> rounds,
    this.config,
    this.hasUnseenUpdate = false,
  }) : _rounds = rounds;

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  final List<ChatRound> _rounds;
  @override
  List<ChatRound> get rounds {
    if (_rounds is EqualUnmodifiableListView) return _rounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rounds);
  }

  @override
  final SessionConfig? config;
  @override
  @JsonKey()
  final bool hasUnseenUpdate;

  @override
  String toString() {
    return 'Session(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, rounds: $rounds, config: $config, hasUnseenUpdate: $hasUnseenUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._rounds, _rounds) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.hasUnseenUpdate, hasUnseenUpdate) ||
                other.hasUnseenUpdate == hasUnseenUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_rounds),
    config,
    hasUnseenUpdate,
  );

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(this);
  }
}

abstract class _Session implements Session {
  const factory _Session({
    required final String id,
    required final String title,
    required final int createdAt,
    required final int updatedAt,
    required final List<ChatRound> rounds,
    final SessionConfig? config,
    final bool hasUnseenUpdate,
  }) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  List<ChatRound> get rounds;
  @override
  SessionConfig? get config;
  @override
  bool get hasUnseenUpdate;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionConfig _$SessionConfigFromJson(Map<String, dynamic> json) {
  return _SessionConfig.fromJson(json);
}

/// @nodoc
mixin _$SessionConfig {
  String? get model => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  bool? get enableReasoning => throw _privateConstructorUsedError;

  /// Serializes this SessionConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionConfigCopyWith<SessionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionConfigCopyWith<$Res> {
  factory $SessionConfigCopyWith(
    SessionConfig value,
    $Res Function(SessionConfig) then,
  ) = _$SessionConfigCopyWithImpl<$Res, SessionConfig>;
  @useResult
  $Res call({String? model, double? temperature, bool? enableReasoning});
}

/// @nodoc
class _$SessionConfigCopyWithImpl<$Res, $Val extends SessionConfig>
    implements $SessionConfigCopyWith<$Res> {
  _$SessionConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? temperature = freezed,
    Object? enableReasoning = freezed,
  }) {
    return _then(
      _value.copyWith(
            model: freezed == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            enableReasoning: freezed == enableReasoning
                ? _value.enableReasoning
                : enableReasoning // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionConfigImplCopyWith<$Res>
    implements $SessionConfigCopyWith<$Res> {
  factory _$$SessionConfigImplCopyWith(
    _$SessionConfigImpl value,
    $Res Function(_$SessionConfigImpl) then,
  ) = __$$SessionConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? model, double? temperature, bool? enableReasoning});
}

/// @nodoc
class __$$SessionConfigImplCopyWithImpl<$Res>
    extends _$SessionConfigCopyWithImpl<$Res, _$SessionConfigImpl>
    implements _$$SessionConfigImplCopyWith<$Res> {
  __$$SessionConfigImplCopyWithImpl(
    _$SessionConfigImpl _value,
    $Res Function(_$SessionConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? temperature = freezed,
    Object? enableReasoning = freezed,
  }) {
    return _then(
      _$SessionConfigImpl(
        model: freezed == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        enableReasoning: freezed == enableReasoning
            ? _value.enableReasoning
            : enableReasoning // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionConfigImpl implements _SessionConfig {
  const _$SessionConfigImpl({
    this.model,
    this.temperature,
    this.enableReasoning,
  });

  factory _$SessionConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionConfigImplFromJson(json);

  @override
  final String? model;
  @override
  final double? temperature;
  @override
  final bool? enableReasoning;

  @override
  String toString() {
    return 'SessionConfig(model: $model, temperature: $temperature, enableReasoning: $enableReasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionConfigImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.enableReasoning, enableReasoning) ||
                other.enableReasoning == enableReasoning));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, model, temperature, enableReasoning);

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionConfigImplCopyWith<_$SessionConfigImpl> get copyWith =>
      __$$SessionConfigImplCopyWithImpl<_$SessionConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionConfigImplToJson(this);
  }
}

abstract class _SessionConfig implements SessionConfig {
  const factory _SessionConfig({
    final String? model,
    final double? temperature,
    final bool? enableReasoning,
  }) = _$SessionConfigImpl;

  factory _SessionConfig.fromJson(Map<String, dynamic> json) =
      _$SessionConfigImpl.fromJson;

  @override
  String? get model;
  @override
  double? get temperature;
  @override
  bool? get enableReasoning;

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionConfigImplCopyWith<_$SessionConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/models/session.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      rounds: (json['rounds'] as List<dynamic>)
          .map((e) => ChatRound.fromJson(e as Map<String, dynamic>))
          .toList(),
      config: json['config'] == null
          ? null
          : SessionConfig.fromJson(json['config'] as Map<String, dynamic>),
      hasUnseenUpdate: json['hasUnseenUpdate'] as bool? ?? false,
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'rounds': instance.rounds,
      'config': instance.config,
      'hasUnseenUpdate': instance.hasUnseenUpdate,
    };

_$SessionConfigImpl _$$SessionConfigImplFromJson(Map<String, dynamic> json) =>
    _$SessionConfigImpl(
      model: json['model'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      enableReasoning: json['enableReasoning'] as bool?,
    );

Map<String, dynamic> _$$SessionConfigImplToJson(_$SessionConfigImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'temperature': instance.temperature,
      'enableReasoning': instance.enableReasoning,
    };
````

## File: lib/core/models/sse_event.dart
````dart
// 保持你原有SseEvent的非空约定，避免修改下游Decoder
class SseEvent {
  final String? id;
  final String? event;
  final String data; // 保持非空，和你原有逻辑一致

  const SseEvent({
    this.id,
    this.event,
    required this.data,
  });
}
````

## File: lib/data/data_sources/api_builders/chat_completions_api_builder.dart
````dart
import 'package:aiservice/data/data_sources/api_builders/model_info_parser.dart';

import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ChatCompletionsApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'Authorization': 'Bearer ${ctx.apiKey}',
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.chatPath);
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }
  
  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'model': ctx.model,
      'messages': _buildMessages(ctx.context),
      'stream': true,
      if (ctx.enableReasoning) 'reasoning_effort': 'medium',
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    return ModelInfoParser.parseModelsResponse(json);
  }

  List<Map<String, dynamic>> _buildMessages(List<ApiMessage> context) {
    return context.map(_buildMessage).toList();
  }

  Map<String, dynamic> _buildMessage(ApiMessage message) {
    if (message.role == 'assistant') {
      final result = <String, dynamic>{
        'role': 'assistant',
        'content': message.content ?? '',
      };
      if ((message.reasoning ?? '').trim().isNotEmpty) {
        result['reasoning_content'] = message.reasoning;
      }
      return result;
    }

    if (message.parts.isEmpty) {
      return {
        'role': message.role,
        'content': message.content ?? '',
      };
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) => part.when(
            text: (type, text) => {'type': 'text', 'text': text},
            imageUrl: (type, imageUrl) => {
              'type': 'image_url',
              'image_url': {'url': imageUrl.url},
            },
          )).toList(),
    };
  }
}
````

## File: lib/data/data_sources/api_builders/google_api_builder.dart
````dart
import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class GoogleApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'x-goog-api-key': ctx.apiKey,
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath).replace(
      queryParameters: {'alt': 'sse'},
    );
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }

  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'contents': _buildGoogleContents(ctx.context),
      'generationConfig': {},
      'safetySettings': [
        {'category': 'HARM_CATEGORY_HARASSMENT', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_HATE_SPEECH', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_DANGEROUS_CONTENT', 'threshold': 'BLOCK_NONE'},
      ],
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final models = json['models'] as List<dynamic>?;
    if (models == null) return [];

    return models.map((e) {
      final m = e as Map<String, dynamic>;
      final name = (m['name'] ?? '').toString();
      final id = name.startsWith('models/') ? name.substring(7) : name;

      final methods = m['supportedGenerationMethods'] as List<dynamic>?;
      if (methods != null && !methods.contains('generateContent')) {
        return null;
      }

      return ModelInfo(
        id: id,
      );
    }).whereType<ModelInfo>().toList();
  }

  List<Map<String, dynamic>> _buildGoogleContents(List<ApiMessage> context) {
    return context.map((message) {
      final role = message.role == 'assistant' ? 'model' : message.role;
      final parts = <Map<String, dynamic>>[];

      if (message.parts.isEmpty) {
        final text = message.content?.trim() ?? '';
        if (text.isNotEmpty) {
          parts.add({'text': text});
        }
      } else {
        for (final part in message.parts) {
          parts.addAll(part.when(
            text: (type, text) => [{'text': text}],
            imageUrl: (type, imageUrl) {
              final url = imageUrl.url;
              if (url.startsWith('data:')) {
                final commaIndex = url.indexOf(',');
                if (commaIndex != -1) {
                  final mime = url.substring(5, commaIndex);
                  final base64Data = url.substring(commaIndex + 1);
                  return [
                    {
                      'inlineData': {
                        'mimeType': mime,
                        'data': base64Data,
                      }
                    }
                  ];
                }
              }
              return [{'text': '[Image: $url]'}];
            },
          ));
        }
      }

      if (parts.isEmpty) return null;
      return {'role': role, 'parts': parts};
    }).whereType<Map<String, dynamic>>().toList();
  }
}
````

## File: lib/data/data_sources/api_builders/model_info_parser.dart
````dart
// lib/data/data_sources/api_builders/model_info_parser.dart
import '../../../core/models/model_info.dart';

class ModelInfoParser {
  /// 从 /v1/models 或 /v1/responses 等标准 OpenAI 风格响应中解析模型列表
  static List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];
    return data.map((e) => _parseModelInfo(e as Map<String, dynamic>)).toList();
  }

  static ModelInfo _parseModelInfo(Map<String, dynamic> json) {
    bool? readBool(Map<String, dynamic> json, List<String> keys) {
      for (final key in keys) {
        if (!json.containsKey(key)) continue;
        final value = json[key];
        if (value is bool) return value;
        if (value is num) return value != 0;
        if (value is String) {
          final lower = value.toLowerCase();
          if (lower == 'true' || lower == '1' || lower == 'yes') return true;
          if (lower == 'false' || lower == '0' || lower == 'no') return false;
        }
      }
      return null;
    }

    return ModelInfo(
      id: (json['id'] ?? '').toString(),
      overrideSupportsReasoning:
          readBool(json, ['overrideSupportsReasoning', 'override_supports_reasoning']),
      overrideSupportsVision:
          readBool(json, ['overrideSupportsVision', 'override_supports_vision']),
    );
  }
}
````

## File: lib/data/data_sources/api_builders/responses_api_builder.dart
````dart
import 'package:aiservice/data/data_sources/api_builders/model_info_parser.dart';
import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ResponsesApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'Authorization': 'Bearer ${ctx.apiKey}',
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.chatPath);
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }
  
  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'model': ctx.model,
      'input': _buildInput(ctx.context),
      'stream': true,
      'store': false,
      if (ctx.enableReasoning)
        'reasoning': {
          'effort': 'medium',
        },
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    return ModelInfoParser.parseModelsResponse(json);
  }
  
  List<Map<String, dynamic>> _buildInput(List<ApiMessage> context) {
    final result = <Map<String, dynamic>>[];
    for (final message in context) {
      if (message.role == 'assistant') {
        result.addAll(_buildAssistantItems(message));
      } else {
        result.add(_buildUserLikeMessage(message));
      }
    }
    return result;
  }

  Map<String, dynamic> _buildUserLikeMessage(ApiMessage message) {
    if (message.parts.isEmpty) {
      return {'role': message.role, 'content': message.content ?? ''};
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) => part.when(
            text: (type, text) => {'type': 'input_text', 'text': text},
            imageUrl: (type, imageUrl) => {
              'type': 'input_image',
              'image_url': imageUrl.url,
            },
          )).toList(),
    };
  }

  List<Map<String, dynamic>> _buildAssistantItems(ApiMessage message) {
    final items = <Map<String, dynamic>>[];
    if ((message.reasoning ?? '').trim().isNotEmpty) {
      items.add({
        'type': 'reasoning',
        'summary': [
          {'type': 'summary_text', 'text': message.reasoning}
        ],
      });
    }
    if ((message.content ?? '').trim().isNotEmpty) {
      items.add({'role': 'assistant', 'content': message.content});
    }
    return items;
  }
}
````

## File: lib/data/data_sources/remote_chat_source.dart
````dart
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/utils/sse_parser.dart';
import 'chat_source.dart';
import 'sse_event_decoder.dart';
import 'api_builders/api_request_builder.dart';
import 'api_builders/google_api_builder.dart';
import 'api_builders/chat_completions_api_builder.dart';
import 'api_builders/responses_api_builder.dart';

class RemoteChatSource implements ChatSource {
  ApiRequestBuilder _getBuilder(String apiMode) {
    switch (apiMode) {
      case 'google':
        return GoogleApiBuilder();
      case 'responses':
        return ResponsesApiBuilder();
      case 'chat_completions':
      default:
        return ChatCompletionsApiBuilder();
    }
  }

  @override
  Future<List<ModelInfo>> fetchModels(AppConfig config) async {
    final builder = _getBuilder(config.apiMode);
    final ctx = ApiBuildContext(
      model: '',
      context: [],
      enableReasoning: false,
      apiKey: config.apiKey,
      baseUrl: config.baseUrl,
      chatPath: '',
      modelsPath: config.modelsPath,
    );

    final url = builder.buildModelsUri(ctx);
    final response = await http.get(url, headers: builder.buildHeaders(ctx));

    if (response.statusCode != 200) {
      throw Exception('获取模型列表失败：${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return builder.parseModelsResponse(json);
  }

  @override
  Stream<ChatChunk> chatStream({
    required AppConfig config,
    required List<ApiMessage> context,
  }) async* {
    final client = http.Client();
    try {
      final apiMode = config.apiMode.trim();
      final selectedId = config.selectedModel;
      final selectedModel = config.availableModels?.firstWhereOrNull((m) => m.id == selectedId);
      final enableReasoning = selectedModel?.overrideSupportsReasoning == true;
      final model = config.selectedModel?.trim() ?? '';

      final builder = _getBuilder(apiMode);
      String resolvedChatPath = config.chatPath.trim();
      if (resolvedChatPath.contains('{model}')) {
        resolvedChatPath = resolvedChatPath.replaceAll('{model}', model);
      }

      final ctx = ApiBuildContext(
        model: model, context: context, enableReasoning: enableReasoning,
        apiKey: config.apiKey.trim(), baseUrl: config.baseUrl.trim(),
        chatPath: resolvedChatPath, modelsPath: config.modelsPath.trim(),
      );

      final uri = builder.buildUri(ctx);
      final requestBody = builder.buildRequestBody(ctx);

      final request = http.Request('POST', uri)
        ..headers.addAll(builder.buildHeaders(ctx))
        ..headers.addAll({'Accept': 'text/event-stream', 'Cache-Control': 'no-cache'})
        ..body = jsonEncode(requestBody);

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode < 200 || streamedResponse.statusCode >= 300) {
        final errorBody = await streamedResponse.stream.bytesToString();
        throw Exception('${streamedResponse.statusCode} $errorBody');
      }

      final parser = SseParser();
      final stream = streamedResponse.stream.transform(utf8.decoder);

      await for (final rawChunk in stream) {
        final events = parser.addChunk(rawChunk);
        for (final event in events) {
          try {
            final decoded = SseEventDecoder.decode(apiMode: apiMode, event: event);
            if (decoded == null) continue;
            yield decoded;
            if (decoded.isDone) return;
          } catch (_) {}
        }
      }

      final lastEvent = parser.close();
      if (lastEvent != null) {
        try {
          final decoded = SseEventDecoder.decode(apiMode: apiMode, event: lastEvent);
          if (decoded != null) {
            yield decoded;
            if (decoded.isDone) return;
          }
        } catch (_) {}
      }
      yield const ChatChunk(isDone: true);
    } catch (e) {
      yield ChatChunk(isDone: true, error: '$e');
    } finally {
      client.close();
    }
  }
}
````

## File: lib/data/database/database.dart
````dart
import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../core/models/app_config.dart';
import '../../core/models/session.dart';

part 'database.g.dart'; // 运行 build_runner 生成

// ==========================================
// Type Converters
// ==========================================
class AppConfigConverter extends TypeConverter<AppConfig, String> {
  const AppConfigConverter();
  @override
  AppConfig fromSql(String fromDb) => 
    AppConfig.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(AppConfig value) => jsonEncode(value.toJson());
}

class SessionConfigConverter extends TypeConverter<SessionConfig, String> {
  const SessionConfigConverter();
  @override
  SessionConfig fromSql(String fromDb) => 
    SessionConfig.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(SessionConfig value) => jsonEncode(value.toJson());
}

// ==========================================
// Tables
// ==========================================
class DbConfigStore extends Table {
  IntColumn get id => integer().autoIncrement()(); // 永远只有一条记录 id=1
  TextColumn get activeProfileId => text()();
}

class DbConfigProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get config => text().map(const AppConfigConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

class DbSessions extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  TextColumn get config => text().map(const SessionConfigConverter()).nullable()();
  BoolColumn get hasUnseenUpdate => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DbChatRounds extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text().references(DbSessions, #id, onDelete: KeyAction.cascade)();
  TextColumn get parentId => text().nullable()();
  IntColumn get createdAt => integer()();
  TextColumn get userContent => text()();
  TextColumn get assistantThinking => text().nullable()();
  TextColumn get assistantContent => text().nullable()();
  BoolColumn get isIncomplete => boolean().withDefault(const Constant(false))();
  BoolColumn get hasUnseenUpdate => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DbAttachments extends Table {
  TextColumn get id => text()();
  TextColumn get roundId => text().references(DbChatRounds, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get relativePath => text()();
  BoolColumn get isImage => boolean().withDefault(const Constant(false))();
  TextColumn get mimeType => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// Database
// ==========================================
@DriftDatabase(
  tables: [
    DbConfigStore,
    DbConfigProfiles,
    DbSessions,
    DbChatRounds,
    DbAttachments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          // 开启 SQLite 外键约束，实现级联删除
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ai_chat_v1.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
````

## File: lib/data/database/database.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DbConfigStoreTable extends DbConfigStore
    with TableInfo<$DbConfigStoreTable, DbConfigStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbConfigStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activeProfileIdMeta = const VerificationMeta(
    'activeProfileId',
  );
  @override
  late final GeneratedColumn<String> activeProfileId = GeneratedColumn<String>(
    'active_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, activeProfileId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_config_store';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbConfigStoreData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('active_profile_id')) {
      context.handle(
        _activeProfileIdMeta,
        activeProfileId.isAcceptableOrUnknown(
          data['active_profile_id']!,
          _activeProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_activeProfileIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbConfigStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbConfigStoreData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activeProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}active_profile_id'],
      )!,
    );
  }

  @override
  $DbConfigStoreTable createAlias(String alias) {
    return $DbConfigStoreTable(attachedDatabase, alias);
  }
}

class DbConfigStoreData extends DataClass
    implements Insertable<DbConfigStoreData> {
  final int id;
  final String activeProfileId;
  const DbConfigStoreData({required this.id, required this.activeProfileId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['active_profile_id'] = Variable<String>(activeProfileId);
    return map;
  }

  DbConfigStoreCompanion toCompanion(bool nullToAbsent) {
    return DbConfigStoreCompanion(
      id: Value(id),
      activeProfileId: Value(activeProfileId),
    );
  }

  factory DbConfigStoreData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbConfigStoreData(
      id: serializer.fromJson<int>(json['id']),
      activeProfileId: serializer.fromJson<String>(json['activeProfileId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activeProfileId': serializer.toJson<String>(activeProfileId),
    };
  }

  DbConfigStoreData copyWith({int? id, String? activeProfileId}) =>
      DbConfigStoreData(
        id: id ?? this.id,
        activeProfileId: activeProfileId ?? this.activeProfileId,
      );
  DbConfigStoreData copyWithCompanion(DbConfigStoreCompanion data) {
    return DbConfigStoreData(
      id: data.id.present ? data.id.value : this.id,
      activeProfileId: data.activeProfileId.present
          ? data.activeProfileId.value
          : this.activeProfileId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigStoreData(')
          ..write('id: $id, ')
          ..write('activeProfileId: $activeProfileId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, activeProfileId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConfigStoreData &&
          other.id == this.id &&
          other.activeProfileId == this.activeProfileId);
}

class DbConfigStoreCompanion extends UpdateCompanion<DbConfigStoreData> {
  final Value<int> id;
  final Value<String> activeProfileId;
  const DbConfigStoreCompanion({
    this.id = const Value.absent(),
    this.activeProfileId = const Value.absent(),
  });
  DbConfigStoreCompanion.insert({
    this.id = const Value.absent(),
    required String activeProfileId,
  }) : activeProfileId = Value(activeProfileId);
  static Insertable<DbConfigStoreData> custom({
    Expression<int>? id,
    Expression<String>? activeProfileId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activeProfileId != null) 'active_profile_id': activeProfileId,
    });
  }

  DbConfigStoreCompanion copyWith({
    Value<int>? id,
    Value<String>? activeProfileId,
  }) {
    return DbConfigStoreCompanion(
      id: id ?? this.id,
      activeProfileId: activeProfileId ?? this.activeProfileId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activeProfileId.present) {
      map['active_profile_id'] = Variable<String>(activeProfileId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigStoreCompanion(')
          ..write('id: $id, ')
          ..write('activeProfileId: $activeProfileId')
          ..write(')'))
        .toString();
  }
}

class $DbConfigProfilesTable extends DbConfigProfiles
    with TableInfo<$DbConfigProfilesTable, DbConfigProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbConfigProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AppConfig, String> config =
      GeneratedColumn<String>(
        'config',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AppConfig>($DbConfigProfilesTable.$converterconfig);
  @override
  List<GeneratedColumn> get $columns => [id, name, config];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_config_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbConfigProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbConfigProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbConfigProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      config: $DbConfigProfilesTable.$converterconfig.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}config'],
        )!,
      ),
    );
  }

  @override
  $DbConfigProfilesTable createAlias(String alias) {
    return $DbConfigProfilesTable(attachedDatabase, alias);
  }

  static TypeConverter<AppConfig, String> $converterconfig =
      const AppConfigConverter();
}

class DbConfigProfile extends DataClass implements Insertable<DbConfigProfile> {
  final String id;
  final String name;
  final AppConfig config;
  const DbConfigProfile({
    required this.id,
    required this.name,
    required this.config,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    {
      map['config'] = Variable<String>(
        $DbConfigProfilesTable.$converterconfig.toSql(config),
      );
    }
    return map;
  }

  DbConfigProfilesCompanion toCompanion(bool nullToAbsent) {
    return DbConfigProfilesCompanion(
      id: Value(id),
      name: Value(name),
      config: Value(config),
    );
  }

  factory DbConfigProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbConfigProfile(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      config: serializer.fromJson<AppConfig>(json['config']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'config': serializer.toJson<AppConfig>(config),
    };
  }

  DbConfigProfile copyWith({String? id, String? name, AppConfig? config}) =>
      DbConfigProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        config: config ?? this.config,
      );
  DbConfigProfile copyWithCompanion(DbConfigProfilesCompanion data) {
    return DbConfigProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      config: data.config.present ? data.config.value : this.config,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('config: $config')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, config);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConfigProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.config == this.config);
}

class DbConfigProfilesCompanion extends UpdateCompanion<DbConfigProfile> {
  final Value<String> id;
  final Value<String> name;
  final Value<AppConfig> config;
  final Value<int> rowid;
  const DbConfigProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.config = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbConfigProfilesCompanion.insert({
    required String id,
    required String name,
    required AppConfig config,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       config = Value(config);
  static Insertable<DbConfigProfile> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? config,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (config != null) 'config': config,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbConfigProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<AppConfig>? config,
    Value<int>? rowid,
  }) {
    return DbConfigProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      config: config ?? this.config,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(
        $DbConfigProfilesTable.$converterconfig.toSql(config.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('config: $config, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbSessionsTable extends DbSessions
    with TableInfo<$DbSessionsTable, DbSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SessionConfig?, String> config =
      GeneratedColumn<String>(
        'config',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<SessionConfig?>($DbSessionsTable.$converterconfign);
  static const VerificationMeta _hasUnseenUpdateMeta = const VerificationMeta(
    'hasUnseenUpdate',
  );
  @override
  late final GeneratedColumn<bool> hasUnseenUpdate = GeneratedColumn<bool>(
    'has_unseen_update',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_unseen_update" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    createdAt,
    updatedAt,
    config,
    hasUnseenUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('has_unseen_update')) {
      context.handle(
        _hasUnseenUpdateMeta,
        hasUnseenUpdate.isAcceptableOrUnknown(
          data['has_unseen_update']!,
          _hasUnseenUpdateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      config: $DbSessionsTable.$converterconfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}config'],
        ),
      ),
      hasUnseenUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_unseen_update'],
      )!,
    );
  }

  @override
  $DbSessionsTable createAlias(String alias) {
    return $DbSessionsTable(attachedDatabase, alias);
  }

  static TypeConverter<SessionConfig, String> $converterconfig =
      const SessionConfigConverter();
  static TypeConverter<SessionConfig?, String?> $converterconfign =
      NullAwareTypeConverter.wrap($converterconfig);
}

class DbSession extends DataClass implements Insertable<DbSession> {
  final String id;
  final String title;
  final int createdAt;
  final int updatedAt;
  final SessionConfig? config;
  final bool hasUnseenUpdate;
  const DbSession({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.config,
    required this.hasUnseenUpdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || config != null) {
      map['config'] = Variable<String>(
        $DbSessionsTable.$converterconfign.toSql(config),
      );
    }
    map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate);
    return map;
  }

  DbSessionsCompanion toCompanion(bool nullToAbsent) {
    return DbSessionsCompanion(
      id: Value(id),
      title: Value(title),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      config: config == null && nullToAbsent
          ? const Value.absent()
          : Value(config),
      hasUnseenUpdate: Value(hasUnseenUpdate),
    );
  }

  factory DbSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSession(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      config: serializer.fromJson<SessionConfig?>(json['config']),
      hasUnseenUpdate: serializer.fromJson<bool>(json['hasUnseenUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'config': serializer.toJson<SessionConfig?>(config),
      'hasUnseenUpdate': serializer.toJson<bool>(hasUnseenUpdate),
    };
  }

  DbSession copyWith({
    String? id,
    String? title,
    int? createdAt,
    int? updatedAt,
    Value<SessionConfig?> config = const Value.absent(),
    bool? hasUnseenUpdate,
  }) => DbSession(
    id: id ?? this.id,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    config: config.present ? config.value : this.config,
    hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
  );
  DbSession copyWithCompanion(DbSessionsCompanion data) {
    return DbSession(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      config: data.config.present ? data.config.value : this.config,
      hasUnseenUpdate: data.hasUnseenUpdate.present
          ? data.hasUnseenUpdate.value
          : this.hasUnseenUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSession(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('config: $config, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, createdAt, updatedAt, config, hasUnseenUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSession &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.config == this.config &&
          other.hasUnseenUpdate == this.hasUnseenUpdate);
}

class DbSessionsCompanion extends UpdateCompanion<DbSession> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<SessionConfig?> config;
  final Value<bool> hasUnseenUpdate;
  final Value<int> rowid;
  const DbSessionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.config = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSessionsCompanion.insert({
    required String id,
    required String title,
    required int createdAt,
    required int updatedAt,
    this.config = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DbSession> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? config,
    Expression<bool>? hasUnseenUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (config != null) 'config': config,
      if (hasUnseenUpdate != null) 'has_unseen_update': hasUnseenUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<SessionConfig?>? config,
    Value<bool>? hasUnseenUpdate,
    Value<int>? rowid,
  }) {
    return DbSessionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      config: config ?? this.config,
      hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(
        $DbSessionsTable.$converterconfign.toSql(config.value),
      );
    }
    if (hasUnseenUpdate.present) {
      map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbSessionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('config: $config, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbChatRoundsTable extends DbChatRounds
    with TableInfo<$DbChatRoundsTable, DbChatRound> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbChatRoundsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_sessions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userContentMeta = const VerificationMeta(
    'userContent',
  );
  @override
  late final GeneratedColumn<String> userContent = GeneratedColumn<String>(
    'user_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assistantThinkingMeta = const VerificationMeta(
    'assistantThinking',
  );
  @override
  late final GeneratedColumn<String> assistantThinking =
      GeneratedColumn<String>(
        'assistant_thinking',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _assistantContentMeta = const VerificationMeta(
    'assistantContent',
  );
  @override
  late final GeneratedColumn<String> assistantContent = GeneratedColumn<String>(
    'assistant_content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isIncompleteMeta = const VerificationMeta(
    'isIncomplete',
  );
  @override
  late final GeneratedColumn<bool> isIncomplete = GeneratedColumn<bool>(
    'is_incomplete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_incomplete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hasUnseenUpdateMeta = const VerificationMeta(
    'hasUnseenUpdate',
  );
  @override
  late final GeneratedColumn<bool> hasUnseenUpdate = GeneratedColumn<bool>(
    'has_unseen_update',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_unseen_update" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    parentId,
    createdAt,
    userContent,
    assistantThinking,
    assistantContent,
    isIncomplete,
    hasUnseenUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_chat_rounds';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbChatRound> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('user_content')) {
      context.handle(
        _userContentMeta,
        userContent.isAcceptableOrUnknown(
          data['user_content']!,
          _userContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userContentMeta);
    }
    if (data.containsKey('assistant_thinking')) {
      context.handle(
        _assistantThinkingMeta,
        assistantThinking.isAcceptableOrUnknown(
          data['assistant_thinking']!,
          _assistantThinkingMeta,
        ),
      );
    }
    if (data.containsKey('assistant_content')) {
      context.handle(
        _assistantContentMeta,
        assistantContent.isAcceptableOrUnknown(
          data['assistant_content']!,
          _assistantContentMeta,
        ),
      );
    }
    if (data.containsKey('is_incomplete')) {
      context.handle(
        _isIncompleteMeta,
        isIncomplete.isAcceptableOrUnknown(
          data['is_incomplete']!,
          _isIncompleteMeta,
        ),
      );
    }
    if (data.containsKey('has_unseen_update')) {
      context.handle(
        _hasUnseenUpdateMeta,
        hasUnseenUpdate.isAcceptableOrUnknown(
          data['has_unseen_update']!,
          _hasUnseenUpdateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbChatRound map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbChatRound(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      userContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_content'],
      )!,
      assistantThinking: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assistant_thinking'],
      ),
      assistantContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assistant_content'],
      ),
      isIncomplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_incomplete'],
      )!,
      hasUnseenUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_unseen_update'],
      )!,
    );
  }

  @override
  $DbChatRoundsTable createAlias(String alias) {
    return $DbChatRoundsTable(attachedDatabase, alias);
  }
}

class DbChatRound extends DataClass implements Insertable<DbChatRound> {
  final String id;
  final String sessionId;
  final String? parentId;
  final int createdAt;
  final String userContent;
  final String? assistantThinking;
  final String? assistantContent;
  final bool isIncomplete;
  final bool hasUnseenUpdate;
  const DbChatRound({
    required this.id,
    required this.sessionId,
    this.parentId,
    required this.createdAt,
    required this.userContent,
    this.assistantThinking,
    this.assistantContent,
    required this.isIncomplete,
    required this.hasUnseenUpdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['user_content'] = Variable<String>(userContent);
    if (!nullToAbsent || assistantThinking != null) {
      map['assistant_thinking'] = Variable<String>(assistantThinking);
    }
    if (!nullToAbsent || assistantContent != null) {
      map['assistant_content'] = Variable<String>(assistantContent);
    }
    map['is_incomplete'] = Variable<bool>(isIncomplete);
    map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate);
    return map;
  }

  DbChatRoundsCompanion toCompanion(bool nullToAbsent) {
    return DbChatRoundsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      createdAt: Value(createdAt),
      userContent: Value(userContent),
      assistantThinking: assistantThinking == null && nullToAbsent
          ? const Value.absent()
          : Value(assistantThinking),
      assistantContent: assistantContent == null && nullToAbsent
          ? const Value.absent()
          : Value(assistantContent),
      isIncomplete: Value(isIncomplete),
      hasUnseenUpdate: Value(hasUnseenUpdate),
    );
  }

  factory DbChatRound.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbChatRound(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      userContent: serializer.fromJson<String>(json['userContent']),
      assistantThinking: serializer.fromJson<String?>(
        json['assistantThinking'],
      ),
      assistantContent: serializer.fromJson<String?>(json['assistantContent']),
      isIncomplete: serializer.fromJson<bool>(json['isIncomplete']),
      hasUnseenUpdate: serializer.fromJson<bool>(json['hasUnseenUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'parentId': serializer.toJson<String?>(parentId),
      'createdAt': serializer.toJson<int>(createdAt),
      'userContent': serializer.toJson<String>(userContent),
      'assistantThinking': serializer.toJson<String?>(assistantThinking),
      'assistantContent': serializer.toJson<String?>(assistantContent),
      'isIncomplete': serializer.toJson<bool>(isIncomplete),
      'hasUnseenUpdate': serializer.toJson<bool>(hasUnseenUpdate),
    };
  }

  DbChatRound copyWith({
    String? id,
    String? sessionId,
    Value<String?> parentId = const Value.absent(),
    int? createdAt,
    String? userContent,
    Value<String?> assistantThinking = const Value.absent(),
    Value<String?> assistantContent = const Value.absent(),
    bool? isIncomplete,
    bool? hasUnseenUpdate,
  }) => DbChatRound(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    parentId: parentId.present ? parentId.value : this.parentId,
    createdAt: createdAt ?? this.createdAt,
    userContent: userContent ?? this.userContent,
    assistantThinking: assistantThinking.present
        ? assistantThinking.value
        : this.assistantThinking,
    assistantContent: assistantContent.present
        ? assistantContent.value
        : this.assistantContent,
    isIncomplete: isIncomplete ?? this.isIncomplete,
    hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
  );
  DbChatRound copyWithCompanion(DbChatRoundsCompanion data) {
    return DbChatRound(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      userContent: data.userContent.present
          ? data.userContent.value
          : this.userContent,
      assistantThinking: data.assistantThinking.present
          ? data.assistantThinking.value
          : this.assistantThinking,
      assistantContent: data.assistantContent.present
          ? data.assistantContent.value
          : this.assistantContent,
      isIncomplete: data.isIncomplete.present
          ? data.isIncomplete.value
          : this.isIncomplete,
      hasUnseenUpdate: data.hasUnseenUpdate.present
          ? data.hasUnseenUpdate.value
          : this.hasUnseenUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbChatRound(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('userContent: $userContent, ')
          ..write('assistantThinking: $assistantThinking, ')
          ..write('assistantContent: $assistantContent, ')
          ..write('isIncomplete: $isIncomplete, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    parentId,
    createdAt,
    userContent,
    assistantThinking,
    assistantContent,
    isIncomplete,
    hasUnseenUpdate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbChatRound &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt &&
          other.userContent == this.userContent &&
          other.assistantThinking == this.assistantThinking &&
          other.assistantContent == this.assistantContent &&
          other.isIncomplete == this.isIncomplete &&
          other.hasUnseenUpdate == this.hasUnseenUpdate);
}

class DbChatRoundsCompanion extends UpdateCompanion<DbChatRound> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String?> parentId;
  final Value<int> createdAt;
  final Value<String> userContent;
  final Value<String?> assistantThinking;
  final Value<String?> assistantContent;
  final Value<bool> isIncomplete;
  final Value<bool> hasUnseenUpdate;
  final Value<int> rowid;
  const DbChatRoundsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.userContent = const Value.absent(),
    this.assistantThinking = const Value.absent(),
    this.assistantContent = const Value.absent(),
    this.isIncomplete = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbChatRoundsCompanion.insert({
    required String id,
    required String sessionId,
    this.parentId = const Value.absent(),
    required int createdAt,
    required String userContent,
    this.assistantThinking = const Value.absent(),
    this.assistantContent = const Value.absent(),
    this.isIncomplete = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       createdAt = Value(createdAt),
       userContent = Value(userContent);
  static Insertable<DbChatRound> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? parentId,
    Expression<int>? createdAt,
    Expression<String>? userContent,
    Expression<String>? assistantThinking,
    Expression<String>? assistantContent,
    Expression<bool>? isIncomplete,
    Expression<bool>? hasUnseenUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (parentId != null) 'parent_id': parentId,
      if (createdAt != null) 'created_at': createdAt,
      if (userContent != null) 'user_content': userContent,
      if (assistantThinking != null) 'assistant_thinking': assistantThinking,
      if (assistantContent != null) 'assistant_content': assistantContent,
      if (isIncomplete != null) 'is_incomplete': isIncomplete,
      if (hasUnseenUpdate != null) 'has_unseen_update': hasUnseenUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbChatRoundsCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String?>? parentId,
    Value<int>? createdAt,
    Value<String>? userContent,
    Value<String?>? assistantThinking,
    Value<String?>? assistantContent,
    Value<bool>? isIncomplete,
    Value<bool>? hasUnseenUpdate,
    Value<int>? rowid,
  }) {
    return DbChatRoundsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      parentId: parentId ?? this.parentId,
      createdAt: createdAt ?? this.createdAt,
      userContent: userContent ?? this.userContent,
      assistantThinking: assistantThinking ?? this.assistantThinking,
      assistantContent: assistantContent ?? this.assistantContent,
      isIncomplete: isIncomplete ?? this.isIncomplete,
      hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (userContent.present) {
      map['user_content'] = Variable<String>(userContent.value);
    }
    if (assistantThinking.present) {
      map['assistant_thinking'] = Variable<String>(assistantThinking.value);
    }
    if (assistantContent.present) {
      map['assistant_content'] = Variable<String>(assistantContent.value);
    }
    if (isIncomplete.present) {
      map['is_incomplete'] = Variable<bool>(isIncomplete.value);
    }
    if (hasUnseenUpdate.present) {
      map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbChatRoundsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('userContent: $userContent, ')
          ..write('assistantThinking: $assistantThinking, ')
          ..write('assistantContent: $assistantContent, ')
          ..write('isIncomplete: $isIncomplete, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbAttachmentsTable extends DbAttachments
    with TableInfo<$DbAttachmentsTable, DbAttachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roundIdMeta = const VerificationMeta(
    'roundId',
  );
  @override
  late final GeneratedColumn<String> roundId = GeneratedColumn<String>(
    'round_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_chat_rounds (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relativePathMeta = const VerificationMeta(
    'relativePath',
  );
  @override
  late final GeneratedColumn<String> relativePath = GeneratedColumn<String>(
    'relative_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isImageMeta = const VerificationMeta(
    'isImage',
  );
  @override
  late final GeneratedColumn<bool> isImage = GeneratedColumn<bool>(
    'is_image',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_image" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roundId,
    name,
    relativePath,
    isImage,
    mimeType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbAttachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('round_id')) {
      context.handle(
        _roundIdMeta,
        roundId.isAcceptableOrUnknown(data['round_id']!, _roundIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roundIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('relative_path')) {
      context.handle(
        _relativePathMeta,
        relativePath.isAcceptableOrUnknown(
          data['relative_path']!,
          _relativePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relativePathMeta);
    }
    if (data.containsKey('is_image')) {
      context.handle(
        _isImageMeta,
        isImage.isAcceptableOrUnknown(data['is_image']!, _isImageMeta),
      );
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAttachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAttachment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roundId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      relativePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relative_path'],
      )!,
      isImage: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_image'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
    );
  }

  @override
  $DbAttachmentsTable createAlias(String alias) {
    return $DbAttachmentsTable(attachedDatabase, alias);
  }
}

class DbAttachment extends DataClass implements Insertable<DbAttachment> {
  final String id;
  final String roundId;
  final String name;
  final String relativePath;
  final bool isImage;
  final String? mimeType;
  const DbAttachment({
    required this.id,
    required this.roundId,
    required this.name,
    required this.relativePath,
    required this.isImage,
    this.mimeType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['round_id'] = Variable<String>(roundId);
    map['name'] = Variable<String>(name);
    map['relative_path'] = Variable<String>(relativePath);
    map['is_image'] = Variable<bool>(isImage);
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    return map;
  }

  DbAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return DbAttachmentsCompanion(
      id: Value(id),
      roundId: Value(roundId),
      name: Value(name),
      relativePath: Value(relativePath),
      isImage: Value(isImage),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
    );
  }

  factory DbAttachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAttachment(
      id: serializer.fromJson<String>(json['id']),
      roundId: serializer.fromJson<String>(json['roundId']),
      name: serializer.fromJson<String>(json['name']),
      relativePath: serializer.fromJson<String>(json['relativePath']),
      isImage: serializer.fromJson<bool>(json['isImage']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roundId': serializer.toJson<String>(roundId),
      'name': serializer.toJson<String>(name),
      'relativePath': serializer.toJson<String>(relativePath),
      'isImage': serializer.toJson<bool>(isImage),
      'mimeType': serializer.toJson<String?>(mimeType),
    };
  }

  DbAttachment copyWith({
    String? id,
    String? roundId,
    String? name,
    String? relativePath,
    bool? isImage,
    Value<String?> mimeType = const Value.absent(),
  }) => DbAttachment(
    id: id ?? this.id,
    roundId: roundId ?? this.roundId,
    name: name ?? this.name,
    relativePath: relativePath ?? this.relativePath,
    isImage: isImage ?? this.isImage,
    mimeType: mimeType.present ? mimeType.value : this.mimeType,
  );
  DbAttachment copyWithCompanion(DbAttachmentsCompanion data) {
    return DbAttachment(
      id: data.id.present ? data.id.value : this.id,
      roundId: data.roundId.present ? data.roundId.value : this.roundId,
      name: data.name.present ? data.name.value : this.name,
      relativePath: data.relativePath.present
          ? data.relativePath.value
          : this.relativePath,
      isImage: data.isImage.present ? data.isImage.value : this.isImage,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAttachment(')
          ..write('id: $id, ')
          ..write('roundId: $roundId, ')
          ..write('name: $name, ')
          ..write('relativePath: $relativePath, ')
          ..write('isImage: $isImage, ')
          ..write('mimeType: $mimeType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roundId, name, relativePath, isImage, mimeType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAttachment &&
          other.id == this.id &&
          other.roundId == this.roundId &&
          other.name == this.name &&
          other.relativePath == this.relativePath &&
          other.isImage == this.isImage &&
          other.mimeType == this.mimeType);
}

class DbAttachmentsCompanion extends UpdateCompanion<DbAttachment> {
  final Value<String> id;
  final Value<String> roundId;
  final Value<String> name;
  final Value<String> relativePath;
  final Value<bool> isImage;
  final Value<String?> mimeType;
  final Value<int> rowid;
  const DbAttachmentsCompanion({
    this.id = const Value.absent(),
    this.roundId = const Value.absent(),
    this.name = const Value.absent(),
    this.relativePath = const Value.absent(),
    this.isImage = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbAttachmentsCompanion.insert({
    required String id,
    required String roundId,
    required String name,
    required String relativePath,
    this.isImage = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roundId = Value(roundId),
       name = Value(name),
       relativePath = Value(relativePath);
  static Insertable<DbAttachment> custom({
    Expression<String>? id,
    Expression<String>? roundId,
    Expression<String>? name,
    Expression<String>? relativePath,
    Expression<bool>? isImage,
    Expression<String>? mimeType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roundId != null) 'round_id': roundId,
      if (name != null) 'name': name,
      if (relativePath != null) 'relative_path': relativePath,
      if (isImage != null) 'is_image': isImage,
      if (mimeType != null) 'mime_type': mimeType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbAttachmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? roundId,
    Value<String>? name,
    Value<String>? relativePath,
    Value<bool>? isImage,
    Value<String?>? mimeType,
    Value<int>? rowid,
  }) {
    return DbAttachmentsCompanion(
      id: id ?? this.id,
      roundId: roundId ?? this.roundId,
      name: name ?? this.name,
      relativePath: relativePath ?? this.relativePath,
      isImage: isImage ?? this.isImage,
      mimeType: mimeType ?? this.mimeType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roundId.present) {
      map['round_id'] = Variable<String>(roundId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (relativePath.present) {
      map['relative_path'] = Variable<String>(relativePath.value);
    }
    if (isImage.present) {
      map['is_image'] = Variable<bool>(isImage.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('roundId: $roundId, ')
          ..write('name: $name, ')
          ..write('relativePath: $relativePath, ')
          ..write('isImage: $isImage, ')
          ..write('mimeType: $mimeType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DbConfigStoreTable dbConfigStore = $DbConfigStoreTable(this);
  late final $DbConfigProfilesTable dbConfigProfiles = $DbConfigProfilesTable(
    this,
  );
  late final $DbSessionsTable dbSessions = $DbSessionsTable(this);
  late final $DbChatRoundsTable dbChatRounds = $DbChatRoundsTable(this);
  late final $DbAttachmentsTable dbAttachments = $DbAttachmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dbConfigStore,
    dbConfigProfiles,
    dbSessions,
    dbChatRounds,
    dbAttachments,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'db_sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('db_chat_rounds', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'db_chat_rounds',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('db_attachments', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DbConfigStoreTableCreateCompanionBuilder =
    DbConfigStoreCompanion Function({
      Value<int> id,
      required String activeProfileId,
    });
typedef $$DbConfigStoreTableUpdateCompanionBuilder =
    DbConfigStoreCompanion Function({
      Value<int> id,
      Value<String> activeProfileId,
    });

class $$DbConfigStoreTableFilterComposer
    extends Composer<_$AppDatabase, $DbConfigStoreTable> {
  $$DbConfigStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activeProfileId => $composableBuilder(
    column: $table.activeProfileId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DbConfigStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $DbConfigStoreTable> {
  $$DbConfigStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activeProfileId => $composableBuilder(
    column: $table.activeProfileId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbConfigStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbConfigStoreTable> {
  $$DbConfigStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get activeProfileId => $composableBuilder(
    column: $table.activeProfileId,
    builder: (column) => column,
  );
}

class $$DbConfigStoreTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbConfigStoreTable,
          DbConfigStoreData,
          $$DbConfigStoreTableFilterComposer,
          $$DbConfigStoreTableOrderingComposer,
          $$DbConfigStoreTableAnnotationComposer,
          $$DbConfigStoreTableCreateCompanionBuilder,
          $$DbConfigStoreTableUpdateCompanionBuilder,
          (
            DbConfigStoreData,
            BaseReferences<
              _$AppDatabase,
              $DbConfigStoreTable,
              DbConfigStoreData
            >,
          ),
          DbConfigStoreData,
          PrefetchHooks Function()
        > {
  $$DbConfigStoreTableTableManager(_$AppDatabase db, $DbConfigStoreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbConfigStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbConfigStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbConfigStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> activeProfileId = const Value.absent(),
              }) => DbConfigStoreCompanion(
                id: id,
                activeProfileId: activeProfileId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String activeProfileId,
              }) => DbConfigStoreCompanion.insert(
                id: id,
                activeProfileId: activeProfileId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DbConfigStoreTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbConfigStoreTable,
      DbConfigStoreData,
      $$DbConfigStoreTableFilterComposer,
      $$DbConfigStoreTableOrderingComposer,
      $$DbConfigStoreTableAnnotationComposer,
      $$DbConfigStoreTableCreateCompanionBuilder,
      $$DbConfigStoreTableUpdateCompanionBuilder,
      (
        DbConfigStoreData,
        BaseReferences<_$AppDatabase, $DbConfigStoreTable, DbConfigStoreData>,
      ),
      DbConfigStoreData,
      PrefetchHooks Function()
    >;
typedef $$DbConfigProfilesTableCreateCompanionBuilder =
    DbConfigProfilesCompanion Function({
      required String id,
      required String name,
      required AppConfig config,
      Value<int> rowid,
    });
typedef $$DbConfigProfilesTableUpdateCompanionBuilder =
    DbConfigProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<AppConfig> config,
      Value<int> rowid,
    });

class $$DbConfigProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $DbConfigProfilesTable> {
  $$DbConfigProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AppConfig, AppConfig, String> get config =>
      $composableBuilder(
        column: $table.config,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$DbConfigProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbConfigProfilesTable> {
  $$DbConfigProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbConfigProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbConfigProfilesTable> {
  $$DbConfigProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AppConfig, String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);
}

class $$DbConfigProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbConfigProfilesTable,
          DbConfigProfile,
          $$DbConfigProfilesTableFilterComposer,
          $$DbConfigProfilesTableOrderingComposer,
          $$DbConfigProfilesTableAnnotationComposer,
          $$DbConfigProfilesTableCreateCompanionBuilder,
          $$DbConfigProfilesTableUpdateCompanionBuilder,
          (
            DbConfigProfile,
            BaseReferences<
              _$AppDatabase,
              $DbConfigProfilesTable,
              DbConfigProfile
            >,
          ),
          DbConfigProfile,
          PrefetchHooks Function()
        > {
  $$DbConfigProfilesTableTableManager(
    _$AppDatabase db,
    $DbConfigProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbConfigProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbConfigProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbConfigProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<AppConfig> config = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbConfigProfilesCompanion(
                id: id,
                name: name,
                config: config,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required AppConfig config,
                Value<int> rowid = const Value.absent(),
              }) => DbConfigProfilesCompanion.insert(
                id: id,
                name: name,
                config: config,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DbConfigProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbConfigProfilesTable,
      DbConfigProfile,
      $$DbConfigProfilesTableFilterComposer,
      $$DbConfigProfilesTableOrderingComposer,
      $$DbConfigProfilesTableAnnotationComposer,
      $$DbConfigProfilesTableCreateCompanionBuilder,
      $$DbConfigProfilesTableUpdateCompanionBuilder,
      (
        DbConfigProfile,
        BaseReferences<_$AppDatabase, $DbConfigProfilesTable, DbConfigProfile>,
      ),
      DbConfigProfile,
      PrefetchHooks Function()
    >;
typedef $$DbSessionsTableCreateCompanionBuilder =
    DbSessionsCompanion Function({
      required String id,
      required String title,
      required int createdAt,
      required int updatedAt,
      Value<SessionConfig?> config,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });
typedef $$DbSessionsTableUpdateCompanionBuilder =
    DbSessionsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<SessionConfig?> config,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });

final class $$DbSessionsTableReferences
    extends BaseReferences<_$AppDatabase, $DbSessionsTable, DbSession> {
  $$DbSessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbChatRoundsTable, List<DbChatRound>>
  _dbChatRoundsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbChatRounds,
    aliasName: $_aliasNameGenerator(
      db.dbSessions.id,
      db.dbChatRounds.sessionId,
    ),
  );

  $$DbChatRoundsTableProcessedTableManager get dbChatRoundsRefs {
    final manager = $$DbChatRoundsTableTableManager(
      $_db,
      $_db.dbChatRounds,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbChatRoundsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $DbSessionsTable> {
  $$DbSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SessionConfig?, SessionConfig, String>
  get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbChatRoundsRefs(
    Expression<bool> Function($$DbChatRoundsTableFilterComposer f) f,
  ) {
    final $$DbChatRoundsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableFilterComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSessionsTable> {
  $$DbSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSessionsTable> {
  $$DbSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SessionConfig?, String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);

  GeneratedColumn<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => column,
  );

  Expression<T> dbChatRoundsRefs<T extends Object>(
    Expression<T> Function($$DbChatRoundsTableAnnotationComposer a) f,
  ) {
    final $$DbChatRoundsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSessionsTable,
          DbSession,
          $$DbSessionsTableFilterComposer,
          $$DbSessionsTableOrderingComposer,
          $$DbSessionsTableAnnotationComposer,
          $$DbSessionsTableCreateCompanionBuilder,
          $$DbSessionsTableUpdateCompanionBuilder,
          (DbSession, $$DbSessionsTableReferences),
          DbSession,
          PrefetchHooks Function({bool dbChatRoundsRefs})
        > {
  $$DbSessionsTableTableManager(_$AppDatabase db, $DbSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<SessionConfig?> config = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSessionsCompanion(
                id: id,
                title: title,
                createdAt: createdAt,
                updatedAt: updatedAt,
                config: config,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int createdAt,
                required int updatedAt,
                Value<SessionConfig?> config = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSessionsCompanion.insert(
                id: id,
                title: title,
                createdAt: createdAt,
                updatedAt: updatedAt,
                config: config,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dbChatRoundsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dbChatRoundsRefs) db.dbChatRounds],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbChatRoundsRefs)
                    await $_getPrefetchedData<
                      DbSession,
                      $DbSessionsTable,
                      DbChatRound
                    >(
                      currentTable: table,
                      referencedTable: $$DbSessionsTableReferences
                          ._dbChatRoundsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DbSessionsTableReferences(
                            db,
                            table,
                            p0,
                          ).dbChatRoundsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sessionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DbSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSessionsTable,
      DbSession,
      $$DbSessionsTableFilterComposer,
      $$DbSessionsTableOrderingComposer,
      $$DbSessionsTableAnnotationComposer,
      $$DbSessionsTableCreateCompanionBuilder,
      $$DbSessionsTableUpdateCompanionBuilder,
      (DbSession, $$DbSessionsTableReferences),
      DbSession,
      PrefetchHooks Function({bool dbChatRoundsRefs})
    >;
typedef $$DbChatRoundsTableCreateCompanionBuilder =
    DbChatRoundsCompanion Function({
      required String id,
      required String sessionId,
      Value<String?> parentId,
      required int createdAt,
      required String userContent,
      Value<String?> assistantThinking,
      Value<String?> assistantContent,
      Value<bool> isIncomplete,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });
typedef $$DbChatRoundsTableUpdateCompanionBuilder =
    DbChatRoundsCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<String?> parentId,
      Value<int> createdAt,
      Value<String> userContent,
      Value<String?> assistantThinking,
      Value<String?> assistantContent,
      Value<bool> isIncomplete,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });

final class $$DbChatRoundsTableReferences
    extends BaseReferences<_$AppDatabase, $DbChatRoundsTable, DbChatRound> {
  $$DbChatRoundsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbSessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.dbSessions.createAlias(
        $_aliasNameGenerator(db.dbChatRounds.sessionId, db.dbSessions.id),
      );

  $$DbSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$DbSessionsTableTableManager(
      $_db,
      $_db.dbSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DbAttachmentsTable, List<DbAttachment>>
  _dbAttachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbAttachments,
    aliasName: $_aliasNameGenerator(
      db.dbChatRounds.id,
      db.dbAttachments.roundId,
    ),
  );

  $$DbAttachmentsTableProcessedTableManager get dbAttachmentsRefs {
    final manager = $$DbAttachmentsTableTableManager(
      $_db,
      $_db.dbAttachments,
    ).filter((f) => f.roundId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbAttachmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbChatRoundsTableFilterComposer
    extends Composer<_$AppDatabase, $DbChatRoundsTable> {
  $$DbChatRoundsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userContent => $composableBuilder(
    column: $table.userContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assistantThinking => $composableBuilder(
    column: $table.assistantThinking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assistantContent => $composableBuilder(
    column: $table.assistantContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isIncomplete => $composableBuilder(
    column: $table.isIncomplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnFilters(column),
  );

  $$DbSessionsTableFilterComposer get sessionId {
    final $$DbSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.dbSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSessionsTableFilterComposer(
            $db: $db,
            $table: $db.dbSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dbAttachmentsRefs(
    Expression<bool> Function($$DbAttachmentsTableFilterComposer f) f,
  ) {
    final $$DbAttachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbAttachments,
      getReferencedColumn: (t) => t.roundId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAttachmentsTableFilterComposer(
            $db: $db,
            $table: $db.dbAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbChatRoundsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbChatRoundsTable> {
  $$DbChatRoundsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userContent => $composableBuilder(
    column: $table.userContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assistantThinking => $composableBuilder(
    column: $table.assistantThinking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assistantContent => $composableBuilder(
    column: $table.assistantContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isIncomplete => $composableBuilder(
    column: $table.isIncomplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbSessionsTableOrderingComposer get sessionId {
    final $$DbSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.dbSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.dbSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbChatRoundsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbChatRoundsTable> {
  $$DbChatRoundsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get userContent => $composableBuilder(
    column: $table.userContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assistantThinking => $composableBuilder(
    column: $table.assistantThinking,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assistantContent => $composableBuilder(
    column: $table.assistantContent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isIncomplete => $composableBuilder(
    column: $table.isIncomplete,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => column,
  );

  $$DbSessionsTableAnnotationComposer get sessionId {
    final $$DbSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.dbSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dbAttachmentsRefs<T extends Object>(
    Expression<T> Function($$DbAttachmentsTableAnnotationComposer a) f,
  ) {
    final $$DbAttachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbAttachments,
      getReferencedColumn: (t) => t.roundId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAttachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbChatRoundsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbChatRoundsTable,
          DbChatRound,
          $$DbChatRoundsTableFilterComposer,
          $$DbChatRoundsTableOrderingComposer,
          $$DbChatRoundsTableAnnotationComposer,
          $$DbChatRoundsTableCreateCompanionBuilder,
          $$DbChatRoundsTableUpdateCompanionBuilder,
          (DbChatRound, $$DbChatRoundsTableReferences),
          DbChatRound,
          PrefetchHooks Function({bool sessionId, bool dbAttachmentsRefs})
        > {
  $$DbChatRoundsTableTableManager(_$AppDatabase db, $DbChatRoundsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbChatRoundsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbChatRoundsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbChatRoundsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<String> userContent = const Value.absent(),
                Value<String?> assistantThinking = const Value.absent(),
                Value<String?> assistantContent = const Value.absent(),
                Value<bool> isIncomplete = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbChatRoundsCompanion(
                id: id,
                sessionId: sessionId,
                parentId: parentId,
                createdAt: createdAt,
                userContent: userContent,
                assistantThinking: assistantThinking,
                assistantContent: assistantContent,
                isIncomplete: isIncomplete,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                Value<String?> parentId = const Value.absent(),
                required int createdAt,
                required String userContent,
                Value<String?> assistantThinking = const Value.absent(),
                Value<String?> assistantContent = const Value.absent(),
                Value<bool> isIncomplete = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbChatRoundsCompanion.insert(
                id: id,
                sessionId: sessionId,
                parentId: parentId,
                createdAt: createdAt,
                userContent: userContent,
                assistantThinking: assistantThinking,
                assistantContent: assistantContent,
                isIncomplete: isIncomplete,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbChatRoundsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sessionId = false, dbAttachmentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbAttachmentsRefs) db.dbAttachments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sessionId,
                                    referencedTable:
                                        $$DbChatRoundsTableReferences
                                            ._sessionIdTable(db),
                                    referencedColumn:
                                        $$DbChatRoundsTableReferences
                                            ._sessionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbAttachmentsRefs)
                        await $_getPrefetchedData<
                          DbChatRound,
                          $DbChatRoundsTable,
                          DbAttachment
                        >(
                          currentTable: table,
                          referencedTable: $$DbChatRoundsTableReferences
                              ._dbAttachmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbChatRoundsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbAttachmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roundId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbChatRoundsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbChatRoundsTable,
      DbChatRound,
      $$DbChatRoundsTableFilterComposer,
      $$DbChatRoundsTableOrderingComposer,
      $$DbChatRoundsTableAnnotationComposer,
      $$DbChatRoundsTableCreateCompanionBuilder,
      $$DbChatRoundsTableUpdateCompanionBuilder,
      (DbChatRound, $$DbChatRoundsTableReferences),
      DbChatRound,
      PrefetchHooks Function({bool sessionId, bool dbAttachmentsRefs})
    >;
typedef $$DbAttachmentsTableCreateCompanionBuilder =
    DbAttachmentsCompanion Function({
      required String id,
      required String roundId,
      required String name,
      required String relativePath,
      Value<bool> isImage,
      Value<String?> mimeType,
      Value<int> rowid,
    });
typedef $$DbAttachmentsTableUpdateCompanionBuilder =
    DbAttachmentsCompanion Function({
      Value<String> id,
      Value<String> roundId,
      Value<String> name,
      Value<String> relativePath,
      Value<bool> isImage,
      Value<String?> mimeType,
      Value<int> rowid,
    });

final class $$DbAttachmentsTableReferences
    extends BaseReferences<_$AppDatabase, $DbAttachmentsTable, DbAttachment> {
  $$DbAttachmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbChatRoundsTable _roundIdTable(_$AppDatabase db) =>
      db.dbChatRounds.createAlias(
        $_aliasNameGenerator(db.dbAttachments.roundId, db.dbChatRounds.id),
      );

  $$DbChatRoundsTableProcessedTableManager get roundId {
    final $_column = $_itemColumn<String>('round_id')!;

    final manager = $$DbChatRoundsTableTableManager(
      $_db,
      $_db.dbChatRounds,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbAttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $DbAttachmentsTable> {
  $$DbAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isImage => $composableBuilder(
    column: $table.isImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  $$DbChatRoundsTableFilterComposer get roundId {
    final $$DbChatRoundsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableFilterComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbAttachmentsTable> {
  $$DbAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isImage => $composableBuilder(
    column: $table.isImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbChatRoundsTableOrderingComposer get roundId {
    final $$DbChatRoundsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableOrderingComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbAttachmentsTable> {
  $$DbAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isImage =>
      $composableBuilder(column: $table.isImage, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  $$DbChatRoundsTableAnnotationComposer get roundId {
    final $$DbChatRoundsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbAttachmentsTable,
          DbAttachment,
          $$DbAttachmentsTableFilterComposer,
          $$DbAttachmentsTableOrderingComposer,
          $$DbAttachmentsTableAnnotationComposer,
          $$DbAttachmentsTableCreateCompanionBuilder,
          $$DbAttachmentsTableUpdateCompanionBuilder,
          (DbAttachment, $$DbAttachmentsTableReferences),
          DbAttachment,
          PrefetchHooks Function({bool roundId})
        > {
  $$DbAttachmentsTableTableManager(_$AppDatabase db, $DbAttachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbAttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbAttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbAttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roundId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> relativePath = const Value.absent(),
                Value<bool> isImage = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbAttachmentsCompanion(
                id: id,
                roundId: roundId,
                name: name,
                relativePath: relativePath,
                isImage: isImage,
                mimeType: mimeType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roundId,
                required String name,
                required String relativePath,
                Value<bool> isImage = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbAttachmentsCompanion.insert(
                id: id,
                roundId: roundId,
                name: name,
                relativePath: relativePath,
                isImage: isImage,
                mimeType: mimeType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbAttachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roundId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roundId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roundId,
                                referencedTable: $$DbAttachmentsTableReferences
                                    ._roundIdTable(db),
                                referencedColumn: $$DbAttachmentsTableReferences
                                    ._roundIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbAttachmentsTable,
      DbAttachment,
      $$DbAttachmentsTableFilterComposer,
      $$DbAttachmentsTableOrderingComposer,
      $$DbAttachmentsTableAnnotationComposer,
      $$DbAttachmentsTableCreateCompanionBuilder,
      $$DbAttachmentsTableUpdateCompanionBuilder,
      (DbAttachment, $$DbAttachmentsTableReferences),
      DbAttachment,
      PrefetchHooks Function({bool roundId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbConfigStoreTableTableManager get dbConfigStore =>
      $$DbConfigStoreTableTableManager(_db, _db.dbConfigStore);
  $$DbConfigProfilesTableTableManager get dbConfigProfiles =>
      $$DbConfigProfilesTableTableManager(_db, _db.dbConfigProfiles);
  $$DbSessionsTableTableManager get dbSessions =>
      $$DbSessionsTableTableManager(_db, _db.dbSessions);
  $$DbChatRoundsTableTableManager get dbChatRounds =>
      $$DbChatRoundsTableTableManager(_db, _db.dbChatRounds);
  $$DbAttachmentsTableTableManager get dbAttachments =>
      $$DbAttachmentsTableTableManager(_db, _db.dbAttachments);
}
````

## File: lib/domain/models/session_card_meta.dart
````dart
class SessionCardMeta {
  final int roundCount;
  final String? previewRoundId;
  final String userPreview;
  final String aiPreview;
  final bool hasUnseen;
  final bool isStreaming;

  const SessionCardMeta({
    required this.roundCount,
    required this.previewRoundId,
    required this.userPreview,
    required this.aiPreview,
    required this.hasUnseen,
    required this.isStreaming,
  });
}
````

## File: lib/presentation/providers/input_notifier.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/input_state.dart';
import '../models/pending_attachment.dart';

/// 输入状态 Notifier
///
/// 职责：
/// - 管理输入框文本和附件列表
/// - 提供状态变更方法
/// - 不包含发送逻辑、不包含编辑模式、不包含 isSending 状态
class InputNotifier extends Notifier<InputState> {
  @override
  InputState build() => const InputState();

  /// 更新输入文本
  void updateText(String text) {
    state = state.copyWith(text: text);
  }

  /// 添加附件
  void addAttachment(PendingAttachment attachment) {
    state = state.copyWith(
      attachments: [...state.attachments, attachment],
    );
  }

  /// 移除指定 ID 的附件
  void removeAttachment(String id) {
    state = state.copyWith(
      attachments: state.attachments.where((a) => a.id != id).toList(),
    );
  }

  /// 清空输入状态（文本和附件）
  void clear() {
    state = const InputState();
  }
}

/// 全局输入状态 Provider
///
/// 特点：
/// - 全局单例：所有会话共享同一份输入草稿
/// - 自动保留：切换会话时草稿不会丢失
final inputStateProvider =
    NotifierProvider<InputNotifier, InputState>(InputNotifier.new);
````

## File: lib/presentation/widgets/common/app_toast.dart
````dart
// lib/presentation/widgets/common/app_toast.dart
import 'package:flutter/cupertino.dart';
import '../../../main.dart'; // 全局 navigatorKey

abstract class AppToast {
  static OverlayEntry? _entry;

  static void show(String message, {Duration duration = const Duration(seconds: 1)}) {
    _entry?.remove();
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    _entry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: IgnorePointer(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: const Color(0xE6111827),
                child: Text(
                  message,
                  style: const TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_entry!);
    Future.delayed(duration, () {
      _entry?.remove();
      if (_entry != null) _entry = null;
    });
  }
}
````

## File: lib/presentation/widgets/markdown_widget.dart
````dart
import 'package:aiservice/presentation/widgets/common/app_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'markdown_parser.dart';

class MarkdownWidget extends StatelessWidget {
  final String data;
  final TextStyle? baseStyle;

  const MarkdownWidget({super.key, required this.data, this.baseStyle});

  @override
  Widget build(BuildContext context) {
    final blocks = MarkdownParser.parse(data);
    final theme = CupertinoTheme.of(context);
    final defaultStyle = baseStyle ?? theme.textTheme.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.map((block) => _buildBlock(block, defaultStyle, theme, context)).toList(),
    );
  }

  Widget _buildBlock(
    MarkdownBlock block, 
    TextStyle defaultStyle, 
    CupertinoThemeData theme, 
    BuildContext context) {
    switch (block.type) {
      case MarkdownBlockType.heading:
        final level = block.level ?? 1;
        double fontSizeFactor;
        switch (level) {
          case 1:
            fontSizeFactor = 1.8;
            break;
          case 2:
            fontSizeFactor = 1.6;
            break;
          case 3:
            fontSizeFactor = 1.4;
            break;
          default:
            fontSizeFactor = 1.2;
        }
        final style = defaultStyle.copyWith(
          fontSize: theme.textTheme.textStyle.fontSize! * fontSizeFactor,
        );
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: _buildRichText(block.text ?? '', style),
        );

      case MarkdownBlockType.paragraph:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: _buildRichText(block.text ?? '', defaultStyle),
        );

      case MarkdownBlockType.code:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: block.text ?? ''));
                  AppToast.show('代码已复制');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.doc_on_doc, size: 14),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 4),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  block.text ?? '',
                  style: const TextStyle(),
                ),
              ),
            ),            
          ],
        );

      case MarkdownBlockType.table:
        final rows = block.tableRows;
        if (rows == null || rows.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Table(
            border: TableBorder.all(color: CupertinoDynamicColor.resolve(CupertinoColors.separator, context)),
            children: rows.map((row) {
              final isHeader = rows.indexOf(row) == 0;
              return TableRow(
                decoration: BoxDecoration(
                  color: isHeader ? CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context) : null, // 修改这里
                ),
                children: row.cells.map((cell) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: isHeader
                        ? _buildRichText(cell, defaultStyle)
                        : _buildRichText(cell, defaultStyle),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        );
    }
  }

  Widget _buildRichText(String text, TextStyle baseStyle) {
    final spans = MarkdownParser.parseInline(text);
    return Text.rich(
      TextSpan(
        style: baseStyle,
        children: spans.map((span) {
          TextStyle style = baseStyle;
          if (span.type == InlineType.bold) {
            style = baseStyle.copyWith(fontWeight: FontWeight.bold);
          }
          return TextSpan(text: span.text, style: style);
        }).toList(),
      ),
    );
  }
}
````

## File: .github/workflows/build_ios.yml
````yaml
name: Build Flutter iOS IPA

on:
  workflow_dispatch:

jobs:
  build-ios:
    runs-on: macos-latest

    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          channel: stable
          cache: true

      - name: Flutter doctor
        run: flutter doctor -v

      - name: Install dependencies
        run: flutter pub get

      # ★★★ 正确修复：在插件目录中克隆 llama.cpp ★★★
      - name: Provide llama.cpp inside flutter_llama plugin
        run: |
          PLUGIN_DIR="$HOME/.pub-cache/hosted/pub.dev/flutter_llama-1.1.2"
          if [ ! -d "$PLUGIN_DIR" ]; then
            echo "Plugin directory not found. Trying alternative location..."
            # 可能版本号有差异，使用通配符查找
            PLUGIN_DIR=$(find $HOME/.pub-cache/hosted -type d -name "flutter_llama-1.1.2" | head -1)
            if [ -z "$PLUGIN_DIR" ]; then
              echo "Failed to find flutter_llama plugin directory"
              exit 1
            fi
          fi
          echo "Plugin directory: $PLUGIN_DIR"
          cd "$PLUGIN_DIR"
          # 删除可能已存在的 llama.cpp（避免冲突）
          rm -rf llama.cpp
          git clone https://github.com/ggerganov/llama.cpp.git
          # 验证头文件存在
          if [ -f "llama.cpp/include/llama.h" ]; then
            echo "✅ llama.h successfully placed in plugin directory"
          else
            echo "❌ Failed to place llama.h"
            exit 1
          fi

      - name: Install CocoaPods
        run: |
          cd ios
          pod install --repo-update

      - name: Build iOS without codesign
        run: flutter build ios --release --no-codesign

      - name: Create IPA
        run: |
          APP_PATH="build/ios/iphoneos/Runner.app"
          [ -d "$APP_PATH" ] || APP_PATH="build/ios/Release-iphoneos/Runner.app"
          mkdir Payload
          cp -r "$APP_PATH" Payload/
          zip -r app.ipa Payload

      - uses: actions/upload-artifact@v4
        with:
          name: ios-ipa
          path: app.ipa
````

## File: android/app/build.gradle.kts
````kotlin
plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.aiservice"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.aiservice"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 28
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
````

## File: android/build.gradle.kts
````kotlin
import com.android.build.gradle.BaseExtension

subprojects {
    afterEvaluate {
        if (extensions.findByName("android") != null) {
            val android = extensions.getByName("android") as BaseExtension
            android.externalNativeBuild?.cmake?.version = "3.22.1"
        }
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
````

## File: lib/di/providers.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/local_chat_source.dart'; // 新增
import '../data/data_sources/remote_chat_source.dart'; // 替换原 remote_api_source
import '../data/data_sources/chat_source_router.dart'; // 新增
import '../data/database/database.dart';
import '../data/services/config_service.dart';
import '../data/repositories/conversation_repository.dart';

final localFileSourceProvider = FutureProvider<LocalFileSource>((ref) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileSource = LocalFileSource(appDir.path);
  await fileSource.initDirectories();
  return fileSource;
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  ref.watch(localFileSourceProvider);
  return AppDatabase();
});

// --- 新增 Data Sources ---
final remoteChatSourceProvider = Provider<RemoteChatSource>((ref) => RemoteChatSource());
final localChatSourceProvider = Provider<LocalChatSource>((ref) => LocalChatSource());

final chatSourceRouterProvider = Provider<ChatSourceRouter>((ref) {
  return ChatSourceRouter(
    ref.watch(remoteChatSourceProvider),
    ref.watch(localChatSourceProvider),
  );
});

// --- 更新 Service 依赖 ---
final configServiceProvider = Provider<ConfigService>((ref) {
  return ConfigService(
    ref.watch(appDatabaseProvider),
    ref.watch(chatSourceRouterProvider), // 替换原 remoteApiSourceProvider
  );
});

final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  return ConversationRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(localFileSourceProvider).requireValue,
  );
});
````

## File: lib/domain/models/session_list_item.dart
````dart
class SessionListItem {
  final String id;
  final String title;
  final int updatedAt;

  const SessionListItem({
    required this.id,
    required this.title,
    required this.updatedAt,
  });
}
````

## File: lib/domain/services/stream_processor.dart
````dart
import 'dart:async';
import '../../core/models/chat_chunk.dart';
import '../../core/models/generation_event.dart';

/// 流处理器
///
/// 职责：
/// - 累加 content 和 reasoning
/// - 节流输出 partial 事件
/// - 映射错误和完成状态
/// - 纯逻辑，无副作用，易于测试
class StreamProcessor {
  final Duration throttleInterval;

  StreamProcessor({this.throttleInterval = const Duration(seconds: 1)});

  /// 处理输入流并输出生成事件流
  Stream<GenerationEvent> process(Stream<ChatChunk> input) async* {
    final contentBuffer = StringBuffer();
    final reasoningBuffer = StringBuffer();
    String? error;
    DateTime? lastEmitTime;

    // 辅助函数：检查是否需要节流输出
    bool shouldEmit() {
      final now = DateTime.now();
      if (lastEmitTime == null) {
        lastEmitTime = now;
        return true;
      }
      if (now.difference(lastEmitTime!) >= throttleInterval) {
        lastEmitTime = now;
        return true;
      }
      return false;
    }

    try {
      await for (final chunk in input) {
        // 错误处理
        if (chunk.error != null) {
          error = chunk.error;
          break;
        }

        // 累加数据
        if (chunk.content != null) {
          contentBuffer.write(chunk.content);
        }
        if (chunk.reasoningContent != null) {
          reasoningBuffer.write(chunk.reasoningContent);
        }

        // 节流输出
        if (shouldEmit()) {
          yield GenerationEvent.partial(
            content: contentBuffer.toString(),
            reasoning: reasoningBuffer.toString(),
          );
        }

        // 完成处理
        if (chunk.isDone) {
          break;
        }
      }

      // 最终输出
      if (error != null) {
        yield GenerationEvent.failed(
          error: error,
          content: '$contentBuffer\n\n[错误] $error'.trim(),
          reasoning: reasoningBuffer.toString(),
        );
      } else {
        yield GenerationEvent.completed(
          content: contentBuffer.toString(),
          reasoning: reasoningBuffer.toString(),
        );
      }
    } catch (e) {
      yield GenerationEvent.failed(error: e.toString());
    }
  }
}
````

## File: lib/domain/services/tree_builder.dart
````dart
import '../models/tree_node.dart';

List<TreeNode> buildTree(List<({String id, String? parentId})> topology) {
  if (topology.isEmpty) return [];

  final nodeMap = <String, TreeNode>{
    for (final t in topology)
      t.id: TreeNode(id: t.id, parentId: t.parentId, children: const [], depth: 0),
  };

  final childrenMap = <String, List<String>>{};
  final rootIds = <String>[];

  for (final t in topology) {
    if (t.parentId == null) {
      rootIds.add(t.id);
    } else {
      childrenMap.putIfAbsent(t.parentId!, () => []).add(t.id);
    }
  }

  final roots = <TreeNode>[];
  for (final rootId in rootIds) {
    final root = nodeMap[rootId];
    if (root != null) {
      roots.add(_buildSubtreeIterative(root, childrenMap, nodeMap));
    }
  }
  return roots;
}

TreeNode _buildSubtreeIterative(
  TreeNode root,
  Map<String, List<String>> childrenMap,
  Map<String, TreeNode> nodeMap,
) {
  final postOrder = <TreeNode>[];
  final stack = <TreeNode>[root];
  while (stack.isNotEmpty) {
    final node = stack.removeLast();
    postOrder.add(node);
    for (final cid in childrenMap[node.id] ?? []) {
      final child = nodeMap[cid];
      if (child != null) stack.add(child);
    }
  }

  final updatedMap = <String, TreeNode>{};
  for (int i = postOrder.length - 1; i >= 0; i--) {
    final original = postOrder[i];
    final childIds = childrenMap[original.id] ?? [];
    final builtChildren = <TreeNode>[];
    int maxChildDepth = -1;
    for (final cid in childIds) {
      final builtChild = updatedMap[cid]!;
      builtChildren.add(builtChild);
      if (builtChild.depth > maxChildDepth) maxChildDepth = builtChild.depth;
    }
    updatedMap[original.id] = original.copyWith(
      depth: maxChildDepth + 1,
      children: builtChildren,
    );
  }
  return updatedMap[root.id]!;
}
````

## File: lib/presentation/widgets/common/app_page_scaffold.dart
````dart
import 'package:flutter/cupertino.dart';

class AppPageScaffold extends StatelessWidget {
  final ObstructingPreferredSizeWidget? navigationBar;
  final Widget body;
  final bool useSafeArea;

  const AppPageScaffold({
    super.key,
    this.navigationBar,
    required this.body,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoDynamicColor.resolve(CupertinoColors.systemGroupedBackground, context),
      navigationBar: navigationBar,

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        
        child: SafeArea(child: body),
      ),
    );
  }
}
````

## File: lib/data/data_sources/local_file_source.dart
````dart
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;
import '../../core/constants/app_constants.dart';

class LocalFileSource{
  final String _baseDir;
  final Directory _directory;

  LocalFileSource(this._baseDir) : _directory = Directory(_baseDir);

  Future<String> get basePath async => _baseDir;

  Future<void> initDirectories() async {
    await _directory.create(recursive: true);
    await Directory(path.join(_baseDir, AppConstants.dirAttachments))
      .create(recursive: true);
  }

  Future<void> deleteAttachment(String relativePath) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      if (await file.exists()) {
        await file.delete();
       }
    } on FileSystemException catch (e) {
      throw Exception('删除文件失败：${e.message}');
    }
  }

  Future<String> saveAttachment(Uint8List data, String fileName) async {
    try {
      final ext = path.extension(fileName).toLowerCase();
      final hash = sha256.convert(data).toString();
       final hashedFileName = '$hash$ext';
      final relativePath = '${AppConstants.dirAttachments}/$hashedFileName';
      final filePath = path.join(_baseDir, relativePath);
       final file = File(filePath);

      if (!await file.exists()) {
        await file.writeAsBytes(data, flush: true);
      }

      return relativePath;
    } on FileSystemException catch (e) {
      throw Exception('保存附件失败：${e.message}');
    }
  }

  File readAttachment(String relativePath) {
    return File(path.join(_baseDir, relativePath));
  }
}
````

## File: lib/presentation/pages/image_attachment_viewer_page.dart
````dart
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:aiservice/presentation/widgets/common/app_page_scaffold.dart';

class ImageAttachmentViewerPage extends StatelessWidget {
  final String title;
  final String filePath;

  const ImageAttachmentViewerPage({
    super.key,
    required this.title,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    final imageFile = File(filePath);
    
    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(title, overflow: TextOverflow.ellipsis)),
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: Image.file(
            imageFile,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const Center(child: Icon(CupertinoIcons.exclamationmark_triangle)),
          ),
        ),
      ),
    );
  }
}
````

## File: lib/presentation/providers/config_notifier.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../di/providers.dart';

/// 监听当前激活的配置（响应式）
final configProvider = StreamProvider<AppConfig>((ref) {
  return ref.read(configServiceProvider).watchConfig();
});

/// 监听配置存档列表（响应式）
final configProfilesProvider = StreamProvider<AppConfigStore>((ref) {
  return ref.read(configServiceProvider).watchConfigStore();
});
````

## File: lib/presentation/widgets/thought_bubble.dart
````dart
import 'package:flutter/cupertino.dart';

class ThoughtBubble extends StatefulWidget {
  final String content;

  const ThoughtBubble({
    super.key,
    required this.content,
  });

  @override
  State<ThoughtBubble> createState() => _ThoughtBubbleState();
}

class _ThoughtBubbleState extends State<ThoughtBubble> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.content.trim();
    if (text.isEmpty) return const SizedBox.shrink();

    final textTheme = CupertinoTheme.of(context).textTheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.lightbulb,
                  size: 16,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context),
                ),
                const SizedBox(width: 6),
                Text(
                  '推理过程',
                  style: textTheme.textStyle.copyWith(
                    color: CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context),
                  ),
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                  size: 18,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey, context),
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                text,
                style: textTheme.textStyle.copyWith(
                  fontSize: 13,
                  height: 1.5,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
````

## File: lib/domain/services/chat_context_builder.dart
````dart
import 'dart:convert';
import 'package:aiservice/core/models/attachment.dart';

import '../../core/models/api_message.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';

Future<List<ApiMessage>> buildApiContextFromRounds(
  List<ChatRound> rounds,
  ConversationRepository repository,
) async {
  final result = <ApiMessage>[];

  for (final round in rounds) {
    final userMessage = await _buildUserMessage(round, repository);
    result.add(userMessage);

    final assistantMessage = _buildAssistantMessage(round);
    if (assistantMessage != null) {
      result.add(assistantMessage);
    }
  }

  return result;
}

ApiMessage? _buildAssistantMessage(ChatRound round) {
  final thinking = round.assistantThinking?.trim() ?? '';
  final content = round.assistantContent?.trim() ?? '';

  if (thinking.isEmpty && content.isEmpty) return null;

  return ApiMessage(
    role: 'assistant',
    content: content.isEmpty ? null : content,
    reasoning: thinking.isEmpty ? null : thinking,
  );
}

Future<ApiMessage> _buildUserMessage(
  ChatRound round,
  ConversationRepository repository,
) async {
  final parts = <ApiMessageContentPart>[];

  if (round.userContent.trim().isNotEmpty) {
    parts.add(ApiMessageContentPart.text(text: round.userContent.trim()));
  }

  for (final attachment in round.userAttachments) {
    final attachmentParts = await _buildAttachmentParts(attachment, repository);
    parts.addAll(attachmentParts);
  }

  if (parts.isEmpty) {
    return const ApiMessage(role: 'user', content: '');
  }

  if (_isOnlySingleTextPart(parts)) {
    final text = parts.first.maybeWhen(
      text: (_, text) => text,
      orElse: () => '',
    );
    return ApiMessage(role: 'user', content: text);
  }

  return ApiMessage(role: 'user', parts: parts);
}

bool _isOnlySingleTextPart(List<ApiMessageContentPart> parts) {
  if (parts.length != 1) return false;
  return parts.first.maybeWhen(
    text: (_, text) => true,
    orElse: () => false,
  );
}

Future<List<ApiMessageContentPart>> _buildAttachmentParts(
  Attachment attachment,
  ConversationRepository repository,
) async {
  final file = repository.getAttachment(attachment.relativePath);
  if (attachment.isImage) {
    final bytes = await file.readAsBytes();
    final mimeType = attachment.mimeType;
    final base64Data = base64Encode(bytes);
    return [ApiMessageContentPart.imageUrl(imageUrl: ApiImageUrl(url: 'data:$mimeType;base64,$base64Data'))];
  } else {
    // 上层保证非图片一定是可读文本文件
    final bytes = await file.readAsBytes();
    final text = utf8.decode(bytes, allowMalformed: true);
    return [ApiMessageContentPart.text(text: text)];
  }
}
````

## File: lib/domain/services/chat_service.dart
````dart
import 'dart:async';
import 'package:aiservice/data/data_sources/chat_source_router.dart';
import 'package:uuid/uuid.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../data/services/config_service.dart';
import '../../presentation/models/pending_attachment.dart';
import 'attachment_preparer.dart';
import 'chat_context_builder.dart';
import 'stream_processor.dart';

class ChatService {
  static final Map<String, StreamSubscription> _activeGenerations = {};

  static Future<String> sendMessage({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String sessionId,
    required String content,
    required String? parentRoundId,
    required List<PendingAttachment> pendingAttachments,
  }) async {
    final savedAttachments = await savePendingAttachments(repository, pendingAttachments);
    final newRoundId = await _createRound(
      repository: repository,
      sessionId: sessionId,
      content: content,
      parentRoundId: parentRoundId,
      attachments: savedAttachments,
    );
    
    _startGeneration(
      repository: repository,
      configService: configService,
      sourceRouter: sourceRouter,
      roundId: newRoundId,
    );
    
    return newRoundId;
  }

  static Future<String> retryFromRound({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String sessionId,
    required ChatRound sourceRound,
  }) async {
    final newRoundId = await _createRound(
      repository: repository,
      sessionId: sessionId,
      content: sourceRound.userContent,
      parentRoundId: sourceRound.parentId,
      attachments: sourceRound.userAttachments,
    );

    _startGeneration(
      repository: repository,
      configService: configService,
      sourceRouter: sourceRouter,
      roundId: newRoundId,
    );

    return newRoundId;
  }

  static void stopGeneration(String roundId, ConversationRepository repository) {
    final subscription = _activeGenerations.remove(roundId);
    if (subscription != null) {
      subscription.cancel();
      repository.updateRound(
        roundId: roundId,
        isIncomplete: false,
        hasUnseenUpdate: true,
      );
    }
  }

  static Future<void> _startGeneration({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String roundId,
  }) async {
    final contextRounds = await repository.getContextRounds(roundId);
    final apiContext = await buildApiContextFromRounds(
      contextRounds,
      repository,
    );

    final config = await configService.loadConfig();
    final source = sourceRouter.getSourceFromConfig(config);
    
    final chatStream = source.chatStream(
      config: config,
      context: apiContext,
    );

    final processor = StreamProcessor();
    final eventStream = processor.process(chatStream);

    final subscription = eventStream.listen((event) {
      event.when(
        partial: (content, reasoning) {
          repository.updateRound(
            roundId: roundId,
            assistantContent: content,
            assistantThinking: reasoning,
            isIncomplete: true,
          );
        },
        completed: (content, reasoning) {
          repository.updateRound(
            roundId: roundId,
            assistantContent: content,
            assistantThinking: reasoning,
            isIncomplete: false,
            hasUnseenUpdate: true,
          );
          _activeGenerations.remove(roundId);
        },
        failed: (error, content, reasoning) {
          repository.updateRound(
            roundId: roundId,
            assistantContent: content, 
            assistantThinking: reasoning,
            isIncomplete: false,
            hasUnseenUpdate: true,
          );
          _activeGenerations.remove(roundId);
        },
      );
    });

    _activeGenerations[roundId] = subscription;
  }

  static Future<String> _createRound({
    required ConversationRepository repository,
    required String sessionId,
    required String content,
    required String? parentRoundId,
    required List<Attachment> attachments,
  }) async {
    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: attachments,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );
    await repository.appendRound(sessionId, newRound);
    return newRound.id;
  }
}
````

## File: lib/main.dart
````dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di/providers.dart'; // 仅导入 providers
import 'presentation/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  await container.read(localFileSourceProvider.future);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'AI Chat',
      navigatorKey: navigatorKey,
      home: const HomePage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
    );
  }
}
````

## File: lib/presentation/providers/settings_form_notifier.dart
````dart
// lib/presentation/providers/settings_form_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/model_info.dart';
import '../../data/services/config_service.dart';
import '../../di/providers.dart';
import 'config_notifier.dart'; // 导入 configProvider
import 'package:file_picker/file_picker.dart';

/// 设置表单的状态
class SettingsFormState {
  final AppConfig config;
  final bool isSaving;
  final bool isRefreshingModels;

  const SettingsFormState({
    required this.config,
    this.isSaving = false,
    this.isRefreshingModels = false,
  });

  SettingsFormState copyWith({
    AppConfig? config,
    bool? isSaving,
    String? error,
    bool? isRefreshingModels,
  }) {
    return SettingsFormState(
      config: config ?? this.config,
      isSaving: isSaving ?? this.isSaving,
      isRefreshingModels: isRefreshingModels ?? this.isRefreshingModels,
    );
  }
}

/// 设置表单 Notifier
class SettingsFormNotifier extends Notifier<SettingsFormState> {
  late final ConfigService _configService;
  AppConfig? _lastLoadedConfig;

  @override
  SettingsFormState build() {
    _configService = ref.read(configServiceProvider);

    // 1. 尝试获取初始值（如果已经加载）
    final initialConfig = ref.read(configProvider).valueOrNull;
    if (initialConfig != null) {
      _lastLoadedConfig = initialConfig;
      state = SettingsFormState(config: initialConfig);
    } else {
      state = SettingsFormState(config: AppConfig.defaultConfig());
    }

    // 2. 监听全局配置变化，自动同步
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        if (_lastLoadedConfig != config) {
          _lastLoadedConfig = config;
          _load(config);
        }
      });
    });

    return state;
  }

  void _load(AppConfig config) {
    state = state.copyWith(config: config);
  }

  void updateBaseUrl(String value) {
    state = state.copyWith(config: state.config.copyWith(baseUrl: value));
  }

  void updateApiKey(String value) {
    state = state.copyWith(config: state.config.copyWith(apiKey: value));
  }

  void updateModelsPath(String value) {
    state = state.copyWith(config: state.config.copyWith(modelsPath: value));
  }

  void updateChatPath(String value) {
    state = state.copyWith(config: state.config.copyWith(chatPath: value));
  }

  void updateApiMode(String value) {
    final defaults = _defaultPathsForMode(value);
    state = state.copyWith(
      config: state.config.copyWith(
        apiMode: value,
        modelsPath: defaults['models']!,
        chatPath: defaults['chat']!,
      ),
    );
  }

  void updateSelectedModel(String value) {
    state = state.copyWith(
      config: state.config.copyWith(selectedModel: value.isEmpty ? null : value),
    );
  }

  void toggleReasoning(bool value) {
    _updateModelCapability(overrideSupportsReasoning: value);
  }

  void toggleVision(bool value) {
    _updateModelCapability(overrideSupportsVision: value);
  }

  void _updateModelCapability({bool? overrideSupportsReasoning, bool? overrideSupportsVision}) {
    final modelId = state.config.selectedModel;
    if (modelId == null || modelId.isEmpty) return;

    final models = [...(state.config.availableModels ?? const <ModelInfo>[])];
    final index = models.indexWhere((m) => m.id == modelId);
    final baseModel = index >= 0 ? models[index] : ModelInfo(id: modelId);

    final updatedModel = baseModel.copyWith(
      overrideSupportsReasoning: overrideSupportsReasoning ?? baseModel.overrideSupportsReasoning,
      overrideSupportsVision: overrideSupportsVision ?? baseModel.overrideSupportsVision,
    );

    if (index >= 0) {
      models[index] = updatedModel;
    } else {
      models.add(updatedModel);
    }

    state = state.copyWith(config: state.config.copyWith(availableModels: models));
  }

  Future<void> save() async {
    state = state.copyWith(isSaving: true);
    try {
      await _configService.saveConfig(state.config);
      state = state.copyWith(isSaving: false);
    } catch (e) {
      state = state.copyWith(isSaving: false);
      rethrow;
    }
  }

  void restoreDefaults() {
    state = state.copyWith(config: AppConfig.defaultConfig());
  }

  Future<void> refreshModels() async {
    if (state.isRefreshingModels) return;
    if (state.config.apiMode == 'local') {
      await addLocalModel();
      return;
    }

    state = state.copyWith(isRefreshingModels: true);
    try {
      await _configService.refreshModels(state.config);
      state = state.copyWith(isRefreshingModels: false);
    } catch (e) {
      state = state.copyWith(
        isRefreshingModels: false,
      );
      rethrow;
    }
  }

  Future<void> addLocalModel() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['gguf'],
    );
    if (result == null || result.files.single.path == null) return;

    final path = result.files.single.path!;

    final newModel = ModelInfo(id: path);

    final currentModels = List<ModelInfo>.from(state.config.availableModels ?? []);
    if (currentModels.any((m) => m.id == path)) {
      // 已存在则直接选中
      state = state.copyWith(config: state.config.copyWith(selectedModel: path));
      return;
    }

    currentModels.add(newModel);
    state = state.copyWith(
      config: state.config.copyWith(
        availableModels: currentModels,
        selectedModel: path,
      ),
    );
  }

  Map<String, String> _defaultPathsForMode(String apiMode) {
    switch (apiMode) {
      case 'google':
        return {'models': 'v1beta/models', 'chat': 'v1beta/models/{model}:streamGenerateContent'};
      case 'responses':
        return {'models': 'v1/models', 'chat': 'v1/responses'};
      default:
        return {'models': 'v1/models', 'chat': 'v1/chat/completions'};
    }
  }
}

final settingsFormProvider = NotifierProvider<SettingsFormNotifier, SettingsFormState>(
  SettingsFormNotifier.new,
);
````

## File: lib/presentation/pages/text_attachment_viewer_page.dart
````dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show SelectionArea;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

final textFileContentProvider = FutureProvider.family<String, String>((ref, filePath) async {
  final file = File(filePath);
  if (!await file.exists()) {
    throw Exception('文件不存在');
  }
  final bytes = await file.readAsBytes();
  return utf8.decode(bytes, allowMalformed: true);
});

class TextAttachmentViewerPage extends ConsumerWidget {
  final String title;
  final String filePath;

  const TextAttachmentViewerPage({
    super.key,
    required this.title,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentAsync = ref.watch(textFileContentProvider(filePath));

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title, overflow: TextOverflow.ellipsis),
        trailing: contentAsync.when(
          data: (text) => CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: text));
              if (context.mounted) AppToast.show('全文已复制');
            },
            child: const Icon(CupertinoIcons.doc_on_doc),
          ),
          loading: () => const SizedBox.shrink(),
          error: (_, _) => const SizedBox.shrink(),
        ),
      ),
      body: contentAsync.when(
        data: (text) {
          final lines = text.split('\n');

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: SelectionArea(
                child: ListView.builder(
                  itemCount: lines.length,
                  itemBuilder: (context, index) => Text(lines[index]),
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
      ),
    );
  }
}
````

## File: lib/presentation/widgets/attachment_list.dart
````dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/models/attachment.dart';
import '../../di/providers.dart';
import '../pages/image_attachment_viewer_page.dart';
import '../pages/text_attachment_viewer_page.dart';
import 'common/app_toast.dart';

class AttachmentList extends ConsumerWidget {
  final List<Attachment> attachments;
  final bool rightAligned;

  const AttachmentList({
    super.key,
    required this.attachments,
    this.rightAligned = true,
  });

  bool _isTextAttachment(Attachment attachment) {
    final lowerName = attachment.name.toLowerCase();
    final mime = (attachment.mimeType ?? '').toLowerCase();
    return mime.startsWith('text/') ||
        mime == 'application/json' ||
        lowerName.endsWith('.md') ||
        lowerName.endsWith('.txt') ||
        lowerName.endsWith('.json') ||
        lowerName.endsWith('.dart') ||
        lowerName.endsWith('.yaml') ||
        lowerName.endsWith('.yml') ||
        lowerName.endsWith('.log') ||
        lowerName.endsWith('.csv');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    return Align(
      alignment: rightAligned ? Alignment.centerRight : Alignment.centerLeft,
      child: Wrap(
        alignment: rightAligned ? WrapAlignment.end : WrapAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children: attachments.map((attachment) {
          if (attachment.isImage) {
            return _ImageAttachmentThumb(attachment: attachment);
          }
          return _FileAttachmentChip(
            attachment: attachment,
            isText: _isTextAttachment(attachment),
          );
        }).toList(),
      ),
    );
  }
}

class _ImageAttachmentThumb extends ConsumerWidget {
  final Attachment attachment;
  const _ImageAttachmentThumb({required this.attachment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.read(conversationRepositoryProvider).getAttachment(attachment.relativePath);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => ImageAttachmentViewerPage(
            title: attachment.name,
            filePath: file.path,
          ),
        ),
      ),
      onLongPress: () => Share.shareXFiles([XFile(file.path)], text: attachment.name),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 108,
          height: 108,
          child: Image.file(
            file,
            fit: BoxFit.cover,
            gaplessPlayback: true,
            errorBuilder: (_, _, _) => const Center(child: Icon(CupertinoIcons.photo)),
          ),
        ),
      ),
    );
  }
}

class _FileAttachmentChip extends ConsumerWidget {
  final Attachment attachment;
  final bool isText;
  const _FileAttachmentChip({required this.attachment, required this.isText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.read(conversationRepositoryProvider).getAttachment(attachment.relativePath);
    final leadingIcon = isText ? CupertinoIcons.doc_text : CupertinoIcons.doc;

    return GestureDetector(
      onTap: () {
        if (isText) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => TextAttachmentViewerPage(
                title: attachment.name,
                filePath: file.path,
              ),
            ),
          );
        } else {
          AppToast.show('该文件暂不支持直接预览，请长按进行分享');
        }
      },
      onLongPress: () => Share.shareXFiles([XFile(file.path)], text: attachment.name),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(leadingIcon, size: 16),
            const SizedBox(width: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(attachment.name, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
````

## File: lib/presentation/widgets/message_bubble.dart
````dart
import 'package:flutter/cupertino.dart';
import 'markdown_widget.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;
  final VoidCallback onCopy;
  final VoidCallback onRetryReply;
  final VoidCallback? onEdit;

  const MessageBubble({
    super.key,
    required this.content,
    required this.isUser,
    required this.onCopy,
    required this.onRetryReply,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context);

    final textColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.white, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.label, context);

    final maxWidth = MediaQuery.of(context).size.width * 0.88;

    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: MarkdownWidget(
              data: content,
              baseStyle: TextStyle(color: textColor),
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 8, left: 4, right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onPressed: onCopy,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.doc_on_doc, size: 14),
                  ],
                ),
              ),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onPressed: onRetryReply,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.arrow_clockwise, size: 14),
                  ],
                ),
              ),
              if (onEdit != null)
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  onPressed: onEdit,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.pencil, size: 14),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
````

## File: lib/presentation/providers/session_list_notifier.dart
````dart
// lib/presentation/providers/session_list_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
import '../../domain/models/session_list_item.dart';
import '../../domain/models/session_card_meta.dart';

final sessionListProvider = StreamProvider<List<SessionListItem>>((ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionListItems();
});

final sessionCardMetaProvider =
    StreamProvider.family<SessionCardMeta, String>((ref, sessionId) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionCardMeta(sessionId);
});
````

## File: lib/data/services/config_service.dart
````dart
import 'dart:async';
import 'package:aiservice/data/data_sources/chat_source_router.dart';
import 'package:drift/drift.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../database/database.dart';
import 'package:uuid/uuid.dart';

class ConfigService{
  final AppDatabase _db;
  final ChatSourceRouter _sourceRouter;

  ConfigService(this._db, this._sourceRouter);

  Future<AppConfigStore> _ensureInitialized() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    var activeId = storeRow?.activeProfileId ?? 'default';

    final profileRows = await _db.select(_db.dbConfigProfiles).get();

    if (profileRows.isEmpty) {
      final defaultProfile = ConfigProfile(
        id: 'default',
        name: '默认配置',
        config: AppConfig.defaultConfig(),
      );

      await _db.into(_db.dbConfigProfiles).insert(
        DbConfigProfilesCompanion.insert(
          id: defaultProfile.id,
          name: defaultProfile.name,
          config: defaultProfile.config,
        ),
      );
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        const DbConfigStoreCompanion(
          id: Value(1),
          activeProfileId: Value('default'),
        ),
      );

      activeId = 'default';
      return AppConfigStore(
        activeProfileId: activeId,
        profiles: [defaultProfile],
      );
    }

    final profiles = profileRows
        .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
        .toList();

    if (!profiles.any((p) => p.id == activeId)) {
      activeId = profiles.first.id;
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        DbConfigStoreCompanion(
          id: const Value(1),
          activeProfileId: Value(activeId),
        ),
      );
    }

    return AppConfigStore(activeProfileId: activeId, profiles: profiles);
  }

  Future<AppConfigStore> loadConfigStore() async {
    return await _ensureInitialized();
  }

  Future<AppConfig> loadConfig() async {
    final store = await loadConfigStore();
    return store.profiles.firstWhere(
      (p) => p.id == store.activeProfileId,
      orElse: () => store.profiles.first,
    ).config;
  }

  Future<void> saveConfig(AppConfig config) async {
    final store = await loadConfigStore();
    final activeId = store.activeProfileId;
    await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(activeId)))
        .write(DbConfigProfilesCompanion(config: Value(config)));
  }

  Future<void> refreshModels(AppConfig targetConfig) async {
    final source = _sourceRouter.getSourceFromConfig(targetConfig);
    final remoteModels = await source.fetchModels(targetConfig);

    final oldModels = targetConfig.availableModels ?? const <ModelInfo>[];
    final oldById = {for (final model in oldModels) model.id: model};

    final updatedModels = remoteModels.map((remote) {
      final old = oldById[remote.id];
      return remote.copyWith(
        overrideSupportsReasoning: old?.overrideSupportsReasoning,
        overrideSupportsVision: old?.overrideSupportsVision,
      );
    }).toList();

    final updatedConfig = targetConfig.copyWith(
      availableModels: updatedModels,
    );

    await saveConfig(updatedConfig);
  }

  Future<List<ConfigProfile>> getProfiles() async {
    final store = await loadConfigStore();
    return store.profiles;
  }

  Future<void> switchProfile(String profileId) async {
    await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
      DbConfigStoreCompanion(
        id: const Value(1),
        activeProfileId: Value(profileId),
      ),
    );
  }

  Future<void> createProfile(String name) async {
    final activeConfig = await loadConfig();
    final newId = const Uuid().v4();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();

    await _db.into(_db.dbConfigProfiles).insert(
      DbConfigProfilesCompanion.insert(
        id: newId,
        name: cleanName,
        config: activeConfig,
      ),
    );
    await switchProfile(newId);
  }

  Future<void> renameProfile(String profileId, String name) async {
    if (name.trim().isEmpty) return;
    await (_db.update(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(name: Value(name.trim())));
  }

  Future<void> deleteProfile(String profileId) async {
    final store = await loadConfigStore();

    if (store.profiles.length <= 1) return;

    if (store.activeProfileId == profileId) {
      final remaining = store.profiles.where((p) => p.id != profileId).toList();
      if (remaining.isNotEmpty) {
        await switchProfile(remaining.first.id);
      }
    }

    await (_db.delete(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .go();
  }

  Stream<AppConfigStore> watchConfigStore() {
    _ensureInitialized();

    final storeStream = _db.select(_db.dbConfigStore).watchSingleOrNull();
    final profilesStream = _db.select(_db.dbConfigProfiles).watch();

    final outputController = StreamController<AppConfigStore>();

    DbConfigStoreData? latestStoreRow;
    List<DbConfigProfile> latestProfileRows = [];

    void computeAndOutput() {
      final storeRow = latestStoreRow;
      final profileRows = latestProfileRows;

      if (storeRow == null && profileRows.isEmpty) return;
      if (profileRows.isEmpty) return;

      var activeId = storeRow?.activeProfileId ?? 'default';

      final profiles = profileRows
          .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
          .toList();

      if (!profiles.any((p) => p.id == activeId)) {
        activeId = profiles.first.id;
        _db.into(_db.dbConfigStore).insertOnConflictUpdate(
          DbConfigStoreCompanion(
            id: const Value(1),
            activeProfileId: Value(activeId),
          ),
        );
      }

      outputController.add(
        AppConfigStore(activeProfileId: activeId, profiles: profiles),
      );
    }

    final storeSubscription = storeStream.listen(
      (row) {
        latestStoreRow = row;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    final profilesSubscription = profilesStream.listen(
      (rows) {
        latestProfileRows = rows;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    outputController.onCancel = () {
      storeSubscription.cancel();
      profilesSubscription.cancel();
    };

    return outputController.stream;
  }

  Stream<AppConfig> watchConfig() {
    return watchConfigStore().map((store) {
      return store.profiles.firstWhere(
        (p) => p.id == store.activeProfileId,
        orElse: () => store.profiles.first,
      ).config;
    });
  }
}
````

## File: pubspec.lock
````
# Generated by pub
# See https://dart.dev/tools/pub/glossary#lockfile
packages:
  _fe_analyzer_shared:
    dependency: transitive
    description:
      name: _fe_analyzer_shared
      sha256: da0d9209ca76bde579f2da330aeb9df62b6319c834fa7baae052021b0462401f
      url: "https://pub.dev"
    source: hosted
    version: "85.0.0"
  analyzer:
    dependency: transitive
    description:
      name: analyzer
      sha256: f4ad0fea5f102201015c9aae9d93bc02f75dd9491529a8c21f88d17a8523d44c
      url: "https://pub.dev"
    source: hosted
    version: "7.6.0"
  analyzer_plugin:
    dependency: transitive
    description:
      name: analyzer_plugin
      sha256: a5ab7590c27b779f3d4de67f31c4109dbe13dd7339f86461a6f2a8ab2594d8ce
      url: "https://pub.dev"
    source: hosted
    version: "0.13.4"
  args:
    dependency: transitive
    description:
      name: args
      sha256: d0481093c50b1da8910eb0bb301626d4d8eb7284aa739614d2b394ee09e3ea04
      url: "https://pub.dev"
    source: hosted
    version: "2.7.0"
  async:
    dependency: transitive
    description:
      name: async
      sha256: e2eb0491ba5ddb6177742d2da23904574082139b07c1e33b8503b9f46f3e1a37
      url: "https://pub.dev"
    source: hosted
    version: "2.13.1"
  boolean_selector:
    dependency: transitive
    description:
      name: boolean_selector
      sha256: "8aab1771e1243a5063b8b0ff68042d67334e3feab9e95b9490f9a6ebf73b42ea"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  build:
    dependency: transitive
    description:
      name: build
      sha256: "51dc711996cbf609b90cbe5b335bbce83143875a9d58e4b5c6d3c4f684d3dda7"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.4"
  build_config:
    dependency: transitive
    description:
      name: build_config
      sha256: "4ae2de3e1e67ea270081eaee972e1bd8f027d459f249e0f1186730784c2e7e33"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  build_daemon:
    dependency: transitive
    description:
      name: build_daemon
      sha256: bf05f6e12cfea92d3c09308d7bcdab1906cd8a179b023269eed00c071004b957
      url: "https://pub.dev"
    source: hosted
    version: "4.1.1"
  build_resolvers:
    dependency: transitive
    description:
      name: build_resolvers
      sha256: ee4257b3f20c0c90e72ed2b57ad637f694ccba48839a821e87db762548c22a62
      url: "https://pub.dev"
    source: hosted
    version: "2.5.4"
  build_runner:
    dependency: "direct dev"
    description:
      name: build_runner
      sha256: "382a4d649addbfb7ba71a3631df0ec6a45d5ab9b098638144faf27f02778eb53"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.4"
  build_runner_core:
    dependency: transitive
    description:
      name: build_runner_core
      sha256: "85fbbb1036d576d966332a3f5ce83f2ce66a40bea1a94ad2d5fc29a19a0d3792"
      url: "https://pub.dev"
    source: hosted
    version: "9.1.2"
  built_collection:
    dependency: transitive
    description:
      name: built_collection
      sha256: "376e3dd27b51ea877c28d525560790aee2e6fbb5f20e2f85d5081027d94e2100"
      url: "https://pub.dev"
    source: hosted
    version: "5.1.1"
  built_value:
    dependency: transitive
    description:
      name: built_value
      sha256: "0730c18c770d05636a8f945c32a4d7d81cb6e0f0148c8db4ad12e7748f7e49af"
      url: "https://pub.dev"
    source: hosted
    version: "8.12.5"
  characters:
    dependency: transitive
    description:
      name: characters
      sha256: faf38497bda5ead2a8c7615f4f7939df04333478bf32e4173fcb06d428b5716b
      url: "https://pub.dev"
    source: hosted
    version: "1.4.1"
  charcode:
    dependency: transitive
    description:
      name: charcode
      sha256: fb0f1107cac15a5ea6ef0a6ef71a807b9e4267c713bb93e00e92d737cc8dbd8a
      url: "https://pub.dev"
    source: hosted
    version: "1.4.0"
  checked_yaml:
    dependency: transitive
    description:
      name: checked_yaml
      sha256: "959525d3162f249993882720d52b7e0c833978df229be20702b33d48d91de70f"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.4"
  cli_util:
    dependency: transitive
    description:
      name: cli_util
      sha256: ff6785f7e9e3c38ac98b2fb035701789de90154024a75b6cb926445e83197d1c
      url: "https://pub.dev"
    source: hosted
    version: "0.4.2"
  clock:
    dependency: transitive
    description:
      name: clock
      sha256: fddb70d9b5277016c77a80201021d40a2247104d9f4aa7bab7157b7e3f05b84b
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  code_assets:
    dependency: transitive
    description:
      name: code_assets
      sha256: "83ccdaa064c980b5596c35dd64a8d3ecc68620174ab9b90b6343b753aa721687"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.0"
  code_builder:
    dependency: transitive
    description:
      name: code_builder
      sha256: "6a6cab2ba4680d6423f34a9b972a4c9a94ebe1b62ecec4e1a1f2cba91fd1319d"
      url: "https://pub.dev"
    source: hosted
    version: "4.11.1"
  collection:
    dependency: "direct main"
    description:
      name: collection
      sha256: "2f5709ae4d3d59dd8f7cd309b4e023046b57d8a6c82130785d2b0e5868084e76"
      url: "https://pub.dev"
    source: hosted
    version: "1.19.1"
  convert:
    dependency: transitive
    description:
      name: convert
      sha256: b30acd5944035672bc15c6b7a8b47d773e41e2f17de064350988c5d02adb1c68
      url: "https://pub.dev"
    source: hosted
    version: "3.1.2"
  cross_file:
    dependency: transitive
    description:
      name: cross_file
      sha256: "28bb3ae56f117b5aec029d702a90f57d285cd975c3c5c281eaca38dbc47c5937"
      url: "https://pub.dev"
    source: hosted
    version: "0.3.5+2"
  crypto:
    dependency: "direct dev"
    description:
      name: crypto
      sha256: c8ea0233063ba03258fbcf2ca4d6dadfefe14f02fab57702265467a19f27fadf
      url: "https://pub.dev"
    source: hosted
    version: "3.0.7"
  cupertino_icons:
    dependency: "direct main"
    description:
      name: cupertino_icons
      sha256: "41e005c33bd814be4d3096aff55b1908d419fde52ca656c8c47719ec745873cd"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.9"
  custom_lint_core:
    dependency: transitive
    description:
      name: custom_lint_core
      sha256: "31110af3dde9d29fb10828ca33f1dce24d2798477b167675543ce3d208dee8be"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.5"
  custom_lint_visitor:
    dependency: transitive
    description:
      name: custom_lint_visitor
      sha256: "4a86a0d8415a91fbb8298d6ef03e9034dc8e323a599ddc4120a0e36c433983a2"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.0+7.7.0"
  dart_style:
    dependency: transitive
    description:
      name: dart_style
      sha256: "8a0e5fba27e8ee025d2ffb4ee820b4e6e2cf5e4246a6b1a477eb66866947e0bb"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.1"
  dbus:
    dependency: transitive
    description:
      name: dbus
      sha256: "0ce9b0a839e6dee59a37a623d2fc26a35bbbe6404213e419b0d6411023d62645"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.14"
  drift:
    dependency: "direct main"
    description:
      name: drift
      sha256: "540cf382a3bfa99b76e51514db5b0ebcd81ce3679b7c1c9cb9478ff3735e47a1"
      url: "https://pub.dev"
    source: hosted
    version: "2.28.2"
  drift_dev:
    dependency: "direct dev"
    description:
      name: drift_dev
      sha256: "68c138e884527d2bd61df2ade276c3a144df84d1adeb0ab8f3196b5afe021bd4"
      url: "https://pub.dev"
    source: hosted
    version: "2.28.0"
  fake_async:
    dependency: transitive
    description:
      name: fake_async
      sha256: "5368f224a74523e8d2e7399ea1638b37aecfca824a3cc4dfdf77bf1fa905ac44"
      url: "https://pub.dev"
    source: hosted
    version: "1.3.3"
  ffi:
    dependency: transitive
    description:
      name: ffi
      sha256: "6d7fd89431262d8f3125e81b50d3847a091d846eafcd4fdb88dd06f36d705a45"
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  file:
    dependency: transitive
    description:
      name: file
      sha256: a3b4f84adafef897088c160faf7dfffb7696046cb13ae90b508c2cbc95d3b8d4
      url: "https://pub.dev"
    source: hosted
    version: "7.0.1"
  file_picker:
    dependency: "direct dev"
    description:
      name: file_picker
      sha256: f13a03000d942e476bc1ff0a736d2e9de711d2f89a95cd4c1d88f861c3348387
      url: "https://pub.dev"
    source: hosted
    version: "11.0.2"
  file_selector_linux:
    dependency: transitive
    description:
      name: file_selector_linux
      sha256: "2567f398e06ac72dcf2e98a0c95df2a9edd03c2c2e0cacd4780f20cdf56263a0"
      url: "https://pub.dev"
    source: hosted
    version: "0.9.4"
  file_selector_macos:
    dependency: transitive
    description:
      name: file_selector_macos
      sha256: "5e0bbe9c312416f1787a68259ea1505b52f258c587f12920422671807c4d618a"
      url: "https://pub.dev"
    source: hosted
    version: "0.9.5"
  file_selector_platform_interface:
    dependency: transitive
    description:
      name: file_selector_platform_interface
      sha256: "35e0bd61ebcdb91a3505813b055b09b79dfdc7d0aee9c09a7ba59ae4bb13dc85"
      url: "https://pub.dev"
    source: hosted
    version: "2.7.0"
  file_selector_windows:
    dependency: transitive
    description:
      name: file_selector_windows
      sha256: "62197474ae75893a62df75939c777763d39c2bc5f73ce5b88497208bc269abfd"
      url: "https://pub.dev"
    source: hosted
    version: "0.9.3+5"
  fixnum:
    dependency: transitive
    description:
      name: fixnum
      sha256: b6dc7065e46c974bc7c5f143080a6764ec7a4be6da1285ececdc37be96de53be
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  flutter:
    dependency: "direct main"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_lints:
    dependency: "direct dev"
    description:
      name: flutter_lints
      sha256: "3105dc8492f6183fb076ccf1f351ac3d60564bff92e20bfc4af9cc1651f4e7e1"
      url: "https://pub.dev"
    source: hosted
    version: "6.0.0"
  flutter_llama:
    dependency: "direct main"
    description:
      name: flutter_llama
      sha256: c347703791c2b27685aa324f2896bd4215ffe808daee423c040f2ad4a4ca582b
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  flutter_localizations:
    dependency: "direct main"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_plugin_android_lifecycle:
    dependency: transitive
    description:
      name: flutter_plugin_android_lifecycle
      sha256: "38d1c268de9097ff59cf0e844ac38759fc78f76836d37edad06fa21e182055a0"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.34"
  flutter_riverpod:
    dependency: "direct main"
    description:
      name: flutter_riverpod
      sha256: "9532ee6db4a943a1ed8383072a2e3eeda041db5657cdf6d2acecf3c21ecbe7e1"
      url: "https://pub.dev"
    source: hosted
    version: "2.6.1"
  flutter_slidable:
    dependency: "direct dev"
    description:
      name: flutter_slidable
      sha256: a857de7ea701f276fd6a6c4c67ae885b60729a3449e42766bb0e655171042801
      url: "https://pub.dev"
    source: hosted
    version: "3.1.2"
  flutter_test:
    dependency: "direct dev"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_web_plugins:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.0"
  freezed:
    dependency: "direct dev"
    description:
      name: freezed
      sha256: "59a584c24b3acdc5250bb856d0d3e9c0b798ed14a4af1ddb7dc1c7b41df91c9c"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.8"
  freezed_annotation:
    dependency: "direct main"
    description:
      name: freezed_annotation
      sha256: c2e2d632dd9b8a2b7751117abcfc2b4888ecfe181bd9fca7170d9ef02e595fe2
      url: "https://pub.dev"
    source: hosted
    version: "2.4.4"
  frontend_server_client:
    dependency: transitive
    description:
      name: frontend_server_client
      sha256: f64a0333a82f30b0cca061bc3d143813a486dc086b574bfb233b7c1372427694
      url: "https://pub.dev"
    source: hosted
    version: "4.0.0"
  glob:
    dependency: transitive
    description:
      name: glob
      sha256: c3f1ee72c96f8f78935e18aa8cecced9ab132419e8625dc187e1c2408efc20de
      url: "https://pub.dev"
    source: hosted
    version: "2.1.3"
  graphs:
    dependency: transitive
    description:
      name: graphs
      sha256: "741bbf84165310a68ff28fe9e727332eef1407342fca52759cb21ad8177bb8d0"
      url: "https://pub.dev"
    source: hosted
    version: "2.3.2"
  hooks:
    dependency: transitive
    description:
      name: hooks
      sha256: e79ed1e8e1929bc6ecb6ec85f0cb519c887aa5b423705ded0d0f2d9226def388
      url: "https://pub.dev"
    source: hosted
    version: "1.0.2"
  http:
    dependency: "direct main"
    description:
      name: http
      sha256: "87721a4a50b19c7f1d49001e51409bddc46303966ce89a65af4f4e6004896412"
      url: "https://pub.dev"
    source: hosted
    version: "1.6.0"
  http_multi_server:
    dependency: transitive
    description:
      name: http_multi_server
      sha256: aa6199f908078bb1c5efb8d8638d4ae191aac11b311132c3ef48ce352fb52ef8
      url: "https://pub.dev"
    source: hosted
    version: "3.2.2"
  http_parser:
    dependency: transitive
    description:
      name: http_parser
      sha256: "178d74305e7866013777bab2c3d8726205dc5a4dd935297175b19a23a2e66571"
      url: "https://pub.dev"
    source: hosted
    version: "4.1.2"
  image_picker:
    dependency: "direct main"
    description:
      name: image_picker
      sha256: "784210112be18ea55f69d7076e2c656a4e24949fa9e76429fe53af0c0f4fa320"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.1"
  image_picker_android:
    dependency: transitive
    description:
      name: image_picker_android
      sha256: "9eae0cbd672549dacc18df855c2a23782afe4854ada5190b7d63b30ee0b0d3fd"
      url: "https://pub.dev"
    source: hosted
    version: "0.8.13+15"
  image_picker_for_web:
    dependency: transitive
    description:
      name: image_picker_for_web
      sha256: "66257a3191ab360d23a55c8241c91a6e329d31e94efa7be9cf7a212e65850214"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.1"
  image_picker_ios:
    dependency: transitive
    description:
      name: image_picker_ios
      sha256: b9c4a438a9ff4f60808c9cf0039b93a42bb6c2211ef6ebb647394b2b3fa84588
      url: "https://pub.dev"
    source: hosted
    version: "0.8.13+6"
  image_picker_linux:
    dependency: transitive
    description:
      name: image_picker_linux
      sha256: "1f81c5f2046b9ab724f85523e4af65be1d47b038160a8c8deed909762c308ed4"
      url: "https://pub.dev"
    source: hosted
    version: "0.2.2"
  image_picker_macos:
    dependency: transitive
    description:
      name: image_picker_macos
      sha256: "86f0f15a309de7e1a552c12df9ce5b59fe927e71385329355aec4776c6a8ec91"
      url: "https://pub.dev"
    source: hosted
    version: "0.2.2+1"
  image_picker_platform_interface:
    dependency: transitive
    description:
      name: image_picker_platform_interface
      sha256: "567e056716333a1647c64bb6bd873cff7622233a5c3f694be28a583d4715690c"
      url: "https://pub.dev"
    source: hosted
    version: "2.11.1"
  image_picker_windows:
    dependency: transitive
    description:
      name: image_picker_windows
      sha256: d248c86554a72b5495a31c56f060cf73a41c7ff541689327b1a7dbccc33adfae
      url: "https://pub.dev"
    source: hosted
    version: "0.2.2"
  intl:
    dependency: "direct dev"
    description:
      name: intl
      sha256: "3df61194eb431efc39c4ceba583b95633a403f46c9fd341e550ce0bfa50e9aa5"
      url: "https://pub.dev"
    source: hosted
    version: "0.20.2"
  io:
    dependency: transitive
    description:
      name: io
      sha256: dfd5a80599cf0165756e3181807ed3e77daf6dd4137caaad72d0b7931597650b
      url: "https://pub.dev"
    source: hosted
    version: "1.0.5"
  js:
    dependency: transitive
    description:
      name: js
      sha256: "53385261521cc4a0c4658fd0ad07a7d14591cf8fc33abbceae306ddb974888dc"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.2"
  json_annotation:
    dependency: "direct main"
    description:
      name: json_annotation
      sha256: "1ce844379ca14835a50d2f019a3099f419082cfdd231cd86a142af94dd5c6bb1"
      url: "https://pub.dev"
    source: hosted
    version: "4.9.0"
  json_serializable:
    dependency: "direct dev"
    description:
      name: json_serializable
      sha256: c50ef5fc083d5b5e12eef489503ba3bf5ccc899e487d691584699b4bdefeea8c
      url: "https://pub.dev"
    source: hosted
    version: "6.9.5"
  leak_tracker:
    dependency: transitive
    description:
      name: leak_tracker
      sha256: "33e2e26bdd85a0112ec15400c8cbffea70d0f9c3407491f672a2fad47915e2de"
      url: "https://pub.dev"
    source: hosted
    version: "11.0.2"
  leak_tracker_flutter_testing:
    dependency: transitive
    description:
      name: leak_tracker_flutter_testing
      sha256: "1dbc140bb5a23c75ea9c4811222756104fbcd1a27173f0c34ca01e16bea473c1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.10"
  leak_tracker_testing:
    dependency: transitive
    description:
      name: leak_tracker_testing
      sha256: "8d5a2d49f4a66b49744b23b018848400d23e54caf9463f4eb20df3eb8acb2eb1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.2"
  lints:
    dependency: transitive
    description:
      name: lints
      sha256: "12f842a479589fea194fe5c5a3095abc7be0c1f2ddfa9a0e76aed1dbd26a87df"
      url: "https://pub.dev"
    source: hosted
    version: "6.1.0"
  logging:
    dependency: transitive
    description:
      name: logging
      sha256: c8245ada5f1717ed44271ed1c26b8ce85ca3228fd2ffdb75468ab01979309d61
      url: "https://pub.dev"
    source: hosted
    version: "1.3.0"
  matcher:
    dependency: transitive
    description:
      name: matcher
      sha256: dc0b7dc7651697ea4ff3e69ef44b0407ea32c487a39fff6a4004fa585e901861
      url: "https://pub.dev"
    source: hosted
    version: "0.12.19"
  material_color_utilities:
    dependency: transitive
    description:
      name: material_color_utilities
      sha256: "9c337007e82b1889149c82ed242ed1cb24a66044e30979c44912381e9be4c48b"
      url: "https://pub.dev"
    source: hosted
    version: "0.13.0"
  meta:
    dependency: transitive
    description:
      name: meta
      sha256: "23f08335362185a5ea2ad3a4e597f1375e78bce8a040df5c600c8d3552ef2394"
      url: "https://pub.dev"
    source: hosted
    version: "1.17.0"
  mime:
    dependency: transitive
    description:
      name: mime
      sha256: "41a20518f0cb1256669420fdba0cd90d21561e560ac240f26ef8322e45bb7ed6"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.0"
  native_toolchain_c:
    dependency: transitive
    description:
      name: native_toolchain_c
      sha256: "6ba77bb18063eebe9de401f5e6437e95e1438af0a87a3a39084fbd37c90df572"
      url: "https://pub.dev"
    source: hosted
    version: "0.17.6"
  objective_c:
    dependency: transitive
    description:
      name: objective_c
      sha256: "100a1c87616ab6ed41ec263b083c0ef3261ee6cd1dc3b0f35f8ddfa4f996fe52"
      url: "https://pub.dev"
    source: hosted
    version: "9.3.0"
  package_config:
    dependency: transitive
    description:
      name: package_config
      sha256: f096c55ebb7deb7e384101542bfba8c52696c1b56fca2eb62827989ef2353bbc
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  path:
    dependency: "direct main"
    description:
      name: path
      sha256: "75cca69d1490965be98c73ceaea117e8a04dd21217b37b292c9ddbec0d955bc5"
      url: "https://pub.dev"
    source: hosted
    version: "1.9.1"
  path_provider:
    dependency: "direct main"
    description:
      name: path_provider
      sha256: "50c5dd5b6e1aaf6fb3a78b33f6aa3afca52bf903a8a5298f53101fdaee55bbcd"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.5"
  path_provider_android:
    dependency: transitive
    description:
      name: path_provider_android
      sha256: "149441ca6e4f38193b2e004c0ca6376a3d11f51fa5a77552d8bd4d2b0c0912ba"
      url: "https://pub.dev"
    source: hosted
    version: "2.2.23"
  path_provider_foundation:
    dependency: transitive
    description:
      name: path_provider_foundation
      sha256: "2a376b7d6392d80cd3705782d2caa734ca4727776db0b6ec36ef3f1855197699"
      url: "https://pub.dev"
    source: hosted
    version: "2.6.0"
  path_provider_linux:
    dependency: transitive
    description:
      name: path_provider_linux
      sha256: f7a1fe3a634fe7734c8d3f2766ad746ae2a2884abe22e241a8b301bf5cac3279
      url: "https://pub.dev"
    source: hosted
    version: "2.2.1"
  path_provider_platform_interface:
    dependency: transitive
    description:
      name: path_provider_platform_interface
      sha256: "88f5779f72ba699763fa3a3b06aa4bf6de76c8e5de842cf6f29e2e06476c2334"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  path_provider_windows:
    dependency: transitive
    description:
      name: path_provider_windows
      sha256: bd6f00dbd873bfb70d0761682da2b3a2c2fccc2b9e84c495821639601d81afe7
      url: "https://pub.dev"
    source: hosted
    version: "2.3.0"
  petitparser:
    dependency: transitive
    description:
      name: petitparser
      sha256: "91bd59303e9f769f108f8df05e371341b15d59e995e6806aefab827b58336675"
      url: "https://pub.dev"
    source: hosted
    version: "7.0.2"
  platform:
    dependency: transitive
    description:
      name: platform
      sha256: "5d6b1b0036a5f331ebc77c850ebc8506cbc1e9416c27e59b439f917a902a4984"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.6"
  plugin_platform_interface:
    dependency: transitive
    description:
      name: plugin_platform_interface
      sha256: "4820fbfdb9478b1ebae27888254d445073732dae3d6ea81f0b7e06d5dedc3f02"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.8"
  pool:
    dependency: transitive
    description:
      name: pool
      sha256: "978783255c543aa3586a1b3c21f6e9d720eb315376a915872c61ef8b5c20177d"
      url: "https://pub.dev"
    source: hosted
    version: "1.5.2"
  pub_semver:
    dependency: transitive
    description:
      name: pub_semver
      sha256: "5bfcf68ca79ef689f8990d1160781b4bad40a3bd5e5218ad4076ddb7f4081585"
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  pubspec_parse:
    dependency: transitive
    description:
      name: pubspec_parse
      sha256: "0560ba233314abbed0a48a2956f7f022cce7c3e1e73df540277da7544cad4082"
      url: "https://pub.dev"
    source: hosted
    version: "1.5.0"
  recase:
    dependency: transitive
    description:
      name: recase
      sha256: e4eb4ec2dcdee52dcf99cb4ceabaffc631d7424ee55e56f280bc039737f89213
      url: "https://pub.dev"
    source: hosted
    version: "4.1.0"
  riverpod:
    dependency: transitive
    description:
      name: riverpod
      sha256: "59062512288d3056b2321804332a13ffdd1bf16df70dcc8e506e411280a72959"
      url: "https://pub.dev"
    source: hosted
    version: "2.6.1"
  riverpod_analyzer_utils:
    dependency: transitive
    description:
      name: riverpod_analyzer_utils
      sha256: "837a6dc33f490706c7f4632c516bcd10804ee4d9ccc8046124ca56388715fdf3"
      url: "https://pub.dev"
    source: hosted
    version: "0.5.9"
  riverpod_annotation:
    dependency: "direct main"
    description:
      name: riverpod_annotation
      sha256: e14b0bf45b71326654e2705d462f21b958f987087be850afd60578fcd502d1b8
      url: "https://pub.dev"
    source: hosted
    version: "2.6.1"
  riverpod_generator:
    dependency: "direct dev"
    description:
      name: riverpod_generator
      sha256: "120d3310f687f43e7011bb213b90a436f1bbc300f0e4b251a72c39bccb017a4f"
      url: "https://pub.dev"
    source: hosted
    version: "2.6.4"
  rxdart:
    dependency: "direct main"
    description:
      name: rxdart
      sha256: "5c3004a4a8dbb94bd4bf5412a4def4acdaa12e12f269737a5751369e12d1a962"
      url: "https://pub.dev"
    source: hosted
    version: "0.28.0"
  share_plus:
    dependency: "direct main"
    description:
      name: share_plus
      sha256: fce43200aa03ea87b91ce4c3ac79f0cecd52e2a7a56c7a4185023c271fbfa6da
      url: "https://pub.dev"
    source: hosted
    version: "10.1.4"
  share_plus_platform_interface:
    dependency: transitive
    description:
      name: share_plus_platform_interface
      sha256: cc012a23fc2d479854e6c80150696c4a5f5bb62cb89af4de1c505cf78d0a5d0b
      url: "https://pub.dev"
    source: hosted
    version: "5.0.2"
  shelf:
    dependency: transitive
    description:
      name: shelf
      sha256: e7dd780a7ffb623c57850b33f43309312fc863fb6aa3d276a754bb299839ef12
      url: "https://pub.dev"
    source: hosted
    version: "1.4.2"
  shelf_web_socket:
    dependency: transitive
    description:
      name: shelf_web_socket
      sha256: "3632775c8e90d6c9712f883e633716432a27758216dfb61bd86a8321c0580925"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.0"
  sky_engine:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.0"
  source_gen:
    dependency: transitive
    description:
      name: source_gen
      sha256: "35c8150ece9e8c8d263337a265153c3329667640850b9304861faea59fc98f6b"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.0"
  source_helper:
    dependency: transitive
    description:
      name: source_helper
      sha256: a447acb083d3a5ef17f983dd36201aeea33fedadb3228fa831f2f0c92f0f3aca
      url: "https://pub.dev"
    source: hosted
    version: "1.3.7"
  source_span:
    dependency: transitive
    description:
      name: source_span
      sha256: "56a02f1f4cd1a2d96303c0144c93bd6d909eea6bee6bf5a0e0b685edbd4c47ab"
      url: "https://pub.dev"
    source: hosted
    version: "1.10.2"
  sqlite3:
    dependency: transitive
    description:
      name: sqlite3
      sha256: "3145bd74dcdb4fd6f5c6dda4d4e4490a8087d7f286a14dee5d37087290f0f8a2"
      url: "https://pub.dev"
    source: hosted
    version: "2.9.4"
  sqlite3_flutter_libs:
    dependency: "direct main"
    description:
      name: sqlite3_flutter_libs
      sha256: eeb9e3a45207649076b808f8a5a74d68770d0b7f26ccef6d5f43106eee5375ad
      url: "https://pub.dev"
    source: hosted
    version: "0.5.42"
  sqlparser:
    dependency: transitive
    description:
      name: sqlparser
      sha256: "57090342af1ce32bb499aa641f4ecdd2d6231b9403cea537ac059e803cc20d67"
      url: "https://pub.dev"
    source: hosted
    version: "0.41.2"
  stack_trace:
    dependency: transitive
    description:
      name: stack_trace
      sha256: "8b27215b45d22309b5cddda1aa2b19bdfec9df0e765f2de506401c071d38d1b1"
      url: "https://pub.dev"
    source: hosted
    version: "1.12.1"
  state_notifier:
    dependency: transitive
    description:
      name: state_notifier
      sha256: b8677376aa54f2d7c58280d5a007f9e8774f1968d1fb1c096adcb4792fba29bb
      url: "https://pub.dev"
    source: hosted
    version: "1.0.0"
  stream_channel:
    dependency: transitive
    description:
      name: stream_channel
      sha256: "969e04c80b8bcdf826f8f16579c7b14d780458bd97f56d107d3950fdbeef059d"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  stream_transform:
    dependency: transitive
    description:
      name: stream_transform
      sha256: ad47125e588cfd37a9a7f86c7d6356dde8dfe89d071d293f80ca9e9273a33871
      url: "https://pub.dev"
    source: hosted
    version: "2.1.1"
  string_scanner:
    dependency: transitive
    description:
      name: string_scanner
      sha256: "921cd31725b72fe181906c6a94d987c78e3b98c2e205b397ea399d4054872b43"
      url: "https://pub.dev"
    source: hosted
    version: "1.4.1"
  synchronized:
    dependency: "direct dev"
    description:
      name: synchronized
      sha256: c254ade258ec8282947a0acbbc90b9575b4f19673533ee46f2f6e9b3aeefd7c0
      url: "https://pub.dev"
    source: hosted
    version: "3.4.0"
  term_glyph:
    dependency: transitive
    description:
      name: term_glyph
      sha256: "7f554798625ea768a7518313e58f83891c7f5024f88e46e7182a4558850a4b8e"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.2"
  test_api:
    dependency: transitive
    description:
      name: test_api
      sha256: "8161c84903fd860b26bfdefb7963b3f0b68fee7adea0f59ef805ecca346f0c7a"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.10"
  timing:
    dependency: transitive
    description:
      name: timing
      sha256: "62ee18aca144e4a9f29d212f5a4c6a053be252b895ab14b5821996cff4ed90fe"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.2"
  typed_data:
    dependency: transitive
    description:
      name: typed_data
      sha256: f9049c039ebfeb4cf7a7104a675823cd72dba8297f264b6637062516699fa006
      url: "https://pub.dev"
    source: hosted
    version: "1.4.0"
  url_launcher_linux:
    dependency: transitive
    description:
      name: url_launcher_linux
      sha256: d5e14138b3bc193a0f63c10a53c94b91d399df0512b1f29b94a043db7482384a
      url: "https://pub.dev"
    source: hosted
    version: "3.2.2"
  url_launcher_platform_interface:
    dependency: transitive
    description:
      name: url_launcher_platform_interface
      sha256: "552f8a1e663569be95a8190206a38187b531910283c3e982193e4f2733f01029"
      url: "https://pub.dev"
    source: hosted
    version: "2.3.2"
  url_launcher_web:
    dependency: transitive
    description:
      name: url_launcher_web
      sha256: d0412fcf4c6b31ecfdb7762359b7206ffba3bbffd396c6d9f9c4616ece476c1f
      url: "https://pub.dev"
    source: hosted
    version: "2.4.2"
  url_launcher_windows:
    dependency: transitive
    description:
      name: url_launcher_windows
      sha256: "712c70ab1b99744ff066053cbe3e80c73332b38d46e5e945c98689b2e66fc15f"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.5"
  uuid:
    dependency: "direct main"
    description:
      name: uuid
      sha256: "1fef9e8e11e2991bb773070d4656b7bd5d850967a2456cfc83cf47925ba79489"
      url: "https://pub.dev"
    source: hosted
    version: "4.5.3"
  vector_math:
    dependency: transitive
    description:
      name: vector_math
      sha256: d530bd74fea330e6e364cda7a85019c434070188383e1cd8d9777ee586914c5b
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  vm_service:
    dependency: transitive
    description:
      name: vm_service
      sha256: "45caa6c5917fa127b5dbcfbd1fa60b14e583afdc08bfc96dda38886ca252eb60"
      url: "https://pub.dev"
    source: hosted
    version: "15.0.2"
  watcher:
    dependency: transitive
    description:
      name: watcher
      sha256: "1398c9f081a753f9226febe8900fce8f7d0a67163334e1c94a2438339d79d635"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.1"
  web:
    dependency: transitive
    description:
      name: web
      sha256: "868d88a33d8a87b18ffc05f9f030ba328ffefba92d6c127917a2ba740f9cfe4a"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  web_socket:
    dependency: transitive
    description:
      name: web_socket
      sha256: "34d64019aa8e36bf9842ac014bb5d2f5586ca73df5e4d9bf5c936975cae6982c"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.1"
  web_socket_channel:
    dependency: transitive
    description:
      name: web_socket_channel
      sha256: d645757fb0f4773d602444000a8131ff5d48c9e47adfe9772652dd1a4f2d45c8
      url: "https://pub.dev"
    source: hosted
    version: "3.0.3"
  win32:
    dependency: transitive
    description:
      name: win32
      sha256: d7cb55e04cd34096cd3a79b3330245f54cb96a370a1c27adb3c84b917de8b08e
      url: "https://pub.dev"
    source: hosted
    version: "5.15.0"
  xdg_directories:
    dependency: transitive
    description:
      name: xdg_directories
      sha256: "7a3f37b05d989967cdddcbb571f1ea834867ae2faa29725fd085180e0883aa15"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.0"
  xml:
    dependency: transitive
    description:
      name: xml
      sha256: "971043b3a0d3da28727e40ed3e0b5d18b742fa5a68665cca88e74b7876d5e025"
      url: "https://pub.dev"
    source: hosted
    version: "6.6.1"
  yaml:
    dependency: transitive
    description:
      name: yaml
      sha256: b9da305ac7c39faa3f030eccd175340f968459dae4af175130b3fc47e40d76ce
      url: "https://pub.dev"
    source: hosted
    version: "3.1.3"
sdks:
  dart: ">=3.11.1 <4.0.0"
  flutter: ">=3.38.4"
````

## File: lib/presentation/pages/settings_page.dart
````dart
// lib/presentation/pages/settings_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../../data/services/config_service.dart';
import '../../di/providers.dart';
import '../providers/config_notifier.dart';
import '../providers/settings_form_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import '../widgets/common/declarative_text_field.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(settingsFormProvider);
    final formNotifier = ref.read(settingsFormProvider.notifier);
    final profilesAsync = ref.watch(configProfilesProvider);
    final configService = ref.read(configServiceProvider);

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('设置'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _confirmRestoreDefaults(context, formNotifier),
          child: const Icon(CupertinoIcons.arrow_counterclockwise),
        ),
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('加载配置存档失败：$e')),
        data: (store) {
          return ListView(
            children: [
              _buildProfileSection(context, store, configService),
              _buildConnectionSection(formState, formNotifier),
              _buildModelSection(formState, formNotifier),
              _buildActionSection(formState, formNotifier),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context,
    AppConfigStore store,
    ConfigService configService,
  ) {
    final activeProfile = store.profiles.firstWhere((p) => p.id == store.activeProfileId);
    return CupertinoFormSection.insetGrouped(
      header: const Text('配置存档'),
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('当前配置'),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showProfileManagementSheet(context, store, configService),
            child: Text(activeProfile.name),
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    return CupertinoFormSection.insetGrouped(
      header: const Text('连接配置'),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('Base URL'),
          child: _buildStyledTextField(
            value: formState.config.baseUrl,
            onChanged: notifier.updateBaseUrl,
            placeholder: 'https://api.openai.com',
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('API Key'),
          child: _buildStyledTextField(
            value: formState.config.apiKey,
            onChanged: notifier.updateApiKey,
            placeholder: 'API Key',
            obscureText: true,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('Models Path'),
          child: _buildStyledTextField(
            value: formState.config.modelsPath,
            onChanged: notifier.updateModelsPath,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('Chat Path'),
          child: _buildStyledTextField(
            value: formState.config.chatPath,
            onChanged: notifier.updateChatPath,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('API Mode'),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showApiModePicker(context, notifier),
            child: Text(formState.config.apiMode),
          ),
        ),
      ],
    );
  }

  Widget _buildModelSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    final models = formState.config.availableModels ?? const <ModelInfo>[];
    final currentModelId = formState.config.selectedModel;
    final currentModel = currentModelId != null
        ? models.where((m) => m.id == currentModelId).firstOrNull
        : null;
    final supportsReasoning = currentModel?.overrideSupportsReasoning ?? false;
    final supportsVision = currentModel?.overrideSupportsVision ?? false;

    return CupertinoFormSection.insetGrouped(
      header: const Text('模型设置'),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('模型 ID'),
          child: Row(
            children: [
              Expanded(
                child: _buildStyledTextField(
                  value: currentModelId ?? '',
                  onChanged: notifier.updateSelectedModel,
                  placeholder: '输入模型 ID',
                ),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                borderRadius: BorderRadius.circular(12),
                onPressed: models.isNotEmpty
                    ? () => _showModelPicker(context, models, notifier)
                    : null,
                child: const Text('从列表选择'),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                borderRadius: BorderRadius.circular(12),
                onPressed: () async {
                  try {
                    await notifier.refreshModels();
                    if (mounted) AppToast.show('模型列表已同步');
                  } catch (e) {
                    if (mounted) AppToast.show('同步模型失败：$e');
                  }
                },
                child: formState.isRefreshingModels
                    ? const SizedBox(width: 20, height: 20, child: CupertinoActivityIndicator())
                    : const Text('立即同步'),
              ),
            ],
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('启用思考'),
          child: CupertinoSwitch(
            value: supportsReasoning,
            onChanged: notifier.toggleReasoning,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('允许图片输入'),
          child: CupertinoSwitch(
            value: supportsVision,
            onChanged: notifier.toggleVision,
          ),
        ),
      ],
    );
  }

  Widget _buildActionSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    return CupertinoFormSection.insetGrouped(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
      children: [
        CupertinoFormRow(
          child: CupertinoButton.filled(
            borderRadius: BorderRadius.circular(12),
            onPressed: formState.isSaving
                ? null
                : () async {
                    try {
                      await notifier.save();
                      if (mounted) AppToast.show('设置已保存');
                    } catch (e) {
                      if (mounted) AppToast.show('保存失败：$e');
                    }
                  },
            child: formState.isSaving
                ? const CupertinoActivityIndicator()
                : const Text('保存设置'),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledTextField({
    required String value,
    required ValueChanged<String> onChanged,
    String? placeholder,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DeclarativeCupertinoTextField(
        value: value,
        onChanged: onChanged,
        placeholder: placeholder,
        obscureText: obscureText,
      ),
    );
  }

  // ------------------ 弹窗方法 ------------------
  void _showApiModePicker(BuildContext context, SettingsFormNotifier notifier) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('chat_completions'); Navigator.pop(context); },
            child: const Text('chat_completions'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('responses'); Navigator.pop(context); },
            child: const Text('responses'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('google'); Navigator.pop(context); },
            child: const Text('google'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('local'); Navigator.pop(context); },
            child: const Text('local'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  void _showModelPicker(BuildContext context, List<ModelInfo> models, SettingsFormNotifier notifier) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('选择模型'),
        actions: models.map((model) {
          final label = model.id;
          return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              notifier.updateSelectedModel(model.id);
            },
            child: Text(label),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  void _showProfileManagementSheet(
    BuildContext context,
    AppConfigStore store,
    ConfigService configService,
  ) {
    final activeProfile = store.profiles.firstWhere((p) => p.id == store.activeProfileId);
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('配置存档管理'),
        actions: [
          ...store.profiles.map((p) => CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              if (p.id != store.activeProfileId) configService.switchProfile(p.id);
            },
            isDefaultAction: p.id == store.activeProfileId,
            child: Row(
              children: [
                Expanded(child: Text(p.name)),
                if (p.id == store.activeProfileId)
                  const Icon(CupertinoIcons.check_mark, size: 18, color: CupertinoColors.systemBlue),
              ],
            ),
          )),
          const SizedBox(height: 8),
          CupertinoActionSheetAction(
            onPressed: () { Navigator.pop(context); _showCreateProfileDialog(context, configService); },
            child: const Text('新建配置'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { Navigator.pop(context); _showRenameProfileDialog(context, activeProfile, configService); },
            child: const Text('重命名当前配置'),
          ),
          if (store.profiles.length > 1)
            CupertinoActionSheetAction(
              onPressed: () { Navigator.pop(context); _deleteProfile(context, activeProfile, store.profiles.length, configService); },
              isDestructiveAction: true,
              child: const Text('删除当前配置'),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  Future<void> _showCreateProfileDialog(BuildContext context, ConfigService configService) async {
    final controller = TextEditingController();
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('新建配置存档'),
        content: CupertinoTextField(controller: controller, autofocus: true, placeholder: '输入配置名称'),
        actions: [
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('创建')),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) await configService.createProfile(result);
  }

  Future<void> _showRenameProfileDialog(BuildContext context, ConfigProfile profile, ConfigService configService) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('重命名配置存档'),
        content: CupertinoTextField(controller: controller, autofocus: true, placeholder: '输入配置名称'),
        actions: [
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('保存')),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) await configService.renameProfile(profile.id, result);
  }

  Future<void> _deleteProfile(BuildContext context, ConfigProfile profile, int profileCount, ConfigService configService) async {
    if (profileCount <= 1) {
      AppToast.show('至少保留一个配置存档');
      return;
    }
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除配置存档'),
            content: Text('确定删除 "${profile.name}" 吗？'),
            actions: [
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(true), isDestructiveAction: true, child: const Text('删除')),
            ],
          ),
        ) ??
        false;
    if (confirmed) await configService.deleteProfile(profile.id);
  }

  Future<void> _confirmRestoreDefaults(BuildContext context, SettingsFormNotifier notifier) async {
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('恢复默认设置'),
            content: const Text('确定要将当前配置存档恢复为默认设置吗？'),
            actions: [
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true), 
                isDestructiveAction: true,
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;
    if (confirmed) {
      notifier.restoreDefaults();
      await notifier.save();
      if (mounted) AppToast.show('已恢复默认设置');
    }
  }
}
````

## File: pubspec.yaml
````yaml
name: aiservice
description: "AI Chat with Branch Tree - 支持分支对话树的 AI 聊天应用"
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ^3.11.1

dependencies:
  flutter:
    sdk: flutter
  flutter_llama: ^1.1.2
  # ========== 状态管理 ==========
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3

  # ========== 代码生成 ==========
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

  # ========== HTTP 网络请求 ==========
  http: ^1.6.0

  # ========== 本地存储/文件操作 ==========
  path_provider: ^2.1.2
  path: ^1.8.3

  # ========== UUID 生成 ==========
  uuid: ^4.3.3

  # ========== 图片/附件选择 ==========
  image_picker: ^1.0.7

  # ========== 基础 UI 组件 ==========
  cupertino_icons: ^1.0.8

  share_plus: ^10.0.2

  drift: ^2.14.0
  sqlite3_flutter_libs: ^0.5.0

  collection: ^1.19.1
  rxdart: ^0.28.0
  flutter_localizations:
    sdk: flutter
dev_dependencies:
  flutter_test:
    sdk: flutter

  # ========== 代码生成工具 ==========
  build_runner: ^2.4.8
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  riverpod_generator: ^2.3.9

  # ========== 代码检查 ==========
  flutter_lints: ^6.0.0

  flutter_slidable: ^3.0.1

  intl: ^0.20.2

  file_picker: ^11.0.2

  synchronized: ^3.3.0

  crypto: ^3.0.3

  drift_dev: ^2.14.0
````

## File: lib/presentation/pages/branch_tree_page.dart
````dart
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatTopologyProvider, roundDetailProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

const double _nodeWidth = 300.0;
const double _nodeHeight = 200.0;
const double _levelSeparation = 120.0;
const double _siblingSeparation = 40.0;
const double _canvasPadding = 2000.0;

class BranchTreePage extends ConsumerStatefulWidget {
  final String sessionId;
  final String initialFocusRoundId;

  const BranchTreePage({
    super.key,
    required this.sessionId,
    required this.initialFocusRoundId,
  });

  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}

class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final TransformationController _transformationController = TransformationController();
  final GlobalKey _viewerKey = GlobalKey();
  final Map<String, double> _nodeWidthCache = {};
  bool _hasFocused = false;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _computeWidthsForTree(TreeNode root) {
    void postOrder(TreeNode node) {
      if (node.children.isEmpty) {
        _nodeWidthCache[node.id] = _nodeWidth;
        return;
      }
      double total = 0;
      for (final child in node.children) {
        postOrder(child);
        total += _nodeWidthCache[child.id]!;
      }
      total += (node.children.length - 1) * _siblingSeparation;
      _nodeWidthCache[node.id] = total;
    }
    postOrder(root);
  }

  double _subtreeWidth(TreeNode node) {
    return _nodeWidthCache[node.id] ?? _nodeWidth;
  }

  void _layoutNode(TreeNode node, double x, double y, Map<String, Offset> positions) {
    positions[node.id] = Offset(x, y);
    if (node.children.isEmpty) return;

    final childWidths = node.children.map((c) => _subtreeWidth(c)).toList();
    final totalChildrenWidth = childWidths.fold(0.0, (a, b) => a + b) +
        (node.children.length - 1) * _siblingSeparation;
    double startX = x + (_nodeWidth - totalChildrenWidth) / 2;
    for (int i = 0; i < node.children.length; i++) {
      final child = node.children[i];
      final childWidth = childWidths[i];
      final childX = startX + childWidth / 2 - _nodeWidth / 2;
      _layoutNode(child, childX, y + _nodeHeight + _levelSeparation, positions);
      startX += childWidth + _siblingSeparation;
    }
  }

  _TreeLayout _computeLayout(List<TreeNode> roots) {
    _nodeWidthCache.clear();
    for (final root in roots) {
      _computeWidthsForTree(root);
    }
    final positions = <String, Offset>{};
    double currentX = 0;
    double maxHeight = 0;

    for (final root in roots) {
      final tempPositions = <String, Offset>{};
      _layoutNode(root, currentX, 0, tempPositions);

      double minX = double.infinity, maxX = -double.infinity;
      double minY = double.infinity, maxY = -double.infinity;
      for (final pos in tempPositions.values) {
        minX = min(minX, pos.dx);
        maxX = max(maxX, pos.dx + _nodeWidth);
        minY = min(minY, pos.dy);
        maxY = max(maxY, pos.dy + _nodeHeight);
      }
      final width = maxX - minX;
      final height = maxY - minY;

      final offsetX = currentX - minX;
      for (final entry in tempPositions.entries) {
        positions[entry.key] = Offset(entry.value.dx + offsetX, entry.value.dy);
      }

      currentX += width + _siblingSeparation;
      maxHeight = max(maxHeight, height);
    }

    final canvasWidth = currentX + _canvasPadding * 2;
    final canvasHeight = maxHeight + _canvasPadding * 2;
    return _TreeLayout(positions: positions, canvasSize: Size(canvasWidth, canvasHeight));
  }

  List<(Offset, Offset)> _buildParentChildPairs(List<TreeNode> roots, Map<String, Offset> positions) {
    final pairs = <(Offset, Offset)>[];
    void traverse(TreeNode node) {
      final parentPos = positions[node.id];
      if (parentPos == null) return;
      for (final child in node.children) {
        final childPos = positions[child.id];
        if (childPos != null) {
          pairs.add((parentPos, childPos));
        }
        traverse(child);
      }
    }
    for (final root in roots) traverse(root);
    return pairs;
  }

  List<Widget> _buildAllNodeWidgets(List<TreeNode> roots, Map<String, Offset> positions) {
    final widgets = <Widget>[];
    void addNode(TreeNode node) {
      final pos = positions[node.id];
      if (pos != null) {
        widgets.add(
          Positioned(
            left: pos.dx,
            top: pos.dy,
            child: _TreeNodeCard(
              roundId: node.id,
              onSwitch: () => Navigator.of(context).pop(node.id),
              onDelete: () async {
                if (await _confirmDelete()) await _deleteNode(node.id);
              },
            ),
          ),
        );
      }
      for (final child in node.children) addNode(child);
    }
    for (final root in roots) addNode(root);
    return widgets;
  }

  Future<void> _deleteNode(String nodeId) async {
    final topology = await ref.read(chatTopologyProvider(widget.sessionId).future);
    final roots = buildTree(topology);
    final target = _findNodeById(roots, nodeId);
    if (target == null) return;
    final ids = _collectSubtreeIds(target).toList();
    try {
      await ref.read(conversationRepositoryProvider)
          .deleteRoundsAndCleanupOrphanAttachments(widget.sessionId, ids);
    } catch (e) {
      if (mounted) AppToast.show('删除失败：$e');
    }
  }

  Future<bool> _confirmDelete() async {
    return await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除节点'),
            content: const Text('确定删除这一轮及其后续全部分支吗？'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true),
                isDestructiveAction: true,
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Set<String> _collectSubtreeIds(TreeNode root) {
    final ids = <String>{};
    final stack = <TreeNode>[root];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      ids.add(node.id);
      stack.addAll(node.children);
    }
    return ids;
  }

  TreeNode? _findNodeById(List<TreeNode> roots, String targetId) {
    final stack = [...roots];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node.id == targetId) return node;
      stack.addAll(node.children);
    }
    return null;
  }

  void _focusOnNode(String nodeId, Map<String, Offset> positions) {
    if (_hasFocused) return;
    final nodePos = positions[nodeId];
    if (nodePos == null) return;
    final viewerBox = _viewerKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewerBox == null) return;
    final viewerSize = viewerBox.size;
    final nodeCenter = Offset(nodePos.dx + _nodeWidth / 2, nodePos.dy + _nodeHeight / 2);
    final targetOffset = Offset(viewerSize.width / 2 - nodeCenter.dx, viewerSize.height / 2 - nodeCenter.dy);
    _transformationController.value = Matrix4.identity()..translate(targetOffset.dx, targetOffset.dy);
    _hasFocused = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final topology = ref.watch(chatTopologyProvider(widget.sessionId));
    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: const Text('分支树')),
      body: topology.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (err, _) => Center(child: Text('加载分支结构失败：$err')),
        data: (topology) {
          final roots = buildTree(topology);
          if (roots.isEmpty) return const Center(child: Text('暂无分支结构'));
          final layout = _computeLayout(roots);
          final positions = layout.positions;
          final canvasSize = layout.canvasSize;
          final pairs = _buildParentChildPairs(roots, positions);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_hasFocused) _focusOnNode(widget.initialFocusRoundId, positions);
          });
          return InteractiveViewer(
            key: _viewerKey,
            transformationController: _transformationController,
            minScale: 0.2,
            maxScale: 3.0,
            constrained: false,
            boundaryMargin: const EdgeInsets.all(_canvasPadding),
            child: SizedBox(
              width: canvasSize.width,
              height: canvasSize.height,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: _OrthogonalLinePainter(pairs: pairs),
                    size: canvasSize,
                  ),
                  ..._buildAllNodeWidgets(roots, positions),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TreeLayout {
  final Map<String, Offset> positions;
  final Size canvasSize;
  _TreeLayout({required this.positions, required this.canvasSize});
}

class _OrthogonalLinePainter extends CustomPainter {
  final List<(Offset, Offset)> pairs;
  _OrthogonalLinePainter({required this.pairs});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CupertinoColors.separator
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    for (final pair in pairs) {
      final parentCenter = Offset(pair.$1.dx + _nodeWidth / 2, pair.$1.dy + _nodeHeight / 2);
      final childCenter = Offset(pair.$2.dx + _nodeWidth / 2, pair.$2.dy + _nodeHeight / 2);
      final start = Offset(parentCenter.dx, parentCenter.dy + _nodeHeight / 2);
      final end = Offset(childCenter.dx, childCenter.dy - _nodeHeight / 2);
      final midY = (start.dy + end.dy) / 2;
      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..lineTo(start.dx, midY)
        ..lineTo(end.dx, midY)
        ..lineTo(end.dx, end.dy);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _OrthogonalLinePainter oldDelegate) => true;
}

class _TreeNodeCard extends ConsumerWidget {
  final String roundId;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _TreeNodeCard({
    required this.roundId,
    required this.onSwitch,
    required this.onDelete,
  });

  Widget _buildStatusDot({required bool isStreaming, required bool hasUnseen}) {
    if (isStreaming) {
      return Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemOrange,
          shape: BoxShape.circle,
        ),
      );
    }
    if (hasUnseen) {
      return Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemBlue,
          shape: BoxShape.circle,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    final dateText = round == null
        ? null
        : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.createdAt));
    final userText = round?.userContent;
    final aiText = round == null
        ? null
        : ((round.assistantContent ?? '').trim().isEmpty ? '（等待回复）' : round.assistantContent!);

    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
            onDelete();
          },
          isDestructiveAction: true,
          child: const Text('删除节点'),
        ),
      ],
      child: Container(
        width: _nodeWidth,
        height: _nodeHeight,
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    dateText ?? '加载中...',
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (round != null && (round.isIncomplete || round.hasUnseenUpdate))
                  _buildStatusDot(isStreaming: round.isIncomplete, hasUnseen: round.hasUnseenUpdate),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(child: _PreviewSlot(label: 'YOU', content: userText, loading: round == null)),
            const SizedBox(height: 4),
            Expanded(child: _PreviewSlot(label: 'AI', content: aiText, loading: round == null)),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                borderRadius: BorderRadius.circular(12),
                onPressed: onSwitch,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text('切换到此分支'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PreviewSlot extends StatelessWidget {
  final String label;
  final String? content;
  final bool loading;

  const _PreviewSlot({
    required this.label,
    required this.content,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = CupertinoDynamicColor.resolve(CupertinoColors.label, context);
    final style = CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: textColor);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 34,
          child: Text('$label ', style: style),
        ),
        Expanded(
          child: loading
              ? const Text('加载中...', maxLines: 2, overflow: TextOverflow.ellipsis)
              : Text(
                  (content == null || content!.trim().isEmpty) ? '（空）' : content!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
        ),
      ],
    );
  }
}
````

## File: lib/presentation/widgets/input_bar.dart
````dart
import 'dart:io';

import 'package:aiservice/presentation/models/input_state.dart';
import 'package:aiservice/presentation/widgets/common/app_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/pending_attachment.dart';
import '../pages/image_attachment_viewer_page.dart';
import '../pages/text_attachment_viewer_page.dart';
import '../providers/input_notifier.dart';

class InputBar extends ConsumerStatefulWidget {
  final Future<void> Function(String text, List<PendingAttachment> attachments) onSend;
  final VoidCallback? onStop;
  final bool isIncomplete;
  final String hintText;

  const InputBar({
    super.key,
    required this.onSend,
    this.onStop,
    this.isIncomplete = false,
    this.hintText = '输入消息...',
  });

  @override
  ConsumerState<InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<InputBar> {
  late final TextEditingController _controller;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addPendingAttachment({
    required String name,
    required String path,
    required bool isImage,
    required String mimeType,
  }) {
    final attachment = PendingAttachment(
      id: const Uuid().v4(),
      name: name,
      path: path,
      isImage: isImage,
      mimeType: mimeType,
    );
    ref.read(inputStateProvider.notifier).addAttachment(attachment);
  }

  bool _isImageFile(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.bmp');
  }

  bool _isTextFile(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.txt') ||
        lower.endsWith('.md') ||
        lower.endsWith('.json') ||
        lower.endsWith('.dart') ||
        lower.endsWith('.yaml') ||
        lower.endsWith('.yml') ||
        lower.endsWith('.log') ||
        lower.endsWith('.csv');
  }

  String _mimeForImage(String fileName) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.bmp')) return 'image/bmp';
    return 'image/png';
  }

  String _mimeForText(String fileName) {
    return 'text/plain';
  }

  Future<void> _pickFileAttachment() async {
    final result = await FilePicker.pickFiles(
      allowMultiple: false,
      withData: false,
      type: FileType.any,
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.single;
    final filePath = file.path;
    if (filePath == null || filePath.trim().isEmpty) return;

    final isImage = _isImageFile(file.name);
    final isText = _isTextFile(file.name);

    if (!isImage && !isText) {
      if (mounted) {
        AppToast.show('仅支持图片和文本文件（.txt, .md, .json, .dart, .yaml 等）');
      }
      return;
    }

    final mimeType = isImage ? _mimeForImage(file.name) : _mimeForText(file.name);

    _addPendingAttachment(
      name: file.name,
      path: filePath,
      isImage: isImage,
      mimeType: mimeType,
    );
  }

  Future<void> _pickImageFromGallery() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file == null) return;

    final mimeType = file.mimeType ?? _mimeForImage(file.name);

    _addPendingAttachment(
      name: file.name,
      path: file.path,
      isImage: true,
      mimeType: mimeType,
    );
  }

  void _removeAttachment(String id) {
    ref.read(inputStateProvider.notifier).removeAttachment(id);
  }

  Future<void> _showAddAttachmentSheet() async {
    FocusScope.of(context).unfocus();
    
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
                _pickFileAttachment();
              },
              child: const Text('文件'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImageFromGallery();
              },
              child: const Text('相册'),
            ),              
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
        );
      },
    );
  }

  String _sanitizeInput(String input) {
    var result = input.replaceAll('\uFEFF', '');               // 移除 BOM
    result = result.replaceAll(RegExp(r'[\u200B\u200C\u200D]'), ''); // 移除零宽字符
    result = result.replaceAll('\r\n', '\n').replaceAll('\r', '\n');   // 统一换行符
    return result;
  }

  Future<void> _handleSend() async {
    FocusScope.of(context).unfocus();

    final state = ref.read(inputStateProvider);
    if (!state.canSend) return;

    final sanitizedText = _sanitizeInput(state.text);

    try {
      await widget.onSend(sanitizedText, state.attachments);
      ref.read(inputStateProvider.notifier).clear();
    } catch (e) {
      // 发送失败，保持输入内容和附件不变
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String>(
      inputStateProvider.select((s) => s.text),
      (previous, next) {
        if (next != _controller.text) {
          _controller.value = TextEditingValue(
            text: next,
            selection: TextSelection.collapsed(offset: next.length),
            composing: TextRange.empty,
          );
        }
      },
    );

    final inputState = ref.watch(inputStateProvider);
    final attachments = inputState.attachments;
    final canSend = inputState.canSend;
    final showStopButton = widget.isIncomplete;

    return SafeArea(
      top: false,
      child: Container(
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemGroupedBackground, context),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (attachments.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: attachments.map((attachment) {
                      final file = File(attachment.path);
                      if (attachment.isImage) {
                        return _PendingImageAttachment(
                          attachment: attachment,
                          file: file,
                          onRemove: () => _removeAttachment(attachment.id),
                        );
                      } else {
                        return _PendingFileAttachment(
                          attachment: attachment,
                          file: file,
                          onRemove: () => _removeAttachment(attachment.id),
                        );
                      }
                    }).toList(),
                  ),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _showAddAttachmentSheet,
                  child: const Icon(CupertinoIcons.add),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CupertinoTextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      placeholder: widget.hintText,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onChanged: (value) {
                        ref.read(inputStateProvider.notifier).updateText(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (showStopButton)
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    borderRadius: BorderRadius.circular(8),
                    onPressed: widget.onStop,
                    child: const Icon(CupertinoIcons.stop_fill, size: 20),
                  )
                else
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    borderRadius: BorderRadius.circular(8),
                    onPressed: canSend ? _handleSend : null,
                    child: const Icon(CupertinoIcons.arrow_up, size: 20),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================= 新增的预览组件 =================

class _PendingImageAttachment extends StatelessWidget {
  final PendingAttachment attachment;
  final File file;
  final VoidCallback onRemove;

  const _PendingImageAttachment({
    required this.attachment,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 点击图片进行全屏预览
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => ImageAttachmentViewerPage(
                  title: attachment.name,
                  filePath: file.path,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              file,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
                  child: const Icon(CupertinoIcons.photo, color: CupertinoColors.systemGrey),
                );
              },
            ),
          ),
        ),
        // 右上角删除按钮
        Positioned(
          top: 2,
          right: 2,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: CupertinoColors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PendingFileAttachment extends StatelessWidget {
  final PendingAttachment attachment;
  final File file;
  final VoidCallback onRemove;

  const _PendingFileAttachment({
    required this.attachment,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 点击文件名及图标区域进行文本预览
          Flexible(
            child: GestureDetector(
              onTap: () {
                // 上游已做拦截，走到这里的必然是文本文件，直接跳转预览
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => TextAttachmentViewerPage(
                      title: attachment.name,
                      filePath: file.path,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.doc_text, size: 16),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      attachment.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          // 右侧独立的删除按钮
          GestureDetector(
            onTap: onRemove,
            child: const Icon(CupertinoIcons.xmark_circle_fill, size: 16),
          ),
        ],
      ),
    );
  }
}
````

## File: lib/presentation/pages/home_page.dart
````dart
import 'package:aiservice/di/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/session_list_item.dart';
import '../providers/session_list_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/input_bar.dart';
import 'chat_page.dart';
import 'settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Future<void> _showRenameDialog(
    BuildContext context,
    WidgetRef ref,
    SessionListItem item,
  ) async {
    final controllerText = TextEditingController(text: item.title);
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('重命名会话'),
        content: CupertinoTextField(
          controller: controllerText,
          autofocus: true,
          placeholder: '输入新的会话名称',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(ctx).pop(controllerText.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );
    if (result != null && result.isNotEmpty && result != item.title) {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.updateSessionTitle(item.id, result);
    }
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    SessionListItem item,
  ) async {
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除会话'),
            content: Text('确定要删除 "${item.title}" 吗？\n此操作无法撤销。'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true),
                isDestructiveAction: true,
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;

    if (confirmed == true) {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(item.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(sessionListProvider);

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('AI Chat'),
        trailing: CupertinoButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => const SettingsPage(),
              ),
            );
          },
          child: const Icon(CupertinoIcons.settings),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: sessionsAsync.when(
              loading: () => const Center(child: CupertinoActivityIndicator()),
              error: (e, st) => _HomeErrorState(
                message: '加载会话失败：$e',
                onRetry: () async {
                  ref.invalidate(sessionListProvider);
                },
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const _HomeEmptyState();
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  itemCount: items.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _SessionCard(
                      item: item,
                      onRename: (item) => _showRenameDialog(context, ref, item),
                      onDelete: (item) => _showDeleteConfirmDialog(context, ref, item),
                    );
                  },
                );
              },
            ),
          ),
          InputBar(
            hintText: '发送消息',
            onSend: (content, attachments) async {
              final repository = ref.read(conversationRepositoryProvider);
              final sessionId = const Uuid().v4();
              await repository.createSession(sessionId: sessionId, title: '新对话');
              if (context.mounted) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ChatPage(
                      sessionId: sessionId,
                      initialMessage: content,
                      initialAttachments: attachments,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HomeEmptyState extends StatelessWidget {
  const _HomeEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(CupertinoIcons.sparkles, size: 40),
              SizedBox(height: 16),
              Text(
                '开始你的第一段对话',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                '在下方输入问题，系统会自动创建一个新会话。\n你也可以附加图片或文件开始交流。',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeErrorState extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const _HomeErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.exclamationmark_triangle,
                size: 40,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(height: 12),
              const Text(
                '出现了一点问题',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CupertinoButton.filled(
                onPressed: onRetry,
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlueDot extends StatelessWidget {
  const _BlueDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: CupertinoColors.systemBlue,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _BlinkingDot extends StatefulWidget {
  const _BlinkingDot();

  @override
  State<_BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<_BlinkingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemOrange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SessionCard extends ConsumerWidget {
  final SessionListItem item;
  final Future<void> Function(SessionListItem item) onRename;
  final Future<void> Function(SessionListItem item) onDelete;

  const _SessionCard({
    required this.item,
    required this.onRename,
    required this.onDelete,
  });

  Widget _buildMetaChip(String label, {IconData? icon}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 12),
          const SizedBox(width: 4),
        ],
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = item.id;
    final updatedAt = DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(item.updatedAt));
    final metaAsync = ref.watch(sessionCardMetaProvider(item.id));

    return LayoutBuilder(
      builder: (context, constraints) {
        // 获取父级最大宽度，并减去可能的内边距（ListView 默认有 padding 16）
        final maxWidth = constraints.maxWidth - 32;
        return CupertinoContextMenu(
          actions: [
            CupertinoContextMenuAction(
              child: const Text('重命名'),
              onPressed: () {
                Navigator.of(context).pop();
                onRename(item);
              },
            ),
            CupertinoContextMenuAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                onDelete(item);
              },
              child: const Text('删除'),
            ),
          ],
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ChatPage(sessionId: sessionId),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.systemBackground,
                    context,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: metaAsync.when(
                  loading: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      const Text('加载中...'),
                      const SizedBox(height: 8),
                      _buildMetaChip(updatedAt, icon: CupertinoIcons.clock),
                    ],
                  ),
                  error: (e, st) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      const Text('加载摘要失败'),
                      const SizedBox(height: 8),
                      _buildMetaChip(updatedAt, icon: CupertinoIcons.clock),
                    ],
                  ),
                  data: (meta) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (meta.isStreaming) ...[
                            const SizedBox(width: 8),
                            const _BlinkingDot(),
                          ],
                          if (meta.hasUnseen) ...[
                            const SizedBox(width: 8),
                            const _BlueDot(),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),
                      _PreviewLine(
                        label: 'YOU',
                        text: meta.userPreview,
                      ),
                      const SizedBox(height: 4),
                      _PreviewLine(
                        label: 'AI',
                        text: meta.aiPreview,
                      ),
                      const SizedBox(height: 8),
                      _buildMetaChip(updatedAt, icon: CupertinoIcons.clock),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PreviewLine extends StatelessWidget {
  final String label;
  final String text;

  const _PreviewLine({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CupertinoTheme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label  ',
          style: textTheme.textStyle,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.textStyle,
          ),
        ),
      ],
    );
  }
}
````

## File: lib/data/repositories/conversation_repository.dart
````dart
// data/repositories/conversation_repository.dart
import 'dart:async';
import 'dart:io';
import 'package:drift/drift.dart';
import '../data_sources/local_file_source.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../domain/models/session_list_item.dart';
import '../database/database.dart';
import '../../domain/models/session_card_meta.dart';
import 'package:rxdart/rxdart.dart';

class ConversationRepository {
  final AppDatabase _db;
  final LocalFileSource _fileService;
  ConversationRepository(this._db, this._fileService);

  // ========== 响应式查询 ==========

  Stream<List<SessionListItem>> watchSessionListItems() {
    final query = (_db.select(_db.dbSessions)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    return query.watch().map((sessions) {
      return sessions.map((session) {
        return SessionListItem(
          id: session.id,
          title: session.title,
          updatedAt: session.updatedAt,
        );
      }).toList();
    });
  }

  Stream<SessionCardMeta> watchSessionCardMeta(String sessionId) {
    final lastRoundStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .watchSingleOrNull();

    final countStream = (_db.selectOnly(_db.dbChatRounds)
          ..addColumns([countAll()])
          ..where(_db.dbChatRounds.sessionId.equals(sessionId)))
        .watchSingle()
        .map((row) => row.read(countAll()) ?? 0);

    final hasUnseenStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..where((t) => t.hasUnseenUpdate.equals(true))
          ..limit(1))
        .watchSingleOrNull()
        .map((row) => row != null);

    return Rx.combineLatest3(lastRoundStream, countStream, hasUnseenStream,
        (lastRound, count, hasUnseen) {
      final previewRound = lastRound;
      final userPreview = previewRound == null
          ? '点击开始新的对话'
          : previewRound.userContent.trim().isEmpty
              ? '（空输入）'
              : previewRound.userContent.trim();
      final aiPreview = previewRound == null
          ? '（等待回复）'
          : (previewRound.assistantContent?.trim().isNotEmpty ?? false)
              ? previewRound.assistantContent!
              : (previewRound.isIncomplete ? '正在生成...' : '（等待回复）');

      return SessionCardMeta(
        roundCount: count,
        previewRoundId: previewRound?.id,
        userPreview: userPreview,
        aiPreview: aiPreview,
        hasUnseen: hasUnseen,
        isStreaming: previewRound?.isIncomplete == true,
      );
    });
  }

  // ========== 细粒度监听（新增） ==========

  Stream<List<({String id, String? parentId})>> watchSessionTopology(String sessionId) {
    final query = _db.selectOnly(_db.dbChatRounds)
      ..addColumns([_db.dbChatRounds.id, _db.dbChatRounds.parentId])
      ..where(_db.dbChatRounds.sessionId.equals(sessionId))
      ..orderBy([OrderingTerm.asc(_db.dbChatRounds.createdAt)]);
    return query.watch().map((rows) => rows.map((r) => (
      id: r.read(_db.dbChatRounds.id)!,
      parentId: r.read(_db.dbChatRounds.parentId)
    )).toList());
  }

  /// 仅监听单条消息的完整详情（含附件）- 改用 rxdart 组合两个独立查询
  Stream<ChatRound?> watchSingleRound(String roundId) {
    final roundStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.id.equals(roundId)))
        .watchSingleOrNull();

    final attachmentsStream = (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.equals(roundId)))
        .watch()
        .map((rows) => rows.map((a) => Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            )).toList());

    return Rx.combineLatest2(roundStream, attachmentsStream,
        (DbChatRound? round, List<Attachment> attachments) {
      if (round == null) return null;
      return ChatRound(
        id: round.id,
        parentId: round.parentId,
        createdAt: round.createdAt,
        userContent: round.userContent,
        userAttachments: attachments,
        assistantThinking: round.assistantThinking,
        assistantContent: round.assistantContent,
        isIncomplete: round.isIncomplete,
        hasUnseenUpdate: round.hasUnseenUpdate,
      );
    });
  }

  Future<List<ChatRound>> getContextRounds(String roundId) async {
    final roundsQuery = _db.customSelect(
      '''
      WITH RECURSIVE ctx_chain AS (
        SELECT id, session_id, parent_id, created_at, user_content,
              assistant_thinking, assistant_content, is_incomplete, has_unseen_update
        FROM db_chat_rounds WHERE id = :roundId
        UNION ALL
        SELECT r.id, r.session_id, r.parent_id, r.created_at, r.user_content,
              r.assistant_thinking, r.assistant_content, r.is_incomplete, r.has_unseen_update
        FROM db_chat_rounds r
        INNER JOIN ctx_chain c ON r.id = c.parent_id
      )
      SELECT * FROM ctx_chain ORDER BY created_at ASC
      ''',
      readsFrom: {_db.dbChatRounds},
      variables: [Variable.withString(roundId)],
    );

    final dbRounds = await roundsQuery.map((row) {
      return DbChatRound(
        id: row.read<String>('id'),
        sessionId: row.read<String>('session_id'),
        parentId: row.read<String?>('parent_id'),
        createdAt: row.read<int>('created_at'),
        userContent: row.read<String>('user_content'),
        assistantThinking: row.read<String?>('assistant_thinking'),
        assistantContent: row.read<String?>('assistant_content'),
        isIncomplete: row.read<bool>('is_incomplete'),
        hasUnseenUpdate: row.read<bool>('has_unseen_update'),
      );
    }).get();

    if (dbRounds.isEmpty) return [];

    final roundIds = dbRounds.map((r) => r.id).toList();
    final dbAttachments = await (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.isIn(roundIds)))
        .get();

    final attachmentMap = <String, List<Attachment>>{};
    for (final att in dbAttachments) {
      attachmentMap.putIfAbsent(att.roundId, () => []).add(
        Attachment(
          id: att.id,
          name: att.name,
          relativePath: att.relativePath,
          isImage: att.isImage,
          mimeType: att.mimeType,
        ),
      );
    }

    return dbRounds.map((round) => _mapToChatRound(round, attachmentMap[round.id] ?? [])).toList();
  }

  Stream<String?> watchSessionTitle(String sessionId) {
    return (_db.select(_db.dbSessions)
          ..where((t) => t.id.equals(sessionId)))
        .map((row) => row.title)
        .watchSingleOrNull();
  }

  ChatRound _mapToChatRound(DbChatRound row, List<Attachment> attachments) {
    return ChatRound(
      id: row.id,
      parentId: row.parentId,
      createdAt: row.createdAt,
      userContent: row.userContent,
      userAttachments: attachments,
      assistantThinking: row.assistantThinking,
      assistantContent: row.assistantContent,
      isIncomplete: row.isIncomplete,
      hasUnseenUpdate: row.hasUnseenUpdate,
    );
  }

  Future<void> _cleanupOrphanAttachments(Iterable<String> relativePaths) async {
    final uniquePaths = relativePaths.toSet();
    if (uniquePaths.isEmpty) return;

    final referencedPaths = await (_db.select(_db.dbAttachments)
          ..where((t) => t.relativePath.isIn(uniquePaths)))
        .map((t) => t.relativePath)
        .get();

    final orphanPaths = uniquePaths.difference(referencedPaths.toSet());

    for (final path in orphanPaths) {
      try {
        await _fileService.deleteAttachment(path);
      } catch (_) {}
    }
  }

  // ========== 写操作 ==========

  Future<void> deleteRoundsAndCleanupOrphanAttachments(
    String sessionId,
    List<String> roundIds,
  ) async {
    if (roundIds.isEmpty) return;

    // 1. 收集候选附件路径（改用直接查询，不用 join）
    final candidatePaths = (await (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.isIn(roundIds)))
        .get())
        .map((a) => a.relativePath)
        .toSet();

    // 2. 提交数据库变更
    await _db.transaction(() async {
      await (_db.delete(_db.dbChatRounds)
            ..where((t) => t.sessionId.equals(sessionId) & t.id.isIn(roundIds)))
          .go();
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<void> deleteSession(String sessionId) async {
    // 1. 收集候选附件路径（先查出所有 round id，再查附件）
    final roundIds = await (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId)))
        .map((r) => r.id)
        .get();

    final candidatePaths = <String>{};
    if (roundIds.isNotEmpty) {
      final attachments = await (_db.select(_db.dbAttachments)
            ..where((t) => t.roundId.isIn(roundIds)))
          .get();
      candidatePaths.addAll(attachments.map((a) => a.relativePath));
    }

    // 2. 提交数据库变更
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId))).go();

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<Session> createSession({
    required String sessionId,
    required String title,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final session = Session(
      id: sessionId,
      title: title,
      createdAt: now,
      updatedAt: now,
      rounds: [],
    );
    await _db.into(_db.dbSessions).insert(
          DbSessionsCompanion.insert(
            id: session.id,
            title: session.title,
            createdAt: session.createdAt,
            updatedAt: session.updatedAt,
          ),
        );
    return session;
  }

  Future<void> updateSessionTitle(String sessionId, String title) async {
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(
      DbSessionsCompanion(
        title: Value(title),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  Future<void> appendRound(String sessionId, ChatRound round) async {
    await _db.transaction(() async {
      await _db.into(_db.dbChatRounds).insert(
            DbChatRoundsCompanion.insert(
              id: round.id,
              sessionId: sessionId,
              parentId: Value(round.parentId),
              createdAt: round.createdAt,
              userContent: round.userContent,
              assistantThinking: Value(round.assistantThinking),
              assistantContent: Value(round.assistantContent),
              isIncomplete: Value(round.isIncomplete),
              hasUnseenUpdate: Value(round.hasUnseenUpdate),
            ),
          );
      for (final attach in round.userAttachments) {
        await _db.into(_db.dbAttachments).insert(
              DbAttachmentsCompanion.insert(
                id: attach.id,
                roundId: round.id,
                name: attach.name,
                relativePath: attach.relativePath,
                isImage: Value(attach.isImage),
                mimeType: Value(attach.mimeType),
              ),
            );
      }
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  Future<void> updateRound({
    required String roundId,
    String? userContent,
    String? assistantThinking,
    String? assistantContent,
    bool? isIncomplete,
    bool? hasUnseenUpdate,
  }) async {
    await (_db.update(_db.dbChatRounds)..where((t) => t.id.equals(roundId)))
      .write(DbChatRoundsCompanion(
        userContent: userContent != null 
          ? Value(userContent) 
          : const Value.absent(),
        assistantThinking: assistantThinking != null
          ? Value(assistantThinking)
          : const Value.absent(),
        assistantContent: assistantContent != null
          ? Value(assistantContent)
          : const Value.absent(),
        isIncomplete: isIncomplete != null
          ? Value(isIncomplete)
          : const Value.absent(),
        hasUnseenUpdate: hasUnseenUpdate != null
          ? Value(hasUnseenUpdate)
          : const Value.absent(),
      ));
  }

  // ========== 附件读写接口保留 ==========
  Future<String> saveAttachment(Uint8List data, String fileName) async =>
      await _fileService.saveAttachment(data, fileName);

  File getAttachment(String relativePath) => _fileService.readAttachment(relativePath);

  Future<void> deleteAttachment(String relativePath) async =>
      await _fileService.deleteAttachment(relativePath);
}
````

## File: .github/workflows/cd.yml
````yaml
name: Flutter CD

on:
  workflow_dispatch:

jobs:
  build_android:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Install Vulkan build tools
        run: |
          sudo apt-get update -qq
          sudo apt-get install -y -qq glslc

      - name: Set up JDK 17
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'temurin'

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable
          cache: true

      - name: Flutter doctor
        run: flutter doctor -v

      - name: Install dependencies
        run: flutter pub get

      # ★★★ 核心：预装 NDK + 注入头文件 + 物理替换桩库 (The Ultimate Hack) ★★★
      - name: Ultimate NDK Hack & Vulkan Injection
        run: |
          echo "🚀 Step 1: Pre-installing NDK 27 & CMake 3.22.1..."
          yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "ndk;27.0.12077973" "cmake;3.22.1"
          
          echo "🔍 Step 2: Locating flutter_llama plugin..."
          PLUGIN_DIR=$(find $HOME/.pub-cache/hosted/pub.dev -maxdepth 1 -type d -name "flutter_llama-*" 2>/dev/null | head -n 1)
          if [ -z "$PLUGIN_DIR" ]; then
            echo "❌ Fatal: Could not find flutter_llama plugin directory."
            exit 1
          fi
          cd "$PLUGIN_DIR"
          
          echo "🛠️ Step 3: Patching Plugin CMake version..."
          GRADLE_FILE=""
          if [ -f "android/build.gradle.kts" ]; then GRADLE_FILE="android/build.gradle.kts"
          elif [ -f "android/build.gradle" ]; then GRADLE_FILE="android/build.gradle"; fi
          
          if [ -n "$GRADLE_FILE" ]; then
            sed -i 's/"3.18.1"/"3.22.1"/g' "$GRADLE_FILE"
            sed -i "s/'3.18.1'/'3.22.1'/g" "$GRADLE_FILE"
          fi
          
          echo "🚀 Step 4: Shallow cloning llama.cpp..."
          rm -rf llama.cpp
          git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/ggerganov/llama.cpp.git
          
          echo "💉 Step 5: Injecting Vulkan Headers into NDK 27 Sysroot..."
          SYSROOT="$ANDROID_HOME/ndk/27.0.12077973/toolchains/llvm/prebuilt/linux-x86_64/sysroot"
          mkdir -p $SYSROOT/usr/include/vulkan
          mkdir -p $SYSROOT/usr/include/vk_video
          
          rm -rf SPIRV-Headers
          git clone --depth 1 --branch main https://github.com/KhronosGroup/SPIRV-Headers.git
          cd SPIRV-Headers
          cmake -B build -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr
          cmake --build build --target install
          cd ..
          
          VULKAN_TAG="v1.3.290"
          rm -rf Vulkan-Headers
          git clone --depth 1 --branch $VULKAN_TAG https://github.com/KhronosGroup/Vulkan-Headers.git
          cp -r Vulkan-Headers/include/vulkan/* $SYSROOT/usr/include/vulkan/
          cp -r Vulkan-Headers/include/vk_video/* $SYSROOT/usr/include/vk_video/
          
          rm -rf Vulkan-Hpp
          git clone --depth 1 --branch $VULKAN_TAG https://github.com/KhronosGroup/Vulkan-Hpp.git
          HPP_FILE=$(find Vulkan-Hpp -type f -name "vulkan.hpp" | head -n 1)
          VULKAN_HPP_DIR=$(dirname "$HPP_FILE")
          cp -r "$VULKAN_HPP_DIR"/* $SYSROOT/usr/include/vulkan/
          
          echo "💥 Step 6: THE ULTIMATE HACK - Overwrite API 24 libvulkan.so with API 28..."
          # AGP 硬编码了 API 24 的 libvulkan.so 绝对路径，导致链接器找不到 Vulkan 1.1 符号
          # 我们直接用包含 Vulkan 1.1 符号的 API 28 的 stub 库覆盖它！
          LIB_VULKAN_24="$SYSROOT/usr/lib/aarch64-linux-android/24/libvulkan.so"
          LIB_VULKAN_28="$SYSROOT/usr/lib/aarch64-linux-android/28/libvulkan.so"
          
          if [ -f "$LIB_VULKAN_28" ] && [ -f "$LIB_VULKAN_24" ]; then
            cp "$LIB_VULKAN_28" "$LIB_VULKAN_24"
            echo "✅ Successfully overwrote API 24 libvulkan.so with API 28 version. Linker will now find Vulkan 1.1 symbols!"
          else
            echo "⚠️ Warning: Could not find libvulkan.so to overwrite."
          fi
          
          echo "🧹 Step 7: Cleaning CMake caches..."
          rm -rf android/.cxx
          rm -rf $HOME/.pub-cache/hosted/pub.dev/flutter_llama-*/android/.cxx
          
          echo "🛡️ Step 8: Applying Kotlin Legacy Flags..."
          cd $GITHUB_WORKSPACE
          GRADLE_PROPS="android/gradle.properties"
          if [ -f "$GRADLE_PROPS" ]; then
            grep -qxF "android.builtInKotlin=false" "$GRADLE_PROPS" || echo "android.builtInKotlin=false" >> "$GRADLE_PROPS"
            grep -qxF "android.newDsl=false" "$GRADLE_PROPS" || echo "android.newDsl=false" >> "$GRADLE_PROPS"
          fi

      - name: Build Android APK
        run: flutter build apk --release --split-per-abi

      - name: Upload APK Artifact
        uses: actions/upload-artifact@v4
        with:
          name: android
          path: build/app/outputs/flutter-apk/

  build_ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'
          cache: true
      - run: flutter pub get
      - name: Inject official llama.cpp source (Latest)
        run: |
          PLUGIN_DIR=$(find ~/.pub-cache -type d -name "flutter_llama-*" | head -n 1)
          if [ -d "$PLUGIN_DIR" ] && [ ! -f "$PLUGIN_DIR/llama.cpp/include/llama.h" ]; then
            echo "Cloning latest llama.cpp..."
            git clone https://github.com/ggml-org/llama.cpp.git /tmp/llama_cpp_repo
            rm -rf "$PLUGIN_DIR/llama.cpp"
            mv /tmp/llama_cpp_repo "$PLUGIN_DIR/llama.cpp"
            echo "Latest llama.cpp injected successfully."
          fi
      - name: Build iOS
        run: flutter build ipa --no-codesign
      - name: Package .app into .ipa
        run: |
          APP_PATH=$(find build/ios/archive/Runner.xcarchive/Products/Applications -name "*.app" -maxdepth 1 | head -n 1)
          if [ -z "$APP_PATH" ]; then
            echo "❌ Fatal: Could not find .app file in the archive."
            exit 1
          fi
          mkdir -p Payload
          cp -R "$APP_PATH" Payload/
          zip -qr ios-unsigned.ipa Payload
      - name: Upload iOS Artifact
        uses: actions/upload-artifact@v4
        with:
          name: ios
          path: ios-unsigned.ipa

  build_windows:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'
          cache: true
      - run: flutter pub get
      - run: flutter build windows --release
      - run: Compress-Archive -Path build\windows\x64\runner\Release\* -DestinationPath build\windows-app.zip
      - uses: actions/upload-artifact@v4
        with:
          name: windows
          path: build\windows-app.zip

  release:
    needs: [build_android, build_ios, build_windows]
    runs-on: ubuntu-latest
    permissions:
      contents: write 
    steps:
      - name: Download Android artifacts
        uses: actions/download-artifact@v4
        with:
          name: android
          path: android
      - name: Download iOS artifacts
        uses: actions/download-artifact@v4
        with:
          name: ios
          path: ios
      - name: Download Windows artifacts
        uses: actions/download-artifact@v4
        with:
          name: windows
          path: windows
      - name: Create Release
        uses: softprops/action-gh-release@v2
        with:
          tag_name: v${{ github.run_number }}
          name: ai service
          files: |
            android/*.apk
            ios/*.ipa
            windows/*.zip
          generate_release_notes: true
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
````

## File: lib/presentation/providers/chat_notifier.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../di/providers.dart';

final sessionTitleProvider = StreamProvider.family<String, String>((ref, sessionId) {
  return ref.watch(conversationRepositoryProvider).watchSessionTitle(sessionId)
      .map((title) => title ?? '对话');
});

final chatTopologyProvider =
    StreamProvider.family<List<({String id, String? parentId})>, String>(
  (ref, sessionId) {
    return ref.watch(conversationRepositoryProvider).watchSessionTopology(sessionId);
  },
);

final roundDetailProvider = StreamProvider.family<ChatRound?, String>((ref, roundId) {
  return ref.watch(conversationRepositoryProvider).watchSingleRound(roundId);
});

final visibleRoundIdsProvider =
    Provider.family<List<String>, ({String sessionId, String? roundId})>(
  (ref, args) {
    final topology = ref.watch(chatTopologyProvider(args.sessionId)).valueOrNull ?? [];
    if (args.roundId == null) return const [];

    final idToParent = {for (var t in topology) t.id: t.parentId};
    final path = <String>[];
    String? currentId = args.roundId;

    while (currentId != null && idToParent.containsKey(currentId)) {
      path.add(currentId);
      currentId = idToParent[currentId];
    }
    return path.reversed.toList();
  },
);
````

## File: lib/presentation/pages/chat_page.dart
````dart
import 'package:aiservice/data/repositories/conversation_repository.dart';
import 'package:aiservice/di/providers.dart';
import 'package:aiservice/domain/services/chat_service.dart';
import 'package:aiservice/presentation/models/pending_attachment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show SelectionArea;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/chat_notifier.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import 'branch_tree_page.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String sessionId;
  final String? initialRoundId;
  final String? initialMessage;
  final List<PendingAttachment>? initialAttachments;

  const ChatPage({
    super.key,
    required this.sessionId,
    this.initialRoundId,
    this.initialMessage,
    this.initialAttachments,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  PageController? _pageController;
  bool _initialMessageHandled = false;

  String? _branchLeafId;
  String? _currentRoundId;
  
  @override
  void initState() {
    super.initState();
    _branchLeafId = widget.initialRoundId;
    _currentRoundId = widget.initialRoundId;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ensureInitialRoundId();
    });
  }

  String _getTitleWithPage(String sessionTitle, List<String> visibleRoundIds, String? currentRoundId) {
    final total = visibleRoundIds.length;
    final currentIndex = visibleRoundIds.indexOf(currentRoundId ?? '');
    if (currentIndex == -1) return sessionTitle;
    return '$sessionTitle (${currentIndex + 1}/$total)';
  }

  Future<void> _ensureInitialRoundId() async {
    if (_branchLeafId != null) return;
    final topology = await ref.read(chatTopologyProvider(widget.sessionId).future);
    if (topology.isNotEmpty && mounted) {
      setState(() {
        _branchLeafId = topology.last.id;
        _currentRoundId = _branchLeafId;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleInitialMessage();
  }

  void _handleInitialMessage() async { 
    if (_initialMessageHandled || widget.initialMessage == null) return;
    _initialMessageHandled = true;

    try {
      final newId = await ChatService.sendMessage(
        repository: ref.read(conversationRepositoryProvider),
        configService: ref.read(configServiceProvider),
        sourceRouter: ref.read(chatSourceRouterProvider),
        sessionId: widget.sessionId,
        content: widget.initialMessage!,
        parentRoundId: _currentRoundId,
        pendingAttachments: widget.initialAttachments ?? [],
      );
      _updateBranch(newId);
    } catch (e) {
      AppToast.show('发送失败：$e');
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _updateBranch(String leafId) {
    if (!mounted) return;
    setState(() {
      _branchLeafId = leafId;
      _currentRoundId = leafId;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chatTopologyProvider(widget.sessionId), (prev, next) {
      final topology = next.valueOrNull;
      if (topology != null && _currentRoundId != null && !topology.any((t) => t.id == _currentRoundId)) {
        setState(() => _currentRoundId = topology.isNotEmpty ? topology.last.id : null);
      }
    });
    
    final hasUnseen = ref.watch(
      roundDetailProvider(_currentRoundId ?? '').select(
        (round) => round.valueOrNull?.hasUnseenUpdate ?? false,
      ),
    );

    if (hasUnseen && ModalRoute.of(context)?.isCurrent == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(conversationRepositoryProvider).updateRound(
                roundId: _currentRoundId!,
                hasUnseenUpdate: false,
              );
        }
      });
    }

    final sessionTitle = ref.watch(sessionTitleProvider(widget.sessionId)).valueOrNull ?? '未加载';
    final currentRoundAsync = ref.watch(roundDetailProvider(_currentRoundId ?? ''));
    final isIncomplete = currentRoundAsync.valueOrNull?.isIncomplete ?? false;

    final visibleRoundIds = ref.watch(visibleRoundIdsProvider(( 
      sessionId: widget.sessionId,
      roundId: _branchLeafId,
    )));

    int currentIndex = visibleRoundIds.indexOf(_currentRoundId ?? '');

    if (currentIndex != -1) {
      _pageController ??= PageController(initialPage: currentIndex);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController!.jumpToPage(currentIndex);
      });
    } else {
      _pageController ??= PageController(initialPage: 0);
    }

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_getTitleWithPage(sessionTitle, visibleRoundIds, _currentRoundId)),
        trailing: CupertinoButton(
          onPressed: () async {
            final selectedId = await Navigator.of(context).push<String>(
              CupertinoPageRoute(
                builder: (_) => BranchTreePage(
                  sessionId: widget.sessionId,
                  initialFocusRoundId: _currentRoundId!,
                ),
              ),
            );
            if (selectedId != null) _updateBranch(selectedId);
          },
          child: const Icon(CupertinoIcons.arrow_branch),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: visibleRoundIds.isEmpty
                ? const Center(child: Text('加载中'))
                : PageView.builder(
                    controller: _pageController,
                    physics: const PageScrollPhysics(),
                    itemCount: visibleRoundIds.length,
                    onPageChanged: (index) {
                      final targetId = visibleRoundIds[index];
                      setState(() => _currentRoundId = targetId);
                    },
                    itemBuilder: (_, index) => _ChatRoundPage(
                      key: ValueKey(visibleRoundIds[index]),
                      sessionId: widget.sessionId,
                      roundId: visibleRoundIds[index],
                      onRetryReply: () => _retry(visibleRoundIds[index]),
                    ),
                  ),
          ),
          InputBar(
            hintText: '发送消息',
            isIncomplete: isIncomplete, 
            onStop: () {
              ChatService.stopGeneration(
                _currentRoundId!, 
                ref.read(conversationRepositoryProvider),
              );
            },
            onSend: (text, attachments) async {
              final newId = await ChatService.sendMessage(
                repository: ref.read(conversationRepositoryProvider),
                configService: ref.read(configServiceProvider),
                sourceRouter: ref.read(chatSourceRouterProvider),
                sessionId: widget.sessionId,
                content: text,
                parentRoundId: _currentRoundId,
                pendingAttachments: attachments,
              );
              _updateBranch(newId);
            },
          ),
        ],
      ),
    );
  }

  void _retry(String roundId) async {
    final sourceRound = await ref.read(roundDetailProvider(roundId).future);
    if (sourceRound == null) return;

    final newId = await ChatService.retryFromRound(
      repository: ref.read(conversationRepositoryProvider),
      configService: ref.read(configServiceProvider),
      sourceRouter: ref.read(chatSourceRouterProvider),
      sessionId: widget.sessionId,
      sourceRound: sourceRound,
    );
    _updateBranch(newId);
  }
}

class _ChatRoundPage extends StatelessWidget {
  final String sessionId;
  final String roundId;
  final VoidCallback onRetryReply;

  const _ChatRoundPage({
    super.key,
    required this.sessionId,
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UserSection(
                roundId: roundId,
                onRetryReply: onRetryReply,
              ),
              _ThinkingSection(roundId: roundId),
              _AiReplySection(
                roundId: roundId,
                onRetryReply: onRetryReply,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UserSection extends ConsumerWidget {
  final String roundId;
  final VoidCallback onRetryReply;

  const _UserSection({
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId).select((s) {
      final r = s.valueOrNull;
      return r == null
          ? null
          : (
              content: r.userContent,
              time: r.createdAt,
              attach: r.userAttachments,
              inc: r.isIncomplete
            );
    }));

    if (round == null) return const SizedBox.shrink();
    final repository = ref.read(conversationRepositoryProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.time)),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: MessageBubble(
              content: round.content,
              isUser: true,
              onCopy: () {
                Clipboard.setData(ClipboardData(text: round.content));
                AppToast.show('已复制');
              },
              onRetryReply: onRetryReply,
              onEdit: () => showEditContentDialog(
              context: context,
              repository: repository, 
              roundId: roundId,
              initialText: round.content,
              isUser: true,
            ),
            ),
        ),
        if (round.attach.isNotEmpty) ...[
          const SizedBox(height: 8),
          AttachmentList(attachments: round.attach),
        ],
      ],
    );
  }
}

class _ThinkingSection extends ConsumerWidget {
  final String roundId;

  const _ThinkingSection({required this.roundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thinking = ref.watch(
      roundDetailProvider(roundId).select((s) => s.valueOrNull?.assistantThinking),
    );
    if (thinking == null || thinking.trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        child: ThoughtBubble(content: thinking),
      ),
    );
  }
}

class _AiReplySection extends ConsumerWidget {
  final String roundId;
  final VoidCallback onRetryReply;

  const _AiReplySection({
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ai = ref.watch(roundDetailProvider(roundId).select((s) {
      final r = s.valueOrNull;
      return r == null
          ? null
          : (content: r.assistantContent, isIncomplete: r.isIncomplete);
    }));

    if (ai == null || (ai.content == null && !ai.isIncomplete)) {
      return const SizedBox.shrink();
    }

    final repository = ref.read(conversationRepositoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ai.content != null)
          Align(
            alignment: Alignment.centerLeft,
            child: MessageBubble(
                content: ai.content!,
                isUser: false,
                onCopy: () {
                  Clipboard.setData(ClipboardData(text: ai.content!));
                  AppToast.show('已复制');
                },
                onRetryReply: onRetryReply,
                onEdit: () => showEditContentDialog(
                context: context,
                repository: repository,
                roundId: roundId,
                initialText: ai.content!,
                isUser: false,
              ),
              ),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8),
            child: CupertinoActivityIndicator(),
          ),
      ],
    );
  }
}

Future<void> showEditContentDialog({
  required BuildContext context,
  required ConversationRepository repository,
  required String roundId,
  required String initialText,
  required bool isUser,
}) async {
  final controller = TextEditingController(text: initialText);
  
  final result = await showCupertinoDialog<String>(
    context: context,
    builder: (ctx) => CupertinoAlertDialog(
      title: const Text('编辑'),
      content: CupertinoTextField(
        controller: controller,
        autofocus: true,
        maxLines: 16,
        padding: const EdgeInsets.all(12),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('取消'),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(ctx).pop(controller.text),
          child: const Text('保存'),
        ),
      ],
    ),
  );
  if (result != null && result != initialText) {
    if (isUser) {
      await repository.updateRound(roundId: roundId, userContent: result);
    } else {
      await repository.updateRound(roundId: roundId, assistantContent: result);
    }
  }
}
````

## File: .github/workflows/build-android.yml
````yaml
name: Build Flutter Android APK

on:
  workflow_dispatch:

jobs:
  build-android:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Install Vulkan build tools
        run: |
          sudo apt-get update -qq
          sudo apt-get install -y -qq glslc

      - name: Set up JDK 17
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'temurin'

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable
          cache: true

      - name: Flutter doctor
        run: flutter doctor -v

      - name: Install dependencies
        run: flutter pub get

      # ★★★ 核心：预装 NDK + 注入头文件 + 物理替换桩库 (The Ultimate Hack) ★★★
      - name: Ultimate NDK Hack & Vulkan Injection
        run: |
          echo "🚀 Step 1: Pre-installing NDK 27 & CMake 3.22.1..."
          yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "ndk;27.0.12077973" "cmake;3.22.1"
          
          echo "🔍 Step 2: Locating flutter_llama plugin..."
          PLUGIN_DIR=$(find $HOME/.pub-cache/hosted/pub.dev -maxdepth 1 -type d -name "flutter_llama-*" 2>/dev/null | head -n 1)
          if [ -z "$PLUGIN_DIR" ]; then
            echo "❌ Fatal: Could not find flutter_llama plugin directory."
            exit 1
          fi
          cd "$PLUGIN_DIR"
          
          echo "🛠️ Step 3: Patching Plugin CMake version..."
          GRADLE_FILE=""
          if [ -f "android/build.gradle.kts" ]; then GRADLE_FILE="android/build.gradle.kts"
          elif [ -f "android/build.gradle" ]; then GRADLE_FILE="android/build.gradle"; fi
          
          if [ -n "$GRADLE_FILE" ]; then
            sed -i 's/"3.18.1"/"3.22.1"/g' "$GRADLE_FILE"
            sed -i "s/'3.18.1'/'3.22.1'/g" "$GRADLE_FILE"
          fi
          
          echo "🚀 Step 4: Shallow cloning llama.cpp..."
          rm -rf llama.cpp
          git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/ggerganov/llama.cpp.git
          
          echo "💉 Step 5: Injecting Vulkan Headers into NDK 27 Sysroot..."
          SYSROOT="$ANDROID_HOME/ndk/27.0.12077973/toolchains/llvm/prebuilt/linux-x86_64/sysroot"
          mkdir -p $SYSROOT/usr/include/vulkan
          mkdir -p $SYSROOT/usr/include/vk_video
          
          rm -rf SPIRV-Headers
          git clone --depth 1 --branch main https://github.com/KhronosGroup/SPIRV-Headers.git
          cd SPIRV-Headers
          cmake -B build -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr
          cmake --build build --target install
          cd ..
          
          VULKAN_TAG="v1.3.290"
          rm -rf Vulkan-Headers
          git clone --depth 1 --branch $VULKAN_TAG https://github.com/KhronosGroup/Vulkan-Headers.git
          cp -r Vulkan-Headers/include/vulkan/* $SYSROOT/usr/include/vulkan/
          cp -r Vulkan-Headers/include/vk_video/* $SYSROOT/usr/include/vk_video/
          
          rm -rf Vulkan-Hpp
          git clone --depth 1 --branch $VULKAN_TAG https://github.com/KhronosGroup/Vulkan-Hpp.git
          HPP_FILE=$(find Vulkan-Hpp -type f -name "vulkan.hpp" | head -n 1)
          VULKAN_HPP_DIR=$(dirname "$HPP_FILE")
          cp -r "$VULKAN_HPP_DIR"/* $SYSROOT/usr/include/vulkan/
          
          echo "💥 Step 6: THE ULTIMATE HACK - Overwrite API 24 libvulkan.so with API 28..."
          # AGP 硬编码了 API 24 的 libvulkan.so 绝对路径，导致链接器找不到 Vulkan 1.1 符号
          # 我们直接用包含 Vulkan 1.1 符号的 API 28 的 stub 库覆盖它！
          LIB_VULKAN_24="$SYSROOT/usr/lib/aarch64-linux-android/24/libvulkan.so"
          LIB_VULKAN_28="$SYSROOT/usr/lib/aarch64-linux-android/28/libvulkan.so"
          
          if [ -f "$LIB_VULKAN_28" ] && [ -f "$LIB_VULKAN_24" ]; then
            cp "$LIB_VULKAN_28" "$LIB_VULKAN_24"
            echo "✅ Successfully overwrote API 24 libvulkan.so with API 28 version. Linker will now find Vulkan 1.1 symbols!"
          else
            echo "⚠️ Warning: Could not find libvulkan.so to overwrite."
          fi
          
          echo "🧹 Step 7: Cleaning CMake caches..."
          rm -rf android/.cxx
          rm -rf $HOME/.pub-cache/hosted/pub.dev/flutter_llama-*/android/.cxx
          
          echo "🛡️ Step 8: Applying Kotlin Legacy Flags..."
          cd $GITHUB_WORKSPACE
          GRADLE_PROPS="android/gradle.properties"
          if [ -f "$GRADLE_PROPS" ]; then
            grep -qxF "android.builtInKotlin=false" "$GRADLE_PROPS" || echo "android.builtInKotlin=false" >> "$GRADLE_PROPS"
            grep -qxF "android.newDsl=false" "$GRADLE_PROPS" || echo "android.newDsl=false" >> "$GRADLE_PROPS"
          fi

      - name: Build Android APK
        run: flutter build apk --release

      - name: Upload APK Artifact
        uses: actions/upload-artifact@v4
        with:
          name: android-apk
          path: build/app/outputs/flutter-apk/app-release.apk
````
