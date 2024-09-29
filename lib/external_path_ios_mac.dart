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
/// final documentsPath = await externalPath.getDirectoryPath(directory: 'Documents');
/// final macOsLibraryPath = await externalPath.getDirectoryPathMacOs(directory: 'Library');
/// final platformVersion = await externalPath.getPlatformVersion();
/// ```
/// --
class ExternalPathIosMac {
  // Retrieves the path for a specified directory on the iOS platform.
  ///
  /// This method calls the `getDirectoryPath` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter.
  ///
  /// The following directories are supported:
  /// - `DIRECTORY_DOWNLOADS`: Downloads directory = 'DIRECTORY_DOWNLOADS' .
  /// - `DIRECTORY_MUSIC`: Music directory = 'DIRECTORY_MUSIC' .
  /// - `DIRECTORY_PODCASTS`: Podcasts directory = 'DIRECTORY_PODCASTS'.
  /// - `DIRECTORY_RINGTONES`: Ringtones directory = 'DIRECTORY_RINGTONES'.
  /// - `DIRECTORY_ALARMS`: Alarms directory = 'DIRECTORY_ALARMS'.
  /// - `DIRECTORY_NOTIFICATIONS`: Notifications directory = 'DIRECTORY_NOTIFICATIONS' .
  /// - `DIRECTORY_PICTURES`: Pictures directory = 'DIRECTORY_PICTURES' .
  /// - `DIRECTORY_MOVIES`: Movies directory = 'DIRECTORY_MOVIES'.
  /// - `DIRECTORY_DCIM`: DCIM (Digital Camera Images) directory = 'DIRECTORY_DCIM' .
  /// - `DIRECTORY_DOCUMENTS`: Documents directory = 'DIRECTORY_DOCUMENTS' .
  /// - `DIRECTORY_SCREENSHOTS`: Screenshots directory = 'DIRECTORY_SCREENSHOTS'  .
  /// - `DIRECTORY_AUDIOBOOKS`: Audiobooks directory. = 'DIRECTORY_AUDIOBOOKS' .
  ///
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
  /// - `DIRECTORY_DOWNLOADS`: Downloads directory = "DIRECTORY_DOWNLOADS".
  /// - `DIRECTORY_PICTURES`: DIRECTORY_PICTURES directory = "DIRECTORY_PICTURES".
  /// - `IRECTORY_MOVIES`: IRECTORY_MOVIES directory = "DIRECTORY_MOVIES".
  ///
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
