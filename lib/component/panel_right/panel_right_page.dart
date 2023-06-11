import 'package:flutter/material.dart';

import '../../util/responsive_layout.dart';

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({super.key});
   

  @override
  State<PanelRightPage> createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  @override
  Widget build(BuildContext context) {
    if(ResponsiveLayout.isPhone(context))
    return  Container(
      
    );
    else
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
      title: Center(child: Text('Last Site Checked', style: TextStyle(fontWeight: FontWeight.bold,),),),),
    );
  }
}