import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/helpers/helpers.dart';
import 'package:elancer_second_proj/models/city.dart';
import 'package:elancer_second_proj/models/user.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _cityIdTextController;


  late Future<List<City>> _future;

  String _gender='M';
  int dropdownValue=1 ;
  List<City> _cities = <City>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController=TextEditingController();
    _mobileTextController=TextEditingController();
    _passwordTextController=TextEditingController() ;
    _cityIdTextController=TextEditingController() ;


    _future = AuthApiController().getCities();


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
      appBar:AppBar(
        backgroundColor: Color(0xFFFFDA1A),
        title:const Text('Edit Profile'),
        centerTitle: true,
      ),
      body:  FutureBuilder<List<City>>(
    future: _future,
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
    _cities = snapshot.data ?? [];
    return ListView(
    physics: const NeverScrollableScrollPhysics(),
    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
    children: [
    const Text('Edit your account ...',style:
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
    const SizedBox(height:15),
    AppTextField(
    controller: _nameTextController,
    prefixIcon: Icons.person,
    hint: 'FullName',
      prefixColor: Color(0xFFFFDA1A),
    ),
    const SizedBox(height:10),

    DropdownButton<int>(
    isExpanded: true,
    value: dropdownValue,
    elevation: 16,
     hint:const Text('Select City'),

    onChanged: (int? newValue) {
    print(dropdownValue);
    if(newValue!=null)
    setState(() {
    dropdownValue = newValue;
    });

    },
    items: _cities
        .map<DropdownMenuItem<int>>((City value) {
    return DropdownMenuItem<int>(
    value: value.id,
    child: Text(value.nameEn),
    );
    }).toList(),
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
    onPressed: ()async=>await  performUpdate(),
    child:const Text('EDIT'),
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
    );}

    else {
    return Center(
    child: Column(
    children: const [
    Icon(Icons.warning, size: 80),
    Text(
    'NO DATA',
    style: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    ),
    )
    ],
    ),
    );
    }

    }

    ));
  }


  Future<void> performUpdate() async {
    if (checkData()) {
      await update();
    }
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context: context,
      message: 'Enter required datah',
      error: true,
    );
    return false;
  }

  Future<void> update() async{
    bool status= await AuthApiController().updateprofile(context, user: user);
    print(status);
    if(status) Navigator.pop(context );
  }

  User get user{
    User user = User();
    user.name=_nameTextController.text;
    user.gender=_gender;
    user.cityId=dropdownValue;
    return user;


  }

}
