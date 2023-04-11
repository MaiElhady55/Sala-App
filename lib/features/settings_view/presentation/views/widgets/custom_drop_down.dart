import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';

class CustomDropDwon extends StatefulWidget {
  CustomDropDwon({super.key});

  @override
  State<CustomDropDwon> createState() => _CustomDropDwonState();
}

class _CustomDropDwonState extends State<CustomDropDwon> {
  @override
  final List<String> myList = ['USD', 'EGP', 'EUR', 'AED'];

  String dropdownValue = 'USD';

  Widget build(BuildContext context) {
    return DropdownButton<String>(
        elevation: 16,
        value: dropdownValue,
        style: TextStyle(color: AppColors.kPrimaryColor),
        items: myList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            dropdownValue = val!;
          });
        });
  }
}
