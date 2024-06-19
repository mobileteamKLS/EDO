import 'package:e_do/menuitems/imp_generatedo.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'imp_generatedoissuedo.dart';

class ImportGenerateDoList extends StatefulWidget {
  const ImportGenerateDoList({Key? key}) : super(key: key);

  @override
  _ImportGenerateDoListState createState() => _ImportGenerateDoListState();
}

class _ImportGenerateDoListState extends State<ImportGenerateDoList> {
  bool selectAll = false,
      selectPaymentConfirmed = true,
      selectGenerated = false,
      selectIssued = false;
  String btnText = "Payment Confirmed >";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "Generate DO"),
      body: Column(
        children: [
          //   SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: selectAll
                                      ? Color(0xFF0461AA)
                                      : Colors.white))),
                    ),
                    onPressed: () async {
                      setState(() {
                        selectAll = true;
                        selectPaymentConfirmed = false;
                        selectGenerated = false;
                        selectIssued = false;
                        btnText = "Payment Confirmed >";
                      });
                      //await setApproveReject(context, 1);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 50,
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: const Color(0xFF0461AA),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF0461AA)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: selectPaymentConfirmed
                                      ? Color(0xFF0461AA)
                                      : Colors.white))),
                    ),
                    onPressed: () async {
                      //await setApproveReject(context, 1);
                      setState(() {
                        selectAll = false;
                        selectPaymentConfirmed = true;
                        selectGenerated = false;
                        selectIssued = false;
                        btnText = "Payment Confirmed >";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Payment Confirmed",
                          style: TextStyle(
                            color: const Color(0xFF0461AA),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: selectGenerated
                                      ? Color(0xFF0461AA)
                                      : Colors.white))),
                    ),
                    onPressed: () async {
                      //await setApproveReject(context, 1);
                      setState(() {
                        selectAll = false;
                        selectPaymentConfirmed = false;
                        selectGenerated = true;
                        selectIssued = false;
                        btnText = "Generated >";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Generated",
                          style: TextStyle(
                            color: const Color(0xFF0461AA),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: selectIssued
                                      ? Color(0xFF0461AA)
                                      : Colors.white))),
                    ),
                    onPressed: () async {
                      //await setApproveReject(context, 1);
                      setState(() {
                        selectAll = false;
                        selectPaymentConfirmed = false;
                        selectGenerated = false;
                        selectIssued = true;
                        btnText = "Issued >";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Issued",
                          style: TextStyle(
                            color: const Color(0xFF0461AA),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  SizedBox(height: 5),
          Expanded(child: buildPassList()),
          bottomCompanyNameBar(context),
        ],
      ),
    );
  }

  Widget buildPassList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          //CodexPass _passDetails = passList.elementAt(index);
          //return generatePassCard(_passDetails, context);
          return generatedoListCard(context);
        });
  }

  generatedoListCard(context) {
    return Column(
      children: [
        doListLocal(
            context,
            // _passDetails.TokenNo,
            // _passDetails.VehicleNo,
            // _passDetails.SlotDetails,
            // _passDetails.PortTerminal,
            // _passDetails.Status == 1 ? "Payment Confirmed >" : "Payment Pending >",
            // _passDetails),
            "DOR032100000001",
            "Yang Ming Lines",
            "YMLU19032021",
            "3",
            "3 / 2 / 0"),
        // SizedBox(height: 10),
      ],
    );
  }

  doListLocal(BuildContext context, lblTokenNo, lblVehicleNo, lblSlot,
      lblTerminal, lblCount) {
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelHeaderText(context, 'DO Request No.'),
                      labelText(context, lblTokenNo),
                    ]),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ImportIssueDO()),
                    // );
                  },
                  child: Icon(
                    FontAwesomeIcons.chevronRight,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder()),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF95B701)), // <-- Button color
                    // overlayColor:
                    //     MaterialStateProperty.resolveWith<Color?>((states) {
                    //   if (states.contains(MaterialState.pressed))
                    //     return Colors.red; // <-- Splash color
                    // }),
                  ),
                )
              ]),
              SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'MBL'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, "YMLU19032021"),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'HBL'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, "YMLU261220201"),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: 15),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelHeaderText(context, 'SL/FF Name'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            3, // hard coding child width
                        child: labelText(context, lblVehicleNo),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 12, backgroundColor: const Color(0xff0461aa),
                      // primary: btnText.toString().contains("Confirmed") // ||
                      //     // btnText.toString().contains("Pending")
                      //     ? const Color(0xff0461aa)
                      //     : Colors.red.shade800,
                    ),
                    onPressed: () async {
                      if (selectAll) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportGenerateDo()),
                        );
                      } else if (selectPaymentConfirmed) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportGenerateDo()),
                        );
                      } else if (selectGenerated) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportIssueDO()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportIssueDO()),
                        );
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 40,
                      child: Center(
                        child: Text(
                          btnText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
