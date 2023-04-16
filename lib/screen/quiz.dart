import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'home_page.dart';

class QuizDart extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final void Function()? addAnswer;
  QuizDart({Key? key, required this.question, required this.addAnswer,required this.questionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Question(
          questionText: question[questionIndex]['questionText'].toString(),
        ),
        ...(question[questionIndex]['answer'] as List<String>).map((answer) {
          return AnswerPage(ansText: answer,onPressed: addAnswer,);
        }).toList()
        //font_awesome_flutter
        // Align(
        //   alignment: Alignment.center,
        //   child: Container(
        //       width: 50.w,
        //       decoration: BoxDecoration(
        //           color: Colors.pinkAccent,
        //           borderRadius: BorderRadius.circular(15)),
        //       padding:
        //           EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Sign in with ",
        //             style: TextStyle(
        //                 fontSize: 15.sp,
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //           Spacer(),
        //           FaIcon(
        //             FontAwesomeIcons.google,
        //             color: Colors.blue,
        //           )
        //         ],
        //       )),
        // ),
        //
        // SizedBox(height: 2.h,),
        // //animated text kit
        // Center(
        //   child: AnimatedTextKit(animatedTexts: [
        //     TyperAnimatedText('Type Writer Animated',
        //         speed: Duration(milliseconds: 300),
        //         textStyle: TextStyle(fontSize: 20.sp)
        //     ),
        //     ScaleAnimatedText('Scale Animated',duration: Duration(milliseconds: 600),textStyle: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700)),
        //     FadeAnimatedText('Fade animated text',duration: Duration(milliseconds: 600),textStyle: TextStyle(fontSize: 20.sp)),
        //     RotateAnimatedText('Rotate animated Text',textStyle: TextStyle(fontSize: 20.sp),duration: Duration(milliseconds: 400)),
        //     ColorizeAnimatedText('Colorize Animated', textStyle: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700), colors: [
        //       Colors.red,
        //       Colors.lightGreen
        //     ])
        //   ],
        //     totalRepeatCount: 4,
        //   ),
        // ),
        // SizedBox(height: 2.h,),
        //
        // //FlutterLogo
        // Center(
        //   child: const FlutterLogo(
        //     size: 150,
        //     style: FlutterLogoStyle.horizontal,
        //     curve: Curves.bounceInOut,
        //     duration: Duration(milliseconds: 1000),
        //   ),
        // ),
        //
        // //physical model
        // Center(
        //   child: PhysicalModel(
        //     child: Container(
        //       height: 120,
        //       width: 120,
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(20)
        //       ),
        //       alignment: Alignment.center,
        //       child: FaIcon(FontAwesomeIcons.amazon,size: 50,color: Colors.blue,),
        //     ),
        //     color: Colors.grey,
        //     elevation: 10,
        //     shadowColor: Colors.grey,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        // )
      ],
    );
  }
}
