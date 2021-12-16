import 'package:elancer_second_proj/models/category.dart';
import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  CategoryItem({
    Key? key,
     required this.category,
  }) : super(key: key);
  final List<Category> category;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/categories_screen');
              },
              child:
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Stack(
                  children:[
                    Container(
                      width:250,
                      child: Image.network(category[index].imageUrl,
                        fit:BoxFit.cover ,
                        //height: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                          width:200,
                          padding: const EdgeInsets.symmetric(horizontal: 2,vertical:2),
                          //color: Colors.white54,
                          child:  Text(category[index].nameEn,
                            overflow: TextOverflow.clip
                            ,style: TextStyle(
                              color:Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),)
                      ),
                    ),],
                ),
              ),
            );
          }),
    );
  }
}
