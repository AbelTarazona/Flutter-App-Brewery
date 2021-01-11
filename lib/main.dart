import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_init/bmi.dart';
import 'package:flutter_app_init/speedtest.dart';
import 'package:flutter_app_init/story_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
StoryBrain storyBrain = StoryBrain();

//The main function is the starting point for all our Flutter apps
void main() => runApp(Speed());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  int storyNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO: Step 1 - Add background.png to this Container as a background image.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    storyBrain.nextStory(1);
                  },
                  color: Colors.red,
                  child: Text(
                    //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: FlatButton(
                  onPressed: () {
                    //Choice 2 made by user.
                    //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                    storyBrain.nextStory(2);
                  },
                  color: Colors.blue,
                  child: Text(
                    //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                    storyBrain.getChoice2(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  showAlert() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "FIN",
      desc: "Ha completado todas las preguntas!",
      buttons: [
        DialogButton(
          child: Text(
            "Reiniciar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  void checkAnswer(bool userPickedAnswer) {
    if (quizBrain.isLastQuestion()) {
      showAlert();
      setState(() {
        scoreKeeper.clear();
      });
      quizBrain.restart();
      return;
    }

    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        scoreKeeper.add(
          Icon(Icons.close, color: Colors.red),
        );
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.red,
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

class XylophoneApp extends StatelessWidget {
  void playSound(int i) {
    final player = AudioCache();
    player.play('note$i.wav');
  }

  Expanded buildKey({Color color, int sound}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(sound);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, sound: 1),
              buildKey(color: Colors.green, sound: 2),
              buildKey(color: Colors.blue, sound: 3),
              buildKey(color: Colors.cyanAccent, sound: 4),
              buildKey(color: Colors.deepOrange, sound: 5),
              buildKey(color: Colors.tealAccent, sound: 6),
              buildKey(color: Colors.deepPurpleAccent, sound: 7),
            ],
          ),
        ),
      ),
    );
  }
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Ask me Anything'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void clickBall() {
    ballNumber = Random().nextInt(4) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Image.asset('images/ball$ballNumber.png'),
          onPressed: () {
            setState(() {
              clickBall();
            });
          },
        ),
      ),
    );
  }
}

class DiceeState extends StatefulWidget {
  @override
  _DiceeStateState createState() => _DiceeStateState();
}

class _DiceeStateState extends State<DiceeState> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 3;
  String status = 'NOT EQUAL';

  void getRandomNumber() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
    if (leftDiceNumber == rightDiceNumber) {
      status = 'EQUAL';
    } else {
      status = 'NOT EQUAL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  status,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            getRandomNumber();
                          });
                        },
                        child: Image.asset('images/dice$leftDiceNumber.png'),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            getRandomNumber();
                          });
                        },
                        child: Image(
                          image: AssetImage('images/dice$rightDiceNumber.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dicee extends StatelessWidget {
  int leftDiceNumber = 1;
  var rightDiceNumber = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {},
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      print('Right pressed');
                    },
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNumber.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Bitel',
              style: TextStyle(color: Colors.black, fontSize: 22.0)),
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://avatars2.githubusercontent.com/u/12468902?s=460&u=af12dd749e68b45862f389cd57bc7da901ab24e6&v=4'),
              ),
              Text(
                'Abel Tarazona',
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '970080498',
                    style:
                        TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'abel.tarazona@bitel.com.pe',
                    style:
                        TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.map,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Perú',
                    style:
                        TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InitialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Monster", style: TextStyle(color: Colors.white70)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/52614b19-d6dc-4cd1-9b2e-a62db03067ff/d9hog0i-c2406ff4-ba8d-415a-8a81-a55d59a75e64.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNTI2MTRiMTktZDZkYy00Y2QxLTliMmUtYTYyZGIwMzA2N2ZmXC9kOWhvZzBpLWMyNDA2ZmY0LWJhOGQtNDE1YS04YTgxLWE1NWQ1OWE3NWU2NC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.JSB4hYRPk7lvwfdPLZmSwgA4vlWC-QSbpB-LplvhT2Q'),
          height: 250,
        ),
      ),
    );
  }
}
