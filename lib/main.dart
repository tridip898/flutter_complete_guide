import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/home_page.dart';
import 'package:flutter_complete_guide/screen/location_package/location_page.dart';
import 'package:sizer/sizer.dart';
void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_,orientation,deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}
