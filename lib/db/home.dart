import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sqlite_database/language_translation_string/languageTranslation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('for 1 night'.tr),
      ),
      body: Container(
        child: Column(
          children: [
          
    Text("for 1 night".tr),
   
    Container(
      width: double.infinity,
      height: 400,
      child: ListView(
        children: [
            ListTile(
            leading: const Icon(Icons.language),
            // title: DropDownPage(),
            title:LanguageChange(),
            onTap: (){
            },
          ),
        ],
      ),
    )
          ],
        ),
     
        
      ),
    );
  }
}




class LanguageChange extends StatefulWidget {
  // const LanguageChange({Key? key}) : super(key: key);

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  // List countryImage=['images/turkish.jpg','images/rassian.jpg','images/philippen.png'
  //   ,'images/korean.jpg','images/Khmer.png','images/indonesia.png','images/french.jpg','images/spanish.jpg'
  //   ,'images/us.jpg','images/german.jpg','images/chines.jpg','images/arabic.jpg',];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lng=TranslationPage().getCurrentLang();
  }
  String? lng;
  @override
  Widget build(BuildContext context) {

    return  DropdownButton<String>(
      menuMaxHeight: Get.size.height*0.35,

      value: this.lng,
      underline: Container(),
      isExpanded: false,
      onChanged: (newVal){
        setState((){
          this.lng=newVal!;
          TranslationPage().changeLocale(newVal);
        });
      },
      items: TranslationPage.langs.map(( value) {
        // items: langs.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              // Image.asset(countryImage[2],width: 35,height: 35,),
              Text(value),
            ],
          ),
        );
      }).toList(),
    );
  }
}


