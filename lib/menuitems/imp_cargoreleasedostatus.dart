import 'dart:convert';

import 'package:e_do/constants/constants.dart';
import 'package:e_do/menuitems/imp_cargoreleasecdelivery.dart';
import 'package:e_do/menuitems/pdfscreen.dart';
import 'package:e_do/widgets/commonwodgets.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import 'imp_cargoreleasecompleted.dart';
import 'imp_cargoreleaseloaded.dart';

import 'package:http/http.dart' as http;

class ImportCargoDoStatus extends StatefulWidget {
  final String? doNumber;
  final String? qrCodeNo;
  const ImportCargoDoStatus({Key? key, this.doNumber, this.qrCodeNo})
      : super(key: key);

  @override
  _ImportCargoDoStatusState createState() => _ImportCargoDoStatusState();
}

class _ImportCargoDoStatusState extends State<ImportCargoDoStatus> {
  var doDetails = {"orgid": Global.orgId, "DONo": ""};
  var doDerailsArr = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDoDetails();
  }

  void getDoDetails() async {
    try {
      setState(() {
        doDerailsArr = [];
        isLoading = true;
      });

      // await showLoadingMsg(context, true);
      print("****getDoDetails**** ");
      doDetails['DONo'] = this.widget.doNumber.toString();
      await Global()
          .postData(
        Settings.SERVICES['DoDetails'],
        doDetails,
      )
          .then((response) {
        if (response.statusCode == 200) {
          print("data received in getDoDetails ");
          var parsed = json.decode(response.body)['response'];
          var resp = json.decode(parsed).cast<Map<String, dynamic>>();
          print(resp);
          setState(() {
            doDerailsArr = resp;
            print("doDerailsArr.length.toString()");
            print(doDerailsArr.length.toString());
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "DO Status"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? Center(
                      child: Container(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator()))
                  : ListView(children: [
                      Container(
                        height: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x40000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Text(
                          "DO # : " + this.widget.doNumber.toString(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0461AA),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        child:
                            menuListItem('icon_ScanDO.png', 'View DO Details'),
                        onTap: () async {
                          await getDODocument(
                              context,
                              this
                                  .widget
                                  .qrCodeNo
                                  .toString()); //"DO00022032276676");
                        },
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: menuListItem('icon_DOList.png', 'Cargo Release'),
                        onTap: () async {
                          //var doStatus = this.doDerailsArr[0]['DOStatus'];
                          var isCargoRelease =
                              this.doDerailsArr[0]['isCargoRelease'];
                          //  var errmsg = "";

                          // if ((doStatus == "Expired" || doStatus == "Hold") &&
                          //     (isCargoRelease == "0" ||
                          //         isCargoRelease == "2")) {
                          //   errmsg =
                          //       "User cannot the release the cargo as the DO is expired.";
                          //   showMessageBox(context, "OK", "DO expired", errmsg);
                          //   return;
                          // } else if (isCargoRelease == "1") {
                          //   errmsg = "Cargo Release Confirmation already done.";
                          //   showMessageBox(
                          //       context, "OK", "Cargo Release Done", errmsg);
                          //   return;
                          // } else if (doStatus == "Rev Requested") {
                          //   errmsg =
                          //       "User cannot the release the cargo as the DO is expired.";
                          //   showMessageBox(context, "OK", "DO expired", errmsg);
                          //   return;
                          // } else if (doStatus == "Rev Payment Pending") {
                          //   errmsg =
                          //       "User cannot the release the cargo as the DO is expired.";
                          //   showMessageBox(context, "OK", "DO expired", errmsg);
                          //   return;
                          // } else if (doStatus == "Rev Payment Confirm") {
                          //   errmsg =
                          //       "User cannot the release the cargo as the DO is expired.";
                          //   showMessageBox(context, "OK", "DO expired", errmsg);
                          //   return;
                          // }

                          if (isCargoRelease == "0" || isCargoRelease == "2") {
                            var getval = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => doDerailsArr[0]
                                              ["ShipmentType"] ==
                                          "Loaded Delivery"
                                      ? ImportCargoReleaseLoaded(
                                          doDerailsArr:
                                              this.doDerailsArr.toList())
                                      : ImportCargoReleaseCDelivery(
                                          doDerailsArr:
                                              this.doDerailsArr.toList())),
                            );
                            if (getval != null) getDoDetails();
                          } else {
                            if (isCargoRelease == "1") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ImportReleaseCompleted(
                                          doDerailsArr: doDerailsArr[0],
                                        )),
                              );
                            }
                          }
                        },
                      ),
                    ]),
            ),
          ),
          bottomCompanyNameBar(context),
        ],
      ),
    );
  }

  getDODocument(context, uniquedo) async {
    print("get dpocument called here for " + uniquedo);
    showLoadingDialog(context, true); //Settings.SERVER_URL
    var urlPath = Settings.SERVER_URL + "GetViewDoPrint";
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(urlPath));
    request.body = json.encode({"uniquedo": uniquedo});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(response);
      print(await json.decode(json.encode(response.headers)));
      print(response.headers.length);
      Map<String, String> header = new Map();
      header = response.headers;
      var searchKey = "content-disposition";
      header.forEach((key, value) {
        if (key.toUpperCase() == searchKey.toUpperCase()) {
          print(key + " -- " + value);
          // ignore: unnecessary_null_comparison
          if (value == null) return;


          final keyString = value;
          final splitted = keyString.split(';');
          print(splitted);
          final fileName = (splitted[1].toString().replaceAll("filename=", ""))
              .replaceAll("\"", "");
          print("fileName === " + fileName);
//https://pcs.codexcommunity.com/THWebAPI/ReportBuilder/ <-- live link
//https://edouat.kalelogistics.com/DOAPI/ReportBuilder/<-- uat link
          var finalfilepath =
              "https://pcs.codexcommunity.com/THWebAPI/ReportBuilder/" + fileName;
          showLoadingDialog(context, false);
          viewPdf(context, finalfilepath, fileName);
        }
      });
    } else {
      showLoadingDialog(context, false);
      print("status" + response.reasonPhrase.toString());
      showMessageBox(
          context, "OK", "No record found", "No data available for DO# !");
    }
  }

  viewPdf(context, docURL, docName) {
    showLoadingDialog(context, true);
    createFileOfPdfUrl(docURL).then((f) {
      print(f);

      if (f.path.isNotEmpty) {
        showLoadingDialog(context, false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFScreen(path: f.path, pgTitle: docName),
          ),
        );
      } else
        showLoadingDialog(context, false);
    });
  }

  showLoadingMsg(BuildContext context, isLoad) {
    isLoad
        ? showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return SimpleDialog(
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(
                            color: Color(0xFF0461AA),
                          ),
                        )
                      ]),
                    )
                  ]);
            })
        : Navigator.pop(context);
  }
}
