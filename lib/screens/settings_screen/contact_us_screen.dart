import 'package:elancer_second_proj/api/api_helpers.dart';
import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> with ApiHelpers {

  late TextEditingController _subjectTextController;
  late TextEditingController _messagTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subjectTextController = TextEditingController();
    _messagTextController = TextEditingController();}
  @override
  void dispose() {
    // TODO: implement dispose
    _subjectTextController.dispose();
    _messagTextController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFFFDA1A),

        title:Text('Contact us'),
        centerTitle: true,
      ),
      body: ListView(

        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
        children: [
          AppTextField(controller: _subjectTextController, prefixIcon: Icons.subject, hint: 'Enter Subject',prefixColor: Colors.lightBlueAccent,),
          SizedBox(height: 10,),
          AppTextField(controller: _messagTextController, prefixIcon: Icons.message, hint: 'Enter Your Message',prefixColor: Colors.lightBlueAccent,),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: ()=>performSend(),
            //  child:  Text(AppLocalizations.of(context)!.login),
            child:  const Text('Send'),


            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: const Color(0xFFFFDA1A),
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

        ],
      ),
    );
  }


  Future<void> performSend() async {
    if (checkData()) {
      await contactUs();
    }
  }

  bool checkData() {
    if (_subjectTextController.text.isNotEmpty&&
        _messagTextController.text.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context: context,
      message: 'Enter required datah',
      error: true,
    );
    return false;
  }

  Future<void> contactUs() async{
    bool status = await CspApiController().contactUs(
        context,
    message:_messagTextController.text ,
      subject: _subjectTextController.text,
    );
    // if (status) Navigator.pushReplacementNamed(context, '/reset_password_screen');
    if (status) {
      Navigator.pop(context);
    }
  }


}
