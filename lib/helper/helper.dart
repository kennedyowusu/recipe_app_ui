import 'package:flutter/material.dart';

Center logoContainer() {
  return Center(
    child: CircleAvatar(
      radius: 60,
      backgroundColor: Colors.grey[100],
      backgroundImage: const AssetImage(
        'assets/images/logo.png',
      ),
    ),
  );
}

Text actionText({
  Key? key,
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
