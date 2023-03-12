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
  bool _startButtonVisible = true; // 시작 버튼 표시 여부
  bool _inputVisible = false;

void _checkHint(String value) {
    if (value.contains("1a15")) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("힌트"),
            content: Text("경비원 옷에서 힌트를 찾아보세요."),
            actions: <Widget>[
              ElevatedButton(
                child: Text("정답 확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("힌트"),
                        content: Text("가슴 주머니에 열쇠를 찾아보세요."),
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
                },
              ),
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
  }

  void _startTimer() {
  if (_timerStarted) {
    return;
  }


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

    setState(() {
      _timerStarted = true;
      _startButtonVisible = false;
      _inputVisible = true;
    });
  }
  void resetTimer() {
    setState(() {
      _remainingTime = 3600;
    });
  }

  void _navigateToChat() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage()),
    );
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
              style: Theme.of(context).textTheme.headline1!,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_startButtonVisible)
                  ElevatedButton(
                    child: Text("시작"),
                    onPressed: () {
                      _startTimer();
                    },
                  ),
                SizedBox(width: 30),
                ElevatedButton(
                  child: Text("초기화"),
                  onPressed: () {
                    resetTimer();
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            if (_inputVisible)
              TextField(
                decoration: InputDecoration(
                  hintText: '여기에 입력해주세요',
                ),
                onChanged: (value) {
                  setState(() {
                    _output = value;
                  });
                  _checkHint(value);
                },
              ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("채팅"),
              onPressed: () {
                _navigateToChat();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("채팅"),
),
body: WebView(
initialUrl: 'https://escape9.channel.io/lounge',

javascriptMode: JavascriptMode.unrestricted,
),
);
}
}