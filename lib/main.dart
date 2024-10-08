import 'package:rewards_converter/screens/initial_screen.dart';
import 'package:rewards_converter/screens/login_screen.dart';
import 'package:rewards_converter/screens/profile/profile_info_screen.dart';
import 'package:rewards_converter/screens/transaction/transaction_details_screen.dart';
import 'package:rewards_converter/screens/webview/about_us_screen.dart';
import 'package:rewards_converter/screens/webview/contact_us_screen.dart';
import 'package:rewards_converter/screens/webview/privacy_policy_screen.dart';
import 'package:rewards_converter/screens/webview/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'helpers/functions.dart';

void main() async {
  runApp(const RewardsConverterApp());
}

class RewardsConverterApp extends StatefulWidget {
  const RewardsConverterApp({super.key});

  @override
  State<RewardsConverterApp> createState() => _RewardsConverterAppState();
}

class _RewardsConverterAppState extends State<RewardsConverterApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rewards Converter Global',
      themeMode: ThemeMode.light,
      theme: ThemeData(colorSchemeSeed: Colors.red, useMaterial3: true),
      routes: {
        '/profile-info': (context) => ProfileInfoScreen(),
        '/login': (context) => LoginScreen(),
        '/about-us': (context) => AboutUsScreen(),
        '/privacy-policy': (context) => PrivacyPolicyScreen(),
        '/terms-and-conditions': (context) => TermsAndConditionsScreen(),
        '/contact-us': (context) => ContactUsScreen(),
        '/transaction-details': (context) => TransactionDetailsScreen(
              arguments: ModalRoute.of(context)!.settings.arguments as Map,
            ),
      },
      home: FutureBuilder(
        future: isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != false) {
              return InitialScreen();
            } else {
              return LoginScreen();
            }
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
