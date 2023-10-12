import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/question_cubit/question_cubit.dart';
import 'package:untitled2/views/display_questions_view.dart';

import 'custom_widget/question_category_widget.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;

    return GridView.count(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: widthScreen/22,
      mainAxisSpacing: widthScreen/22,
      children: [
        QuestionCategory(
            title: "General Knowledge",
            numOfQuestion: 50,
            imageUrl:"assets/images/knowledge.png" ,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 9,amount: 50);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));

            }
        ),
        QuestionCategory(
            title: "History",
            imageUrl: "assets/images/history.png",
            numOfQuestion: 30,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 23,amount: 30);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
        QuestionCategory(
          title: "Sports",
          numOfQuestion: 40,
          imageUrl:"assets/images/sports.png" ,
          onTap: (){
            BlocProvider.of<QuestionCubit>(context).score=0;
            BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 21,amount: 40);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
          },
        ),
        QuestionCategory(
            title: "Politics",
            numOfQuestion: 25,
            imageUrl:"assets/images/politics.png" ,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 24, amount: 25);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
        QuestionCategory(
            title: "Geography",
            numOfQuestion: 33,
            imageUrl:"assets/images/globe.png" ,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 22,amount: 33);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
        QuestionCategory(
            title: "Animals",
            imageUrl: "assets/images/animal.png",
            numOfQuestion: 28,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 27,amount: 28);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
        QuestionCategory(
            title: "mathematics",
            imageUrl: "assets/images/math.png",
            numOfQuestion: 25,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 19,amount: 25);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
        QuestionCategory(
            title: "Books",
            imageUrl: "assets/images/books.png",
            numOfQuestion: 36,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 10,amount: 36);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
        QuestionCategory(
            title: "Nature",
            imageUrl: "assets/images/forest.png",
            numOfQuestion: 20,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 17,amount: 20);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
        QuestionCategory(
            title: "Film",
            imageUrl: "assets/images/film.png",
            numOfQuestion: 24,
            onTap: (){
              BlocProvider.of<QuestionCubit>(context).score=0;
              BlocProvider.of<QuestionCubit>(context).getQuestion(categoryId: 11,amount: 24);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayQuestionsView(),));
            }
        ),
      ],

    );
  }
}
