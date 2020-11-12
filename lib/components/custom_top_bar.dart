import 'package:flutter/material.dart';
import 'package:cutting_edge/support_files/constants.dart';

class CustomTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 70.0, bottom: 25.0, left: 25.0, right: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cancel',
              style: kNavigationButtonTextStyle,
            ),
            Text(
              'Filter',
              style: kScreenTitleTextStyle,
            ),
            Text(
              'Apply',
              style: kNavigationButtonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
