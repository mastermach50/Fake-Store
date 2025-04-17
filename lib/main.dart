import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fakestore/screens/login.dart';
import 'package:fakestore/screens/main_screen.dart';

import 'package:fakestore/providers/navigation.dart';
import 'package:fakestore/providers/products.dart';

import 'package:fakestore/services/snackbar.dart';

void main() {
  runApp(const Recipes());
}

class Recipes extends StatelessWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],

      child: MaterialApp(
        title: 'Fake Store App',
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xff042628),
            onPrimary: Colors.white,
            secondary: Color(0xff70B9BE),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        initialRoute: "/login",
        routes: {
          "/login": (context) => LoginScreen(),
          "/main": (context) => MainScreen(),
        },
        scaffoldMessengerKey: SnackBarService.messengerKey,
      ),
    );
  }
}
