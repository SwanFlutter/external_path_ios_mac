// ignore_for_file: constant_identifier_names

import 'external_path_ios_mac_platform_interface.dart';

/// A class that provides methods to access directory paths and platform version
/// information on iOS and macOS platforms.
///
/// This class acts as a facade for accessing the platform-specific implementation
/// through the [ExternalPathIosMacPlatform] interface. It provides methods to retrieve
/// the paths of specific directories and the platform version by delegating these
/// calls to the current platform implementation instance.
///
/// Example usage:
/// ```dart
/// final externalPath = ExternalPathIosMac();
/// final documentsPath = await externalPath.getDirectoryPath(directory: ExternalPathIosMac.DIRECTORY_DOWNLOADS);
/// final macOsLibraryPath = await externalPath.getDirectoryPathMacOs(directory: ExternalPathIosMac.DIRECTORY_DOWNLOADS_MAC);
/// final platformVersion = await externalPath.getPlatformVersion();
/// ```
/// --
class ExternalPathIosMac {
  /// Definition of records related to directories on the iOS platform
  static const String DIRECTORY_DOWNLOADS = 'DIRECTORY_DOWNLOADS';
  static const String DIRECTORY_MUSIC = 'DIRECTORY_MUSIC';
  static const String DIRECTORY_PODCASTS = 'DIRECTORY_PODCASTS';
  static const String DIRECTORY_RINGTONES = 'DIRECTORY_RINGTONES';
  static const String DIRECTORY_ALARMS = 'DIRECTORY_ALARMS';
  static const String DIRECTORY_NOTIFICATIONS = 'DIRECTORY_NOTIFICATIONS';
  static const String DIRECTORY_PICTURES = 'DIRECTORY_PICTURES';
  static const String DIRECTORY_MOVIES = 'DIRECTORY_MOVIES';
  static const String DIRECTORY_DCIM = 'DIRECTORY_DCIM';
  static const String DIRECTORY_DOCUMENTS = 'DIRECTORY_DOCUMENTS';
  static const String DIRECTORY_SCREENSHOTS = 'DIRECTORY_SCREENSHOTS';
  static const String DIRECTORY_AUDIOBOOKS = 'DIRECTORY_AUDIOBOOKS';

  /// // Definition of records related to directories on the macOS platform
  static const String DIRECTORY_DOWNLOADS_MAC = 'DIRECTORY_DOWNLOADS';
  static const String DIRECTORY_PICTURES_MAC = 'DIRECTORY_PICTURES';
  static const String DIRECTORY_MOVIES_MAC = 'DIRECTORY_MOVIES';

  /// Retrieves the path for a specified directory on the iOS platform.
  ///
  /// This method calls the `getDirectoryPath` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter.
  ///
  /// The following directories are supported:
  /// ```dart
  /// - `DIRECTORY_DOWNLOADS`: ExternalPathIosMac.DIRECTORY_DOWNLOADS .
  /// - `DIRECTORY_MUSIC`: ExternalPathIosMac.DIRECTORY_MUSIC .
  /// - `DIRECTORY_PODCASTS`: ExternalPathIosMac.DIRECTORY_PODCASTS .
  /// - `DIRECTORY_RINGTONES`: ExternalPathIosMac.DIRECTORY_RINGTONES .
  /// - `DIRECTORY_ALARMS`: ExternalPathIosMac.DIRECTORY_ALARMS .
  /// - `DIRECTORY_NOTIFICATIONS`: ExternalPathIosMac.DIRECTORY_NOTIFICATIONS .
  /// - `DIRECTORY_PICTURES`: ExternalPathIosMac.DIRECTORY_PICTURES .
  /// - `DIRECTORY_MOVIES`: ExternalPathIosMac.DIRECTORY_MOVIES .
  /// - `DIRECTORY_DCIM`: ExternalPathIosMac.DIRECTORY_DCIM .
  /// - `DIRECTORY_DOCUMENTS`: ExternalPathIosMac.DIRECTORY_DOCUMENTS .
  /// - `DIRECTORY_SCREENSHOTS`: ExternalPathIosMac.DIRECTORY_SCREENSHOTS .
  /// - `DIRECTORY_AUDIOBOOKS`: ExternalPathIosMac.DIRECTORY_AUDIOBOOKS .
  ///```
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null`
  ///   if the path is not available.
  /// Retrieves paths for various common directories on the iOS platform.
  ///
  /// --
  Future<String?> getDirectoryPath({required String directory}) {
    return ExternalPathIosMacPlatform.instance.getDirectoryPath(directory: directory);
  }

  /// Retrieves the path for a specified directory on the macOS platform.
  ///
  /// This method calls the `getDirectoryPathMacOs` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter for macOS.
  ///
  /// The following directories are supported:
  /// ```dart
  /// - `DIRECTORY_DOWNLOADS`: ExternalPathIosMac.DIRECTORY_DOWNLOADS .
  /// - `DIRECTORY_PICTURES`: ExternalPathIosMac.DIRECTORY_PICTURES .
  /// - `DIRECTORY_MOVIES`: ExternalPathIosMac.DIRECTORY_MOVIES .
  ///```
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null`
  ///   if the path is not available.
  /// Retrieves paths for various common directories on the macOS platform.
  ///
  /// --
  Future<String?> getDirectoryPathMacOs({required String directory}) {
    return ExternalPathIosMacPlatform.instance.getDirectoryPathMacOs(directory: directory);
  }

  /// Retrieves the platform version from the native side (iOS or macOS).
  ///
  /// This method calls the `getPlatformVersion` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It provides the platform version
  /// as a [String].
  ///
  /// Returns:
  ///   A [Future] that completes with the platform version as a [String], or `null`
  ///   if the version is not available.
  Future<String?> getPlatformVersion() {
    return ExternalPathIosMacPlatform.instance.getPlatformVersion();
  }
}
