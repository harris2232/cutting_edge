import 'package:flutter/material.dart';
import 'package:cutting_edge/support_files/constants.dart';

class CustomSwitchButton extends StatelessWidget {
  CustomSwitchButton(
      {@required this.label, this.isSelected = false, this.onPressed});

  final String label;
  final bool isSelected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: isSelected
              ? BorderSide(
                  color: kPrimaryColor,
                  width: 1,
                  style: BorderStyle.solid,
                )
              : BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
        ),
        onPressed: onPressed,
        color: isSelected ? kPrimaryColor : Colors.white,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontFamily: 'Ubuntu',
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
