
import 'package:flutter/material.dart';

class QuestionCategory extends StatelessWidget {
  const QuestionCategory({Key? key,required this.title,required this.imageUrl,required this.numOfQuestion,required this.onTap}) : super(key: key);

final  String title;
  final int numOfQuestion;
  final String imageUrl;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;
   // var heightScreen=MediaQuery.of(context).size.height;
    return  GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
      builder: (context, constraints) {
        //double localHeight=constraints.maxHeight;
        double localWidth=constraints.maxWidth;

        return Container(
          //height: heightScreen/3.5,
          width: widthScreen/2.5,

          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 10,
            // horizontal: 10
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(

            color: Colors.white.withOpacity(.2),
            borderRadius: BorderRadiusDirectional.circular(widthScreen/18),
          ),
          child: Column(
            children: [

              Image.asset(imageUrl,width: localWidth/2),
              Text(
                title,style:  TextStyle(
                  fontSize: localWidth/10,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text(
                "$numOfQuestion Question",style:  TextStyle(
                  fontSize: localWidth/12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
              ),
              ),
            ],
          ),
        );
      },
      ),
    );
  }
}
