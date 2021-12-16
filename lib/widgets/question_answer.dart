import 'package:elancer_second_proj/models/Faqs.dart';
import 'package:flutter/material.dart';

class QuestionAnswer extends StatefulWidget {
   QuestionAnswer({Key? key,
  required this.list}) : super(key: key);

  final List<Faqs> list;
  @override
  _QuestionAnswerState createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical:5),
        itemCount: widget.list.length,

        itemBuilder: (context, index) {
          return ListTile(title: Text(widget.list[index].questionEn),
          subtitle:
            Text(widget.list[index].answerEn),
            leading: Icon(Icons.question_answer),
          );
        },);
  }
}
