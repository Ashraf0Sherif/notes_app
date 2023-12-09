import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Remove note"),
      content: Text("Are you sure ?"),
      actions: [
        CupertinoDialogAction(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text("Remove"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
