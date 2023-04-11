import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/visa_card.dart';

class CustomCardTextField extends StatelessWidget {
  const CustomCardTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyText1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CardNumberFormatter()
        ],
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(25.0),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
              height: 30,
              width: 30,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Change',
              style: TextStyle(color: AppColors.kPrimaryColor),
            ),
          ),
          border: OutlineInputBorder(),
          hintText: 'XXXX XXXX XXXX XXXX',
          labelText: 'Card Number',
          hintStyle: TextStyle(color: Color(0xFF8D8E98)),
          labelStyle: TextStyle(color: AppColors.kPrimaryColor),
        ),
        maxLength: 19,
        onChanged: (value) {},
      ),
    );
  }
}
