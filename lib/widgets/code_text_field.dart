import 'package:flutter/material.dart';

class CodeTextField extends StatelessWidget {
  CodeTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChange,

  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller,
      focusNode:focusNode,
      maxLength: 1,
      onChanged: onChange,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.black
      ),
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: border(),
        focusedBorder:border(borderColor: Colors.blue) ,
      ),

    );
  }

  OutlineInputBorder border({  Color borderColor=Colors.grey}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:BorderSide(
        width: 1,
        color: borderColor,
      ),
    );

  }

}