# external_path_ios_mac

A plugin to get folder path.

## Getting Started


```yaml
dependencies:
  external_path_ios_mac: ^0.0.1
```

```yaml
  dependencies:
 external_path_ios_mac:
      git:
        url: https://github.com/SwanFlutter/flutter_saver.git
```


## How to use

```dart
import 'package:external_path_ios_mac/external_path_ios_mac.dart';

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
import 'dart:async';

import 'package:external_path_ios_mac/external_path_ios_mac.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



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
    String directoryPath;
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
      directoryPath = 'Failed to get directory path.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _directoryPath = directoryPath;
    });
  }

  Future<void> _saveFile() async {
    try {
      final fileName = 'example.txt';
      final filePath = '$_directoryPath/$fileName';
      final file = File(filePath);

      // نوشتن محتوا در فایل
      await file.writeAsString('This is a sample text.');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('File saved to $filePath')));
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Running on: $_platformVersion'),
              Sizedbox(height:5),
              Text('_directoryPathDownload: $_directoryPathDownload'),
              Sizedbox(height:5),
              Text('_directoryPathMusic: $_directoryPathMusic'),
              Sizedbox(height:5),
              Text('_directoryPathPodcasts: $_directoryPathPodcasts'),
              Sizedbox(height:5),
              Text('_directoryPathRingtones: $_directoryPathRingtones'),
              Sizedbox(height:5),
              Text('_directoryPathAlarms: $_directoryPathAlarms'),
              Sizedbox(height:5),
              Text('_directoryPathNotifications: $_directoryPathNotifications'),
              Sizedbox(height:5),
              Text('_directoryPathPictures: $_directoryPathPictures'),
              Sizedbox(height:5),
              Text('_directoryPathMovies: $_directoryPathMovies'),
              Sizedbox(height:5),
              Text('_directoryPathDCIM: $_directoryPathDCIM'),
              Sizedbox(height:5),
              Text('_directoryPathDocuments: $_directoryPathDocuments'),
              Sizedbox(height:5),
              Text('_directoryPathScreenshots: $_directoryPathScreenshots'),
              Sizedbox(height:5),
              Text('_directoryPathAudiobooks: $_directoryPathAudiobooks'),
              Sizedbox(height:5),
              // mac 
              Text('_directoryPathDownloadMac: $_directoryPathDownloadMac'),
              Sizedbox(height:5),
              Text('_directoryPathPicturesMac: $_directoryPathPicturesMac'),
              Sizedbox(height:5),
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
    );
  }
}

```



