import 'package:e_do/dashboard/fulltimesupport.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

class ImportDoViewDownloadMoreDets extends StatefulWidget {
  const ImportDoViewDownloadMoreDets({Key? key}) : super(key: key);

  @override
  _ImportDoViewDownloadMoreDetsState createState() =>
      _ImportDoViewDownloadMoreDetsState();
}

class _ImportDoViewDownloadMoreDetsState
    extends State<ImportDoViewDownloadMoreDets> {
  final TextEditingController txtEventDetails = TextEditingController();
  bool isvalidSlotDay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "DO View/Download More Details"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  doDetailsLocal(context, "DOR032100000001", "Yang Ming Lines",
                      "YMLU19032022", "3", "3 / 2 / 0"),
                  SizedBox(height: 10),
                  Card(
                    // height: 250,
                    // width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(24.0),
                    //   color: const Color(0xffffffff),
                    //   border: Border.all(width: 1.0, color: const Color(0xffe1e1e1)),
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: const Color(0x14000000),
                    //       offset: Offset(0, 3),
                    //       blurRadius: 4,
                    //     ),
                    //   ],
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 18.0, bottom: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      color: const Color(0xffF4D35E),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5, // hard coding child width
                                                child: labelText(
                                                    context, "Document Name"),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5, // hard coding child width
                                                child: labelText(
                                                    context, "File Name"),
                                              ),
                                              labelText(context, "Action"),
                                              // SizedBox(
                                              //   width: MediaQuery.of(context)
                                              //           .size
                                              //           .width /
                                              //       2.5, // hard coding child width
                                              //   child: labelText(
                                              //       context, "Action"),
                                              // ),
                                            ]),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: gridRowHBL(context),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: gridRowHBL(context),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: gridRowHBL(context),
                                    // ),
                                  ],
                                ),
                              ]),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                          gridRowHBL(context),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF0461AA)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(
                                          color: Color(0xFF0461AA))))),
                          onPressed: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.download,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                Text(
                                  " BULK DOWNLOAD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF95B701)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(
                                          color: Color(0xFF95B701))))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FullTimeSupport()),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.headset_mic,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                Text(
                                  " SUPPORT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomCompanyNameBar(context),
        ],
      ),
    );
  }

  doDetailsLocal(BuildContext context, lblTokenNo, lblVehicleNo, lblSlot,
      lblTerminal, lblCount) {
    return Card(
      // height: 250,
      // width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(24.0),
      //   color: const Color(0xffffffff),
      //   border: Border.all(width: 1.0, color: const Color(0xffe1e1e1)),
      //   boxShadow: [
      //     BoxShadow(
      //       color: const Color(0x14000000),
      //       offset: Offset(0, 3),
      //       blurRadius: 4,
      //     ),
      //   ],
      // ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, top: 25.0, bottom: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelHeaderText(context, 'Tracking Shipment No'),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "MSCU1234567",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ]),
            SizedBox(height: 10),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFECECEC),
            ),
            SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2.5, // hard coding child width
                          child: labelHeaderText(context, 'DO No.'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2.5, // hard coding child width
                          child: labelText(context, "DO032100000002"),
                        ),
                        // labelText(context, lblSlot),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labelHeaderText(context, 'DO Validity'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              3.5, // hard coding child width
                          child: labelText(context, "04/04/2021"),
                        ),
                      ]),
                ]),
            SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labelHeaderText(context, 'Issued Date'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              3.5, // hard coding child width
                          child: labelText(context, "19/03/2021"),
                        ),
                      ]),
                ]),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  gridRowHBL(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width /
              2.5, // hard coding child width
          child: labelHeaderText(context, "Bill of Lading"),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width /
              3.5, // hard coding child width
          child: labelHeaderText(context, "ABC.xls"),
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.visibility,
              //FontAwesomeIcons.airbnb,
              size: 24,
              color: const Color(0xff0461aa),
            ),
          ),
          onTap: () {
            // viewPdf(context, _documentDetails.FilePath);
          },
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.download,
              // FontAwesomeIcons.chevronRight,
              size: 24,
              color: const Color(0xff0461aa),
            ),
          ),
          onTap: () {
            // requestDownload(_documentDetails.FilePath);
            // viewPdf(context, _documentDetails.FilePath);
          },
        ),
      ]),
    );
  }
}
