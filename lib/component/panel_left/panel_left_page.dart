import 'package:flutter/material.dart';
import 'package:threat_intelligence_dashboard/util/responsive_layout.dart';

import '../../util/constant.dart';
import '../search.dart';
class PanelLeftPage extends StatelessWidget {
  const  PanelLeftPage({super.key});

 
  

  

  @override
  Widget build(BuildContext context) {
     ApiData data = ApiData();
    if(ResponsiveLayout.isPhone(context))
    return  Container(
      child: SizedBox(
        height:MediaQuery.of(context).size.height* 0.3,
        width: MediaQuery.of(context).size.width* 0.4,
        child: 
       Column(
          children: [
            Text('>>> Summary:- ${data.summary}', style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),
            Text('>>> Score:- ${data.score}' ,style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),
            Text('>>> Verdict:- ${data.verdcit}',style: TextStyle(color: Colors.white),)
          ],
        )
      )
    );
    else
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,
      title: const Center(child: Text('Result' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),),
      body: Container(
      child: SizedBox(
        height:MediaQuery.of(context).size.height* 0.3,
        width: MediaQuery.of(context).size.width* 0.4,
        child: 
     Column(
          children: [
            Text('>>> Summary:- ${data.summary}', style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),
            Text('>>> Score:- ${data.score}' ,style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),
            Text('>>> Verdict:- ${data.verdcit}',style: TextStyle(color: Colors.white),)
          ],
        )
    )
    )
    );
  }
}
