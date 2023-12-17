import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:golden_test/layout/home_states.dart';
import 'package:golden_test/modules/home/widgets/categories_gridview_widget.dart';
import 'package:golden_test/modules/home/widgets/dropdown_country_widget.dart';
import 'package:golden_test/modules/home/widgets/empty_list_widget.dart';
import 'package:golden_test/modules/home/widgets/horizontal_towns_widget.dart';
import 'package:golden_test/modules/home/widgets/search_text_field_widget.dart';
import 'package:golden_test/modules/home/widgets/slider_images_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit().get(context);
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: cubit.countriesList.isNotEmpty
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DropDownWidget(cubit: cubit),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ImageSliderWidget(cubit: cubit),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const SearchTextFieldWidget(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      HorizontalTownsWidget(cubit: cubit),
                      if (state is GetCategoriesLoadingState)
                        const Center(
                          child: CircularProgressIndicator(),
                        )
                      else if (cubit.categoriesList.isNotEmpty)
                        GridViewCategoriesWidget(cubit: cubit)
                      else
                        const EmptyListWidget()
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
