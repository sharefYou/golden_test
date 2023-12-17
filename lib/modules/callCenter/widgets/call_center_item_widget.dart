import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_test/models/call_center_model.dart';
import 'package:golden_test/shared/assets_manager.dart';
import 'package:golden_test/shared/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CallCenterItem extends StatelessWidget {
  const CallCenterItem({
    super.key,
    required this.model,
  });

  final CallCenterModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 37,
          backgroundImage: NetworkImage(model.image),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.kCenterMobileIcon,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    model.phoneNumber,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11.0,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.kCenterDescIcon,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      model.description,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11.0,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
                onTap: () async {
                  if (await canLaunchUrlString(model.locationLink)) {
                  await launchUrlString(model.locationLink);

                  } else {
                  print('Count not open the map.');
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.kCenterLocationIcon),
                        const SizedBox(
                          width: 6.0,
                        ),
                        const Text(
                          'الموقع على الخريطة',
                          style: TextStyle(
                              fontSize: 11,
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: 108,
                      height: 1,
                      color: AppColors.kPrimaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
