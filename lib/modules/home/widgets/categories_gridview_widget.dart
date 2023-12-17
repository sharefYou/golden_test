import 'package:flutter/material.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:golden_test/shared/text_styles.dart';

class GridViewCategoriesWidget extends StatelessWidget {
  const GridViewCategoriesWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      childAspectRatio: 1 / 1.14,
      children: List.generate(
        cubit.categoriesList.length,
        (index) => Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    cubit.rootPath + cubit.categoriesList[index].image,
                    width: double.infinity,
                    height: 140.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Text(
                cubit.categoriesList[index].name,
                style: StylesManager.textStyle14
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
