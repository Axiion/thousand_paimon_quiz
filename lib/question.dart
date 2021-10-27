class Question{
  late String questionText;
  late String questionAns;
  late String a1, a2, a3, a4;
  Question({required String qText, required String answer, required String ans1, required String ans2,
    required String ans3, required String ans4}){
    questionText = qText;
    questionAns = answer;
    a1 = ans1;
    a2 = ans2;
    a3 = ans3;
    a4 = ans4;
  }
}