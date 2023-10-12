part of 'question_cubit.dart';

@immutable
abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}
class QuestionSuccess extends QuestionState {}
class QuestionFailure extends QuestionState {}


