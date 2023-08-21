import 'package:flutter/material.dart';
import 'package:quiz_app/vars&funs.dart';

// The Return Of Score and Wrong Answers Function
var returnOfScoreAndWrongAnswersFunction = calculateScore(getCorrectAnswers());

// Split the returned into the Score and Wring Answers array
var score = returnOfScoreAndWrongAnswersFunction[0];
var arrayForWrongAnswersIndexes = returnOfScoreAndWrongAnswersFunction[1];

var show = true;

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
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: barColor,
                child: Container(
                  width: 400,
                  height: 280,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.hail, size: 100, color: Colors.white),
                      const SizedBox(height: 10),
                      RichText(
                          text: TextSpan(
                              text: 'Grade : ',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                              children: [
                            TextSpan(
                                text: "${(score / 10 * 100).toString()}%",
                                style:
                                    TextStyle(color: orangeOne, fontSize: 20))
                          ])),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                            text: 'Congratulations : ',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: name.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: orangeOne,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        ' Thank you for using our app😇😘 ', // don't touch my Emoji
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'share with us : ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(Icons.facebook, size: 25, color: orangeOne),
                          const SizedBox(width: 3),
                          Icon(Icons.phone, size: 25, color: orangeOne),
                          const SizedBox(width: 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                  visible: score < 10 ? true : false,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(orangeOne)),
                      child: Text(
                        show
                            ? "Hide wrong answered Questions"
                            : "Show wrong answered Questions",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ))),
              const SizedBox(height: 10),
              Expanded(
                child: Visibility(
                  visible: show,
                  child: ListView.builder(
                    itemCount: arrayForWrongAnswersIndexes
                        .length, // Limit the indexing
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Card(
                          color: orangeOne,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                questionsss[arrayForWrongAnswersIndexes[index]]
                                    ['question'],
                                overflow: TextOverflow.clip, // ellipsis
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: barColor,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Text(
                                  questionsss[
                                          arrayForWrongAnswersIndexes[index]]
                                      ['correctAnswer'],
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
              )
            ])));
  }
}
