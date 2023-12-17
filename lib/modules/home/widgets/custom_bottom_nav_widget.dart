import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_test/shared/assets_manager.dart';
import 'package:golden_test/shared/colors.dart';

class CustomBottomNavWidget extends StatelessWidget {
  const CustomBottomNavWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int index)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: currentIndex == 0
                ? AppColors.kDeepOrangeColor
                : Colors.transparent,
            child: SvgPicture.asset(
              AppAssets.kHomeIcon,
              color: currentIndex == 0 ? AppColors.kWhite : Colors.grey,
            ),
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: currentIndex == 1
                ? AppColors.kDeepOrangeColor
                : Colors.transparent,
            child: SvgPicture.asset(
              AppAssets.kMapIcon,
              color: currentIndex == 1 ? AppColors.kWhite : Colors.grey,
            ),
          ),
          label: 'مراكز بيع البطاقات',
        ),
      ],
    );
  }
}
