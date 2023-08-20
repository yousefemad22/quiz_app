import 'package:flutter/material.dart';
import 'package:quiz_app/firstPage.dart';
import 'package:quiz_app/vars&funs.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          backgroundColor: barColor,
          title: const Text('Quiz App'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                width: double.infinity, // Take full width of the screen
                child: const Column( 
                  children: [
                    // Text(
                    //   ' Quiz App You will answer some questions about Flutter lets start 🤩 ',   
                    //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    
                    // ),
                    Text(
                      'Quiz App You will answer some questions about Flutter lets start 🤩',       //don't touch my Emoji
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://tse2.mm.bing.net/th?id=OIP.0vWomIZ7M_aXO2hpgn6rzQHaHa&pid=Api&P=0&h=180', // google
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  // controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: orangeOne),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage())
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(orangeOne),
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



