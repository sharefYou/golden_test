import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:golden_test/layout/home_states.dart';
import 'package:golden_test/modules/callCenter/widgets/call_center_item_widget.dart';
import 'package:golden_test/shared/assets_manager.dart';
import 'package:golden_test/shared/colors.dart';

class CallCenterScreen extends StatelessWidget {
  const CallCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var callCenterList = HomeCubit().get(context).callCenterList;
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: HomeCubit().get(context).callCenterList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => HomeCubit()
                          .get(context)
                          .changeBottomNavCurrentIndex(0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(AppAssets.kArrowBackIcon),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            CallCenterItem(model: callCenterList[index]),
                        separatorBuilder: (context, index) => const Divider(
                          color: Color(0xFFE8E8E8),
                        ),
                        itemCount: callCenterList.length,
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
