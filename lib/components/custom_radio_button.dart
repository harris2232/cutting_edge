import 'package:flutter/material.dart';
import 'package:cutting_edge/support_files/constants.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {this.value, this.groupValue, this.onChanged, this.trailing});

  final dynamic value;
  final dynamic groupValue;
  final Function onChanged;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: kPrimaryColor,
        ),
        Text(
          trailing,
          style: TextStyle(
            color: value == groupValue ? kPrimaryColor : Colors.grey,
            fontSize: 20.0,
            fontFamily: 'Ubuntu',
          ),
        ),
      ],
    );
  }
}
