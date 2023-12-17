import 'package:flutter/material.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:golden_test/shared/colors.dart';

class HorizontalTownsWidget extends StatelessWidget {
  const HorizontalTownsWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cubit.townsList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            cubit.changeHorizontalIndex(cubit.townsList[index].id);
            cubit.getCategories(cubit.townsList[index].id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.5),
            child: Container(
              alignment: AlignmentDirectional.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color:
                    cubit.selectedHorizontalIndex == cubit.townsList[index].id
                        ? AppColors.kDeepOrangeColor
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                cubit.townsList[index].name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color:
                      cubit.selectedHorizontalIndex == cubit.townsList[index].id
                          ? AppColors.kWhite
                          : AppColors.kBlack,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
