import 'package:elancer_second_proj/api/controllers/auth_api_controller.dart';
import 'package:elancer_second_proj/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({Key? key,
  required this.title,
  required this.icon,
  required this.navigator}) : super(key: key);

  final String title;
  final IconData icon;
  final String navigator;

  @override
  _ListTileWidgetState createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {

  SharedPrefController _sharedPrefController=SharedPrefController();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      leading: Icon(widget.icon),
      onTap: widget.navigator!='logout'?()=>Navigator.pushNamed(context,widget.navigator)
          :()async {
        bool status = await AuthApiController().logout();

        if (status){
          Navigator.pushReplacementNamed(context, widget.navigator);
        }
      },
    );
  }
}
