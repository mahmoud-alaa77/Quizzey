import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/login_cubit/login_cubit.dart';
import 'package:untitled2/cubits/question_cubit/question_cubit.dart';
import 'package:untitled2/services/question_service.dart';
import 'package:untitled2/views/welcome_view.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => QuestionCubit(QuestionService()),),
        BlocProvider(create: (context) => LoginCubit(),),

      ],
      child: MaterialApp(

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          brightness: Brightness.dark,
          // primaryColor: Colors.deepOrangeAccent,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WelcomeView(),
      ),
    );
  }
}
