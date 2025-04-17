import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import 'package:fakestore/providers/navigation.dart';

PreferredSize commonAppbar(BuildContext context, String appbarTitle) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight + 24),
    child: Container(
      padding: EdgeInsets.all(16),
      child: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Provider.of<NavigationProvider>(context, listen: false).setIndex(0);
          },
          icon: Icon(IconlyLight.arrowLeft, size: 34),
        ),
        title: Text(
          appbarTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}
