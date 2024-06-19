import 'package:e_do/menuitems/imp_dodetailsmore.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImportDoDetails extends StatefulWidget {
  const ImportDoDetails({Key? key}) : super(key: key);

  @override
  _ImportDoDetailsState createState() => _ImportDoDetailsState();
}

class _ImportDoDetailsState extends State<ImportDoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "DO Details"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  doDetailsLocal(context, "DOR032100000001", "Yang Ming Lines",
                      "YMLU19032021", "3", "3 / 2 / 0"),
                  SizedBox(height: 10),
                  menuListItem('icon_CargoRelease.png', 'Cargo Release'),
                  SizedBox(height: 10),
                  menuListItem('icon_TrackandTrace.png', 'Track and Trace'),
                  SizedBox(height: 10),
                  menuListItem('icon_TrackandTrace.png', 'e-Docket'),
                  SizedBox(height: 10),
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
    return Container(
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
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImportDoDetailsMore()),
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
            ]),
            SizedBox(height: 15),
            labelHeaderText(context, 'Shipping Line/Freight Forwarder'),
            labelText(context, lblVehicleNo),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'MBL'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, lblSlot),
                    ),
                    // labelText(context, lblSlot),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'DO No'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, lblTokenNo),
                    ),
                  ]),
            ]),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'HBL Count'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, lblTerminal),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'Count 20/40/45'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, lblCount),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
