import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _textEditingController;


  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
   }

  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Edit Mobile'),
        centerTitle:
        true,
      ),
      body:ListView(
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 5),
        children: [
          Text('Enter Detail Below',style: TextStyle(
            fontSize: 18,
          ),textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          AppTextField(controller: _textEditingController, prefixIcon: Icons.phone, hint: 'Enter new Mobile'),

        ],
      )
      
    );
  }
}
