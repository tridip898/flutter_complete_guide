import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnswerPage extends StatelessWidget {
  final String ansText;
  final void Function()? onPressed;
  AnswerPage({Key? key, required this.ansText, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.h),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          ansText,
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        height: 5.h,
        minWidth: 30.w,
      ),
    );
  }
}
