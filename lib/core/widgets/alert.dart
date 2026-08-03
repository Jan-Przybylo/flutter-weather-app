import 'package:flutter/cupertino.dart';

class Alert {
  static bool isShow = false;
  static void show(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    isShow = true;
    showCupertinoDialog<void>(
      context: context,
      builder: ((context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              isShow = false;
              Navigator.of(context).pop();
            },
            child: const Text('ok'),
          ),
        ],
      )),
    );
  }
}
