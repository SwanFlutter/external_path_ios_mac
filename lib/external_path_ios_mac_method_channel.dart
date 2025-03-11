// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

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
class MethodChannelExternalPathIosMac extends ExternalPathIosMacPlatform {
  /// The method channel used to communicate with the native platform.
  /// This is marked with `@visibleForTesting` to make it accessible for testing.
  @visibleForTesting
  final methodChannel = const MethodChannel('external_path_ios_mac');

  /// Retrieves the platform version from the native side.
  ///
  /// This method invokes the `getPlatformVersion` method on the native platform
  /// and returns the version as a [String].
  ///
  /// Returns:
  ///   A [Future] that completes with the platform version as a [String], or `null` if not available.
  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

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
  @override
  Future<String?> getDirectoryPath({required String directory}) async {
    final version = await methodChannel
        .invokeMethod<String>('getDirectoryPath', {'directory': directory});
    return version;
  }

  /// Retrieves the path for a specified directory on the macOS platform.
  ///
  /// This method calls the `getDirectoryPathMacOs` method of the current platform-specific
  /// implementation of [ExternalPathIosMacPlatform]. It retrieves the directory path
  /// specified by the [directory] parameter for macOS.
  ///
  /// The following directories are supported:
  /// ```dart
  /// - `DIRECTORY_DOWNLOADS`: ExternalPathIosMac.DIRECTORY_DOWNLOADS_MAC .
  /// - `DIRECTORY_PICTURES`: ExternalPathIosMac.DIRECTORY_PICTURES_MAC .
  /// - `DIRECTORY_MOVIES`: ExternalPathIosMac.DIRECTORY_MOVIES_MAC .
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
  @override
  Future<String?> getDirectoryPathMacOs({required String directory}) async {
    final version = await methodChannel.invokeMethod<String>(
        'getDirectoryPathMacOs', {'directory': directory});
    return version;
  }
}
