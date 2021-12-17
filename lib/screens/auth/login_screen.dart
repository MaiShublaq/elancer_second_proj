
import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers{

  late TextEditingController _numberTextController;
  late TextEditingController _passwordTextController;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = onTap;
  }

  void onTap() {
    Navigator.pushNamed(context, '/register_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _numberTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          // title:  Text(AppLocalizations.of(context)!.login),
          title:  const Text('LOGIN'),
          backgroundColor: const Color(0xFFFFDA1A),

         // backgroundColor: Colors.pink.shade300,
        ),
       // floatingActionButton: FloatingActionButton(
       //   child:const Icon(Icons.language),
       //   onPressed: (){
       //     Provider.of<LanguageProvider>(context,listen: false).changeLanguage();
       //   },
//
       // ),
//
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            const SizedBox(height: 5,),
            //Text(AppLocalizations.of(context)!.welcome, style:
            const Text('Welcome Back', style:

             TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),textAlign: TextAlign.center,),
            // Text(AppLocalizations.of(context)!.start,
            const Text('Find Your Pefect Furniture!',
                textAlign: TextAlign.center,
                style:
                TextStyle(
                  fontSize: 15,
                  color: Color(0xFFFFDA1A),

                )),
            const SizedBox(height: 15),
            AppTextField(
              controller: _numberTextController,
              prefixIcon: Icons.person,
              //  hint: AppLocalizations.of(context)!.fullName,
              hint: 'FullName',
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: _passwordTextController,
              prefixIcon: Icons.lock,
              //  hint: AppLocalizations.of(context)!.password,
              hint: 'Password',
              obsecure: true,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()async=>performLogin(),
              //  child:  Text(AppLocalizations.of(context)!.login),
              child:  const Text('LOGIN'),


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
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  //    text: AppLocalizations.of(context)!.haveAccount,
                    text: 'Don\'t have an account',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(text: ' '),
                      TextSpan(
                        //   text: AppLocalizations.of(context)!.create,
                          text: ' Create now',


                          style: const TextStyle(color: Colors.lightBlueAccent),
                          recognizer: _tapGestureRecognizer
                      )
                    ]
                )),
            TextButton(
                onPressed:()=>Navigator.pushReplacementNamed(context,'/froget_password_screen') ,
                // child: Text(AppLocalizations.of(context)!.passwordForget)
                child: const Text('Forget Password?')
            )

          ],
        )
    );
  }


  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_numberTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {

      return true;
    }
    showSnackBar(context: context,
      message: 'Enter required data',
      error: true,
    );
    return false;
  }

  Future<void> login() async{
    bool status = await AuthApiController().login(
      context,
      mobile: _numberTextController.text,
      password: _passwordTextController.text,
    );

    if (status){
      Navigator.pushReplacementNamed(context, '/main_screen');
    }
  }



}