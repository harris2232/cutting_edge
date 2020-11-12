import 'package:flutter/material.dart';
import 'package:cutting_edge/support_files/constants.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({this.onChanged, this.trailing, this.value});

  final bool value;
  final Function onChanged;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: kPrimaryColor,
          value: value,
          onChanged: onChanged,
        ),
        Text(
          trailing,
          style: TextStyle(
            color: value ? kPrimaryColor : Colors.grey,
            fontSize: 20.0,
            fontFamily: 'Ubuntu',
          ),
        ),
      ],
    );
  }
}
