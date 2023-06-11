import 'package:flutter/material.dart';
import 'package:threat_intelligence_dashboard/component/drawer_page.dart';
import 'package:threat_intelligence_dashboard/component/panel_left/panel_left_page.dart';
import 'package:threat_intelligence_dashboard/screen/home_page.dart';
import 'package:threat_intelligence_dashboard/util/responsive_layout.dart';

import '../component/app_bar/app_bar_widget.dart';
import '../component/panel_right/panel_right_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AppBarWidget(), preferredSize: Size(double.infinity, 100))
          ,
      body: ResponsiveLayout(
        phone: HomePage(),
        tablet: Row(
          children: [
            Expanded(child: HomePage(),),
           
          ],
        ),
        largeTablet:  Row(
          children: [
            Expanded(child: HomePage())
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage(),flex: 1,),
            Expanded(child: HomePage(),flex: 4,),
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}
