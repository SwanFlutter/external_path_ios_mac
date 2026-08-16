import '../external_path_ios_mac_platform_interface.dart';

/// Stub implementation for platforms that are not natively supported
/// (Android, Web, Windows, Linux).
///
/// This class registers itself as the platform implementation on unsupported
/// platforms so that the package resolves without compile errors, while
/// making it clear at runtime that the platform is not supported.
class ExternalPathIosMacStub extends ExternalPathIosMacPlatform {
  /// Registers this stub as the default instance on unsupported platforms.
  static void registerWith() {
    ExternalPathIosMacPlatform.instance = ExternalPathIosMacStub();
  }

  @override
  Future<String?> getPlatformVersion() async {
    throw UnsupportedError(
      'external_path_ios_mac is only supported on iOS and macOS.',
    );
  }

  @override
  Future<String?> getDirectoryPath({required String directory}) async {
    throw UnsupportedError(
      'external_path_ios_mac is only supported on iOS and macOS.',
    );
  }

  @override
  Future<String?> getDirectoryPathMacOs({required String directory}) async {
    throw UnsupportedError(
      'external_path_ios_mac is only supported on iOS and macOS.',
    );
  }

  @override
  Future<String?> getRootInstallationPath() async {
    throw UnsupportedError(
      'external_path_ios_mac is only supported on iOS and macOS.',
    );
  }
}
