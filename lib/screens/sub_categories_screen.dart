
import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/models/sub_categories.dart';
import 'package:elancer_second_proj/screens/tabs/products_screen.dart';
import 'package:elancer_second_proj/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key,
  required this.categoryId,
  required this.subNum}) : super(key: key);
  final int categoryId;
  final int subNum;
  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen>
    with SingleTickerProviderStateMixin {

  //SearchGetxController _searchGetxController = Get.put(SearchGetxController());

  late TabController _tabController;
  late TextEditingController _searchtextController;

  late Future<List<SubCategories>> _future;
  List<SubCategories> _categories = <SubCategories>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController( length:widget.subNum,vsync: this);
    _searchtextController = TextEditingController();
    _future = CspApiController().getSubCategories(id: widget.categoryId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _searchtextController.dispose;
    super.dispose();
  }

  //Future<List<SubCategories>> subCategories=CspApiController().getSubCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        body: FutureBuilder<List<SubCategories>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              _categories = snapshot.data ?? [];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    AppTextField(
                      controller: _searchtextController,
                      prefixIcon: Icons.search,
                      hint: 'Search for productsss',
                      color: Color(0xFFFFDA1A),
                      radius: 30,
                      prefixColor: Color(0xFFFFDA1A),
                      onChange: (value) {
                        //_searchGetxController.changeSearchText(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                        isScrollable: true,
                        labelColor: Color(0xFFFFDA1A),
                        indicatorColor: Colors.pink.shade900,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        controller: _tabController,
                        tabs:
                       // [
                          tabMaker(_categories)

                          // Tab(text: 'Cleanser'),
                          // Tab(text: 'Moisturizer'),
                          // Tab(text: 'Eye Cream'),
                          // Tab(text: 'Sunscreen'),
                        //]
                    ),
                    Expanded(
                      child: TabBarView(
                        children: //[
                         tabBarView(_categories)
                       // ]
                      ,
                        controller: _tabController,
                      ),
                    )
                  ],
                ),
              );
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
    );
  }

//  tabMaker(List<SubCategories> listSub) {
//    for (var i = 0; i < listSub.length; i++) {
//      return Tab(text: listSub[i].nameEn,);
//    }
//  }


  List<Tab> tabMaker(List<SubCategories> listSub){  //return type is specified

    List<Tab> tabs = []; //create an empty list of Tab
    for (var i = 0; i < listSub.length; i++) {
      tabs.add(Tab(text: listSub[i].nameEn)); //add your tabs to the list
    }
    return tabs; //return the list
  }

 List<Widget> tabBarView(List<SubCategories> listSub) {
    List<Widget> tabsView = [];
    for (var i = 0; i < listSub.length; i++) {
      tabsView.add( ProductScreen(subCategoryId: listSub[i].id,));
    }
    return tabsView;

  }
}