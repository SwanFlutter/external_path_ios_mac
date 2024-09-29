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
/// final documentsPath = await externalPath.getDirectoryPath(directory: 'Documents');
/// final macOsLibraryPath = await externalPath.getDirectoryPathMacOs(directory: 'Library');
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
  @override
  Future<String?> getDirectoryPathMacOs({required String directory}) async {
    final version = await methodChannel.invokeMethod<String>(
        'getDirectoryPathMacOs', {'directory': directory});
    return version;
  }
}
