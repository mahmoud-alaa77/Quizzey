import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/question_cubit/question_cubit.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key});

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // var widthScreen=MediaQuery.of(context).size.width;
    var heightScreen=MediaQuery.of(context).size.height;
    return   LayoutBuilder(
      builder: (context, constraints) {
         var localWidthScreen=constraints.maxWidth;
       // var localHeightScreen=constraints.maxHeight;
        return Container(
          height: heightScreen/7,
          // width: widthScreen-50,
          decoration: BoxDecoration(

            color: Colors.white.withOpacity(.2),
            borderRadius: BorderRadiusDirectional.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Image.asset(
                "assets/images/coin.png",
                width: localWidthScreen/6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Last Score",style: TextStyle(
                    fontSize: localWidthScreen/20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${BlocProvider.of<QuestionCubit>(context).getScore()} / ${BlocProvider.of<QuestionCubit>(context).listOfQuestions!.length}",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
/*
Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Image.asset(
                      "assets/images/coin.png",
                      width: localWidthScreen/6,
                    ),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Points today",style: TextStyle(
                          fontSize: localWidthScreen/25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "0",style: TextStyle(
                            fontSize: localWidthScreen/17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: VerticalDivider(
                  width: 1,
                  color: Colors.white,

                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Image.asset("assets/images/cup.png",
width: localWidthScreen/6,
                    ),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Highest rating",style: TextStyle(
                          fontSize: localWidthScreen/25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "0",style: TextStyle(
                            fontSize: localWidthScreen/17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
 */