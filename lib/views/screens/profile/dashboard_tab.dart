import 'package:flutter/material.dart';
import 'package:zicops/utils/colors.dart';

class DashboardTabScreen extends StatefulWidget{
  const DashboardTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardTabScreen();
  }

}

class _DashboardTabScreen extends State<DashboardTabScreen>{
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(color:secondaryColorDark, child: Text("Dashboard"),),);
  }

}