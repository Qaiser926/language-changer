import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqlite_database/language_translation_string/ar_SA.dart';
import 'package:sqlite_database/language_translation_string/en_US.dart';
import 'package:sqlite_database/language_translation_string/es_ES.dart';
import 'package:sqlite_database/language_translation_string/fr_BE.dart';
import 'package:sqlite_database/language_translation_string/id_ID.dart';
import 'package:sqlite_database/language_translation_string/kk_KZ.dart';
import 'package:sqlite_database/language_translation_string/ko_KR.dart';
import 'package:sqlite_database/language_translation_string/ru_RU.dart';
import 'package:sqlite_database/language_translation_string/tl_PH.dart';
import 'package:sqlite_database/language_translation_string/tr_TU.dart';
import 'package:sqlite_database/language_translation_string/zh_CN.dart';

import 'de_DE.dart';
class TranslationPage extends Translations{
  static final local =Locale('en','US');
  static final fallbacklocale=Locale('en','US');

  // https://www.youtube.com/watch?v=-6GBAGj-h4Q


static final langs=  ['Turkish','Russian',
  'Phillipin','Korean','Khmer','Indonesia','French',
  'Spanish','English','German','Chinese','Arabic',];
//  static final List<Map> langs=[
//    {'id':1,'name':'Turkish','image':'images/turkish.jpg'},
//     {'id':2,'name':'Russian','image':'images/rassian.jpg'},
//     {'id':3,'name':'Phillipin','image':'images/philippen.png'},
//     {'id':4,'name':'Korean','image':'images/korean.jpg'},
//     {'id':5,'name':'Khmer','image':'images/Khmer.png'},
//     {'id':6,'name':'Indonesia','image':'images/indonesia.png'},
//     {'id':7,'name':'French','image':'images/french.jpg'},
//     {'id':8,'image':'Spanish','image':'images/spanish.jpg'},
// {'id':9,'name':'English','image':'images/us.jpg'},
//     {'id':10,'name':'German','image':'images/german.jpg'},
//     {'id':11,'name':'Chinese','image':'images/chines.jpg'},
//     {'id':12,'name':'Arabic','image':'images/arabic.jpg'}
//   ];
  static final locales=[
    Locale('tr','TU'),// turkish
    Locale('ru','RU'),// rassian
    Locale('tl','PH'),// philippen
    Locale('ko','KR'), // koream
    Locale('kk','KZ'),
    Locale('id','ID'),// indonessian
    Locale('fr','BE'), // french
    Locale('es','ES'), //spanish
    Locale('en','US'), // english
    Locale('de','DE'), // german
    Locale('zh','CN'),
    Locale('ar','SA'), // arabic
  ];
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    // turkish
    'tr_TU':turkish,
    // rassian
    'ru_RU':ra,
    // filipino
    'tl_PH':filipin,
    // korean
    'ko_KR':korean,
    // khmer
    'kk_KZ':khmer,
    // indonesia
    'id_ID':indonesia,
    // french
    'fr_BE':french,
    // spanish
    'es_ES':spanish,
    // english
    'en_US':en,
    // german
    'de_DE':german,
    // chiness
    'zh_CN':chines,
    // arabic
    'ar_SA':arabic,
  };

  void changeLocale(String lang){
    final locale=getLocaleFromLagnuage(lang);
    final box=GetStorage(); // language state ko save karta he
    box.write('lng', lang); // ye b he save k liye
    Get.updateLocale(locale!);
  }
  Locale? getLocaleFromLagnuage(String lang){
    for(int i =0; i < langs.length; i++){
      if(lang==langs[i]) return locales[i];
    }
    return Get.locale;
  }
  // yd nichd language ko save karta h
  Locale? getCurrentLocale(){
    final box=GetStorage(); // language state ko save karta  he
    Locale? defaultLocale;
    if(box.read('lng')!=null){
      final locale=getLocaleFromLagnuage(box.read('lng'));

      defaultLocale=locale;

    }else{
      defaultLocale=Locale('en','US');
    }
    return defaultLocale;
  }
  // save karta he language
  String getCurrentLang(){
    final box =GetStorage();
    return box.read('lng')!=null?box.read('lng'):'English';
  }

}