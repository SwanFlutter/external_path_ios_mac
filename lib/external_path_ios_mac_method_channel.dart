// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'external_path_ios_mac_platform_interface.dart';

/// An implementation of [ExternalPathIosMacPlatform] that uses method channels.
class MethodChannelExternalPathIosMac extends ExternalPathIosMacPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('external_path_ios_mac');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDirectoryPath({required String directory}) async {
    final version = await methodChannel
        .invokeMethod<String>('getDirectoryPath', {'directory': directory});
    return version;
  }

  @override
  Future<String?> getDirectoryPathMacOs({required String directory}) async {
    final version = await methodChannel.invokeMethod<String>(
        'getDirectoryPathMacOs', {'directory': directory});
    return version;
  }
}
