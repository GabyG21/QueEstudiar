import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:queestudiar/screen_result.dart';
import 'quiz_brain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuizBrain quizBrain= new QuizBrain();

class QuizPage extends StatefulWidget {
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int answer = 0;
  int limit = 5;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              quizBrain.questionBank[answer].questionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black54,
              ),
            )),
          ),
        ),
/*        Row(children: <Widget>[

          Icon(Icons.arrow_back, color: Colors.white,),
          Icon(Icons.arrow_forward, color: Colors.white, ),
        ])
  */
  //TODO: button me gusto mucho
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
              textColor: Colors.white,
              color: Colors.deepOrange,
              onPressed: () {
                //level 5
                setState(() {
                  if(answer < limit) {
                      answer++;}
                    else  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultsPage();
                      }),
                    );
                  }
                });
                quizBrain.questionBank[answer].questionAnswer = 5;
                print(quizBrain.questionBank[answer].questionText+ ' ' + quizBrain.questionBank[answer].questionAnswer.toString() );
              },
              child: Text(
                'Me gusta mucho',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),),
        ),),
    //TODO: button me gusta
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () {
                //level 4
                setState(() {
                  if(answer < limit) {
                    answer++;}
                  else  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultsPage();
                      }),
                    );
                  }
                });
                quizBrain.questionBank[answer].questionAnswer = 4;
                print(quizBrain.questionBank[answer].questionText+ ' ' + quizBrain.questionBank[answer].questionAnswer.toString() );
              },
              child: Text(
                'Me gusta ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),),
        ),),
      //TODO: button me gusto algo
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
              textColor: Colors.white,
              color: Colors.blueAccent,
              onPressed: () {
                //level 3
                setState(() {
                  if(answer < limit) {
                    answer++;}
                  else  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultsPage();
                      }),
                    );
                  }
                });
                quizBrain.questionBank[answer].questionAnswer = 3;
                print(quizBrain.questionBank[answer].questionText+ ' ' + quizBrain.questionBank[answer].questionAnswer.toString() );
              },
              child: Text(
                'Me gusta algo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),),
        ),),
        //TODO: button me gusto poco
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                //level 2
                setState(() {
                  if(answer < limit) {
                    answer++;}
                  else  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultsPage();
                      }),
                    );
                  }
                });
                quizBrain.questionBank[answer].questionAnswer = 2;
                print(quizBrain.questionBank[answer].questionText+ ' ' + quizBrain.questionBank[answer].questionAnswer.toString() );
              },
              child: Text(
                'Me gusta poco',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),),
        ),),
        //TODO: button no me gusta
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
              textColor: Colors.white,
              color: Colors.yellow,
              onPressed: () {
                //level 1
                setState(() {
                  if(answer < limit) {
                    answer++;}
                  else  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultsPage();
                      }),
                    );
                  }
                });
                quizBrain.questionBank[answer].questionAnswer = 1;
                print(quizBrain.questionBank[answer].questionText+ ' ' + quizBrain.questionBank[answer].questionAnswer.toString() );
              },
              child: Text(
                'No me gusta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),),
        ),),
      ],
    ))));
  }
}
