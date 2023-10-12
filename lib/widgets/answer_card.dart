import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/question_cubit/question_cubit.dart';
import 'custom_widget/custom_alert_dilog.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key, required this.userAnswer,  required this.splashColor, required this.index, required this.correctAnswer,  });

  final String userAnswer;
  final String correctAnswer;
final int index;
 final Color splashColor ;

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        if(index==BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length-1){
          showDialog(context: context, builder: (context) => const CustomAlertDialog());
        }
        BlocProvider.of<QuestionCubit>(context).checkCorrectAnswer(correctAnswer: correctAnswer,userAnswer: userAnswer);
        BlocProvider.of<QuestionCubit>(context).pageController.animateToPage(
            index+1,
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInCubic);
      },
      splashColor: splashColor,
      borderRadius: BorderRadius.circular( widthScreen / 20),
      radius: 75,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        margin: const EdgeInsetsDirectional.symmetric(vertical: 16),
        width: widthScreen,
        height: MediaQuery.of(context).size.height/15,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(
              widthScreen / 20),
          border: Border.all(
              width: 1,
              color: Colors.white.withOpacity(.4)
          ),
 //color: color
        ),
        child: Center(
          child: Text(
            userAnswer,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
