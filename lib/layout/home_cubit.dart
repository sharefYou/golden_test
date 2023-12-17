// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_test/layout/home_states.dart';
import 'package:golden_test/models/call_center_model.dart';
import 'package:golden_test/models/categories_model.dart';
import 'package:golden_test/models/countries_model.dart';
import 'package:golden_test/models/slider_model.dart';
import 'package:golden_test/models/towns_model.dart';
import 'package:golden_test/modules/callCenter/call_center_screen.dart';
import 'package:golden_test/modules/home/home_screen.dart';
import 'package:golden_test/shared/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  HomeCubit get(context) => BlocProvider.of(context);

  int selectedCountryIndex = 1;
  String rootPath = 'https://ofrlk.com/';

  List<CountriesModel> countriesList = [];

  int bottomNavCurrentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CallCenterScreen(),
  ];

  void changeBottomNavCurrentIndex(index) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavCurrentIndexState());
  }

  void getCountries() {
    emit(GetCountriesLoadingState());
    DioHelper.getData(endPoint: 'get-all-countries').then((value) {
      for (var element in value.data['data']) {
        countriesList.add(CountriesModel.fromJson(element));
      }
      getSliderImage();
      getTowns(selectedCountryIndex)
          .then((value) => getCategories(townsList[0].id));
      emit(GetCountriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCountriesErrorState());
    });
  }

  List<SliderModel> sliderList = [];

  void getSliderImage() {
    sliderList = [];
    emit(GetSliderLoadingState());
    DioHelper.getData(endPoint: 'get-slider-image').then((value) {
      for (var element in value.data['data']) {
        if (selectedCountryIndex == element['country_id']) {
          sliderList.add(SliderModel.fromJson(element));
        }
      }
      emit(GetSliderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSliderErrorState());
    });
  }

  int carouselIndex = 0;

  void changeCarouselIndex(index) {
    carouselIndex = index;
    emit(ChangeCarouselState());
  }

  List<TownsModel> townsList = [];

  Future<void> getTowns(index) async {
    townsList = [];
    emit(GetSliderLoadingState());
    await DioHelper.getData(endPoint: 'country/$index').then((value) {
      for (var element in value.data['data']) {
        townsList.add(TownsModel.fromJson(element));
      }
      selectedHorizontalIndex = townsList[0].id;
      print(townsList[0].id);
      emit(GetSliderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSliderErrorState());
    });
  }

  int selectedHorizontalIndex = 1;

  void changeHorizontalIndex(index) {
    selectedHorizontalIndex = index;
    emit(ChangeHorizontalIndexState());
  }

  List<CategoriesModel> categoriesList = [];

  void getCategories(index) {
    categoriesList = [];
    emit(GetCategoriesLoadingState());
    DioHelper.getData(endPoint: 'get-city-categories/$index').then((value) {
      for (var element in value.data['data']) {
        categoriesList.add(CategoriesModel.fromJson(element));
      }
      emit(GetSliderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesErrorState());
    });
  }

  List<CallCenterModel> callCenterList = [];

  void getCallCenter() {
    callCenterList = [];
    emit(GetCallCenterLoadingState());
    DioHelper.getData(endPoint: 'get-all-sell-centers').then((value) {
      for (var element in value.data['data']) {
        callCenterList.add(CallCenterModel.fromJson(element));
      }
      emit(GetCallCenterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCallCenterErrorState());
    });
  }

}
