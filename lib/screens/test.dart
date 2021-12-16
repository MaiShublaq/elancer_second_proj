
//import 'package:elancer_second_proj/api/controllers/home_api_controller.dart';
//import 'package:elancer_second_proj/models/slider.dart';
//import 'package:flutter/material.dart';
//
//class Test extends StatefulWidget {
//  const Test({Key? key}) : super(key: key);
//
//  @override
//  _TestState createState() => _TestState();
//}
//
//class _TestState extends State<Test> {
//  late Future<List<SliderImage>> _future;
//  List<SliderImage> _categories = <SliderImage>[];
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _future = HomeApiController().getSlider();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: const Text('Categories'),
//
//      ),
//      body: FutureBuilder<List<SliderImage>>(
//        future: _future,
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.waiting) {
//            return const Center(child: CircularProgressIndicator());
//          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//            _categories = snapshot.data ?? [];
//            return GridView.builder(
//              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//              itemCount: _categories.length,
//              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//                mainAxisSpacing: 10,
//                crossAxisSpacing: 10,
//              ),
//              itemBuilder: (context, index) {
//                return Card(
//                  elevation: 4,
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(10),
//                  ),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      CircleAvatar(
//                        radius: 40,
//                        backgroundImage: NetworkImage(_categories[index].imageUrl),
//                      ),
//                      const SizedBox(height: 15),
//                      Text(
//                        _categories[index].imageUrl,
//                        style: const TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      )
//                    ],
//                  ),
//                );
//              },
//            );
//          } else {
//            return Center(
//              child: Column(
//                children: const [
//                  Icon(Icons.warning, size: 80),
//                  Text(
//                    'NO DATA',
//                    style: TextStyle(
//                      color: Colors.grey,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 24,
//                    ),
//                  )
//                ],
//              ),
//            );
//          }
//        },
//      ),
//    );
//  }
//
//
//}
//