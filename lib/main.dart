import 'package:camera_quiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'dart:async';
import './quiz.dart';
import './result.dart';

void main() => runApp(FirstPage());

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HomePage",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '石川高専クイズ！',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
            Text(
              '全問正解してカメラを使おう！',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                child: Text("スタート"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp()
                    )
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. 一年生の時になかった授業は?',
      'answers': [
        {'text': '基礎英語', 'score': 0},
        {'text': '基礎数学A', 'score': 0},
        {'text': '回路基礎', 'score': 10},
        {'text': '基礎数学B', 'score': 0},
      ],
    },
    {
      'questionText': 'Q2. 3年生以下で赤点は何点未満?',
      'answers': [
        {'text': '30点', 'score': 0},
        {'text': '40点', 'score': 0},
        {'text': '50点', 'score': 10},
        {'text': '60点', 'score': 0},
      ],
    },
    {
      'questionText': ' Q3. 二年生のプロ基礎で習った言語は？',
      'answers': [
        {'text': 'Ruby', 'score': 0},
        {'text': 'C', 'score': 10},
        {'text': 'Java', 'score': 0},
        {'text': 'Python', 'score': 0},
      ],
    },
    {
      'questionText': 'Q4. 先生の名前と別名の組み合わせが正しいのは？',
      'answers': [
        {'text': '長岡先生: 神', 'score': 10},
        {'text': '金寺先生: 仏', 'score': 10},
        {'text': '小村先生: 鬼', 'score': 10},
      ],
    },
    {
      'questionText': 'Q5. 石川高専は昭和40年設立である．',
      'answers': [
        {'text': '◯', 'score': 10},
        {'text': '×', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FirstPage()
      )
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('石川高専クイズ！'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}