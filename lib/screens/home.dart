import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import 'package:fakestore/providers/products.dart';

import 'package:fakestore/services/snackbar.dart';

import 'package:fakestore/widgets/heading_bar.dart';
import 'package:fakestore/widgets/categories_button_bar.dart';
import 'package:fakestore/widgets/popular_product_card_full.dart';
import 'package:fakestore/widgets/featured_product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProductsProvider provider = Provider.of<ProductsProvider>(
        context,
        listen: false,
      );
      if (provider.products.isEmpty) {
        provider.fetchProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(context),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Section
            headingBar(context, "Featured"),
            featuredCards(),

            // Categories Section
            headingBar(context, "Category", buttonText: "See All"),
            categoryButtonsBar(context),

            // Popular Section
            headingBar(context, "Popular Products", buttonText: "See All"),
            popularProducts(),
          ],
        ),
      ),
    );
  }

  AppBar homeAppbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).canvasColor,
      toolbarHeight: 72,
      title: Container(
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wb_sunny_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedBox(width: 4.83),
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Anonymous',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            IconButton(
              icon: Icon(IconlyLight.buy),
              onPressed: () {
                SnackBarService().showSnackBar("Not Implemented Yet");
              },
            ),
          ],
        ),
      ),
    );
  }

  Consumer<ProductsProvider> featuredCards() {
    return Consumer<ProductsProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (provider.error.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            SnackBarService().showSnackBar(provider.error);
          });
          return Center(child: Text("error"));
        }
        return Container(
          height: 172,
          margin: EdgeInsets.only(left: 24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return Container(
                margin: EdgeInsets.only(right: 16),
                child: featuredProductCard(context, product),
              );
            },
          ),
        );
      },
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
          height: 240,
          margin: EdgeInsets.only(left: 24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.products.length - 3,
            itemBuilder: (context, index) {
              final product = provider.products[index + 3];
              return popularProductCardFull(context, product);
            },
          ),
        );
      },
    );
  }
}
