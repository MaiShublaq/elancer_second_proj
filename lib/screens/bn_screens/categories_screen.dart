
import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/get/home_getx_controller.dart';
import 'package:elancer_second_proj/models/category.dart';
import 'package:elancer_second_proj/models/sub_categories.dart';
import 'package:elancer_second_proj/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  late Future<List<Category>> _future;
  List<Category> _categories = <Category>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future=CspApiController().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title:const Text('Categories',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
          centerTitle: true,
          elevation: 0,
          backgroundColor:const  Color(0xFFFFDA1A),
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 22
        ),),
      body:
        FutureBuilder<List<Category>>(
        future: _future,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty){
          _categories=snapshot.data??[];
          return GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 7),
          itemCount: _categories.length,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 1,
           childAspectRatio: 1.5,
           crossAxisSpacing: 8,
           mainAxisSpacing: 8,
           ), itemBuilder: (context, index) {
           return InkWell(
           onTap: (){
           Navigator.push(context, MaterialPageRoute(
             builder: (BuildContext context)=> SubCategoriesScreen(
                 categoryId: _categories[index].id,
                  subNum: _categories[index].subCategoriesCount,
             )
           ));
           },
           child: Container(
           height: 300,
           width: 300,
           decoration: const BoxDecoration(
             shape: BoxShape.rectangle,
             borderRadius: BorderRadius.all(Radius.circular(40)),),
           child:Card(
           elevation: 4,
           shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
           ),
           child:Stack(
           children:[
           Image.network(_categories[index].imageUrl,
           fit:BoxFit.fill ,
           height: double.infinity,
           width: double.infinity,
           ),
           Align(
           alignment: AlignmentDirectional.bottomCenter,
           child: Container(
           height: 19,
           padding: const EdgeInsets.symmetric(horizontal: 2),
           color: Colors.white54,
           child:  Align(
           alignment: AlignmentDirectional.center,
           child: Text(_categories[index].nameEn,
           overflow: TextOverflow.clip
           ,style: const TextStyle(
           color:Colors.black,
           fontSize: 17,
           fontWeight: FontWeight.bold,
           ),),
           ),


           ),


           ),],
           ),)
           ),
           );

           },);

           }

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
        },


    )

    ,

     );

       }
}
