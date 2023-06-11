import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:threat_intelligence_dashboard/util/constant.dart';
import 'package:threat_intelligence_dashboard/util/widget_tree.dart';
import 'screen/home_page.dart';

void main() async{
 // WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Threat Intelligence Dashboard',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Constant.purpleDark,
        canvasColor: Constant.purpleLight,

      ),
      home: const SafeArea(child: WidgetTree()),
    );
  }
}

