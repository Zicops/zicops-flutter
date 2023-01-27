import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationScreen();
  }

}

class _NotificationScreen extends State<NotificationScreen>{
  @override
  Widget build(BuildContext context) {
    return Text("Coming Soon");
  }

}