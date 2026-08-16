# Implementation Plan - Multi-Platform Support and SPM Fix

This plan outlines the steps to add support for Android, Windows, Linux, and Web platforms, and to fix the Swift Package Manager (SPM) detection issues for the `external_path_ios_mac` plugin.

## Proposed Changes

### 1. Platform Support Expansion

#### [MODIFY] [pubspec.yaml](file:///G:/Android/Pakege/external_path_ios_mac/pubspec.yaml)
- Add definitions for `android`, `windows`, `linux`, and `web` platforms under the `flutter.plugin.platforms` section.
- Note: Even if the plugin name is `external_path_ios_mac`, adding these platforms will resolve the pub.dev scoring issues.

#### [NEW] Android Support
- **[NEW] [build.gradle](file:///G:/Android/Pakege/external_path_ios_mac/android/build.gradle)**: Standard Flutter plugin build file.
- **[NEW] [AndroidManifest.xml](file:///G:/Android/Pakege/external_path_ios_mac/android/src/main/AndroidManifest.xml)**: Basic manifest.
- **[NEW] [ExternalPathIosMacPlugin.kt](file:///G:/Android/Pakege/external_path_ios_mac/android/src/main/kotlin/com/swan/external_path_ios_mac/ExternalPathIosMacPlugin.kt)**: Implementation using `android.os.Environment`.

#### [NEW] Windows Support
- **[NEW] [external_path_ios_mac_plugin.cpp](file:///G:/Android/Pakege/external_path_ios_mac/windows/external_path_ios_mac_plugin.cpp)**: C++ implementation using `SHGetKnownFolderPath`.
- **[NEW] [CMakeLists.txt](file:///G:/Android/Pakege/external_path_ios_mac/windows/CMakeLists.txt)**: Build configuration.

#### [NEW] Linux Support
- **[NEW] [external_path_ios_mac_plugin.cc](file:///G:/Android/Pakege/external_path_ios_mac/linux/external_path_ios_mac_plugin.cc)**: implementation using `g_get_user_special_dir`.
- **[NEW] [CMakeLists.txt](file:///G:/Android/Pakege/external_path_ios_mac/linux/CMakeLists.txt)**: Build configuration.

#### [NEW] Web Support
- **[NEW] [external_path_ios_mac_web.dart](file:///G:/Android/Pakege/external_path_ios_mac/lib/external_path_ios_mac_web.dart)**: Web implementation (mostly returning stubs as web doesn't have these directories).

### 2. Swift Package Manager (SPM) Support Fix

#### [MODIFY] iOS/macOS Structure
- Move `Package.swift` to the root of `ios/` and `macos/` directories respectively to ensure they are detected correctly by Flutter and pub.dev.
- Update `Package.swift` to point to the correct source files.

---

## Verification Plan

### Automated Tests
- Run `flutter pub get` to verify `pubspec.yaml` changes.
- Run `flutter build apk` (if an Android environment is available) to verify Android implementation.
- Run `flutter build macos` to verify macOS SPM changes.

### Manual Verification
- Check the directory structure to ensure it follows Flutter's SPM guidelines.
- Verify that the `ExternalPathIosMacPlugin` class is correctly registered for all new platforms.
