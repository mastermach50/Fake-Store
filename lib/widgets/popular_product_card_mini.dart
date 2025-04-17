import 'package:flutter/material.dart';

import 'package:fakestore/models/product.dart';

import 'package:fakestore/screens/product.dart';

Widget popularProductsCardMini(BuildContext context, Product product) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductScreen(product: product),
        ),
      );
    },
    child: Container(
      height: 136,
      width: 100,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 2),
            color: Color(0x18063336),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 84,
            width: 84,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(product.image),
          ),
          SizedBox(height: 12),
          SizedBox(
            child: Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ),
  );
}
