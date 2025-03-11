import 'package:external_path_ios_mac/external_path_ios_mac.dart';
import 'package:external_path_ios_mac/external_path_ios_mac_method_channel.dart';
import 'package:external_path_ios_mac/external_path_ios_mac_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExternalPathIosMacPlatform
    with MockPlatformInterfaceMixin
    implements ExternalPathIosMacPlatform {
  @override
  @override
  Future<String?> getDirectoryPath({required String directory}) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getPlatformVersion() {
    // TODO: implement getPlatformVersion
    throw UnimplementedError();
  }

  @override
  Future<String?> getDirectoryPathMacOs({required String directory}) {
    // TODO: implement getDirectoryPathMacOs
    throw UnimplementedError();
  }
}

void main() {
  final ExternalPathIosMacPlatform initialPlatform =
      ExternalPathIosMacPlatform.instance;

  test('$MethodChannelExternalPathIosMac is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExternalPathIosMac>());
  });

  test('getDirectoryPath with DirectoryType enum', () async {
    ExternalPathIosMac externalPathIosMacPlugin = ExternalPathIosMac();
    MockExternalPathIosMacPlatform fakePlatform =
        MockExternalPathIosMacPlatform();
    ExternalPathIosMacPlatform.instance = fakePlatform;

    // Test with DirectoryType.downloads
    expect(
        await externalPathIosMacPlugin.getDirectoryPath(
            directory: DirectoryType.downloads),
        '/mock/path/DIRECTORY_DOWNLOADS');

    // Test with DirectoryType.music
    expect(
        await externalPathIosMacPlugin.getDirectoryPath(
            directory: DirectoryType.music),
        '/mock/path/DIRECTORY_MUSIC');

    // Test with DirectoryType.pictures
    expect(
        await externalPathIosMacPlugin.getDirectoryPath(
            directory: DirectoryType.pictures),
        '/mock/path/DIRECTORY_PICTURES');
  });
}
