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
String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
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
    }if (value.contains("1h13")) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("힌트"),
            content: Text("오늘은 10월 19일 Friday 입니다. Monday = 13 / Tuesday = 20 / Wednesday = 23 .....Friday = “6”"),
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
                        content: Text("1906"),
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
    }if (value.contains("1r25")) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("힌트"),
            content: Text("팜플렛에서 설명을 자세히 읽어보신 뒤, 마르가리타 공주의 초상화 옆에 걸려있는 “설명액자”를 바르게 옮겨 걸어주세요!"),
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
                        content: Text("뭐뭐뭐"),
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
    }if (value.contains("1s27")) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("힌트"),
            content: Text("마르가리타 공주는 머리를 쓰다듬어 주는 것을 좋아한다고 해요. 머리를 ‘천천히’ 쓰다듬어주세요!"),
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
                        content: Text("어떤 그림의 머리를 쓰다듬어주세요"),
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
    }if (value.contains("1j38")) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("힌트"),
            content: Text("나무블럭을 거꾸로 꽂이 않았는지 확인해주세요. 칼날의 방향은 아래로 향해야 합니다.불빛은 게임진행과 무관한 요소입니다. 팜플렛과 초록색천을 이용해 나무조각과 석상의 방향을 맞게 맞춰주세요."),
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
                        content: Text("마르스/창과방패 - 세네카/책 - 비너스/미의여신 - 아그리파/신전건설 - 브루투스/단검 - 줄리앙/25세"),
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
        title: Text("escape9"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formatTime(_remainingTime),
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
  ],
),
            SizedBox(height: 0),
            if (_inputVisible)
              TextField(textAlign: TextAlign.center,
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
            FloatingActionButton(
              child: Icon(Icons.chat),
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