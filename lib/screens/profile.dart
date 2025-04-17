import 'package:fakestore/providers/products.dart';
import 'package:fakestore/services/snackbar.dart';
import 'package:fakestore/widgets/favourite_product_card.dart';
import 'package:fakestore/widgets/heading_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 24),
        child: Container(
          padding: EdgeInsets.all(16),
          child: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(null)),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                IconButton(
                  onPressed: () {
                    SnackBarService().showSnackBar("Not Implemented Yet");
                  },
                  icon: Icon(IconlyLight.setting),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          userHeader(),
          headingBar(context, "My Favourites", buttonText: "View All"),
          Expanded(child: favouriteProducts()),
        ],
      ),
    );
  }

  Container userHeader() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 2),
            color: Color(0x18063336),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/profile.jpg',
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Anonymous',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              IconlyLight.arrowRight,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}

Widget favouriteProducts() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Consumer<ProductsProvider>(
      builder: (context, provider, _) {
        if (provider.favourites.isEmpty) {
          return Center(child: Text("Nothing in favourites"));
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: provider.favourites.length,
          itemBuilder: (context, index) {
            final product = provider.favourites[index];
            return favouriteProductCard(context, product);
          },
        );
      },
    ),
  );
}
