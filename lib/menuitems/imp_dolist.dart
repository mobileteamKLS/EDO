import 'package:e_do/menuitems/imp_dodetails.dart';
import 'package:e_do/menuitems/imp_dorequestdetails.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImportDoList extends StatefulWidget {
  const ImportDoList({Key? key}) : super(key: key);

  @override
  _ImportDoListState createState() => _ImportDoListState();
}

class _ImportDoListState extends State<ImportDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "DO List"),
      body: Column(
        children: [
          SizedBox(height: 10),
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
                          builder: (context) => ImportDoDetails()),
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
              labelHeaderText(context, 'MBL'),
              labelText(context, lblSlot),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelHeaderText(context, 'HBL Count'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            4, // hard coding child width
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
                            3, // hard coding child width
                        child: labelText(context, lblCount),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 12, backgroundColor: btnText.toString().contains("Confirmed") // ||
                          // btnText.toString().contains("Pending")
                          ? const Color(0xFF95B701)
                          : Colors.red.shade800,
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImportDoRequestDetails()),
                      );
                      // if (btnText.toString().contains("Confirmed") ||
                      //     btnText.toString().contains("View")) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ScanBarcodePass(lblTokenNo,
                      //             lblVehicleNo, lblSlot, _passDetails.Filepath)),
                      //   );
                      // } else {
                      //   var getval = await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             EditSlotBooking(_passDetails)),
                      //   );
                      //   if (getval != null) getPassList();
                      // }
                    },
                    child: Container(
                      width: 80,
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
