
import 'package:elancer_second_proj/get/favorite_getx_controller.dart';
import 'package:elancer_second_proj/get/home_getx_controller.dart';
import 'package:elancer_second_proj/models/category.dart';
import 'package:elancer_second_proj/widgets/categories_item.dart';
import 'package:elancer_second_proj/widgets/product_item.dart';
import 'package:elancer_second_proj/widgets/slider_image.dart';
import 'package:elancer_second_proj/widgets/view_all_categories.dart';
import 'package:elancer_second_proj/widgets/view_all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


enum ProductType{latest,famous}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String image1='images/2.jpg';
  String image2='images/3.jpg';
  String image3='images/4.jpg';
  HomeGetxController _homeGetxController=Get.put(HomeGetxController());
  FavoriteGetxController _favoriteGetXController=
      Get.put(FavoriteGetxController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),
        centerTitle: true,
        backgroundColor:const  Color(0xFFFFDA1A),
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),      ),
        body:
      //  Container(
      //    decoration: const BoxDecoration(
      //      color: Colors.white,
      //    ),
          //child:
        GetBuilder<HomeGetxController>(
          builder: (controller) {
            if (controller.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (controller.homeResponse != null) {
             return Container(
                     decoration: const BoxDecoration(
                       color: Colors.white,
                     ),
                     child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  children: [
                    const SizedBox(height: 4,),
                    SliderImageWidget(slider: controller.homeResponse!.slider,),
                    view_all_categories(title: 'Categories', navigator: '/categories_screen',),
                    CategoryItem(category: controller.homeResponse!.categories),
                     const SizedBox(height: 10,),
                      view_all(title: 'Latest Products', navigator: '/products_screen',
                          list:controller.homeResponse!.latestProducts),
                     ProductItem(products: controller.homeResponse!.latestProducts,
                     ),
                      view_all(title: 'Famous Products', navigator: '/products_screen',
                          list:controller.homeResponse!.famousProducts,),
                     ProductItem(products: controller.homeResponse!.famousProducts,
                     )
                  ])
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

          })
    );
    }
  }



