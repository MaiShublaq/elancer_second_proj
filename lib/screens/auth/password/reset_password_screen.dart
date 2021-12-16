

import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:elancer_second_proj/widgets/code_text_field.dart';
import 'package:flutter/material.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key,required this.mobile}) : super(key: key);

  final String mobile;
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with Helpers{

  late TextEditingController _newPasswordTextController;
  late TextEditingController _newPasswordConfirmationTextController;

  late TextEditingController _firsCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  late String _code;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newPasswordTextController = TextEditingController();
    _newPasswordConfirmationTextController=TextEditingController();

    _firsCodeTextController=TextEditingController();
    _secondCodeTextController=TextEditingController();
    _thirdCodeTextController=TextEditingController();
    _fourthCodeTextController=TextEditingController();

    _firstFocusNode=FocusNode();
    _secondFocusNode=FocusNode();
    _thirdFocusNode=FocusNode();
    _fourthFocusNode=FocusNode();


  }


  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordTextController.dispose();
    _newPasswordConfirmationTextController.dispose();
    _firsCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
          backgroundColor: const Color(0xFFFFDA1A),
          centerTitle: true,
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          children: [
            const Text('Enter new password...', style:
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
            const Text('Enter new password and receive code ', style:
            TextStyle(
              fontSize: 15,
              color: Colors.grey,
            )),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    child:CodeTextField(
                        controller: _firsCodeTextController,
                        focusNode: _firstFocusNode,
                        onChange: (value){
                          if(value.isNotEmpty) {
                            _secondFocusNode.requestFocus();
                          }})
                ),
                const SizedBox(width: 10),
                Expanded(
                    child:CodeTextField(
                        controller: _secondCodeTextController,
                        focusNode: _secondFocusNode,
                        onChange: (value){
                          value.isNotEmpty
                              ?_thirdFocusNode.requestFocus()
                              :_firstFocusNode.requestFocus();
                        })
                ),
                const SizedBox(width: 10),

                Expanded(
                    child:CodeTextField(
                        controller: _thirdCodeTextController,
                        focusNode: _thirdFocusNode,
                        onChange: (value){
                          value.isNotEmpty
                              ?_fourthFocusNode.requestFocus()
                              :_secondFocusNode.requestFocus();

                        })
                ),
                const SizedBox(width: 10),

                Expanded(
                    child:CodeTextField(
                        controller: _fourthCodeTextController,
                        focusNode: _fourthFocusNode,
                        onChange: (value){
                          if (value.isEmpty){
                            _thirdFocusNode.requestFocus();
                          }

                        })
                ),
              ],
            ),
            const SizedBox(height: 15),

            AppTextField(
              controller: _newPasswordConfirmationTextController,
              prefixIcon: Icons.lock,
              hint: 'new password',
              obsecure: true,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: _newPasswordTextController,
              prefixIcon: Icons.lock,
              hint: 'new password confirmation',
              obsecure: true,
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: ()async=>performForgetPassword(),
              child: const Text('RESET'),
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

  bool checkData(){
    if (checkCode() && checkPassword()){
      return true;
    }
    return false;
  }


  bool checkPassword() {
    if (_newPasswordTextController.text.isNotEmpty &&
        _newPasswordConfirmationTextController.text.isNotEmpty) {

      if(_newPasswordConfirmationTextController.text==_newPasswordTextController.text){
        return true;
      }
      showSnackBar(context: context, message: 'password confirmation error',error:true);
      return false;
    }

    showSnackBar(context: context, message: 'Enter new password',error:true);
    return false; }


  bool checkCode(){
    if(_firsCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty&&
        _thirdCodeTextController.text.isNotEmpty&&
        _fourthCodeTextController.text.isNotEmpty){
      getVerificationCode();
      return true;
    }

    showSnackBar(context: context, message: 'Enter verification code',error:true);
    return false;

  }
  String getVerificationCode(){
    return _code= (_firsCodeTextController.text +
        _secondCodeTextController.text+
        _thirdCodeTextController.text+
        _fourthCodeTextController.text);
  }


  Future<void> forgetPassword() async{
    bool status = await AuthApiController().resetPassword(
      context,
      mobile: widget.mobile,
      password: _newPasswordTextController.text,
      code:_code,
    );
    if (status) Navigator.pushReplacementNamed(context, '/main_screen');
  }


}

