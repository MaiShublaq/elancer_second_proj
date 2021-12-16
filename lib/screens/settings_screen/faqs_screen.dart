import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/models/Faqs.dart';
import 'package:elancer_second_proj/widgets/question_answer.dart';
import 'package:flutter/material.dart';
class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  _FaqsScreenState createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  late Future<List<Faqs>> _future;
  List<Faqs> _faqs = <Faqs>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController( length:1,vsync: this);
    _future = CspApiController().getFaqs();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(title:Text('FAQs'),
      backgroundColor: Color(0xFFFFDA1A),
      centerTitle: true,
      bottom: TabBar(
        indicatorColor: Colors.lightBlueAccent,
labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
        controller: _tabController,
        tabs: [
          Tab(text: 'Questions & Answers',),
        ],


      ),
      ),
      body: FutureBuilder<List<Faqs>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _faqs = snapshot.data ?? [];
           return getTabBarView();
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
        })

    );
  }


  Widget getTabBarView(){
    return TabBarView(


        children: [
        QuestionAnswer(list: _faqs,),
    ],

    controller: _tabController,);
  }

}
