import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:fakestore/providers/products.dart';

import 'package:fakestore/services/snackbar.dart';

Consumer<ProductsProvider> categoryButtonsBar(BuildContext context) {
  return Consumer<ProductsProvider>(
    builder: (context, provider, _) {
      if (provider.isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (provider.error.isNotEmpty) {
        return Center(child: Text("error"));
      }
      return Container(
        height: 41,
        margin: EdgeInsets.only(left: 24),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provider.categories.length,
          itemBuilder: (context, index) {
            Color bgcolor = Color(0xFFF1F5F5);
            Color fgcolor = Colors.black;
            if (index == 0) {
              bgcolor = Theme.of(context).colorScheme.secondary;
              fgcolor = Colors.white;
            }
            return Container(
              margin: EdgeInsets.only(right: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: bgcolor,
                  foregroundColor: fgcolor,
                ),
                onPressed: () {
                  SnackBarService().showSnackBar("Not Implemented Yet");
                },
                child: Text(provider.categories[index]),
              ),
            );
          },
        ),
      );
    },
  );
}
