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

  /// Retrieves the specified directory path on the iOS platform.
  ///
  /// This method must be implemented by platform-specific subclasses to provide the
  /// path for the specified directory.
  ///
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or throws
  ///   an [UnimplementedError] if not implemented.
  Future<String?> getDirectoryPath({required String directory}) {
    throw UnimplementedError('getDirectoryPath() has not been implemented.');
  }

  /// Retrieves the specified directory path on the macOS platform.
  ///
  /// This method must be implemented by platform-specific subclasses to provide the
  /// path for the specified directory on macOS.
  ///
  /// Parameters:
  ///   - directory: The name of the directory whose path is to be retrieved.
  ///
  /// Returns:
  ///   A [Future] that completes with the directory path as a [String], or throws
  ///   an [UnimplementedError] if not implemented.
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
