import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 75.0),
      child: Column(
        children: [
          Icon(
            Icons.perm_device_info,
            size: 75.0,
            color: Color(0xFFF22D00),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'لا يوجد بيانات في هذه المحافظة',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
