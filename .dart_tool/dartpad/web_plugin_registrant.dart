// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter_keyboard_visibility_web/flutter_keyboard_visibility_web.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';
import 'package:mobile_scanner/mobile_scanner_web_plugin.dart';
import 'package:package_info_plus_web/package_info_plus_web.dart';
import 'package:share_plus/src/share_plus_web.dart';
import 'package:share_plus_web/share_plus_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FirebaseAnalyticsWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FlutterKeyboardVisibilityPlugin.registerWith(registrar);
  FlutterSecureStorageWeb.registerWith(registrar);
  MobileScannerWebPlugin.registerWith(registrar);
  PackageInfoPlugin.registerWith(registrar);
  SharePlusWebPlugin.registerWith(registrar);
  SharePlusPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
