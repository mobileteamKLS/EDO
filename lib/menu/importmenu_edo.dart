import 'package:e_do/dashboard/dashboard.dart';
import 'package:e_do/menuitems/imp_cargoreleasedashboard.dart';
import 'package:e_do/menuitems/imp_trackandtracedetails.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class ImportMenuEdo extends StatelessWidget {
  const ImportMenuEdo({Key? key}) : super(key: key);

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
            'e-DO',
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
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 35,
              color: Color(0xFF0461AA),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 4.0),
                    child: Text(
                      'e-DO Dashboard',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.arrow_right,
                      size: 36,
                      color: const Color(0xffffffff),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 4.0),
                    child: Text(
                      'e-DO Menu',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                // GestureDetector(
                //   child: menuListItem('icon_ScanDO.png', 'Scan DO'),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ImportScanDo()),
                //     );
                //   },
                // ),
                // SizedBox(height: 10),
                // GestureDetector(
                //   child: menuListItem('icon_DOList.png', 'DO List'),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ImportDoList()),
                //     );
                //   },
                // ),
                // SizedBox(height: 10),
                // GestureDetector(
                //   child: menuListItem('icon_GenerateDO.png', 'Generate DO'),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => ImportGenerateDoList()),
                //     );
                //   },
                // ),
                // SizedBox(height: 10),
                // menuListItem('icon_RevalidateDO.png', 'Revalidate DO'),
                // SizedBox(height: 10),
                Global.OrgTypeName.toLowerCase().contains("terminal")
                    ? GestureDetector(
                        child: menuListItem(
                            'icon_CargoRelease.png', 'Cargo Release'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ImportCargoReleaseDashboard()), // ImportCargoReleaseList()),
                          );
                        },
                      )
                    : Container(),
                SizedBox(height: 10),
                Global.OrgTypeName.toLowerCase().contains("freight") ||
                        Global.OrgTypeName.toLowerCase().contains("importer") ||
                        Global.OrgTypeName.toLowerCase().contains("broker")
                    ? GestureDetector(
                        child: menuListItem(
                            'icon_TrackandTrace.png', 'Track and Trace'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImportTrackTraceDets()),
                          );
                        },
                      )
                    : Container(),
                // SizedBox(height: 10),
                // GestureDetector(
                //   child:
                //       menuListItem('icon_DODownload.png', 'DO View/Download'),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => ImportDoViewDownloadList()),
                //     );
                //   },
                // ),
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
