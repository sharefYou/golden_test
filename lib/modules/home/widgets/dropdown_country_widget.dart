import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:golden_test/shared/assets_manager.dart';
import 'package:golden_test/shared/colors.dart';
import 'package:golden_test/shared/text_styles.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: SvgPicture.asset(
        AppAssets.kDropdownIcon,
      ),
      itemHeight: 50.0,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.kWhite,
          filled: true),
      borderRadius: BorderRadius.circular(8),
      value: cubit.selectedCountryIndex,
      items: List.generate(
        cubit.countriesList.length,
        (index) => DropdownMenuItem(
          alignment: AlignmentDirectional.centerEnd,
          value: cubit.countriesList[index].id,
          onTap: () {
            cubit.selectedCountryIndex = cubit.countriesList[index].id;
            cubit.getSliderImage();
            cubit.getTowns(cubit.selectedCountryIndex).then(
                  (value) => cubit.getCategories(cubit.townsList[0].id),
                );
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Image.network(
                  cubit.rootPath + cubit.countriesList[index].image,
                  width: 19.0,
                  height: 15.0,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  cubit.countriesList[index].name,
                  style: StylesManager.textStyle14,
                ),
              ],
            ),
          ),
        ),
      ),
      onChanged: (value) {},
    );
  }
}
