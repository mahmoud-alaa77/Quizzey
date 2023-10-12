
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/cubits/question_cubit/question_cubit.dart';
import 'package:untitled2/widgets/custom_widget/custom_alert_dilog.dart';
import 'package:untitled2/widgets/custom_widget/custom_button_widget.dart';

import '../widgets/answer_card.dart';

class DisplayQuestionsView extends StatelessWidget {
  const DisplayQuestionsView({super.key});

  @override

  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;
    var heightScreen=MediaQuery.of(context).size.height;

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
      return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: BlocProvider.of<QuestionCubit>(context).pageController,
        itemCount:BlocProvider.of<QuestionCubit>(context).listOfQuestions?.length ,
        scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var data = BlocProvider.of<QuestionCubit>(context).listOfQuestions![index];
        List<Widget> answers=[
          AnswerCard(
            index: index,
            splashColor: Colors.green,
            userAnswer: data.correctAnswer,
          correctAnswer: data.correctAnswer,
          ),
          AnswerCard(
            index: index,
            splashColor: Colors.red,
            userAnswer: data.inCorrectAnswer1,
            correctAnswer: data.correctAnswer,
          ),
          AnswerCard(
            index: index,
            userAnswer: data.inCorrectAnswer2,
            correctAnswer: data.correctAnswer,
            splashColor: Colors.red,

          ),
          AnswerCard(
            index: index,
            splashColor: Colors.red,
            userAnswer: data.inCorrectAnswer3,
            correctAnswer: data.correctAnswer,
          ),
        ];
        List<Widget> shuffledWidgets = [];
        shuffledWidgets.addAll(answers..shuffle());
        return Padding(
          padding:  EdgeInsets.all(widthScreen/30),
          child: Column(
            children: [
              SizedBox(
                height: heightScreen/45,
              ),
              Row(
                children: [

                  Expanded(
                    flex: 4,
                    child: Slider(
                      value: index.toDouble(),
                      min: 0.0,
                      max:  BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length-1.toDouble(),
                      onChanged: (double value) {

                      },
                      divisions: BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length-1,
                      activeColor: kPrimaryColor,
                      //label: "Score ${BlocProvider.of<QuestionCubit>(context).score.toInt()}",


                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                        "${index+1} /${ BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightScreen/45,
              ),
              Container(
                height: heightScreen/3.5,
                width: widthScreen,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadiusDirectional.circular(widthScreen/20),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Text(
                        data.title,

                        style: TextStyle(
                            fontSize: data.title.length>80 ? widthScreen/22:widthScreen/18

                        ),
                      ),
                      const Spacer(),
                      Container (
                        padding: const EdgeInsetsDirectional.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(16),
                          color: BlocProvider.of<QuestionCubit>(context).showColorOfQuestion(diff: data.difficulty),
                        ),
                        child: Text(
                            data.difficulty
                        ),
                      ),
                    ],
                  )
                ),
              ),

              Expanded(child: ListView.builder(
                itemCount: shuffledWidgets.length,
                itemBuilder: (context, index) {
                  return shuffledWidgets[index];
                },
              )),

              CustomButton(
                title: index==BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length-1?"Next":"Skip",
                onTap: (){
                  BlocProvider.of<QuestionCubit>(context).pageController.animateToPage(
                      index+1,
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.fastOutSlowIn);

                  if(index==BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length-1){
                    // Navigator.pop(context);
                    showDialog(context: context, builder: (context) => const CustomAlertDialog());

                  }

                },
              )
            ],
          ),
        );
      },
      );
    }
  },

),
        ),
      );
  }
}

