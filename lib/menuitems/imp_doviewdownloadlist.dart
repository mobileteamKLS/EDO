import 'package:e_do/menuitems/imp_dodetailsmore.dart';
import 'package:e_do/menuitems/imp_doviewdownloaddetails.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImportDoViewDownloadList extends StatelessWidget {
  const ImportDoViewDownloadList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "DO View/Download List"),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelHeaderText(context, 'DO No.'),
                              labelText(context, "DO032100000002"),
                            ]),
                      ]),
                  SizedBox(height: 15),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labelHeaderText(context, 'DO Request No.'),
                        labelText(context, "DOR032100000001"),
                      ]),
                  SizedBox(height: 15),
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
                  SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelHeaderText(context, 'Container No.'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            2.5, // hard coding child width
                        child: labelText(context, "C001"),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportDoViewDownloadDets()),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
