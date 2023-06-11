import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key, required this.phone, required this.tablet, required this.largeTablet, required this.computer}) : super(key: key);

  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;

  static final int phonehieght = 550 ;
  static final int tablethieght = 800 ;
  static final int largetablethieght = 1100 ;


  static bool isPhone(BuildContext context)=> MediaQuery.of(context).size.width < phonehieght;
  static bool isTablet(BuildContext context)=> MediaQuery.of(context).size.width< tablethieght && MediaQuery.of(context).size.width >= phonehieght ;
  static bool isLargeTablet(BuildContext context)=> MediaQuery.of(context).size.width< largetablethieght && MediaQuery.of(context).size.width >= tablethieght ;
  static bool isComputer(BuildContext context)=>  MediaQuery.of(context).size.width >= largetablethieght;



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint){
        if( constraint.maxWidth < phonehieght)
          {
            return phone;
          }
        if( constraint.maxWidth < tablethieght)
        {
          return tablet;
        }
        if( constraint.maxWidth < largetablethieght)
        {
          return largeTablet;
        }
        else
          {
            return computer;
          }
      },

    );
  }
}
