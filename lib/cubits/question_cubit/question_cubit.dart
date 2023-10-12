import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/question_model.dart';
import 'package:untitled2/services/question_service.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this.questionService) : super(QuestionInitial());
   PageController pageController = PageController();
  QuestionService questionService;
  int score=0;
  final double sliderValue = 0.0;
bool? isColored=false;
  List<QuestionModel>? listOfQuestions;
  getQuestion({ required int categoryId,required int amount}) async {

    emit(QuestionLoading());
    try{
      listOfQuestions= await  questionService.getQuestion( categoryId: categoryId,amount: amount);
      emit(QuestionSuccess());
    }catch(e){
      emit(QuestionFailure());
    }

  }
showColorOfQuestion({required String diff}){
    if(diff=="hard"){
     return Colors.red;
    }else if(diff=="medium"){
      return Colors.lime.withOpacity(.7);
    }else{
      return Colors.green;
    }
}


  checkCorrectAnswer({required String correctAnswer,userAnswer}){
    if(correctAnswer==userAnswer){
      score++;
     // print(score);
    }
  }




}
