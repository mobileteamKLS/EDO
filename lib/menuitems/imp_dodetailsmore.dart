import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

class ImportDoDetailsMore extends StatelessWidget {
  ImportDoDetailsMore({Key? key}) : super(key: key);
  final TextEditingController txtEventDetails = TextEditingController();

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
                      "YMLU19032022", "3", "3 / 2 / 0"),
                  SizedBox(height: 10),
                  Card(
                    // width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(24.0),
                    //   color: const Color(0xffffffff),
                    //   border: Border.all(
                    //       width: 1.0, color: const Color(0xffe1e1e1)),
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
                        "HBL",
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
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    Container(
                                      color: const Color(0xffF4D35E),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    labelText(
                                                        context, 'Sr. No.'),
                                                    SizedBox(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          5, // hard coding child width
                                                      child: labelText(
                                                          context, " "),
                                                    ),
                                                    // labelText(context, lblSlot),
                                                  ]),
                                              Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    labelText(
                                                        context, 'HBL No.'),
                                                    SizedBox(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          3, // hard coding child width
                                                      child: labelText(
                                                          context, " "),
                                                    ),
                                                    // labelText(context, lblSlot),
                                                  ]),
                                              Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    labelText(
                                                        context, 'HBL Date'),
                                                    SizedBox(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          3.5, // hard coding child width
                                                      child: labelText(
                                                          context, " "),
                                                    ),
                                                    // labelText(context, lblSlot),
                                                  ]),
                                              Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    labelText(context,
                                                        'FF/Consignee'),
                                                    SizedBox(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          2.5, // hard coding child width
                                                      child: labelText(
                                                          context, " "),
                                                    ),
                                                    // labelText(context, lblSlot),
                                                  ]),
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
                  Card(
                    // width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(24.0),
                    //   color: const Color(0xffffffff),
                    //   border: Border.all(
                    //       width: 1.0, color: const Color(0xffe1e1e1)),
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
                        "Status",
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
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(
                              obscureText: false,
                              keyboardType: TextInputType.multiline,

                              minLines:
                                  3, //Normal textInputField will be displayed
                              maxLines:
                                  5, // when user presses enter it will adapt to it
                              controller: txtEventDetails,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: const Color(0xff3a3a3a),
                              ),
                              decoration: InputDecoration(
                                hintText: "HOLD/UNHOLD remarks",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600, width: 1.0),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.grey.shade600,
                                        width: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
            // labelHeaderText(context, 'Shipping Line/Freight Forwarder'),
            // labelText(context, lblVehicleNo),
            // SizedBox(height: 15),
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
                      child: labelText(context, "DO032100000002"),
                    ),
                  ]),
            ]),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'DO Request'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, "19/03/2022"),
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
                  ]),
            ]),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelHeaderText(context, 'DO Date'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /
                          2.5, // hard coding child width
                      child: labelText(context, "19/03/2022"),
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
                          2.5, // hard coding child width
                      child: labelText(context, "04/04/2022"),
                    ),
                    // labelText(context, lblSlot),
                  ]),
            ]),
          ],
        ),
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
        width: MediaQuery.of(context).size.width / 3, // hard coding child width
        child: labelHeaderText(context, "HBL2006203"),
      ),
      SizedBox(
        width:
            MediaQuery.of(context).size.width / 3.5, // hard coding child width
        child: labelHeaderText(context, "19/03/2022"),
      ),
      SizedBox(
        width:
            MediaQuery.of(context).size.width / 2.5, // hard coding child width
        child: labelHeaderText(context, "Aspinwall & Traders"),
      ),
    ]);
  }
}
