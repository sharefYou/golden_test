import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_test/shared/assets_manager.dart';
import 'package:golden_test/shared/colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.kBorderColor,
        ),
        color: AppColors.kWhite
      ),
      child: TextFormField(
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'بحث',

            prefixIconConstraints: const BoxConstraints(
              minWidth: 28.0,
              maxHeight: 28.0,
            ),
            prefixIcon: SvgPicture.asset(
              AppAssets.kSearchIcon,
              width: 14.0,
              height: 14.0,
            )),
      ),
    );
  }
}
