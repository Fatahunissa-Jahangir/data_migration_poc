import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

Future<Directory>   getMachineDirectory() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final appName = packageInfo.appName;

  if (Platform.isAndroid) {
    final androidDir = await getApplicationSupportDirectory();
    return androidDir;
  } else if (Platform.isWindows) {
    try {
      final windowDir = Directory('c:\\programData\\$appName');
      if (!windowDir.existsSync()) {
        windowDir.createSync(recursive: true);
      }
      await provideReadWritePermission(windowDir.path);
      return windowDir;
    } catch (e) {
      throw UnsupportedError('Unsupported platform');
    }
  } else {
    throw UnsupportedError('Unsupported platform');
  }
}

Future<void> provideReadWritePermission(String path) async {
  try {
    final result = await Process.run(
      'icacls', 
      [path],
    );
    if (result.stdout.toString().contains('Everyone')
      && result.stdout.toString().contains('(F)')) {
      return;
    }

    final grantResult = await Process.run(
      'icacls', 
      [path, '/grant', 'Everyone:(OI)(CI)F'],
    );

    if (grantResult.exitCode != 0) {
      throw Exception('Failed to grant read/write permission : ${grantResult.stderr}');
    }
  } catch (e) {
    throw Exception('Error providing read/write permission : ${e.toString()}');
  }
}