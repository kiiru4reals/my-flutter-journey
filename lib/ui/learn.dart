import 'package:flutter/material.dart';
import 'package:my_flutter_journey/model/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Kenya gained independece in 1963", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two rights in the Declaration of Independence are:"
            "  \n Life  "
            "  \n Pursuit of happiness.",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:\nYou can practice any religion, "
            "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false), //6
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mwanachi"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Center(
                child: Image.asset("images/about.jpg",
                width: 250,
                height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400, style: BorderStyle.solid
                    )
                  ),
                  height: 120,
                  child: Center(child: Text(questionBank[_currentQuestionIndex].questionText, style: TextStyle(
                    fontSize: 16.9,
                    color: Colors.white
                  ),),
                  )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  RaisedButton(onPressed: () => _previousQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white,),),

                  RaisedButton(onPressed: () => _checkAnswer(true),
                  color: Colors.blueGrey.shade900,
                  child: Text("TRUE", style: TextStyle(color: Colors.white),),),

                  RaisedButton(onPressed: () => _checkAnswer(false),
                    color: Colors.blueGrey.shade900,
                    child: Text("FALSE", style: TextStyle(color: Colors.white),),),

                  RaisedButton(onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white,),)

                ],
              ),
              Spacer(),


            ],

          ),
        ),
      ),
    );
    
  }

  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });

  }

  _nextQuestion() {
    _updateQuestion();

  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect){
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text('Correct'));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _updateQuestion();

      // correct answer
    }else{
      final snackBar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text('Incorect.'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _updateQuestion();

    }
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
