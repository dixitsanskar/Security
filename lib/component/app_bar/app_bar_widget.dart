import 'package:flutter/material.dart';
import 'package:threat_intelligence_dashboard/util/constant.dart';
import 'package:threat_intelligence_dashboard/util/responsive_layout.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constant.purpleLight,
      child: Row(
        children: [
          if(ResponsiveLayout.isComputer(context))
          Container(
            margin: EdgeInsets.all(Constant.kpadding),
            height: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0) , 
                  spreadRadius: 1     ,
                  blurRadius: 10,          )
              ],
              shape: BoxShape.circle
            ),
            child: CircleAvatar(backgroundColor: Colors.pink,radius: 30,),
          )
          else
          IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.menu),
          iconSize: 30,
          color: Colors.white,
          )
        ],
      ),
    );
  }
}