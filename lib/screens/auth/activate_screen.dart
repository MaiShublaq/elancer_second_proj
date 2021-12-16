
import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({Key? key}) : super(key: key);

  @override
  _ActivateScreenState createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> with Helpers{


  late TextEditingController _numberTextController;
  late TextEditingController _codeTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberTextController = TextEditingController();
    _codeTextController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _numberTextController.dispose();
    _codeTextController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          // title:  Text(AppLocalizations.of(context)!.login),
          title:  const Text('Activate'),
          backgroundColor: const Color(0xFFFFDA1A),
        ),

//
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            const SizedBox(height: 5,),
            //Text(AppLocalizations.of(context)!.welcome, style:
            const Text('Activate your account', style:

            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),textAlign: TextAlign.center,),
            // Text(AppLocalizations.of(context)!.start,
            const Text('Enter mobile & code',
                textAlign: TextAlign.center,
                style:
                TextStyle(
                  fontSize: 15,
                  color: Color(0xFFFFDA1A),

                )),
            const SizedBox(height: 15),
            AppTextField(
              controller: _numberTextController,
              prefixIcon: Icons.phone,
              //  hint: AppLocalizations.of(context)!.fullName,
              hint: 'Mobile',
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: _codeTextController,
              prefixIcon: Icons.lock_open ,
              //  hint: AppLocalizations.of(context)!.password,
              hint: 'Code',
              obsecure: true,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()async=>performRegister(),
              //  child:  Text(AppLocalizations.of(context)!.login),
              child:  const Text('Activate'),


              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: const Color(0xFFFFDA1A),
                minimumSize: const Size(0, 50),
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15,),



          ],
        )
    );
  }


  Future<void> performRegister() async {
    if (checkData()) {
      await activate();
    }
  }

  bool checkData() {
    if (_numberTextController.text.isNotEmpty &&
        _codeTextController.text.isNotEmpty) {

      return true;
    }
    showSnackBar(context: context,
      message: 'Enter required data',
      error: true,
    );
    return false;
  }

  Future<void> activate() async{
    bool status = await AuthApiController().activate(
      context,
      mobile: _numberTextController.text,
      code: _codeTextController.text,
    );
    if (status) Navigator.pushReplacementNamed(context, '/main_screen');
  }

}

