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

  void _incrementCounter() {
    // 아무런 작업도 수행하지 않음
  }

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
          );
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      _remainingTime = 3600;
    });
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
        ElevatedButton(
          child: Text("시작"),
          onPressed: () {
            _startTimer();
          },
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
            initialUrl:
                'https://escape9.channel.io/user-chats/64098240d7bbfeb6e780?mode=direct',
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