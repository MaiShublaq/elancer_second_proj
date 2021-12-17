import 'package:elancer_second_proj/widgets/listTile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  List<String> title =['Language','Profile',
  //  'Edit Mobile',
    'Change Password','FAQs','Contact us','About','Logout'];
  List<IconData> icons=[Icons.language,Icons.person,
    //Icons.edit,
    Icons.password,Icons.question_answer,Icons.call,Icons.info,Icons.logout,];
  List<String> navigator=['/language_screen','/profile_screen',
  //  '/edit_screen',
    '/change_password_screen','/faqs_screen','/contact_us_screen','/about_screen','/login_screen',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Settings'),
      backgroundColor: Color(0xFFFFDA1A),
      centerTitle: true,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body:ListView.separated(
          itemBuilder: (context,index){
           return ListTileWidget(title: title[index],
                icon: icons[index],
                navigator: navigator[index]);
          },
          separatorBuilder:(context, index) {
            return Divider();
          } ,
          itemCount: 7,
      padding: EdgeInsets.all(3),)


    );
  }
}
