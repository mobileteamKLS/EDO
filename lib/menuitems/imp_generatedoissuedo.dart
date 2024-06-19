import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

class ImportIssueDO extends StatefulWidget {
  const ImportIssueDO({Key? key}) : super(key: key);

  @override
  _ImportIssueDOState createState() => _ImportIssueDOState();
}

class _ImportIssueDOState extends State<ImportIssueDO> {
  final TextEditingController txtEventDetails = TextEditingController();
  bool isvalidSlotDay = true;
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "DO Details"),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              doDetailsLocal(context, "DOR032100000001", "Yang Ming Lines",
                  "YMLU19032022", "3", "3 / 2 / 0"),
              SizedBox(height: 10),
              doShipmentDetails(context),
              SizedBox(height: 10),
              doHBLDetails(context),
              SizedBox(height: 10),
              doAttachedDocument(context),
              SizedBox(height: 10),
              doShippingLineRemarks(),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF0461AA)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: BorderSide(color: Color(0xFF0461AA))))),
                      onPressed: () async {
                        //await setApproveReject(context, 1);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Issue DO",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        bottomCompanyNameBar(context),
      ]),
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
                  labelHeaderText(context, 'DO Request No.'),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      lblTokenNo,
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Do Details",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
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
                          child: labelHeaderText(
                              context, 'Container Line/Agent/FF'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2.5, // hard coding child width
                          child: labelText(context, "Yang Ming Lines"),
                        ),
                        // labelText(context, lblSlot),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labelHeaderText(context, 'Vessel Line/Agent'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2, // hard coding child width
                          child: labelText(context, "Yang Ming Lines"),
                        ),
                      ]),
                ]),
            SizedBox(height: 15),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFECECEC),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "BL Details",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'Bill of Lading No'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, "YMLU19032021"),
                    ),
                    // labelText(context, lblSlot),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'Consignee'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2, // hard coding child width
                      child: labelText(context, "GREEN SPOT CO. LTD."),
                    ),
                    // labelText(context, lblSlot),
                  ]),
            ]),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'Delivery Type'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, "Loaded Delivery"),
                    ),
                    // labelText(context, lblSlot),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'Shipment Type'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, "FCL"),
                    ),
                    // labelText(context, lblSlot),
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
                        labelHeaderText(context, 'Cargo Description'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2.5, // hard coding child width
                          child: labelText(
                              context, "Fittings for tubes, pipes & hoses"),
                        ),
                        // labelText(context, lblSlot),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labelHeaderText(context, 'Marks & Numbers'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2, // hard coding child width
                          child: labelText(context,
                              "SBB FOODS, LLC 15681 35TH ST. SE CASSELTON, N"),
                        ),
                        // labelText(context, lblSlot),
                      ]),
                ]),
          ],
        ),
      ),
    );
  }

  doBlOtherDetails(BuildContext context) {
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
      child: ExpansionTile(
        // tilePadding: const EdgeInsets.only(left: 8.0),
        initiallyExpanded: true,
        title: Text(
          "BL Other Details",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff0461aa),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 8.0, bottom: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Bill of Lading Date'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "19/03/2021"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Total No. of BL Pkgs'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "2000"),
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
                            labelHeaderText(context, 'BL Weight'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "1500.000 KGM"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Volume'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "200.000 MTQ"),
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
                            labelHeaderText(context, 'Import Manifest No.'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "7400256"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Import Manifest Date'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "19/03/2021"),
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
                            labelHeaderText(context, 'BoE No. and Date'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "BOE Num 19/03/2021"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Containerised'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "Yes"),
                            ),
                          ]),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  doVesselDetails(BuildContext context) {
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
      child: ExpansionTile(
        // tilePadding: const EdgeInsets.only(left: 8.0),
        initiallyExpanded: true,
        title: Text(
          "Vessel Details",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff0461aa),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 8.0, bottom: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Vessel Name'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "IM INTERACTION"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Voyage No. / Call Sign'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "741S / ---"),
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
                            labelHeaderText(context, 'Port of Loading'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "QUE Quebec"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Port of Discharge'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "LOD London"),
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
                            labelHeaderText(context, 'Final Port Delivery'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "---"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Place of Receipt'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "---"),
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
                            labelHeaderText(context, 'Arrival Date'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2.5, // hard coding child width
                              child: labelText(context, "---"),
                            ),
                            // labelText(context, lblSlot),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelHeaderText(context, 'Berth Date & Time'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // hard coding child width
                              child: labelText(context, "30/03/2021"),
                            ),
                          ]),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  doShipmentDetails(BuildContext context) {
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
      child: ExpansionTile(
        // tilePadding: const EdgeInsets.only(left: 8.0),
        initiallyExpanded: true,
        title: Text(
          "Shipment Details",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff0461aa),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 8.0, bottom: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  child: Center(
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width /
                                5, // hard coding child width
                            child: labelHeaderText(context, "Count"),
                          ),
                          SizedBox(
                            width: 35, // hard coding child width
                            child: labelText(context, "20"),
                          ),
                          Container(
                            height: 30,
                            width: 50,
                            color: Colors.grey.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "3",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          SizedBox(
                            width: 25, // hard coding child width
                            child: labelText(context, "40"),
                          ),
                          Container(
                            height: 30,
                            width: 50,
                            color: Colors.grey.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          SizedBox(
                            width: 25, // hard coding child width
                            child: labelText(context, "45"),
                          ),
                          Container(
                            height: 30,
                            width: 50,
                            color: Colors.grey.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(height: 15),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Container(
                              color: const Color(0xffF4D35E),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5, // hard coding child width
                                        child: labelText(context, "Sr. No."),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5, // hard coding child width
                                        child:
                                            labelText(context, "Container No."),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5, // hard coding child width
                                        child: labelText(context, "Sz./Ty."),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3, // hard coding child width
                                        child: labelText(context, "Pkg./Wt."),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5, // hard coding child width
                                        child: labelText(context, "Unit"),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5, // hard coding child width
                                        child: labelText(context, "Seal No."),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: gridRowHBL(context),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: gridRowHBL(context),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: gridRowHBL(context),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  gridRowHBL(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width / 5, // hard coding child width
        child: Text(
          "1",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff6b6b6b),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        width:
            MediaQuery.of(context).size.width / 2.5, // hard coding child width
        child: labelHeaderText(context, "ABCD12345678"),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 5, // hard coding child width
        child: labelHeaderText(context, "20/DC"),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 3, // hard coding child width
        child: labelHeaderText(context, "500/25.10"),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 5, // hard coding child width
        child: labelHeaderText(context, "KGS"),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 5, // hard coding child width
        child: labelHeaderText(context, "123"),
      ),
    ]);
  }

  doHBLDetails(BuildContext context) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          "HBL Details",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff0461aa),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        children: [
          ExpansionTile(
            initiallyExpanded: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: labelHeaderText(context, 'HBL Number'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: labelText(context, "HBL2006203"),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelHeaderText(context, 'HBL Date'),
                      labelText(context, "19/03/2021"),
                    ],
                  ),
                ]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 28,
                    color: const Color(0xff0461aa),
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 8.0, top: 8.0, bottom: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'FF/Consignee Name'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child:
                                      labelText(context, "ABC INTERNATIONAL"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(
                                    context, 'FF/Consignee Address'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "MBC"),
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
                                labelHeaderText(context, 'No. of Packages'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "10"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'Gross Wt./Unit'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "100.000"),
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
                                labelHeaderText(context, 'Goods Description'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "COTTON"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'Marks & Numbers'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "4156KO"),
                                ),
                              ]),
                        ]),
                    SizedBox(height: 25),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HBL Container Details",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff0461aa),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
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
                                labelHeaderText(context, 'Container Number'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "SSNI1056659"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'Sz/Ty'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "20/TG"),
                                ),
                              ]),
                        ]),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFECECEC),
          ),
          ExpansionTile(
            initiallyExpanded: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: labelHeaderText(context, 'HBL Number'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: labelText(context, "HBL2006203"),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelHeaderText(context, 'HBL Date'),
                      labelText(context, "19/03/2021"),
                    ],
                  ),
                ]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 28,
                    color: const Color(0xff0461aa),
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 8.0, top: 8.0, bottom: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'FF/Consignee Name'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child:
                                      labelText(context, "ABC INTERNATIONAL"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(
                                    context, 'FF/Consignee Address'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "MBC"),
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
                                labelHeaderText(context, 'No. of Packages'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "10"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'Gross Wt./Unit'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "100.000"),
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
                                labelHeaderText(context, 'Goods Description'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "COTTON"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'Marks & Numbers'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "4156KO"),
                                ),
                              ]),
                        ]),
                    SizedBox(height: 25),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HBL Container Details",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff0461aa),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
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
                                labelHeaderText(context, 'Container Number'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "SSNI1056659"),
                                ),
                                // labelText(context, lblSlot),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelHeaderText(context, 'Sz/Ty'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      2.5, // hard coding child width
                                  child: labelText(context, "20/TG"),
                                ),
                              ]),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  doAttachedDocument(BuildContext context) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          "Attached Documents",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff0461aa),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            1.5, // hard coding child width
                        child: labelText(context, "Bill of Lading"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: 70,
                              //   child: labelText(context, "Bill of Lading"),
                              // ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: labelHeaderText(context, "100KB"),
                              ),
                              SizedBox(
                                width: 180,
                                child: labelHeaderText(context, "28 Dec 2020"),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            1.5, // hard coding child width
                        child: labelText(context, "Bill of Lading"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: 70,
                              //   child: labelText(context, "Bill of Lading"),
                              // ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: labelHeaderText(context, "100KB"),
                              ),
                              SizedBox(
                                width: 180,
                                child: labelHeaderText(context, "28 Dec 2020"),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            1.5, // hard coding child width
                        child: labelText(context, "Bill of Lading"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: 70,
                              //   child: labelText(context, "Bill of Lading"),
                              // ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: labelHeaderText(context, "100KB"),
                              ),
                              SizedBox(
                                width: 180,
                                child: labelHeaderText(context, "28 Dec 2020"),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            1.5, // hard coding child width
                        child: labelText(context, "Bill of Lading"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: 70,
                              //   child: labelText(context, "Bill of Lading"),
                              // ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: labelHeaderText(context, "100KB"),
                              ),
                              SizedBox(
                                width: 180,
                                child: labelHeaderText(context, "28 Dec 2020"),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  doShippingLineRemarks() {
    return Card(
      child: ExpansionTile(
        // tilePadding: const EdgeInsets.only(left: 8.0),
        initiallyExpanded: true,
        title: Text(
          "Shipping Line Remarks",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff0461aa),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelText(context, "Rejection Remarks"),
              SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.multiline,

                  minLines: 3, //Normal textInputField will be displayed
                  maxLines: 5, // when user presses enter it will adapt to it
                  controller: txtEventDetails,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: const Color(0xff3a3a3a),
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Rejection Remarks",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade600, width: 1.0),
                    ),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.grey.shade600, width: 1.0)),
                  ),
                ),
              ),
              SizedBox(height: 15),
              labelText(context, "Rejection Date"),
              SizedBox(height: 15),
              SizedBox(
                  width: MediaQuery.of(context).size.width /
                      2.5, // hard coding child widthColors.grey.shade600, width: 1.0
                  child: TextFormField(
                    readOnly: true,
                    controller: _dateController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: isvalidSlotDay
                                  ? Colors.grey.shade600
                                  : Colors.red.shade700),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: isvalidSlotDay
                                  ? Colors.grey.shade600
                                  : Colors.red.shade700),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: isvalidSlotDay
                                  ? Colors.grey.shade600
                                  : Colors.red.shade700),
                        ),
                        hintText: "Select",
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: const Color(0xff3a3a3a),
                        )),
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      ).then((selectedDate) {
                        // if (selectedDate != null) {
                        //   _dateController.text =
                        //       DateFormat('dd/MM/yyyy')
                        //           .format(
                        //               selectedDate);

                        //   bookingDetailsSave[
                        //           'SlotDate'] =
                        //       _dateController.text
                        //           .toString();

                        //   setState(() {
                        //     selectedSlotText =
                        //         DateFormat(
                        //                 'dd-MMMM-yyyy')
                        //             .format(
                        //                 selectedDate);

                        //     selectedText = "";
                        //   });

                        //   getAvailableSlots(
                        //       _dateController.text);
                        // }
                      });
                    }, //  "SCD_FromDate":"09/11/2021",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date.';
                      }
                      return null;
                    },
                  )),
              SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
