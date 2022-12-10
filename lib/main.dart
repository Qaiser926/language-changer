import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqlite_database/db/home.dart';
import 'package:sqlite_database/language_translation_string/languageTranslation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // language changing store karta he
  await GetStorage.init(); // language changing store karta he
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 
    return GetMaterialApp(
       translations: TranslationPage(),



    // language change k liye he
      locale:TranslationPage().getCurrentLocale(),
      fallbackLocale: Locale('en','US'),

      home: HomePage(),
    );
  }
}