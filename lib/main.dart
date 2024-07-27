import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'common/helper/storage/local_storage.dart';
import 'common/helper/storage/shared_preferences.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  await Hive.initFlutter(); // Initialize Hive here
  await initDependencies();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        path: 'assets/lang',
        saveLocale: true,
        startLocale: const Locale('en', 'US'),
        child: const MyApp()));
  });
}

initDependencies() async {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  LocalStorageHelper localStorageHelper = LocalStorageHelper();
  await Future.wait([
    sharedPreferencesHelper.init(),
    localStorageHelper.init(),
    EasyLocalization.ensureInitialized(),
  ]);
}
