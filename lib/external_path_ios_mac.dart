import 'external_path_ios_mac_platform_interface.dart';

class ExternalPathIosMac {
  Future<String?> getDirectoryPath({required String directory}) {
    return ExternalPathIosMacPlatform.instance
        .getDirectoryPath(directory: directory);
  }

  Future<String?> getDirectoryPathMacOs({required String directory}) {
    return ExternalPathIosMacPlatform.instance
        .getDirectoryPathMacOs(directory: directory);
  }

  Future<String?> getPlatformVersion() {
    return ExternalPathIosMacPlatform.instance.getPlatformVersion();
  }
}
