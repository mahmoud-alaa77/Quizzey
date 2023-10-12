import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/question_cubit/question_cubit.dart';
import '../../helper.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:const Text(
        "You have finished answering these questions",style: TextStyle(
          fontSize: 20
      ),
      ) ,
      content: Text(
        "Your Score is ${BlocProvider.of<QuestionCubit>(context).score} /${BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length}",
        style: const TextStyle(
            color: Colors.grey,
            fontSize: 18
        ),
      ),
      actions: [

        TextButton(
          onPressed: () async{
            BlocProvider.of<QuestionCubit>(context).saveLastScore(BlocProvider.of<QuestionCubit>(context).score );
            Navigator.pop(context);
            Navigator.pop(context);

          },
          child: const Text('Ok, return to home page',style: TextStyle(color: kPrimaryColor),),
        ),
      ],
    );
  }
}
