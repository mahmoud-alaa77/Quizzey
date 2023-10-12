import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/login_cubit/login_cubit.dart';
import 'package:untitled2/widgets/custom_widget/custom_app_bar.dart';

import '../widgets/categories_list_view.dart';
import '../widgets/score_board_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userName});
final String userName;
  @override
  Widget build(BuildContext context) {
     var widthScreen=MediaQuery.of(context).size.width;
    // var heightScreen=MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
              children: [
                 CustomAppBar(
                  userName: userName,
                   indexOfAvatar: BlocProvider.of<LoginCubit>(context).avatarIndex,
                ),
                 Text(
                  "Let's make this day amazing",style: TextStyle(
                    fontSize: widthScreen/17,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey
                ),
                ),
                const SizedBox(
                  height: 16,
                ),

                const CategoriesListView()

            ],

          ),
        ),
      ),
    );
  }
}

