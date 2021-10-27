import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzler_app/main_quiz.dart';
import 'package:quizzler_app/reusable_card.dart';
import 'package:get/get.dart';
import 'package:quizzler_app/themes.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  main_quiz quiz = main_quiz();
  late Image paimon;

  @override
  Widget build(BuildContext context) {
    Get.put(Themes());
    return Scaffold(
      appBar: AppBar(
        title: Text("A Thousand Questions w/ Paimon!",
            style: Theme.of(context).primaryTextTheme.headline6),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          GetBuilder<Themes>(
            builder: (controller) => IconButton(
              icon: Icon(
                Themes.isDark ? FontAwesomeIcons.sun : FontAwesomeIcons.moon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () => controller.toggleMode(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Stack(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: reusableCard(
                    color: Theme.of(context).colorScheme.primary,
                    cardChild: Padding(
                      padding: EdgeInsets.fromLTRB(
                          10,
                          MediaQuery.of(context).size.height * 0.05,
                          10,
                          MediaQuery.of(context).size.height * 0.05),
                      child: Text(
                        quiz.getQuestion(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.headline1,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: MaterialButton(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            child: Text(
                              quiz.getChoices(1),
                              textAlign: TextAlign.center,
                              style: Themes().buttonStyle,
                            ),
                            onPressed: () {
                              isCorrect(quiz.getChoices(1));
                            },
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: MaterialButton(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            child: Text(
                              quiz.getChoices(2),
                              textAlign: TextAlign.center,
                              style: Themes().buttonStyle,
                            ),
                            onPressed: () {
                              isCorrect(quiz.getChoices(2));
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: MaterialButton(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            child: Text(
                              quiz.getChoices(3),
                              textAlign: TextAlign.center,
                              style: Themes().buttonStyle,
                            ),
                            onPressed: () {
                              isCorrect(quiz.getChoices(3));
                            },
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: MaterialButton(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            child: Text(
                              quiz.getChoices(4),
                              textAlign: TextAlign.center,
                              style: Themes().buttonStyle,
                            ),
                            onPressed: () {
                              isCorrect(quiz.getChoices(4));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/paimonFloat.gif",
            height: 125.0,
            width: 125.0,
          ),
        ]),
      ),
    );
  }

  //for checking of answers and logging
  void isCorrect(String userAns) {
    String check = quiz.getAnswer();

    setState(() {
      // for resetting the quiz
      if (userAns == check) {
        score++;
        if (quiz.isFinished() == true) {
          showAlertDialog(context);
          quiz.reset();
          print(score);
          score = 0;
        } else {
          print(score);
          quiz.checkNext();
        }
      } else if (userAns != check) {
        if (quiz.isFinished() == true) {
          showAlertDialog(context);
          quiz.reset();
          print(score);
          score = 0;
        } else {
          print(score);
          quiz.checkNext();
        }
      }
    });
  }

  Text successMsg(int scr) {
    if (scr == 12) {
      paimon = Image.asset(
        "assets/paimonYes.gif",
        height: 120,
        width: 120,
      );
      return Text("Congrats!");
    } else if (scr <= 11 && scr > 7) {
      paimon = Image.asset(
        "assets/paimonYes.gif",
        height: 125,
        width: 120,
      );
      return Text("Awesome!");
    } else if (scr <= 7 && scr > 4) {
      paimon = Image.asset(
        "assets/paimonMeh.gif",
        height: 145,
        width: 120,
      );
      return Text("Cool!");
    }
    paimon = Image.asset(
      "assets/paimonFail.gif",
      height: 120,
      width: 120,
    );
    return Text("Try again!");
  }

  Text alertMsg(int scr) {
    if (scr == 12) {
      return Text(
          "Your score is $scr, wow! Traveler, you may have more knowledge than"
          " Paimon!",
          style: Themes().dialogBody);
    } else if (scr <= 10 && scr > 7) {
      return Text(
          "Your score is $scr, that's amazing Traveler! You know your stuff!",
          style: Themes().dialogBody);
    } else if (scr <= 7 && scr > 4) {
      return Text("Your score is $scr, not bad, Traveler!",
          style: Themes().dialogBody);
    }
    return Text(
        "Your score is $scr, why don't you take the quiz again, Traveler?",
        style: Themes().dialogBody);
  }

  //for alert dialog
  showAlertDialog(BuildContext context) {
    // button setup
    Widget retryButton = TextButton(
      child: Text("Retry", style: Themes().dialogStyle),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: successMsg(score),
      content: alertMsg(score),
      actions: [
        retryButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Stack(children: <Widget>[
          alert,
          Column(children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
            ),
            paimon,
          ])
        ]);
      },
    );
  }
}
