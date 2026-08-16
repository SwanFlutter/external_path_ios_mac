## 0.0.8

* Added Swift Package Manager (SPM) support for iOS and macOS.
* Fixed `DirectoryType` enum — renamed `dim` to `dcim` to match the correct `DIRECTORY_DCIM` constant.
* Fixed directory value mapping: enum values now correctly produce `DIRECTORY_*` prefixed strings expected by native code.
* Updated iOS minimum deployment target to iOS 13.0.
* Updated macOS minimum deployment target to macOS 10.15 (Catalina) — aligned podspec and Package.swift.
* Enabled `PrivacyInfo.xcprivacy` in both iOS and macOS Swift Package manifests.
* Bumped podspec versions to match package version.

## 0.0.7

* Add `getRootInstallationPath()` method to retrieve the root installation path where applications are installed.
* On iOS, returns the main bundle path (application installation directory).
* On macOS, returns the application's installation directory.
* Updated example app to demonstrate the new functionality.
* Enhanced platform interface with comprehensive documentation.

## 0.0.6

* Update package.

## 0.0.5

* Update API.
* Update package.

## 0.0.4

* Update API.

## 0.0.3

* Edit api document and README.md.
* Update package.

## 0.0.2

* Fix pub point.

## 0.0.1

* Initial release.
