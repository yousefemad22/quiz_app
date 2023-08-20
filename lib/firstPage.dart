import 'package:flutter/material.dart';
import 'package:quiz_app/vars&funs.dart';
import 'package:quiz_app/end.dart';

String? checkedAnswer;

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();

}

// late  String? quen = questions[quizNum-1].question;


class _QuizPageState extends State<QuizPage> {


  void goToNextQuestion() {
    if (quizNum < questionsss.length - 1) {
      if(checkedAnswer != null){
        setState(() {
          quizNum++;
          // print(quizNum);
          choosenAnswers.add(checkedAnswer);
          checkedAnswer = null;
        });
      } else{
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('You must choose answer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              content: const Text('Think about it, if you choose any answer There is chance you might get it right : )', style: TextStyle(color: Colors.white),),
              backgroundColor: barColor,

              actions: [
                TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },child: Text('Close', style: TextStyle(color: orangeOne, fontWeight: FontWeight.bold),),
                ),
              ],
            );
          },
        );
      }
    } else {
      quizNum = 0;
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => endPage())
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 35.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: Text(
              "Quiz : ${quizNum+1}",
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,color: Colors.white
              ),
            ),
          ),

          const Divider(
            thickness: 2.0,color: Colors.white,
          ),

          const SizedBox(height: 30.0),
          Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              questionsss[quizNum]['question'],
              overflow: TextOverflow.clip, // ellipsis
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 30.0),
          ChoiceButton(label: 'A', text: questionsss[quizNum]['answers'][0], checked: false),
          ChoiceButton(label: 'B', text: questionsss[quizNum]['answers'][1], checked: false),
          ChoiceButton(label: 'C', text: questionsss[quizNum]['answers'][2], checked: false),
          ChoiceButton(label: 'D', text: questionsss[quizNum]['answers'][3], checked: false),

          const SizedBox(height: 30.0),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),

            child: MaterialButton(
              onPressed: goToNextQuestion
              // onPressed:(){
              //   Navigator.push(context,
              //     MaterialPageRoute(builder: (context) =>secPage(),)
              //     );
              // }
              ,

              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              color: Color.fromRGBO(245, 90, 12,1),
              height: 60,
              minWidth: 100,
              padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
              child: const Text('Next',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600),),

            ),

          ),

        ]
    );
  }
}

// ignore: must_be_immutable
class ChoiceButton extends StatelessWidget {
  final String label;
  final String text;
  bool checked = false;

  // String ch ="";

  ChoiceButton({super.key, required this.label, required this.text, required this.checked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xdff5eeff),
            borderRadius: BorderRadius.circular(40.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 4),
          child: Container(
              width: double.infinity, // or set a fixed width
              child: MaterialButton(
                // color: checked! ?  orangeOne :const Color.fromARGB(255, 197, 197, 197),
                onPressed: (){
                  checkedAnswer = text;
                  checked = true;
                  print(checkedAnswer);
                },
                child:Row(
                  children: [
                    MaterialButton(
                      onPressed: (){
                        checkedAnswer = text;
                        checked = true;
                        print(checkedAnswer);
                      },
                      minWidth: 5,
                      // elevation: 10,
                      color: checked ?  bodyColor : orangeOne,
                      shape: CircleBorder(),

                      child:Text(
                          label,
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                      ),
                    ),

                    const SizedBox(width: 5.0),

                    Expanded(
                      child: Text(
                        text,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(13, 19, 43,1),
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}