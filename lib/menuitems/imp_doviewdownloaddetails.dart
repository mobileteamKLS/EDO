import 'package:e_do/menuitems/imp_doviewdownloaddetailsmore.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImportDoViewDownloadDets extends StatefulWidget {
  const ImportDoViewDownloadDets({Key? key}) : super(key: key);

  @override
  _ImportDoViewDownloadDetsState createState() =>
      _ImportDoViewDownloadDetsState();
}

class _ImportDoViewDownloadDetsState extends State<ImportDoViewDownloadDets> {
  final tokenController = TextEditingController();
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "DO View/Download Details"),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
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
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFFECECEC),
                      ),
                    ]),
              ),
            ),
          ),
          // SizedBox(height: 10),
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
        itemCount: 3,
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
            "Payment Confirmed",
            "3 / 2 / 0"),
        // SizedBox(height: 10),
      ],
    );
  }

  doListLocal(BuildContext context, lblTokenNo, lblVehicleNo, lblSlot,
      lblTerminal, btnText, lblCount) {
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
                                2.3, // hard coding child width
                            child: labelText(context, "DOR032100000001"),
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
                            child: labelText(context, "04/04/2021"),
                          ),
                        ],
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(
                      //     //       builder: (context) => ImportDoDetails()),
                      //     // );
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
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelHeaderText(context, 'Issued Date'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width /
                                3.5, // hard coding child width
                            child: labelText(context, "04/04/2021"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImportDoViewDownloadMoreDets()),
                  );
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
            ],
          ),
        ),
      ),
    );
  }
}
