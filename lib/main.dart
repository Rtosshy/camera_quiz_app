import 'package:camera_quiz_app/first.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path/path.dart';

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
