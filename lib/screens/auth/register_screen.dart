
import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/models/user.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _cityIdTextController;

  String _gender='M';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController=TextEditingController();
    _mobileTextController=TextEditingController();
    _passwordTextController=TextEditingController() ;
    _cityIdTextController=TextEditingController() ;


  }
  void onTap(){
    Navigator.pushNamed(context, '/register_screen');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    _cityIdTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          title:const Text('REGISTER'),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFDA1A),

        ),
        body:ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          children: [
             const Text('Create new account ...',style:
             TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,),
            const Text('Enter details below',style:
            TextStyle(
              fontSize: 15,
              color: Color(0xFFFFDA1A),
            ),
              textAlign: TextAlign.center,),
            const  SizedBox(height:15),
            AppTextField(
              controller: _nameTextController,
              prefixIcon: Icons.person,
              hint: 'FullName',
            ),
            const SizedBox(height:10),
            AppTextField(
              controller: _mobileTextController,
              prefixIcon: Icons.phone,
              hint: 'Mobile',
              type: TextInputType.phone,
            ),
            const SizedBox(height:10),
            AppTextField(
              controller: _passwordTextController,
              prefixIcon: Icons.lock,
              hint: 'Password',
              obsecure: true,
            ),
            const SizedBox(height:10),
            AppTextField(
              controller: _cityIdTextController,
              prefixIcon: Icons.lock,
              hint: 'city',
            ),

            const SizedBox(height:10),
            Row(
                children:[
                  Expanded(
                      child:RadioListTile<String>(
                        title: const Text('Male'),
                        activeColor:const Color(0xFFFFDA1A),
                          value:'M',
                        groupValue: _gender,
                        onChanged: (String?value) {
                          if(value !=null){
                            setState((){
                              _gender=value;
                            });
                          }
                        },

                      )
                  ),

                  Expanded(
                      child:RadioListTile<String>(

                        title: const Text('Female'),
                        activeColor:const Color(0xFFFFDA1A),
                        value:'F',
                        groupValue: _gender,
                        onChanged: (String?value) {
                          if(value !=null){
                            setState((){
                              _gender=value;
                            });
                          }
                        },

                      )
                  ),

                ]

            ),
            ElevatedButton(
              onPressed: ()async =>performLogin(),
              child:const Text('REGISTER'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: const Color(0xFFFFDA1A),
                minimumSize: const Size(0,50),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15,),


          ],
        )
    );
  }
  Future<void> performLogin() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty&&
        _mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty&&
        _cityIdTextController.text.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context: context,
      message: 'Enter required datah',
      error: true,
    );
    return false;
  }

  Future<void> register() async{
    bool status= await AuthApiController().register(context, user: user);
    if(status) Navigator.pushReplacementNamed(context, '/activate_screen');
  }

  User get user{
    User user = User();
    user.name=_nameTextController.text;
    user.mobile=_mobileTextController.text;
    user.password=_passwordTextController.text;
    user.gender=_gender;
    user.cityId=int.parse(_cityIdTextController.text);
    return user;


  }




}


