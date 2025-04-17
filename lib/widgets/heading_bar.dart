import 'package:flutter/material.dart';

import 'package:fakestore/services/snackbar.dart';

Padding headingBar(
  BuildContext context,
  String title, {
  String buttonText = "",
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        Builder(
          builder: (context) {
            if (buttonText.isNotEmpty) {
              return TextButton(
                onPressed: () {
                  SnackBarService().showSnackBar("Not Implemented Yet");
                },
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              );
            } else {
              return Text("");
            }
          },
        ),
      ],
    ),
  );
}
