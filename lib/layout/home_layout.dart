import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:golden_test/layout/home_states.dart';
import 'package:golden_test/modules/home/widgets/custom_bottom_nav_widget.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit().get(context);
        return Scaffold(
          body: SafeArea(
            child: cubit.screens[cubit.bottomNavCurrentIndex],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .135,
            ),
            child: CustomBottomNavWidget(
              currentIndex: cubit.bottomNavCurrentIndex,
              onTap: (index) => cubit.changeBottomNavCurrentIndex(index),
            ),
          ),
        );
      },
    );
  }
}
