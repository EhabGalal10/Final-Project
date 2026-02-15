import 'package:flutter/material.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

Future<void> showToast(
  BuildContext context, {
  required String message,
  IconData icon = Icons.check,
  required Color shadowColor,
  required Color backgroundColor,
}) async {
  return await ToastService.showToast(
    context,
    isClosable: true,
    backgroundColor: backgroundColor,
    shadowColor: shadowColor,
    length: ToastLength.medium,
    expandedHeight: 70,
    message: message,
    messageStyle: TextStyle(fontSize: 16, color: Colors.white),
    leading: Icon(icon, color: Colors.white),
    slideCurve: Curves.elasticInOut,
    positionCurve: Curves.bounceOut,
    dismissDirection: DismissDirection.horizontal,
  );
}
