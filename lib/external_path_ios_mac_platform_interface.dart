import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'external_path_ios_mac_method_channel.dart';

/// An abstract class that defines the platform interface for accessing directory paths
/// and platform version information on iOS and macOS.
///
/// This class extends [PlatformInterface] to ensure that platform implementations
/// properly extend it and use the correct token verification. It serves as the base
/// class for platform-specific implementations, such as [MethodChannelExternalPathIosMac].
///
/// The class defines three abstract methods that must be implemented by platform-specific
/// classes to retrieve directory paths and platform versions.
///
/// Usage:
///   To access the functionality provided by this platform interface, use
///   [ExternalPathIosMacPlatform.instance] which will hold the current implementation
///   (e.g., [MethodChannelExternalPathIosMac]).
///
/// The default instance is [MethodChannelExternalPathIosMac].
abstract class ExternalPathIosMacPlatform extends PlatformInterface {
  /// Constructs an instance of [ExternalPathIosMacPlatform].
  ///
  /// This constructor passes a token to the parent [PlatformInterface] to ensure
  /// that any subclasses are verified with the correct token.
  ExternalPathIosMacPlatform() : super(token: _token);

  /// A unique token used to verify the integrity of platform implementations
  static final Object _token = Object();

  /// A unique token used to verify the integrity of platform implementations
  static ExternalPathIosMacPlatform _instance =
      MethodChannelExternalPathIosMac();

  /// Provides the current instance of [ExternalPathIosMacPlatform].
  ///
  /// This getter returns the current platform implementation instance which will be
  /// used to call platform-specific code.
  static ExternalPathIosMacPlatform get instance => _instance;

  /// Sets the instance of [ExternalPathIosMacPlatform] to a new platform implementation.
  ///
  /// This setter allows the developer to replace the default instance with a custom
  /// implementation. It verifies that the provided instance uses the correct token to
  /// prevent unauthorized implementations.
  ///
  /// Parameters:
  ///   - instance: The new instance of [ExternalPathIosMacPlatform] to set.
  static set instance(ExternalPathIosMacPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
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
  Future<String?> getDirectoryPath({required String directory}) {
    throw UnimplementedError('getDirectoryPath() has not been implemented.');
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
    throw UnimplementedError(
        'getDirectoryPathMacOs() has not been implemented.');
  }

  /// Retrieves the platform version from the native platform.
  ///
  /// This method must be implemented by platform-specific subclasses to provide the
  /// platform version (e.g., iOS or macOS version).
  ///
  /// Returns:
  ///   A [Future] that completes with the platform version as a [String], or throws
  ///   an [UnimplementedError] if not implemented.
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }
}
