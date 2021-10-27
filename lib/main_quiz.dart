
import 'package:quizzler_app/question.dart';

class main_quiz {
  int ctr = 0;
  List<Question> qList = [

    Question(qText: 'Amber is the Knights of Favonius\' only...', answer: "Outrider", ans1: "Honorary Knight", ans2: "Acting Lead Knight", ans3: "Chef", ans4: "Outrider"),
    Question(
        qText: 'Of the following Mondstadt taverns, Diona is a bartender at:',
        answer: "The Cat's Tail", ans1: "The Dawn Winery", ans2: "The Cat's Tail", ans3: "Angel's Share", ans4: "The Tavern"),
    Question(qText: 'What is Keqing\'s title in the Liyue Qixing?', answer: 'Yuheng', ans1: "Yuheng", ans2: "Tianquan", ans3: "Kaiyang", ans4: "Tianshu"),
    Question(qText: 'Which of the following characters can activate treasure chests that can only be accessed through pressure plates?', answer: "All of the above",
        ans1: "Geo Traveler", ans2: "Amber", ans3: "Ganyu", ans4: "All of the above"),
    Question(qText: 'Who is the Eighth Fatui Harbringer?', answer: "La Signora", ans1: "Scaramouche", ans2: "La Signora", ans3: "Childe", ans4: "Dottore"),
    Question(
        qText: 'Who wrote the Favonius Survival Rulebook for Klee?',
        answer: "Kaeya", ans1: "Diluc", ans2: "Albedo", ans3: "Kaeya", ans4: "Jean"),
    Question(
        qText: 'What is Fischl\'s position at the Adventurers\' Guild?',
        answer: "Investigator", ans1: "Adventurer", ans2: "Investigator", ans3: "Prinzessin der Verurteilung", ans4: "Scout"),
    Question(
        qText: 'Hu Tao\'s passive talent, Sanguine Rouge, gives her how much Pyro DMG Bonus?',
        answer: "33%", ans1: "30%", ans2: "25%", ans3: "32%", ans4: "33%"),
    Question(
        qText: 'What is the maximum number of Electro Sigils that Razor\'s Elemental Skill, Claw and Thunder, can generate?',
        answer: "3", ans1: "1", ans2: "2", ans3: "3", ans4: "4"),
    Question(qText: 'In Jean\'s Story Quest, "Leo Minor Chapter," what is the name of Margaret\'s lost cat?', answer: "Prince",
        ans1: "Prince", ans2: "Roger", ans3: "Nelson", ans4: "Paisley"),
    Question(
        qText: 'Which of the following characters will not have their Charged Attacks infused by Cryo DMG by Chongyun\'s Spirit Blade: Chonghua\'s Layered Frost?',
        answer: "Klee", ans1: "Keqing", ans2: "Bennett", ans3: "Xingqiu", ans4: "Klee"),
    Question(
        qText: 'How many Geo characters do you have to have on your team to obtain a Geo Damage Bonus from Gorou\'s skills?',
        answer: "4", ans1: "None", ans2: "2", ans3: "3", ans4: "4"),
  ];

  void checkNext() {
    if (ctr < qList.length - 1) {
      ctr++;
    }
  }

  String getQuestion() {
    return qList[ctr].questionText;
  }

  String getAnswer() {
    return qList[ctr].questionAns;
  }

  String getChoices(int x){
    switch(x){
      case 1: return qList[ctr].a1;
      case 2: return qList[ctr].a2;
      case 3: return qList[ctr].a3;
      case 4: return qList[ctr].a4;
    }
    return "Error";
  }

  bool isFinished() {
    if (ctr >= qList.length - 1) {
      return true;
    }
    return false;
  }

  void reset() {
    ctr = 0;
  }
}
