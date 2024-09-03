// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'external_path_ios_mac_platform_interface.dart';

/// An implementation of [ExternalPathIosMacPlatform] that uses method channels
/// to communicate with the platform-specific code for retrieving directory
/// paths and platform versions on iOS and macOS.
///
/// This class provides methods to get the platform version and directory paths
/// for both iOS and macOS by invoking platform-specific methods via method channels.
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

  /// Retrieves the specified directory path on the iOS platform.
  ///
  /// This method invokes the `getDirectoryPath` method on the native platform
  /// with the provided directory name and returns the path as a [String].
  ///
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null` if not available.
  @override
  Future<String?> getDirectoryPath({required String directory}) async {
    final version = await methodChannel
        .invokeMethod<String>('getDirectoryPath', {'directory': directory});
    return version;
  }

  /// Retrieves the specified directory path on the macOS platform.
  ///
  /// This method invokes the `getDirectoryPathMacOs` method on the native platform
  /// with the provided directory name and returns the path as a [String].
  ///
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or `null` if not available.
  @override
  Future<String?> getDirectoryPathMacOs({required String directory}) async {
    final version = await methodChannel.invokeMethod<String>(
        'getDirectoryPathMacOs', {'directory': directory});
    return version;
  }
}
