import 'package:external_path_ios_mac/external_path_ios_mac.dart';
import 'package:external_path_ios_mac/external_path_ios_mac_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'external_path_ios_mac_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('external_path_ios_mac');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getDirectoryPath', () async {
    ExternalPathIosMac externalPathPlugin = ExternalPathIosMac();
    MockExternalPathIosMacPlatform fakePlatform =
        MockExternalPathIosMacPlatform();
    ExternalPathIosMacPlatform.instance = fakePlatform;

    expect(
        await externalPathPlugin.getDirectoryPath(
            directory: 'DIRECTORY_DOWNLOADS'),
        '/mock/path/DIRECTORY_DOWNLOADS');
    expect(
        await externalPathPlugin.getDirectoryPath(directory: 'DIRECTORY_MUSIC'),
        '/mock/path/DIRECTORY_MUSIC');
    expect(
        await externalPathPlugin.getDirectoryPath(
            directory: 'DIRECTORY_PICTURES'),
        '/mock/path/DIRECTORY_PICTURES');
  });
}
