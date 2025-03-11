# external_path_ios_mac

A Flutter package for retrieving directory paths on iOS and macOS devices, ensuring file access and management across platforms.

---

## Getting Started

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  external_path_ios_mac: ^0.0.6
```

Alternatively, you can use the Git repository:

```yaml
dependencies:
  external_path_ios_mac:
    git:
      url: https://github.com/SwanFlutter/external_path_ios_mac.git
```

---

![photo_2024-09-12_23-49-20](https://github.com/user-attachments/assets/f7574952-92f7-4784-a433-c78453837e53)

## How to Use

Import the package in your Dart file:

```dart
import 'package:external_path_ios_mac/external_path_ios_mac.dart';
```

---

## Supported Directories

### iOS Directories

The following directories are supported on iOS:

| Directory Type          | Description                          |
|-------------------------|--------------------------------------|
| `DirectoryType.downloads`     | Path to the Downloads directory.     |
| `DirectoryType.music`         | Path to the Music directory.         |
| `DirectoryType.podcasts`      | Path to the Podcasts directory.      |
| `DirectoryType.ringtones`     | Path to the Ringtones directory.     |
| `DirectoryType.alarms`        | Path to the Alarms directory.        |
| `DirectoryType.notifications` | Path to the Notifications directory. |
| `DirectoryType.pictures`      | Path to the Pictures directory.      |
| `DirectoryType.movies`        | Path to the Movies directory.        |
| `DirectoryType.dim`           | Path to the DCIM directory.          |
| `DirectoryType.documents`     | Path to the Documents directory.     |
| `DirectoryType.screenshots`   | Path to the Screenshots directory.   |
| `DirectoryType.audiobooks`    | Path to the Audiobooks directory.    |

### macOS Directories

The following directories are supported on macOS:

| Directory Type          | Description                          |
|-------------------------|--------------------------------------|
| `MacDirectoryType.downloads` | Path to the Downloads directory.     |
| `MacDirectoryType.pictures`  | Path to the Pictures directory.      |
| `MacDirectoryType.movies`    | Path to the Movies directory.        |

---

## Example Usage

### Retrieving Directory Paths on iOS

```dart
final externalPath = ExternalPathIosMac();

// Get the Downloads directory path on iOS
final downloadsPath = await externalPath.getDirectoryPath(directory: DirectoryType.downloads);

// Get the Music directory path on iOS
final musicPath = await externalPath.getDirectoryPath(directory: DirectoryType.music);

// Get the Documents directory path on iOS
final documentsPath = await externalPath.getDirectoryPath(directory: DirectoryType.documents);
```

### Retrieving Directory Paths on macOS

```dart
final externalPath = ExternalPathIosMac();

// Get the Downloads directory path on macOS
final downloadsPathMac = await externalPath.getDirectoryPathMacOs(directory: MacDirectoryType.downloads);

// Get the Pictures directory path on macOS
final picturesPathMac = await externalPath.getDirectoryPathMacOs(directory: MacDirectoryType.pictures);

// Get the Movies directory path on macOS
final moviesPathMac = await externalPath.getDirectoryPathMacOs(directory: MacDirectoryType.movies);
```

### Retrieving Platform Version

```dart
final platformVersion = await externalPath.getPlatformVersion();
print('Platform Version: $platformVersion');
```

---

## Full Example

Here’s a complete example demonstrating how to retrieve all directory paths and save a file to each directory:

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
  final _externalPathIosMac = ExternalPathIosMac();

  String _downloadsPath = '';
  String _musicPath = '';
  String _documentsPath = '';
  String _downloadsPathMac = '';
  String _picturesPathMac = '';
  String _platformVersion = '';

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  Future<void> _initPlatformState() async {
    final platformVersion = await _externalPathIosMac.getPlatformVersion();

    // iOS Paths
    _downloadsPath = await _externalPathIosMac.getDirectoryPath(directory: DirectoryType.downloads) ?? 'Unknown';
    _musicPath = await _externalPathIosMac.getDirectoryPath(directory: DirectoryType.music) ?? 'Unknown';
    _documentsPath = await _externalPathIosMac.getDirectoryPath(directory: DirectoryType.documents) ?? 'Unknown';

    // macOS Paths
    _downloadsPathMac = await _externalPathIosMac.getDirectoryPathMacOs(directory: MacDirectoryType.downloads) ?? 'Unknown';
    _picturesPathMac = await _externalPathIosMac.getDirectoryPathMacOs(directory: MacDirectoryType.pictures) ?? 'Unknown';

    setState(() {
      _platformVersion = platformVersion ?? 'Unknown';
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
              Text('Platform Version: $_platformVersion'),
              const SizedBox(height: 20),
              Text('iOS Downloads Path: $_downloadsPath'),
              Text('iOS Music Path: $_musicPath'),
              Text('iOS Documents Path: $_documentsPath'),
              const SizedBox(height: 20),
              Text('macOS Downloads Path: $_downloadsPathMac'),
              Text('macOS Pictures Path: $_picturesPathMac'),
              const SizedBox(height: 20),
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

Add the following keys to your `Info.plist` file:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select images for editing.</string>
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to take photos for editing.</string>
```

### macOS

Add the following entitlement to your `macos/Runner/DebugProfile.entitlements` and `macos/Runner/Release.entitlements` files:

```xml
<key>com.apple.security.files.user-selected.read-only</key>
<true/>
```

---

## Additional information

If you have any issues, questions, or suggestions related to this package, please feel free to contact us at [swan.dev1993@gmail.com](mailto:swan.dev1993@gmail.com
). We welcome your feedback and will do our best to address any problems or provide assistance.

For more information about this package, you can also visit our [GitHub repository](https://github.com/SwanFlutter/external_path_ios_mac) where you can find additional resources, contribute to the package's development, and file issues or bug reports. We appreciate your contributions and feedback, and we aim to make this package as useful as possible for our users.

Thank you for using our package, and we look forward to hearing from you!




