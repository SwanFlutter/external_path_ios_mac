# external_path_ios_mac

A Flutter package for restoring directory paths on iOS and macOS devices, ensuring file access and management across platforms.


## Getting Started


```yaml
dependencies:
  external_path_ios_mac: ^0.0.5
```

```yaml
  dependencies:
 external_path_ios_mac:
      git:
        url: https://github.com/SwanFlutter/external_path_ios_mac.git
```


![photo_2024-09-12_23-49-20](https://github.com/user-attachments/assets/f7574952-92f7-4784-a433-c78453837e53)



## How to use

```dart
import 'package:external_path_ios_mac/external_path_ios_mac.dart';

```

- The following directories are supported Ios:

```dart
   - `DIRECTORY_DOWNLOADS`: ExternalPathIosMac.DIRECTORY_DOWNLOADS .
   - `DIRECTORY_MUSIC`: ExternalPathIosMac.DIRECTORY_MUSIC .
   - `DIRECTORY_PODCASTS`: ExternalPathIosMac.DIRECTORY_PODCASTS .
   - `DIRECTORY_RINGTONES`: ExternalPathIosMac.DIRECTORY_RINGTONES .
   - `DIRECTORY_ALARMS`: ExternalPathIosMac.DIRECTORY_ALARMS .
   - `DIRECTORY_NOTIFICATIONS`: ExternalPathIosMac.DIRECTORY_NOTIFICATIONS .
   - `DIRECTORY_PICTURES`: ExternalPathIosMac.DIRECTORY_PICTURES .
   - `DIRECTORY_MOVIES`: ExternalPathIosMac.DIRECTORY_MOVIES .
   - `DIRECTORY_DCIM`: ExternalPathIosMac.DIRECTORY_DCIM .
   - `DIRECTORY_DOCUMENTS`: ExternalPathIosMac.DIRECTORY_DOCUMENTS .
   - `DIRECTORY_SCREENSHOTS`: ExternalPathIosMac.DIRECTORY_SCREENSHOTS .
   - `DIRECTORY_AUDIOBOOKS`: ExternalPathIosMac.DIRECTORY_AUDIOBOOKS .
  ```

- The following directories are supported macOs:

```dart
  
  - `DIRECTORY_DOWNLOADS`: ExternalPathIosMac.DIRECTORY_DOWNLOADS .
  - `DIRECTORY_PICTURES`: ExternalPathIosMac.DIRECTORY_PICTURES .
  - `DIRECTORY_MOVIES`: ExternalPathIosMac.DIRECTORY_MOVIES .
  
```

### iOS

```xml
     <key>NSPhotoLibraryUsageDescription</key>
    <string>We need access to your photo library to select images for editing.</string>
    <key>NSCameraUsageDescription</key>
    <string>We need access to your camera to take photos for editing.</string>
```

#### macOS installation

Since the macOS implementation uses `file_selector`, you will need to
add a filesystem access
[entitlement](https://docs.flutter.dev/platform-integration/macos/building#entitlements-and-the-app-sandbox):
```xml
  <key>com.apple.security.files.user-selected.read-only</key>
  <true/>
```

## example

```dart

import 'package:flutter/material.dart';
import 'dart:io';
import 'external_path_ios_mac.dart'; 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _externalPathIosMacPlugin = ExternalPathIosMac();

  String _directoryPathDownload = '';
  String _directoryPathMusic = '';
  String _directoryPathPodcasts = '';
  String _directoryPathRingtones = '';
  String _directoryPathAlarms = '';
  String _directoryPathNotifications = '';
  String _directoryPathPictures = '';
  String _directoryPathMovies = '';
  String _directoryPathDCIM = '';
  String _directoryPathDocuments = '';
  String _directoryPathScreenshots = '';
  String _directoryPathAudiobooks = '';

  // mac path
  String _directoryPathDownloadMac = '';
  String _directoryPathPicturesMac = '';
  String _directoryPathMoviesMac = '';

  String _platformVersion = '';

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  Future<void> _initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = (await _externalPathIosMacPlugin.getPlatformVersion()) ?? 'Unknown platform version';

      _directoryPathDownload = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_DOWNLOADS')) ?? 'Unknown directory';
      _directoryPathMusic = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_MUSIC')) ?? 'Unknown directory';
      _directoryPathPodcasts = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_PODCASTS')) ?? 'Unknown directory';
      _directoryPathRingtones = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_RINGTONES')) ?? 'Unknown directory';
      _directoryPathAlarms = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_ALARMS')) ?? 'Unknown directory';
      _directoryPathNotifications = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_NOTIFICATIONS')) ?? 'Unknown directory';
      _directoryPathPictures = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_PICTURES')) ?? 'Unknown directory';
      _directoryPathMovies = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_MOVIES')) ?? 'Unknown directory';
      _directoryPathDCIM = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_DCIM')) ?? 'Unknown directory';
      _directoryPathDocuments = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_DOCUMENTS')) ?? 'Unknown directory';
      _directoryPathScreenshots = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_SCREENSHOTS')) ?? 'Unknown directory';
      _directoryPathAudiobooks = (await _externalPathIosMacPlugin.getDirectoryPath(directory: 'DIRECTORY_AUDIOBOOKS')) ?? 'Unknown directory';

      // get path mac
      _directoryPathDownloadMac = (await _externalPathIosMacPlugin.getDirectoryPathMacOs(directory: "DIRECTORY_DOWNLOADS")) ?? 'Unknown directory';
      _directoryPathPicturesMac = (await _externalPathIosMacPlugin.getDirectoryPathMacOs(directory: "DIRECTORY_PICTURES")) ?? 'Unknown directory';
      _directoryPathMoviesMac = (await _externalPathIosMacPlugin.getDirectoryPathMacOs(directory: "DIRECTORY_MOVIES")) ?? 'Unknown directory';

    } catch (e) {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _saveFile() async {
    List<String> directoryPaths = [
      _directoryPathDownload,
      _directoryPathMusic,
      _directoryPathPodcasts,
      _directoryPathRingtones,
      _directoryPathAlarms,
      _directoryPathNotifications,
      _directoryPathPictures,
      _directoryPathMovies,
      _directoryPathDCIM,
      _directoryPathDocuments,
      _directoryPathScreenshots,
      _directoryPathAudiobooks,
      _directoryPathDownloadMac,
      _directoryPathPicturesMac,
      _directoryPathMoviesMac,
    ];

    try {
      final fileName = 'example.txt';
      for (String path in directoryPaths) {
        if (path != 'Unknown directory' && path.isNotEmpty) {
          final filePath = '$path/$fileName';
          final file = File(filePath);
          await file.writeAsString('This is a sample text.');

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('File saved to $filePath')));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save file: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Running on: $_platformVersion'),
                SizedBox(height: 5),
                Text('_directoryPathDownload: $_directoryPathDownload'),
                SizedBox(height: 5),
                Text('_directoryPathMusic: $_directoryPathMusic'),
                SizedBox(height: 5),
                Text('_directoryPathPodcasts: $_directoryPathPodcasts'),
                SizedBox(height: 5),
                Text('_directoryPathRingtones: $_directoryPathRingtones'),
                SizedBox(height: 5),
                Text('_directoryPathAlarms: $_directoryPathAlarms'),
                SizedBox(height: 5),
                Text('_directoryPathNotifications: $_directoryPathNotifications'),
                SizedBox(height: 5),
                Text('_directoryPathPictures: $_directoryPathPictures'),
                SizedBox(height: 5),
                Text('_directoryPathMovies: $_directoryPathMovies'),
                SizedBox(height: 5),
                Text('_directoryPathDCIM: $_directoryPathDCIM'),
                SizedBox(height: 5),
                Text('_directoryPathDocuments: $_directoryPathDocuments'),
                SizedBox(height: 5),
                Text('_directoryPathScreenshots: $_directoryPathScreenshots'),
                SizedBox(height: 5),
                Text('_directoryPathAudiobooks: $_directoryPathAudiobooks'),
                SizedBox(height: 5),
                // mac 
                Text('_directoryPathDownloadMac: $_directoryPathDownloadMac'),
                SizedBox(height: 5),
                Text('_directoryPathPicturesMac: $_directoryPathPicturesMac'),
                SizedBox(height: 5),
                Text('_directoryPathMoviesMac: $_directoryPathMoviesMac'),
                //
                ElevatedButton(
                  onPressed: _saveFile,
                  child: const Text('Save File'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


```



