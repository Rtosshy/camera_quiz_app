import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 50) {
      resultText = '全問正解！おめでとう！';
      print(resultScore);
    } else if (resultScore >= 40) {
      resultText = '4問正解！惜しい！';
      print(resultScore);
    } else if (resultScore >= 30) {
      resultText = '3問正解！もう少し！';
    } else if (resultScore >= 20) {
      resultText = '2問正解！まだまだだね〜';
    } else {
      resultText = '1問正解！新入生かな?';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            child: Text(
              '最初に戻る',
            ), //Text
            onPressed: () {
              resetHandler();
            },
          ), //FlatButton
          if (resultScore >= 50)
            ElevatedButton(
                onPressed: () async {
                  WidgetsFlutterBinding.ensureInitialized();

                  // Obtain a list of the available cameras on the device.
                  final cameras = await availableCameras();

                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras.first;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TakePictureScreen(
                              camera: firstCamera,
                            )),
                  );
                },
                child: Text(
                  '記念撮影する',
                ))
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
