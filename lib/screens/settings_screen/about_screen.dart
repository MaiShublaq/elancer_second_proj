import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'),
      centerTitle: true,
      backgroundColor: Color(0xFFFFDA1A),),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 110),
        children:[
          CircleAvatar(
            backgroundImage: AssetImage('images/5.jpg'),
            radius: 100,
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook,
              color: Color(0xFFFFDA1A),),
              Text(' Facebook : Frniture Store '),
            ],
          ),
          SizedBox( height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(Icons.camera,color: Color(0xFFFFDA1A),),
              Text(' Instgram : Frniture_Store '),
            ],
          ),
          SizedBox(height: 10,),
          Center(child: Text('Mai Shublaq-Elancer'))




        ]
      ),
    );
  }
}
