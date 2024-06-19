import 'package:e_do/dashboard/dashboard.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

import 'importmenu_edo.dart';

class ImportMenu extends StatelessWidget {
  const ImportMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 8.0),
        //   child: Icon(
        //     Icons.home,
        //     size: 28,
        //     color: const Color(0xFFF4F7FB),
        //   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
                child: Icon(
                  Icons.home,
                  size: 28,
                  color: const Color(0xFFF4F7FB),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                    (Route<dynamic> route) => false,
                  );
                }),
          ),
        ],
        backgroundColor: Color(0xFF0461AA),
        title: Center(
          child: Text(
            'Import',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                //  MenuItem(),

                // menuListItem('icon_menulist.png', 'Arrival Notice'),
                // SizedBox(height: 10),
                // menuListItem('icon_menulist.png', 'Transshipment Listing'),
                // SizedBox(height: 10),
                // menuListItem('icon_menulist.png', 'IM Filing'),
                // SizedBox(height: 10),
                // menuListItem('icon_menulist.png', 'IAL'),
                // SizedBox(height: 10),
                // menuListItem('icon_menulist.png', 'M&R'),
                // SizedBox(height: 10),
                GestureDetector(
                  child: menuListItem('icon_menulist.png', 'e-DO'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImportMenuEdo()),
                    );
                  },
                ),
                // SizedBox(height: 10),
                // menuListItem('icon_menulist.png', 'Tracker'),
              ]),
            ),
          ),
          bottomCompanyNameBar(context),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 30,
          //   color: Color(0xFF0461AA),
          //   child: Center(
          //     child: Text(
          //       'Powered By Kale Logistics Solutions',
          //       style: TextStyle(
          //         fontFamily: 'Roboto',
          //         fontSize: 11,
          //         color: const Color(0xffffffff),
          //         letterSpacing: 0.19139999580383302,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
