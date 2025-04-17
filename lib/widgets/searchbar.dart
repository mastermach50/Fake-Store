import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

Container searchbar(TextEditingController searchController) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(width: 2, color: Color(0xFFE6EBF2)),
    ),
    child: TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Color(0xFF97A2B0)),
        prefixIcon: const Icon(IconlyLight.search),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      ),
      onChanged: (value) {},
    ),
  );
}
