import 'package:flutter/material.dart';

class test extends StatelessWidget {

  int a = 10;
  List<Map> lm = [
    {
      "sad": [
        "🥰🥰😜😜😜🤗🤗🤗",
        "🤢🤢🤢🤮🤮🤮",
        "😩🥺😢😕🙁",
        "👨‍🍳 👩‍🎓 🧑‍🎓 👨‍🎓 👩‍🎤"
      ]
    },
    {
      "happy": [
        "😆😆😋😋😊😊😀",
        "😃😃😄😄😁😁😁😉😉",
        "😆😆😹😹😂😂😂",
        "😔😔☹😞😞😞😭😭",
      ]
    },
    {
      "love": [
        "💘💓💞💋💋❣️❣️🥰🥰",
        "😍😍😘😘‍❤💋‍👨👩‍❤‍👨💞💞",
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: ElevatedButton(onPressed: () {
        print("${lm[0]["sad"][0]}");
        print("${lm[0]["sad"][1]}");
        print("${lm[1]["happy"][0]}");
        print("${lm[2]["love"][1]}");
      }, child: Text("hear"))),
    );
  }
}
