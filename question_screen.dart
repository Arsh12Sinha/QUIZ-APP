@@ -0,0 +1,65 @@
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app1/answer_button.dart';
import 'package:app1/data/questions.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer,});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex=0;
 void answerQuestion(String selectedAnswer) {
   // currentQuestionIndex= currentQuestionIndex+1;
   widget.onSelectAnswer(selectedAnswer);
   setState((){
     currentQuestionIndex+=1;
   });
 }
  @override
  Widget build(context) {
    final currentQuestion = questions[ currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child:Container(
        margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
                fontWeight: FontWeight.bold,
            ),
textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(answerText: answer, onTap:(){
answerQuestion(answer);
            } ,
            );
          })
        ],
      ),
      ),
    );
  }
}
