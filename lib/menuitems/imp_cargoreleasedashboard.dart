import 'dart:convert';

import 'package:e_do/constants/constants.dart';
import 'package:e_do/menuitems/qr_scan.dart';
import 'package:e_do/widgets/commonwodgets.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../global.dart';
import 'imp_cargoreleasecompleted.dart';
import 'imp_cargoreleasedostatus.dart';

class ImportCargoReleaseDashboard extends StatefulWidget {
  const ImportCargoReleaseDashboard({Key? key}) : super(key: key);

  @override
  State<ImportCargoReleaseDashboard> createState() =>
      _ImportCargoReleaseDashboardState();
}

class _ImportCargoReleaseDashboardState
    extends State<ImportCargoReleaseDashboard> {
  final tokenController = TextEditingController();
  bool isValid = true, isLoading = false, isShowList = false;
  final _formKey = GlobalKey<FormState>();
  var doDerailsArr = [];
  // final DateTime dtStartWid;
  // final DateTime dtEndWid;
  late DateTimeRange selectedDateRange;
  final _dateController = TextEditingController();
  DateTime dtStart = DateTime.now();
  DateTime dtEnd = DateTime.now().add(const Duration(days: 5));
  String fromDateStr = "", toDateStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "Cargo Release"),
      body: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffe1e1e1)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x14000000),
                      offset: Offset(0, 3),
                      blurRadius: 4,
                    ),
                  ],
                ),

                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 8.0, bottom: 8.0, left: 0.0),
                          child: SizedBox(
                              width: MediaQuery.of(context)
                                  .size
                                  .width, // hard coding child width
                              child: TextFormField(
                                readOnly: true,
                                controller: _dateController,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xff3a3a3a)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xff3a3a3a)),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xff3a3a3a)),
                                    ),
                                    hintText: "Select DO Validity Date Range",
                                    labelStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      color: const Color(0xff3a3a3a),
                                    )),
                                onTap: () async {
                                  await showDateRangePicker(
                                    context: context,
                                    //  initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2025),
                                    initialDateRange: DateTimeRange(
                                      start: dtStart,
                                      end: dtEnd,
                                    ),
                                  ).then((selectedDate) {
                                    if (tokenController.text != "")
                                      tokenController.text = "";

                                    if (selectedDate != null) {
                                      var splitString = [];
                                      //2021-11-01 00:00:00.000 - 2021-11-30 00:00:00.000
                                      splitString =
                                          selectedDate.toString().split(" - ");
                                      print(selectedDate);
                                      print(splitString);
                                      var fromDate = DateFormat('dd/MM/yyyy')
                                          .format(
                                              DateTime.parse(splitString[0]));
                                      var toDate = DateFormat('dd/MM/yyyy')
                                          .format(
                                              DateTime.parse(splitString[1]));

                                      _dateController.text =
                                          fromDate + " - " + toDate;
                                      //     DateFormat('dd/MM/yyyy')
                                      //         .format(selectedDate);

                                      setState(() {
                                        selectedDateRange = selectedDate;
                                        dtStart =
                                            DateTime.parse(splitString[0]);
                                        dtEnd = DateTime.parse(splitString[1]);

                                        fromDateStr = fromDate;
                                        toDateStr = toDate;
                                      });

                                      print(fromDate);
                                      print(toDate);
                                    }
                                  });
                                }, //  "SCD_FromDate":"09/11/2021",
                                validator: (value) {
                                  if (tokenController.text != "")
                                    isValid = true;
                                  else {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter date.';
                                    }
                                    return null;
                                  }
                                },
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.6,
                              child: TextFormField(
                                obscureText: false,
                                controller: tokenController,
                                maxLength: 18,
                                inputFormatters: [
                                  new FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z0-9]")),
                                ],
                                decoration: InputDecoration(
                                  counterText: "",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: isValid
                                          ? const Color(0xff3a3a3a)
                                          : Colors.red.shade800,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: isValid
                                          ? const Color(0xff3a3a3a)
                                          : Colors.red.shade800,
                                    ),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: isValid
                                          ? const Color(0xff3a3a3a)
                                          : Colors.red.shade800,
                                    ),
                                  ),
                                  labelText: "Tracking Shipment No",
                                  labelStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: isValid
                                        ? Colors.black
                                        : Colors.red.shade800,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                validator: (value) {
                                  if (_dateController.text != "")
                                    isValid = true;
                                  else {
                                    if (value!.isEmpty) {
                                      setState(() {
                                        isValid = false;
                                      });
                                      return 'Required';
                                    } else {
                                      setState(() {
                                        isValid = true;
                                      });
                                      // getShipmentDetails();
                                      return null;
                                    }
                                  }
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ImportTrackTraceMoreDets()),
                                // );
                                //"DO012200000001";
                                //"DO012200000001";
                                //"DO022200000016";

                                if (_formKey.currentState!.validate()) {
                                  print("Process data");
                                  getDoDetails(tokenController.text);
                                  // loginUser(context);
                                } else {
                                  print('validation failed');
                                }
                              },
                              child: Icon(Icons.search),
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all(CircleBorder()),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(12)),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF0461AA)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () async {
                            tokenController.text = "";
                            _dateController.text = "";
                            var scannedCode = await Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => const QRScan(),
                            ));
                            if (scannedCode != null) {
                              if (scannedCode != "") {
                                print("code returned from app =" + scannedCode);
                                getDoDetails(scannedCode);
                                //await getShipmentDetails(scannedCode);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ImportCargoDoStatus(
                                //             doNumber: scannedCode,
                                //           )),
                                // );
                              }
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 50,
                            child: Row(
                              children: [
                                Icon(Icons.qr_code_scanner),
                                Text(
                                  "  SCAN DO",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff0461aa)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          color: Color(0xff0461aa))))),
                        )
                      ],
                    )),
              ),
            ),
            // SizedBox(height: 10),
            //Expanded(child: buildPassList()),
            Expanded(
                child: isLoading
                    ? Center(
                        child: Container(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator()))
                    : buildPassList()),
            bottomCompanyNameBar(context),
          ],
        ),
      ),
    );
  }

  void getDoDetails(doNumber) async {
    try {
      var doDetails = {
        "FrmDate": "",
        "ToDate": "",
        "orgid": Global.orgId,
        "DONo": ""
      };
      setState(() {
        doDerailsArr = [];
        isLoading = true;
      });

      // await showLoadingMsg(context, true);
      print("****getDoDetails**** ");

      if (doNumber != "") {
        doDetails['DONo'] = doNumber.toString();
      } else {
        doDetails['FrmDate'] = fromDateStr.toString();
        doDetails['ToDate'] = toDateStr.toString();
      }

      // doDetails['DONo'] = doNumber.toString();
      // print("doDetails['DONo'] == " + doDetails['DONo'].toString());
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
            isShowList = true;
          });
        } else {
          showMessageBox(context, "OK", "Invalid Details",
              "No data available for this tracking number!");

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

  Widget buildPassList() {
    return isShowList
        ? ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: doDerailsArr.length,
            itemBuilder: (BuildContext context, int index) {
              //CodexPass _passDetails = passList.elementAt(index);
              //return generatePassCard(_passDetails, context);
              return doListLocal(context, index);
            })
        : Container();
  }

  doListLocal(BuildContext context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          // height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: const Color(0xffffffff),
            border: Border.all(width: 1.0, color: const Color(0xffe1e1e1)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x14000000),
                offset: Offset(0, 3),
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 18.0, top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'DO No. : '),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(
                                  context, doDerailsArr[index]["DONo"]),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'DO Status : '),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(
                                  context, doDerailsArr[index]["DOStatus"]),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'DO Validity : '),
                            SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    2.5, // hard coding child width
                                child: labelText(
                                  context,
                                  doDerailsArr == null
                                      ? ""
                                      : doDerailsArr.length > 0
                                          ? doDerailsArr[index]["revalidity"] !=
                                                  ""
                                              ? returnFormattedDateTime(
                                                  doDerailsArr[index]
                                                      ["revalidity"])
                                              : ""
                                          : "",
                                )
                                //context, doDerailsArr[index]["revalidity"]),
                                ),
                          ]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelHeaderText(
                              context, 'Expected Cargo Release Date/Time : '),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    2.5, // hard coding child width
                                child: labelText(
                                  context,
                                  doDerailsArr == null
                                      ? ""
                                      : doDerailsArr.length > 0
                                          ? doDerailsArr[index]
                                                      ["ExpectedCargoRelDt"] !=
                                                  ""
                                              ? returnFormattedDateTime(
                                                  doDerailsArr[index]
                                                      ["ExpectedCargoRelDt"])
                                              : ""
                                          : "",
                                )
                                //context, doDerailsArr[index]["revalidity"]),
                                ),
                          ),
                        ],
                      ),
                    ]),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xffffffff),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffe1e1e1)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x14000000),
                        offset: Offset(0, 3),
                        blurRadius: 4,
                      ),
                    ],
                  ),

