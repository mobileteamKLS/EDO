import 'package:e_do/auth/userlogin.dart';
import 'package:e_do/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Container menuListItem(iconName, menuItemText) {
  return Container(
    height: 70,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(36.0),
      color: const Color(0xffffffff),
      boxShadow: [
        BoxShadow(
          color: const Color(0x40000000),
          offset: Offset(0, 3),
          blurRadius: 6,
        ),
      ],
    ),
    child: ListTile(
        leading: Image.asset(
          'assets/icons/' + iconName,
        ),
        trailing: Icon(
          //Icons.expand_more,
          FontAwesomeIcons.chevronRight,
          size: 22,
          color: const Color(0xff0461aa),
        ),
        title: Text(menuItemText)),
  );
}

generateAppBar(BuildContext context, appBarText) {
  return AppBar(
    //leading: Container(),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: GestureDetector(
          child: Icon(
            // Icons.menu,
            FontAwesomeIcons.ellipsisV,
            size: 22,
            color: const Color(0xFFF4F7FB),
          ),
          onTapDown: (TapDownDetails details) {
            if (appBarText.toString().toLowerCase() == "home")
              showPopUpMenu(details.globalPosition, context);
            else
              showPopUpMenuHome(details.globalPosition, context);
          },
        ),
      ),
    ],
    backgroundColor: Color(0xFF0461AA),
    title: Center(
      child: Text(
        appBarText,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: const Color(0xffffffff),
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

showPopUpMenu(Offset globalPosition, context) {
  double left = globalPosition.dx;
  double top = globalPosition.dy;
  return showMenu(
    color: Colors.white,
    //add your color
    context: context,
    position: RelativeRect.fromLTRB(left, top, 0, 0),
    items: [
      PopupMenuItem(
        value: 1,
        child: GestureDetector(
          child: Row(
            children: [
              Icon(Icons.power_settings_new_sharp),
              SizedBox(
                width: 10,
              ),
              Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => UserLogin()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    ],
    elevation: 8.0,
  ).then((value) {
    print(value);
    if (value == 1) {
      showAlertDialog(context);
    }
  });
}

showPopUpMenuHome(Offset globalPosition, context) {
  double left = globalPosition.dx;
  double top = globalPosition.dy;
  return showMenu(
    color: Colors.white,
    //add your color
    context: context,
    position: RelativeRect.fromLTRB(left, top, 0, 0),
    items: [
      PopupMenuItem(
        value: 1,
        child: GestureDetector(
          child: Row(
            children: [
              Icon(Icons.power_settings_new_sharp),
              SizedBox(
                width: 10,
              ),
              Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => UserLogin()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: GestureDetector(
          child: Row(
            children: [
              Icon(Icons.home),
              SizedBox(
                width: 10,
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          onTap: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    ],
    elevation: 8.0,
  ).then((value) {
    print(value);
    if (value == 1) {
      showAlertDialog(context);
    }
  });
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      'No',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: const Color(0xff0461aa),
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.center,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      'Yes',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: const Color(0xff0461aa),
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.center,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserLogin()),
      );
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("AlertDialog"),

    content: Text(
      'Are you sure you want to sign out?',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: const Color(0xff3a3a3a),
      ),
      textAlign: TextAlign.center,
    ),
    actions: [
      Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          cancelButton,
          continueButton,
        ],
      ),
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

labelText(BuildContext context, lblText) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0),
    child: Text(
      lblText,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.left,
    ),
  );
}

labelHeaderText(BuildContext context, lblText) {
  return Text(
    lblText,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: const Color(0xff6b6b6b),
    ),
    textAlign: TextAlign.left,
  );
}

bottomCompanyNameBar(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 30,
    color: Color(0xFF0461AA),
    child: Center(
      child: Text(
        'Powered By Kale Logistics Solutions',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 11,
          color: const Color(0xffffffff),
          letterSpacing: 0.19139999580383302,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

timelineLabelText(BuildContext context, lblText) {
  return Text(
    lblText,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      color: const Color(0xff6b6b6b),
      fontWeight: FontWeight.normal,
    ),
    textAlign: TextAlign.left,
  );
}

returnWeightVals(dcWeight, strWeightUnit) {
  String printWeight = "";
  if (dcWeight != null) if (dcWeight != "") {
    printWeight = dcWeight + " " + strWeightUnit;
  }
  return printWeight;
}

returnFormattedDate(revalidity) {
  var validityDate = "";
  if (revalidity != null) {
    var dsplit = revalidity.split(" ");
    validityDate = dsplit[0].toString().replaceAll("-", "/");
  }
  return validityDate;
}

returnFormattedDateTime(revalidity) {
  var validityDate = "";
  if (revalidity != null) {
    var dsplit = revalidity.split(" ");
    validityDate = dsplit[0].toString().replaceAll("-", "/");

    var timeArray = dsplit[1].split(":");
    validityDate = validityDate + " " + timeArray[0] + ":" + timeArray[1];
  }
  return validityDate;
}
