import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/cubits/login_cubit/login_cubit.dart';

class ListViewOfAvaters extends StatefulWidget {
  const ListViewOfAvaters({super.key,});

  @override
  State<ListViewOfAvaters> createState() => _ListViewOfAvatersState();
}

class _ListViewOfAvatersState extends State<ListViewOfAvaters> {
  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;
    var heightScreen=MediaQuery.of(context).size.height;
    return   BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return SizedBox(
      height: heightScreen/10,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>  SizedBox(
          width: widthScreen/25,
        ),
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
BlocProvider.of<LoginCubit>(context).avatarIndex=index+1;
setState(() {

});
          },
          child:BlocProvider.of<LoginCubit>(context).avatarIndex==index+1? CircleAvatar(
            radius: widthScreen/15+4,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: widthScreen/15,

              backgroundColor: Colors.white,
child: Center(
    child: Image.asset("assets/images/person${index+1}.png",
width: widthScreen/12,
)),
            ),
          ):CircleAvatar(
            radius: widthScreen/15,

            backgroundColor: kGrey.withOpacity(.5),
            child: Center(
                child: Image.asset("assets/images/person${index+1}.png",
                  width: widthScreen/12,
                )),
          )
        ),),
    );
  },
);
  }
}
