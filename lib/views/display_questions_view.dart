
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/cubits/question_cubit/question_cubit.dart';
import 'list_of_questions_view.dart';

class DisplayQuestionsView extends StatelessWidget {
  const DisplayQuestionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: BlocBuilder<QuestionCubit, QuestionState>(
  builder: (context, state) {
    if(state is QuestionLoading){
return const Center(
  child: CircularProgressIndicator(
    color: kPrimaryColor,
  ),
);
    }else if(state is QuestionFailure){
      return const Center(
        child: Text("Check your network connection"),
      );
    }else{
      return const ListOfQuestions();
    }
  },

),
        ),
      );
  }
}


