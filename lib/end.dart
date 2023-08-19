import 'package:flutter/material.dart';
import 'package:quiz_app/vars&funs.dart';
// import 'package:zaza/main.dart';


class endPage extends StatefulWidget {
  @override
  State<endPage> createState() => _endPageState();
}


class _endPageState extends State<endPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        backgroundColor: barColor,
        title: Text('Quiz App'),
        centerTitle: true,
      ),
      body:
        const Center(
          child: Column(
            children: [
              // if()
              Text("END", style: TextStyle(fontSize: 20, color: Colors.white),),
              // Text("$correctAnswers", style: TextStyle(color: Colors.white),),
              // Text("$choosenAnswers", style: TextStyle(color: Colors.white),),
            ]
          )
        )
    );
  }
}
