import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'external_path_ios_mac_method_channel.dart';

abstract class ExternalPathIosMacPlatform extends PlatformInterface {
  ExternalPathIosMacPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExternalPathIosMacPlatform _instance =
      MethodChannelExternalPathIosMac();

  static ExternalPathIosMacPlatform get instance => _instance;

  static set instance(ExternalPathIosMacPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getDirectoryPath({required String directory}) {
    throw UnimplementedError('getDirectoryPath() has not been implemented.');
  }

  Future<String?> getDirectoryPathMacOs({required String directory}) {
    throw UnimplementedError(
        'getDirectoryPathMacOs() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }
}
