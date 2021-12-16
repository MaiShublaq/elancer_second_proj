


import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/screens/auth/password/reset_password_screen.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with Helpers{

  late TextEditingController _mobileTextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forget Password'),
          centerTitle: true,
          backgroundColor:const Color(0xFFFFDA1A),
        ),
        body: ListView(

          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const Text('Enter Mobile', style:
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
            const Text('Reset code will be sent', style:
            TextStyle(
              fontSize: 15,
              color: Colors.grey,
            )),
            const SizedBox(height: 15),
            AppTextField(
              controller: _mobileTextController,
              prefixIcon: Icons.phone,
              hint: 'Mobile',
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: ()async=>performForgetPassword(),
              child: const Text('SEND'),
              style: ElevatedButton.styleFrom(
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


  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (_mobileTextController.text.isNotEmpty ) {
      return true;
    }
    showSnackBar(context: context,
      message: 'Enter required data',
      error: true,
    );
    return false;
  }

  Future<void> forgetPassword() async{
    bool status = await AuthApiController().forgetPassword(
      context,
      mobile: _mobileTextController.text,
    );
    // if (status) Navigator.pushReplacementNamed(context, '/reset_password_screen');
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResetPassword(mobile: _mobileTextController.text),
        ),
      );
    }
  }


}