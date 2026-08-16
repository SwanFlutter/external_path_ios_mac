# external_path_ios_mac

A Flutter package for retrieving directory paths on iOS and macOS devices, ensuring file access and management across platforms.

**Platform support: iOS ✓ | macOS ✓**

---

## Getting Started

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  external_path_ios_mac: ^0.0.8
```

Alternatively, you can use the Git repository:

```yaml
dependencies:
  external_path_ios_mac:
    git:
      url: https://github.com/SwanFlutter/external_path_ios_mac.git
```

---

<img src="https://github.com/user-attachments/assets/f7574952-92f7-4784-a433-c78453837e53" width="300"/>

---

## How to Use

Import the package in your Dart file:

```dart
import 'package:external_path_ios_mac/external_path_ios_mac.dart';
```

---

## Supported Directories

### iOS Directories

| Directory Type                  | Description                          |
|---------------------------------|--------------------------------------|
| `DirectoryType.downloads`       | Path to the Downloads directory.     |
| `DirectoryType.music`           | Path to the Music directory.         |
| `DirectoryType.podcasts`        | Path to the Podcasts directory.      |
| `DirectoryType.ringtones`       | Path to the Ringtones directory.     |
| `DirectoryType.alarms`          | Path to the Alarms directory.        |
| `DirectoryType.notifications`   | Path to the Notifications directory. |
| `DirectoryType.pictures`        | Path to the Pictures directory.      |
| `DirectoryType.movies`          | Path to the Movies directory.        |
| `DirectoryType.dcim`            | Path to the DCIM directory.          |
| `DirectoryType.documents`       | Path to the Documents directory.     |
| `DirectoryType.screenshots`     | Path to the Screenshots directory.   |
| `DirectoryType.audiobooks`      | Path to the Audiobooks directory.    |

### macOS Directories

| Directory Type               | Description                      |
|------------------------------|----------------------------------|
| `MacDirectoryType.downloads` | Path to the Downloads directory. |
| `MacDirectoryType.pictures`  | Path to the Pictures directory.  |
| `MacDirectoryType.movies`    | Path to the Movies directory.    |

---

## Example Usage

### Retrieving Directory Paths on iOS

```dart
final externalPath = ExternalPathIosMac();

// Downloads directory
final downloadsPath = await externalPath.getDirectoryPath(
  directory: DirectoryType.downloads,
);

// Music directory
final musicPath = await externalPath.getDirectoryPath(
  directory: DirectoryType.music,
);

// Documents directory
final documentsPath = await externalPath.getDirectoryPath(
  directory: DirectoryType.documents,
);

// DCIM directory
final dcimPath = await externalPath.getDirectoryPath(
  directory: DirectoryType.dcim,
);
```

### Retrieving Directory Paths on macOS

```dart
final externalPath = ExternalPathIosMac();

// Downloads directory
final downloadsPathMac = await externalPath.getDirectoryPathMacOs(
  directory: MacDirectoryType.downloads,
);

// Pictures directory
final picturesPathMac = await externalPath.getDirectoryPathMacOs(
  directory: MacDirectoryType.pictures,
);

// Movies directory
final moviesPathMac = await externalPath.getDirectoryPathMacOs(
  directory: MacDirectoryType.movies,
);
```

### Retrieving Platform Version

```dart
final platformVersion = await externalPath.getPlatformVersion();
print('Platform Version: $platformVersion');
```

### Retrieving Root Installation Path

```dart
final externalPath = ExternalPathIosMac();

try {
  final rootPath = await externalPath.getRootInstallationPath();
  print('Root installation path: $rootPath');
} catch (e) {
  print('Error: $e');
}
```

> On iOS, returns the main bundle path. On macOS, returns the application's installation directory.

---

## Full Example

```dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:external_path_ios_mac/external_path_ios_mac.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _externalPath = ExternalPathIosMac();

  String _platformVersion = '';
  String _downloadsPath = '';
  String _musicPath = '';
  String _documentsPath = '';
  String _downloadsPathMac = '';
  String _picturesPathMac = '';

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  Future<void> _initPlatformState() async {
    final platformVersion = await _externalPath.getPlatformVersion();

    // iOS paths
    final downloadsPath = await _externalPath.getDirectoryPath(
      directory: DirectoryType.downloads,
    );
    final musicPath = await _externalPath.getDirectoryPath(
      directory: DirectoryType.music,
    );
    final documentsPath = await _externalPath.getDirectoryPath(
      directory: DirectoryType.documents,
    );

    // macOS paths
    final downloadsPathMac = await _externalPath.getDirectoryPathMacOs(
      directory: MacDirectoryType.downloads,
    );
    final picturesPathMac = await _externalPath.getDirectoryPathMacOs(
      directory: MacDirectoryType.pictures,
    );

    setState(() {
      _platformVersion = platformVersion ?? 'Unknown';
      _downloadsPath = downloadsPath ?? 'Unknown';
      _musicPath = musicPath ?? 'Unknown';
      _documentsPath = documentsPath ?? 'Unknown';
      _downloadsPathMac = downloadsPathMac ?? 'Unknown';
      _picturesPathMac = picturesPathMac ?? 'Unknown';
    });
  }

  Future<void> _saveFile(String path, String fileName) async {
    if (path != 'Unknown') {
      final file = File('$path/$fileName');
      await file.writeAsString('Sample content');
      print('File saved to $path/$fileName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Directory Paths Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Platform: $_platformVersion'),
              const SizedBox(height: 16),
              Text('iOS Downloads: $_downloadsPath'),
              Text('iOS Music: $_musicPath'),
              Text('iOS Documents: $_documentsPath'),
              const SizedBox(height: 16),
              Text('macOS Downloads: $_downloadsPathMac'),
              Text('macOS Pictures: $_picturesPathMac'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _saveFile(_downloadsPath, 'example.txt'),
                child: const Text('Save File to Downloads'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## Platform-Specific Setup

### iOS

Add the following keys to your `Info.plist` if your app accesses photos or camera:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library.</string>
<key>NSCameraUsageDescription</key>
<string>We need access to your camera.</string>
```

### macOS

Add the following entitlement to `macos/Runner/DebugProfile.entitlements` and `macos/Runner/Release.entitlements`:

```xml
<key>com.apple.security.files.user-selected.read-only</key>
<true/>
```

---

## Swift Package Manager

This package supports Swift Package Manager (SPM) for both iOS and macOS, compatible with Flutter 3.44+. CocoaPods is also supported for backwards compatibility.

---

## Additional Information

For issues, questions, or suggestions, contact us at [swan.dev1993@gmail.com](mailto:swan.dev1993@gmail.com) or visit our [GitHub repository](https://github.com/SwanFlutter/external_path_ios_mac).
