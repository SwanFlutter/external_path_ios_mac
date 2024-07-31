// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:external_path_ios_mac/external_path_ios_mac.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getDirectoryPath test', (WidgetTester tester) async {
    final ExternalPathIosMac plugin = ExternalPathIosMac();

    // Test for different directories
    final String? downloadsPath =
        await plugin.getDirectoryPath(directory: 'DIRECTORY_DOWNLOADS');
    final String? musicPath =
        await plugin.getDirectoryPath(directory: 'DIRECTORY_MUSIC');
    final String? picturesPath =
        await plugin.getDirectoryPath(directory: 'DIRECTORY_PICTURES');

    // The path strings depend on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(downloadsPath?.isNotEmpty, true);
    expect(musicPath?.isNotEmpty, true);
    expect(picturesPath?.isNotEmpty, true);
  });
}
