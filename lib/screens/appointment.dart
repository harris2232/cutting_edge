import 'package:cutting_edge/components/custom_check_box.dart';
import 'package:cutting_edge/components/custom_radio_button.dart';
import 'package:cutting_edge/support_files/constants.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 16, vertical: height / 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Appointment',
                textAlign: TextAlign.center,
                style: kScreenTitleTextStyle.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomRadioButton(
                    value: 0,
                    groupValue: 0,
                    onChanged: (value) {
                      print(value);
                    },
                    trailing: 'Men',
                  ),
                  CustomRadioButton(
                    value: 1,
                    groupValue: 0,
                    onChanged: (value) {
                      print(value);
                    },
                    trailing: 'Women',
                  ),
                ],
              ),
              CheckboxListTile(
                value: true,
                trailing: '\$5',
                onChanged: (value) {
                  print(value);
                },
                title: 'Hair Cut',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckboxListTile extends StatelessWidget {
  CheckboxListTile({this.trailing, this.onChanged, this.value, this.title});

  final bool value;
  final Function onChanged;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCheckBox(
          value: value,
          onChanged: onChanged,
          trailing: title,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Text(
            trailing,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
      ],
    );
  }
}
