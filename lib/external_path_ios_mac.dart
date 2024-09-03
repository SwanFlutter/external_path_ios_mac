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
class ExternalPathIosMac {
  // Retrieves the path for a specified directory on the iOS platform.
  ///
  /// This method calls the `getDirectoryPath` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter.
  ///
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null`
  ///   if the path is not available.
  Future<String?> getDirectoryPath({required String directory}) {
    return ExternalPathIosMacPlatform.instance
        .getDirectoryPath(directory: directory);
  }

  /// Retrieves the path for a specified directory on the macOS platform.
  ///
  /// This method calls the `getDirectoryPathMacOs` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter for macOS.
  ///
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null`
  ///   if the path is not available.
  Future<String?> getDirectoryPathMacOs({required String directory}) {
    return ExternalPathIosMacPlatform.instance
        .getDirectoryPathMacOs(directory: directory);
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
