import 'package:flutter/material.dart';
import 'package:app1/data/questions.dart';
import 'package:app1/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,required this.chosenAnswers});

  final List <String>chosenAnswers;


List<Map<String,Object>>getSummaryData(){
final List<Map<String,Object>>summary=[];

for(var i=0;i<chosenAnswers.length; i++){
  summary.add({
    'question_index':i,
    'question':questions[i].text,
    'correct_answer':questions[i].answers[0],
    'user_answer':chosenAnswers[i]
  },
  );

}
return summary;
}

  @override
  Widget build(BuildContext){
  final summaryData=getSummaryData();
  final numTotalQuestion=questions.length;
  final numCorrectQuestion=summaryData.where((data){
return data['user_answer']==data['correct_answer'];
  }).length;

   return SizedBox(
       width: double.infinity,
       child:Container(
       margin: const EdgeInsets.all(40),
   child: Column(
     mainAxisAlignment: MainAxisAlignment.center,

     children: [
 Text('You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!',),
  const     SizedBox(height: 30,),

 QuestionsSummary(getSummaryData()),

 const      SizedBox(height: 30,),
       TextButton(onPressed: (){},
           child: Text('Restart Quiz')
       )
   ],
   ),
    ),
    );
  }

}
