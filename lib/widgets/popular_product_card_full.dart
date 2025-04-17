import 'package:flutter/material.dart';

import 'package:fakestore/models/product.dart';

import 'package:fakestore/screens/product.dart';

Widget popularProductCardFull(BuildContext context, Product product) {
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
      height: 240,
      width: 200,
      padding: EdgeInsets.all(16),
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
            height: 128,
            width: 168,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(product.image),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 44,
            child: Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.category,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                "\$${product.price}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
