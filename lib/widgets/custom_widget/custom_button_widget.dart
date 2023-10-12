
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.title});
final void Function()? onTap;
final String title;
  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;
    var heightScreen=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width-100,
        height:heightScreen/12,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(16),
            color: kPrimaryColor.withOpacity(.9)
        ),
        child:  Center(
          child: Text(
            title,style: TextStyle(
              fontSize: widthScreen/15,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}
