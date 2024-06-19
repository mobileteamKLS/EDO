import 'package:e_do/widgets/menulistitem.dart';
import 'package:e_do/widgets/timeline.dart';
import 'package:flutter/material.dart';

class ImportTrackTraceMoreDets extends StatefulWidget {
  const ImportTrackTraceMoreDets({Key? key}) : super(key: key);

  @override
  _ImportTrackTraceMoreDetsState createState() =>
      _ImportTrackTraceMoreDetsState();
}

class _ImportTrackTraceMoreDetsState extends State<ImportTrackTraceMoreDets> {
  final TextEditingController txtEventDetails = TextEditingController();
  bool isvalidSlotDay = true;
  final _dateController = TextEditingController();

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
                        Column(
                          children: [
                            Timeline(
                              children: <Widget>[
                                timeelineRow(
                                    context, "Created", "19-03-2021 11:30"),
                                timeelineRow(
                                    context, "Requested", "19-03-2021 11:30"),
                                timeelineRow(context, "Payment Confirm",
                                    "19-03-2021 11:30"),
                                timeelineRow(
                                    context, "Generated", "19-03-2021 11:30"),
                                timeelineRow(
                                    context, "Issued", "19-03-2021 11:30"),
                                timeelineRow(context, "Validity Date",
                                    "19-03-2021 11:30"),
                                timeelineRow(context, "Rev Requested",
                                    "DD-MM-YYYY HH:MM"),
                                timeelineRow(context, "Rev Payment Confirm",
                                    "DD-MM-YYYY HH:MM"),
                                timeelineRow(context, "Payment Confirm",
                                    "DD-MM-YYYY HH:MM"),
                                timeelineRow(
                                    context, "Rev Issued", "DD-MM-YYYY HH:MM"),
                                timeelineRow(context, "Revalidate Date",
                                    "DD-MM-YYYY HH:MM"),
                                timeelineRow(
                                    context, "Reject", "DD-MM-YYYY HH:MM"),
                                timeelineRow(
                                    context, "Hold", "DD-MM-YYYY HH:MM"),
                              ],
                              indicators: <Widget>[
                                timelineIndicator(context, true),
                                timelineIndicator(context, true),
                                timelineIndicator(context, true),
                                timelineIndicator(context, true),
                                timelineIndicator(context, true),
                                timelineIndicator(context, true),
                                timelineIndicator(context, false),
                                timelineIndicator(context, false),
                                timelineIndicator(context, false),
                                timelineIndicator(context, false),
                                timelineIndicator(context, false),
                                timelineIndicator(context, false),
                                timelineIndicator(context, false),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
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
                                        color: Colors.grey.shade600,
                                        width: 1.0),
                                  ),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey.shade600,
                                          width: 1.0)),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //labelText(context, "Rejection Remarks"),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              labelText(context, "Hold/Unhold Date"),
                              SizedBox(width: 30),
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
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
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
                                hintText: "Enter HOLD/UNHOLD remarks",
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
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.red.shade900),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(
                                          color: Colors.red.shade900)))),
                          onPressed: () async {
                            //await setApproveReject(context, 1);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: 50,
                            child: Center(
                              child: Text(
                                "HOLD",
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
                ],
              ),
            ),
          ),
          bottomCompanyNameBar(context),
        ],
      ),
    );
  }

  timeelineRow(BuildContext context, lblText, lblVal) {
    return Container(
      // height: 50,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.6,
              child: timelineLabelText(context, lblText),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: timelineLabelText(context, lblVal),
            ),
            // : _bookingDetails[0].CreatedOn)),
          ],
        ),
      ),
    );
  }

  timelineIndicator(BuildContext context, isComplete) {
    return Icon(
      isComplete ? Icons.check_circle_outline : Icons.schedule,
      size: 36,
      color: isComplete ? Colors.green.shade200 : Colors.red.shade200,
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
}
