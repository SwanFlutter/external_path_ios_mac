import 'package:flutter_test/flutter_test.dart';
import 'package:external_path_ios_mac/external_path_ios_mac.dart';
import 'package:external_path_ios_mac/external_path_ios_mac_platform_interface.dart';
import 'package:external_path_ios_mac/external_path_ios_mac_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExternalPathIosMacPlatform
    with MockPlatformInterfaceMixin
    implements ExternalPathIosMacPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getDirectoryPath({required String directory}) {
    // TODO: implement getDirectoryPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getDirectoryPathMacOs({required String directory}) {
    // TODO: implement getDirectoryPathMacOs
    throw UnimplementedError();
  }

  @override
  Future<String?> getRootInstallationPath() {
    // TODO: implement getRootInstallationPath
    throw UnimplementedError();
  }
}

void main() {
  final ExternalPathIosMacPlatform initialPlatform =
      ExternalPathIosMacPlatform.instance;

  test('$MethodChannelExternalPathIosMac is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExternalPathIosMac>());
  });

  test('getPlatformVersion', () async {
    ExternalPathIosMac externalPathIosMacPlugin = ExternalPathIosMac();
    MockExternalPathIosMacPlatform fakePlatform =
        MockExternalPathIosMacPlatform();
    ExternalPathIosMacPlatform.instance = fakePlatform;

    expect(await externalPathIosMacPlugin.getPlatformVersion(), '42');
  });
}
