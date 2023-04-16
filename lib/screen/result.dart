import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "It\'s done!",
        style: TextStyle(fontSize: 20.sp),
      ),
    );
  }
}
