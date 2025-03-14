// ignore_for_file: constant_identifier_names

import 'package:external_path_ios_mac/src/directory_type.dart';

import 'external_path_ios_mac_platform_interface.dart';

export 'package:external_path_ios_mac/src/directory_type.dart';

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
/// final documentsPath = await externalPath.getDirectoryPath(directory: DirectoryType.downloads);
/// final macOsLibraryPath = await externalPath.getDirectoryPathMacOs(directory: MacDirectoryType.downloads);
/// final platformVersion = await externalPath.getPlatformVersion();
///
/// ```
class ExternalPathIosMac {
  /// Retrieves the path for a specified directory on the iOS platform.
  ///
  /// This method calls the `getDirectoryPath` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter.
  ///
  /// The following directories are supported:
  /// ```dart
  /// - `DirectoryType.downloads`: Downloads directory.
  /// - `DirectoryType.music`: Music directory.
  /// - `DirectoryType.podcasts`: Podcasts directory.
  /// - `DirectoryType.ringtones`: Ringtones directory.
  /// - `DirectoryType.alarms`: Alarms directory.
  /// - `DirectoryType.notifications`: Notifications directory.
  /// - `DirectoryType.pictures`: Pictures directory.
  /// - `DirectoryType.movies`: Movies directory.
  /// - `DirectoryType.dim`: DIM directory.
  /// - `DirectoryType.documents`: Documents directory.
  /// - `DirectoryType.screenshots`: Screenshots directory.
  /// - `DirectoryType.audiobooks`: Audiobooks directory.
  ///```
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null`
  ///   if the path is not available.
  Future<String?> getDirectoryPath({required DirectoryType directory}) {
    return ExternalPathIosMacPlatform.instance
        .getDirectoryPath(directory: directory.name);
  }

  /// Retrieves the path for a specified directory on the macOS platform.
  ///
  /// This method calls the `getDirectoryPathMacOs` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter for macOS.
  ///
  /// The following directories are supported:
  /// ```dart
  /// - `MacDirectoryType.downloads`: Downloads directory.
  /// - `MacDirectoryType.pictures`: Pictures directory.
  /// - `MacDirectoryType.movies`: Movies directory.
  ///```
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null`
  ///   if the path is not available.
  Future<String?> getDirectoryPathMacOs({required MacDirectoryType directory}) {
    return ExternalPathIosMacPlatform.instance
        .getDirectoryPathMacOs(directory: directory.name);
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
