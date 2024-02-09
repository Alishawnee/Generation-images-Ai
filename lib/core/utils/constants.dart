import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aichat/core/utils/app_colors.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  static void showToast(context,
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: msg,
        backgroundColor: color ??
            (AdaptiveTheme.of(context).mode.isDark
                ? AppColors.primaryDark
                : AppColors.primaryLight),
        gravity: gravity ?? ToastGravity.BOTTOM);
  }
}
