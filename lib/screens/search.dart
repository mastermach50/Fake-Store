import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fakestore/providers/products.dart';

import 'package:fakestore/widgets/searchbar.dart';
import 'package:fakestore/widgets/heading_bar.dart';
import 'package:fakestore/widgets/categories_button_bar.dart';
import 'package:fakestore/widgets/popular_product_card_mini.dart';
import 'package:fakestore/widgets/editors_choice_card.dart';
import 'package:fakestore/widgets/common_appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, "Search"),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Searchbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: searchbar(_searchController),
            ),
            SizedBox(height: 16),

            // Category buttons
            categoryButtonsBar(context),

            // Popular Section
            headingBar(context, "Popular Products", buttonText: "View All"),
            popularProducts(),

            headingBar(context, "Editor's Choice", buttonText: "View All"),
            editorsChoice(context),
          ],
        ),
      ),
    );
  }

  Consumer<ProductsProvider> popularProducts() {
    return Consumer<ProductsProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (provider.error.isNotEmpty) {
          return Center(child: Text("error"));
        }
        return Container(
          height: 136,
          margin: EdgeInsets.only(left: 24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.products.length - 3,
            itemBuilder: (context, index) {
              final product = provider.products[index + 3];
              return popularProductsCardMini(context, product);
            },
          ),
        );
      },
    );
  }

  Consumer<ProductsProvider> editorsChoice(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (provider.error.isNotEmpty) {
          return Center(child: Text("error"));
        }
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return editorsChoiceCard(context, product);
            },
          ),
        );
      },
    );
  }
}
