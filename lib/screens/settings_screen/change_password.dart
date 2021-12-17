import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> with Helpers{
  late TextEditingController _oldPassTextController;
  late TextEditingController _newpasswordTextController;
  late TextEditingController _newpasswordConfirmTextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _oldPassTextController = TextEditingController();
    _newpasswordTextController = TextEditingController();
    _newpasswordConfirmTextController = TextEditingController();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    _oldPassTextController.dispose();
    _newpasswordTextController.dispose();
    _newpasswordConfirmTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFDA1A),
        title: Text('Change Password'),
        centerTitle: true,
      ),

      body:ListView(
        padding:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          SizedBox(height: 10,),
          Text('Enter Details Below',style:TextStyle(fontSize: 18),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          AppTextField(controller: _oldPassTextController, prefixIcon: Icons.lock, hint: "Enter your old password",obsecure: true,prefixColor:Colors.lightBlueAccent,),
          SizedBox(height: 10,),
          AppTextField(controller: _newpasswordTextController, prefixIcon: Icons.lock, hint: 'Enter new password',obsecure: true,prefixColor: Colors.lightBlueAccent,),
          SizedBox(height: 10,),
          AppTextField(controller: _newpasswordConfirmTextController, prefixIcon: Icons.lock, hint: 'Confirm new password',obsecure: true,prefixColor:Colors.lightBlueAccent ,),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: ()=>performChange(),
            //  child:  Text(AppLocalizations.of(context)!.login),
            child:  const Text('Change'),


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
      )
    );
  }

  Future<void> performChange() async {
    if (checkData()) {
      await changePassword();
    }
  }

  bool checkData() {
    if (_oldPassTextController.text.isNotEmpty&&
        _newpasswordTextController.text.isNotEmpty &&
        _newpasswordConfirmTextController.text.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context: context,
      message: 'Enter required datah',
      error: true,
    );
    return false;
  }

  Future<void> changePassword() async{
    bool status = await AuthApiController().changePassword(
      context,
      oldPass: _oldPassTextController.text,
      newPass:_newpasswordTextController.text
    );
    print(status);
    // if (status) Navigator.pushReplacementNamed(context, '/reset_password_screen');
    if (status) {
      Navigator.pop(context);
    }
  }

}
