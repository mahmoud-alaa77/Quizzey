
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckConnection extends StatelessWidget {
  const CheckConnection({super.key});

  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         SvgPicture.asset("assets/images/internet.svg",
         width: widthScreen/2,
         ),
          const SizedBox(
            height: 12,
          ),
           Text("Check your network connection !!",style: TextStyle(
            fontSize: widthScreen/20,

          )),
        ],
      ),
    );
  }
}
