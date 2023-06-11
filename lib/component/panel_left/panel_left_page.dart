import 'package:flutter/material.dart';
import 'package:threat_intelligence_dashboard/util/responsive_layout.dart';

import '../search.dart';

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({super.key});

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {

  @override
  Widget build(BuildContext context) {
    if(ResponsiveLayout.isPhone(context))
    return  Container(

    );
    else
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,
      title: const Center(child: Text('Result' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),),
      body: Center(child: Text('heelorr'),),
    );
  }
}