//  if (tablData[i]['isCargoRelease'] == 1) {
//                                         row += '<img src="img/CargoDone.png" class="png-Icon">';
//                                     }
//                                     else if (tablData[i]['isCargoRelease'] == 2) {
//                                         row += '<img src="img/CargoPenHalf.png" class="png-Icon">';
//                                     }
//                                     else {
//                                         row += '<img src="img/CargoPen.png" class="png-Icon">';
//                                     }

                  child: Center(
                    child: this.doDerailsArr[0]['isCargoRelease'] == "1"
                        ? Image.asset('assets/icons/CargoDone.png')
                        : this.doDerailsArr[0]['isCargoRelease'] == "2"
                            ? Image.asset('assets/icons/CargoPenHalf.png')
                            : Image.asset('assets/icons/CargoPen.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          var doStatus = this.doDerailsArr[0]['DOStatus'];
          var isCargoRelease = this.doDerailsArr[0]['isCargoRelease'];
          var errmsg = "";

          if ((doStatus == "Expired" || doStatus == "Hold") &&
              (isCargoRelease == "0" || isCargoRelease == "2")) {
            errmsg = "User cannot the release the cargo as the DO is expired.";
            showMessageBox(context, "OK", "DO expired", errmsg);
            return;
            // } else if (isCargoRelease == "1") {
            //   errmsg = "Cargo Release Confirmation already done.";
            //   showMessageBox(context, "OK", "Cargo Release Done", errmsg);
            //   return;
            // } else if (doStatus == "Rev Requested") {
            //   errmsg = "User cannot the release the cargo as the DO is expired.";
            //   showMessageBox(context, "OK", "DO expired", errmsg);
            //   return;
            // } else if (doStatus == "Rev Payment Pending") {
            //   errmsg = "User cannot the release the cargo as the DO is expired.";
            //   showMessageBox(context, "OK", "DO expired", errmsg);
            //   return;
            // } else if (doStatus == "Rev Payment Confirm") {
            //   errmsg = "User cannot the release the cargo as the DO is expired.";
            //   showMessageBox(context, "OK", "DO expired", errmsg);
            //   return;
          }

          if (isCargoRelease == "0" || isCargoRelease == "2") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImportCargoDoStatus(
                      doNumber: doDerailsArr[index]["DONo"],
                      qrCodeNo: doDerailsArr[index]
                          ["QrCodeNo"] //"DO032200000015",
                      )),
            );
          } else {
            if (isCargoRelease == "1") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImportReleaseCompleted(
                          doDerailsArr: doDerailsArr[index],
                        )),
              );
            }
          }
        },
      ),
    );
  }
}
