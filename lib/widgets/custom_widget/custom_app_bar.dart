
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.userName, required this.indexOfAvatar});
  final String userName;
  final int indexOfAvatar;
  String controlOfTextLength(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }
  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;

    return    Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
           Text( controlOfTextLength(
               userName ==""? "Hello, New User":"Hello, $userName",
               20
           ),
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
             style: TextStyle(

              fontSize: widthScreen/16,
              fontWeight: FontWeight.bold
          ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: widthScreen/13,
            backgroundColor: kGrey.withOpacity(.5),
            child:indexOfAvatar== 0 ? Image.asset("assets/images/person1.png",
              width: widthScreen/10,
            ): Image.asset("assets/images/person$indexOfAvatar.png",
              width: widthScreen/10,
            )
          ),

        ],
      ),
    );
  }
}
