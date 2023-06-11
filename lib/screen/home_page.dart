import 'package:flutter/material.dart';
import 'package:threat_intelligence_dashboard/component/panel_left/panel_left_page.dart';
import 'package:threat_intelligence_dashboard/component/panel_right/panel_right_page.dart';
import 'package:threat_intelligence_dashboard/util/responsive_layout.dart';

import '../component/search.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  ResponsiveLayout(
         phone: SingleChildScrollView(child: Column(
        children: [
        SizedBox(height: 30,),
          SearchBox(),
           PanelRightPage(),
             PanelLeftPage()
        ],
      ),
      ),
         tablet: Column(
        children: [
         Expanded(child: SearchBox(),flex: 1,),
          Expanded(child: Row(children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelRightPage())
          ],),flex: 2,
 ) 
        ],
      ),
         largeTablet: 
         Column(
        children: [
         Expanded(child: SearchBox(),flex: 1,),
          Expanded(child: Row(children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelRightPage())
          ],),flex: 2,
 ) 
        ],
      ),
         computer: Column(
        children: [
         Expanded(child: SearchBox(),flex: 1,),
          Expanded(child: Row(children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelRightPage())
          ],),flex: 2,
 ) 
        ],
      ),

)
    );
  }
}
