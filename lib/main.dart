import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_test/layout/home_layout.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:golden_test/shared/bloc_observer.dart';
import 'package:golden_test/shared/colors.dart';
import 'package:golden_test/shared/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initialDio();
  Bloc.observer = MyBlocObserver();
  runApp(const GoldenTest());
}

class GoldenTest extends StatelessWidget {
  const GoldenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCountries()..getCallCenter(),
      child: MaterialApp(
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: HomeLayout(),
          ),
        ),
        theme: ThemeData(
          primarySwatch: convColors(AppColors.kPrimaryColor),
          useMaterial3: false,
          fontFamily: 'Tajawal',
          scaffoldBackgroundColor: AppColors.kBackgroundColor
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
