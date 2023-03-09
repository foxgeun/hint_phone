import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebViewController? _webViewController;
  int _counter = 0;
  String _output = "";
  bool _timerStarted = false;
  int _remainingTime = 3600; // 초 단위
  bool _startButtonVisible = true; // 시작 버튼 표시 여부// 초 단위



  void _updateOutput(String key) {
    setState(() {
      if (_counter >= 3) {
        _output = "힌트를 모두 사용하셨습니다.";
        return;
      }
      switch (key) {
        case "1":
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("경비원의 옷에서 단서를 찾아보세요 !"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("확인"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          _counter++;
          break;

        case "1a15":
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("경비원의 옷에서 단서를 찾아보세요 !"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("확인"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          _counter++;
          break;
        case "1h13":
          _output =
              "오늘은 10월 19일 Friday 입니다. Monday = 13 / Tuesday = 20 / Wednesday = 23 .....Friday = “6”";
          _counter++;
          break;

        case "reset":
          _counter = 0;
          _output = "힌트가 필요하실 때에는 힌트코드를 입력해주세요.";
          break;

        default:
          _output = "힌트코드를 다시 입력해주세요.";
          break;
      }
    });
  }

  void _startTimer() {
  if (_timerStarted) {
    return;
  }

  String hintCode = "";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("힌트코드를 입력하세요."),
        content: TextField(
          onChanged: (value) {
            hintCode = value;
          },
        ),
        actions: <Widget>[
          TextButton(
            child: Text("확인"),
            onPressed: () {
              _updateOutput(hintCode);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  
  Timer.periodic(Duration(seconds: 1), (timer) {
    setState(() {
      if (_remainingTime > 0) {
        _remainingTime--;
      } else {
        timer.cancel();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("타임오버!"),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ); // 이 부분 인덱스 확인 후 추가해주세요.
      }
    });
  });
  setState(() {
    _timerStarted = true;
    _startButtonVisible = false; // 시작 버튼 숨기기
  });
}


  void resetTimer() {
    setState(() {
      _remainingTime = 3600;
    });
  }

  void _showInputDialog() {
    if (_timerStarted) {
      return;
    }

    String hintCode = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("힌트코드를 입력하세요."),
          content: TextField(
            onChanged: (value) {
              hintCode = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text("확인"),
              onPressed: () {
                _updateOutput(hintCode);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    setState(() {
      _timerStarted = true;
    });
  }
void _incrementCounter() {
    _counter++;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("타이머"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_remainingTime',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _startButtonVisible,
              child: ElevatedButton(
                child: Text("시작"),
                onPressed: () {
                  _startTimer();
                  _showInputDialog(); // 입력창 띄우기
                },
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("초기화"),
              onPressed: () {
                resetTimer();
              },
            ),
            SizedBox(height: 30),
            Expanded(
              child: WebView(
                initialUrl: 'https://escape9.channel.io/lounge',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _webViewController = webViewController;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}