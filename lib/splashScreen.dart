import 'package:flutter/material.dart';
import 'package:karma/features/auth/LoginPage.dart';
import 'package:karma/features/drives/drives_page.dart';
import 'package:karma/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? ctoken;
  checkLogin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    ctoken = _pref.getString('token');
    print(ctoken);
    if (ctoken != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DrivesPage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primary,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
