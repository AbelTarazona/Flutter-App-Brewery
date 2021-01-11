import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  bool last = false;

  List<Question> _questions = [
    Question(q: 'Pregunta 1', a: false),
    Question(q: 'Pregunta 2', a: true),
    Question(q: 'Pregunta 3', a: false),
    Question(q: 'Pregunta 4', a: true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    } else {
      last = true;
      //_questionNumber = 0;
    }
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  bool isLastQuestion() {
    return last;
  }

  void restart() {
    _questionNumber = 0;
    last = false;
  }
}
