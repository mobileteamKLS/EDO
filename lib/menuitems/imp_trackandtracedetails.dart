import 'dart:convert';

import 'package:e_do/constants/constants.dart';
import 'package:e_do/menuitems/pdfscreen.dart';
import 'package:e_do/menuitems/qr_dislpay.dart';
import 'package:e_do/menuitems/qr_scan.dart';
import 'package:e_do/widgets/commonwodgets.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global.dart';
import 'package:http/http.dart' as http;

class ImportTrackTraceDets extends StatefulWidget {
  const ImportTrackTraceDets({Key? key}) : super(key: key);

  @override
  _ImportTrackTraceDetsState createState() => _ImportTrackTraceDetsState();
}

class _ImportTrackTraceDetsState extends State<ImportTrackTraceDets> {
  var doDetails = {"orgid": Global.orgId, "DONo": ""};
  final tokenController = TextEditingController();
  bool isValid = true;
  bool isShowList = false;
  bool isLoading = false;
  var doDerailsArr = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "Track and Trace"),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 25.0),
      //   child: FloatingActionButton.extended(
      //     onPressed: () {
      //       // setState(() {
      //       //   isShowList = true;
      //       // });
      //     },
      //     label: const Text('Scan'),
      //     icon: const Icon(
      //       Icons.qr_code_scanner,
      //       size: 32,
      //     ),
      //     backgroundColor: const Color(0xff0461aa),
      //   ),
      // ),
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
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print("Process data");
                                  getDoDetails(tokenController.text);
                                  // loginUser(context);
                                } else {
                                  print('validation failed');
                                }

                                // setState(() {
                                //   isShowList = true;
                                // });
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ImportTrackTraceMoreDets()),
                                // );
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

  // generatedoListCard(context,index) {
  //   return Column(
  //     children: [
  //       doListLocal(context, "DOR032100000001", "Yang Ming Lines",
  //           "YMLU19032021", "3", "Payment Confirmed", "3 / 2 / 0"),
  //     ],
  //   );
  // }

  void getDoDetails(doNumber) async {
    try {
      setState(() {
        doDerailsArr = [];
        isLoading = true;
      });

      // await showLoadingMsg(context, true);
      print("****getDoDetails**** ");
      doDetails['DONo'] = doNumber;
      await Global()
          .postData(
        Settings.SERVICES['DoTrackAndTrace'],
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

  doListLocal(BuildContext context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelHeaderText(context, 'DO No.'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width /
                                2, // hard coding child width
                            child:
                                labelText(context, doDerailsArr[index]["DoNo"]),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelHeaderText(context, 'DO Validity'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width /
                                3.5, // hard coding child width
                            child: labelText(
                                context, doDerailsArr[index]["DoValidityDt"]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelHeaderText(context, 'BL No.'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width /
                                2, // hard coding child widthBLNo
                            child:
                                labelText(context, doDerailsArr[index]["BLNo"]),
                          ),
                        ],
                      ),
                      Global.OrgTypeName.toLowerCase().contains("freight") ||
                              Global.OrgTypeName.toLowerCase()
                                  .contains("importer") ||
                              Global.OrgTypeName.toLowerCase()
                                  .contains("broker")
                          ? GestureDetector(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.qr_code_2,
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  labelText(context, "QR"),
                                ],
                              ),
                              onTap: () async {
                                if (doDerailsArr[index]["UniqueDo"] == null)
                                  return;
                                else if (doDerailsArr[index]["UniqueDo"] == "")
                                  return;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRDisplay(
                                            doNo: doDerailsArr[index][
                                                "UniqueDo"], //"DO00022032276676",
                                          )),
                                );
                              },
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ImportTrackTraceMoreDets()),
              //     );
              //   },
              //   child: Icon(
              //     FontAwesomeIcons.chevronRight,
              //   ),
              //   style: ButtonStyle(
              //     shape: MaterialStateProperty.all(CircleBorder()),
              //     padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              //     backgroundColor: MaterialStateProperty.all(
              //         const Color(0xFF95B701)), // <-- Button color
              //     // overlayColor:
              //     //     MaterialStateProperty.resolveWith<Color?>((states) {
              //     //   if (states.contains(MaterialState.pressed))
              //     //     return Colors.red; // <-- Splash color
              //     // }),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  getDODocument(context, uniquedo) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://113.193.225.56:8080/DOAPI/api/GetViewDoPrint'));
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

          var finalfilepath =
              "http://113.193.225.56:8080/DOAPI/ReportBuilder/" + fileName;
          viewPdf(context, finalfilepath, fileName);
        }
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  viewPdf(context, docURL, docName) {
    createFileOfPdfUrl(docURL).then((f) {
      print(f);

      if (f.path.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFScreen(path: f.path, pgTitle: docName),
          ),
        );
      }
    });
  }
}
