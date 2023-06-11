import 'package:flutter/material.dart';
import 'package:threat_intelligence_dashboard/util/constant.dart';
import 'package:threat_intelligence_dashboard/util/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}
class ButtonInfo {
  String title;
  IconData icon;
  ButtonInfo({ required this.title , required this.icon});
}
int _currentIndex = 0;
List<ButtonInfo> _buttonInfo = [
  ButtonInfo(title: "Home", icon: Icons.home),
  ButtonInfo(title: "Alerts", icon: Icons.notifications),
  ButtonInfo(title: "Setting", icon: Icons.settings),
  ButtonInfo(title: "Info", icon: Icons.info_outline),




];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Constant.kpadding),
        child: Column(
          children: [
            ListTile(
              title: Text("Menu", style: TextStyle(
                  color: Colors.white
              ),
              ),
              trailing: ResponsiveLayout.isComputer(context)? null : IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.close, color: Colors.white,)),


            ),
            ...List.generate(_buttonInfo.length, (index) => Column(
              children: [
                Container(
                  decoration: index == _currentIndex ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [Constant.redDark.withOpacity(0.9), Constant.orangeDark.withOpacity(0.9)])
                  ): null ,
                  child: ListTile(
                    title: Text(_buttonInfo[index].title,
                    style: TextStyle( color: Colors.white),),
                    leading: Padding(padding: const EdgeInsets.all(Constant.kpadding),
                    child: Icon(_buttonInfo[index].icon, color: Colors.white,),

                    ),
                    onTap: (){
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
                  ),
                ),
                Divider(color: Colors.white, thickness: 0.1,)

              ],
            ))
          ],
        ),
      ),
    )
    );
  }
}
