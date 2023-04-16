import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/answer.dart';
import 'package:flutter_complete_guide/screen/question.dart';
import 'package:flutter_complete_guide/screen/result.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'quiz.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _question = [
    {
      'questionText': "What is your favorite color?",
      'answer': ['Black', 'Red', 'Green', 'Yellow']
    },
    {
      'questionText': 'What is your favorite Animal?',
      'answer': ['Tiger', 'Lion', 'Elephant', 'Panda']
    },
    {
      'questionText': 'What is your favorite Place?',
      'answer': ['Black', 'Red', 'Green', 'Yellow']
    },
    {
      'questionText': 'What is your favorite Language?',
      'answer': ['Black', 'Red', 'Green', 'Yellow']
    },
  ];

  var _questionIndex = 0;

  var _totalScore=0;
  void _addAnswer() {
    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < _question.length) {
      print("We have more question!");
    } else {
      print("No more question!");
    }
    print("Select $_questionIndex");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              "AppBar",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            leading: Icon(
              Icons.menu,
              color: Colors.white,
              size: 3.5.h,
            ),
            actions: [
              Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 3.5.h,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.history,
                color: Colors.white,
                size: 3.5.h,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: _questionIndex < _question.length
                ? QuizDart(
                    addAnswer: _addAnswer,
                    question: _question,
                    questionIndex: _questionIndex,
                  )
                : Result()
          )),
    );
  }
}
