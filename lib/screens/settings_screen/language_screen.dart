import 'package:elancer_second_proj/models/drobDown_model.dart';
import 'package:elancer_second_proj/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<DrobDownModel> _dropDownModel=[
    DrobDownModel(id: 1, name: 'English'),
    DrobDownModel(id: 2, name: 'Arabic')

  ];
  int? _selectedLang;
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        centerTitle: true,
      ),

      body: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        elevation: 16,

        onChanged: (String? newValue) {
          if(newValue!=null)
          SharedPrefController().setLang(lang: newValue);
        setState(() {
        dropdownValue = newValue!;
        });
          SharedPrefController().setLang(lang: dropdownValue);
          String lang=SharedPrefController().language;
          print(lang);
        },
        items: <String>['English', 'Arabic']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    )
   //
   // DropdownButton(
   //   isExpanded: true,
   //   hint: Text('Select Language'),
   //   onChanged: (int? value){
   //     print(value);
   //     if (value!=null){
   //       setState(() {
   //         _selectedLang=value;
   //       });
   //       print(_selectedLang);
   //     }
   //   },
   //   value: _selectedLang,

   //   items:_dropDownModel.map((e) {
   //     return dropDownMenuItem(
   //       child:Text(e.name),
   //       value:e.id
   //     );
   //   }).toList(),

   // )
    );
  }
}
