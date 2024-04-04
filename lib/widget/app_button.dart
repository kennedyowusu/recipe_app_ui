import 'package:flutter/material.dart';
import 'package:recipe_app/constant/theme/app_color.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final String routeName;

  const AppButton({
    Key? key,
    required this.buttonText,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, routeName);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
