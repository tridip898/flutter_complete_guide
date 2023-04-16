import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Question extends StatelessWidget {
  final String questionText;
  const Question({Key? key, required this.questionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText.toString(),
      style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
    );
  }
}
