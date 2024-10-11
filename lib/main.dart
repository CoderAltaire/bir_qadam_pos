import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'hive_helper/hive_helper.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();
  await HiveService.init();
  await AppPrefs.initPrefs();
  runApp(
    const MyApp(),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
