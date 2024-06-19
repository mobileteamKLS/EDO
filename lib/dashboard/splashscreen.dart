import 'dart:async';

import 'package:e_do/auth/userlogin.dart';
import 'package:e_do/menu/importmenu_edo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getStoredPreferences();
  }

  Future<void> getStoredPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    print(prefs.getBool("isLoggedIn_DO"));
    // print(prefs.getString("userType"));
    // print(prefs.getString("logindate"));
    // print(prefs.getString("displayName"));
    // print(prefs.getInt("UserId"));
    // print(prefs.getInt("orgId"));

    if (prefs.getBool("isLoggedIn_DO") != null) {
      if (prefs.getBool("isLoggedIn_DO") == true) {
        Global.displayName = prefs.getString("displayName_DO").toString();
        Global.currUserId = prefs.getInt("UserId_DO")!;

        Global.orgId = prefs.getInt("orgId_DO")!;
        Global.OrgTypeName = prefs.getString("OrgTypeName_DO").toString();

        if (prefs.getString("userType_DO").toString().toUpperCase() ==
            "TRANSPORTER") {
          Global.isTransporter = true;
          Global.isTerminal = false;
          Global.isPortOperator = false;
        } else {
          if (prefs.getString("userType_DO").toString().toUpperCase() ==
              ("Port Operator".toUpperCase())) {
            Global.isPortOperator = true;
          }

          Global.isTransporter = false;
          Global.isTerminal = true;
        }

        Timer(
            Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => DashboardPage())));
      } else {
        Timer(
            Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => UserLogin())));
      }
    } else {
      Timer(
          Duration(seconds: 1),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => UserLogin())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Image.asset(
          'assets/images/splashscreen.png',
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height - 10,
          width: MediaQuery.of(context).size.width - 10,
        ),
      ),
    );
  }

  // body: SingleChildScrollView(
  //     child: GestureDetector(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(
  //                   left: 8.0, bottom: 8.0, top: 50.0, right: 8.0),
  //               child: Image.asset('assets/images/CODEX-PCS_logo_-1.png'),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Image.asset(
  //                 'assets/images/Splashscreen_image1.png',
  //                 fit: BoxFit.fitWidth,
  //               ),
  //             ),
  //             Image.asset(
  //               'assets/images/Splashscreen_image2.png',
  //               fit: BoxFit.fitWidth,
  //             ),
  //           ],
  //         ),
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => UserLogin()),
  //           );
  //         })),

}
