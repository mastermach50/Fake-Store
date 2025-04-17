import 'package:fakestore/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/LoginPageBG.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: _loginPageWidgets(context),
        ),

        Positioned(
          top: 58,
          right: 22,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/main");
            },
            child: Text(
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              "Later",
            ),
          ),
        ),
      ],
    );
  }

  SafeArea _loginPageWidgets(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Welcome Text
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
              "Help your path to health goals with happiness",
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Login Button
                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: Size(327, 54),
                  ),
                  onPressed: () {
                    Provider.of<ProductsProvider>(
                      context,
                      listen: false,
                    ).fetchProducts();
                    Navigator.pushReplacementNamed(context, "/main");
                  },
                  child: Text(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    "Login",
                  ),
                ),

                // New Account Button
                TextButton(
                  style: TextButton.styleFrom(minimumSize: Size(327, 54)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/main");
                  },
                  child: Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    "Create New Account",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
