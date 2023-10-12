import 'package:flutter/material.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/widgets/list_view_of_avater_widget.dart';

import '../widgets/custom_widget/custom_button_widget.dart';
import 'home_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key,});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final  myController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;
    var heightScreen=MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Quizey app"),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/quiz.png",
                  height: heightScreen/3,
                 //width: widthScreen/1.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
                  child: TextField(
                    style:  TextStyle(
                      fontSize: widthScreen/16,
                     height: 1.75,
                      fontWeight: FontWeight.w500
                    ),
                    controller: myController,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: kPrimaryColor,

                          )
                      ),
                      hintText: "Enter your name here...",
                    ),

                  ),
                ),
                 Text(
                  "  Choose your Avatar",style: TextStyle(
                    fontSize: widthScreen/15,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey
                ),
                ),
                  const ListViewOfAvaters(),
                 SizedBox(
                  height: heightScreen/30,
                ),
                 CustomButton(
                   title: "New Game",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeView(
                      userName:myController.text ,
                    ),));

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

