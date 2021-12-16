
import 'package:elancer_second_proj/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:3),(){
      String route=SharedPrefController().loggedIn?'/main_screen':'/login_screen';
      //Navigator.pushReplacementNamed(context, '/out_boarding_screen');
      Navigator.pushReplacementNamed(context, route);


    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
          children: [
            SizedBox(height: 20,),
        const Text('Frniture App',style:TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 25,
             color:Colors.black,
           )),
            Container(
              height: 591,
              width: double.infinity,
              padding:EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child:Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Image.asset('images/1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        )
     //Container(
     //    alignment: AlignmentDirectional.topStart,
     //    decoration: BoxDecoration(
     //      gradient: LinearGradient(colors: [
     //        Colors.pink.shade50,
     //        Colors.pink.shade200,
     //      ],
     //      ),
     //      image: DecorationImage(
     //        image:  AssetImage('images/1.jpg'),
     //        fit:BoxFit.cover,

     //      ), ) ,
     //    child:const Text('Skin Care-APP',style:TextStyle(
     //      fontWeight: FontWeight.bold,
     //      fontSize: 25,
     //      color:Colors.black,
     //    ))
     //),



    );
  }
}
