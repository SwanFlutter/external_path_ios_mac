// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:external_path_ios_mac/external_path_ios_mac.dart';
import 'package:flutter/material.dart';

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
      platformVersion =
          (await _externalPathIosMacPlugin.getPlatformVersion()) ??
              'Unknown platform version';

      _directoryPathDownload = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.downloads)) ??
          'Unknown directory';
      _directoryPathMusic = (await _externalPathIosMacPlugin.getDirectoryPath(
              directory: DirectoryType.music)) ??
          'Unknown directory';
      _directoryPathPodcasts = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.podcasts)) ??
          'Unknown directory';
      _directoryPathRingtones = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.ringtones)) ??
          'Unknown directory';
      _directoryPathAlarms = (await _externalPathIosMacPlugin.getDirectoryPath(
              directory: DirectoryType.alarms)) ??
          'Unknown directory';
      _directoryPathNotifications = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.notifications)) ??
          'Unknown directory';
      _directoryPathPictures = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.pictures)) ??
          'Unknown directory';
      _directoryPathMovies = (await _externalPathIosMacPlugin.getDirectoryPath(
              directory: DirectoryType.movies)) ??
          'Unknown directory';
      _directoryPathDCIM = (await _externalPathIosMacPlugin.getDirectoryPath(
              directory: DirectoryType.dim)) ??
          'Unknown directory';
      _directoryPathDocuments = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.documents)) ??
          'Unknown directory';
      _directoryPathScreenshots = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.screenshots)) ??
          'Unknown directory';
      _directoryPathAudiobooks = (await _externalPathIosMacPlugin
              .getDirectoryPath(directory: DirectoryType.audiobooks)) ??
          'Unknown directory';

      // get path mac
      _directoryPathDownloadMac = (await _externalPathIosMacPlugin
              .getDirectoryPathMacOs(directory: MacDirectoryType.downloads)) ??
          'Unknown directory';
      _directoryPathPicturesMac = (await _externalPathIosMacPlugin
              .getDirectoryPathMacOs(directory: MacDirectoryType.pictures)) ??
          'Unknown directory';
      _directoryPathMoviesMac = (await _externalPathIosMacPlugin
              .getDirectoryPathMacOs(directory: MacDirectoryType.movies)) ??
          'Unknown directory';
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
      const fileName = 'example.txt';
      for (String path in directoryPaths) {
        if (path != 'Unknown directory' && path.isNotEmpty) {
          final filePath = '$path/$fileName';
          final file = File(filePath);
          await file.writeAsString('This is a sample text.');

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('File saved to $filePath')));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to save file: $e')));
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
                const SizedBox(height: 5),
                Text('_directoryPathDownload: $_directoryPathDownload'),
                const SizedBox(height: 5),
                Text('_directoryPathMusic: $_directoryPathMusic'),
                const SizedBox(height: 5),
                Text('_directoryPathPodcasts: $_directoryPathPodcasts'),
                const SizedBox(height: 5),
                Text('_directoryPathRingtones: $_directoryPathRingtones'),
                const SizedBox(height: 5),
                Text('_directoryPathAlarms: $_directoryPathAlarms'),
                const SizedBox(height: 5),
                Text(
                    '_directoryPathNotifications: $_directoryPathNotifications'),
                const SizedBox(height: 5),
                Text('_directoryPathPictures: $_directoryPathPictures'),
                const SizedBox(height: 5),
                Text('_directoryPathMovies: $_directoryPathMovies'),
                const SizedBox(height: 5),
                Text('_directoryPathDCIM: $_directoryPathDCIM'),
                const SizedBox(height: 5),
                Text('_directoryPathDocuments: $_directoryPathDocuments'),
                const SizedBox(height: 5),
                Text('_directoryPathScreenshots: $_directoryPathScreenshots'),
                const SizedBox(height: 5),
                Text('_directoryPathAudiobooks: $_directoryPathAudiobooks'),
                const SizedBox(height: 5),
                // mac
                Text('_directoryPathDownloadMac: $_directoryPathDownloadMac'),
                const SizedBox(height: 5),
                Text('_directoryPathPicturesMac: $_directoryPathPicturesMac'),
                const SizedBox(height: 5),
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
