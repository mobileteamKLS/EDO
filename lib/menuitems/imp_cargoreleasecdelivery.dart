import 'dart:convert';

import 'package:e_do/constants/constants.dart';
import 'package:e_do/datastructure/containerdetails.dart';
import 'package:e_do/widgets/commonwodgets.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../global.dart';

class ContainersArray {
  late int index;
  late bool isChecked = false;
  late TextEditingController truckNo;
  late TextEditingController weight;
  late String dtACR;
  late bool isReleased = false;
  late int cntId;
  late String containerNo;
}

// ignore: must_be_immutable
class ImportCargoReleaseCDelivery extends StatefulWidget {
  var doDetails = {"orgid": Global.orgId, "DoRequestId": "", "HBLid": "0"};
  var doDerailsArr = [];

  ImportCargoReleaseCDelivery({Key? key, required this.doDerailsArr})
      : super(key: key);

  @override
  State<ImportCargoReleaseCDelivery> createState() =>
      _ImportCargoReleaseCDeliveryState();
}

class _ImportCargoReleaseCDeliveryState
    extends State<ImportCargoReleaseCDelivery> {
  bool isSelectAll = false, isCompleted = false, isLoading = false;
  List<ContainerDetails> doContainerDetsArr = [];
  TextEditingController controllerTruckNo = new TextEditingController();
  TextEditingController controllerweight = new TextEditingController();
  List<ContainersArray> containersArrayList = [];
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TimeOfDay selectedTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  String acrDate = "";

  @override
  void initState() {
    super.initState();
    getDoContainerDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "Cargo Release Status"),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? Center(
                    child: Container(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator()))
                : ListView(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText(context, "Cargo Release Confirmation"),
                              SizedBox(height: 25),
                              labelHeaderText(context, 'DO No.'),
                              labelText(
                                  context, widget.doDerailsArr[0]["DONo"]),
                              SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(context, 'MBL No.'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2, // hard coding child width
                                            child: labelText(
                                                context,
                                                widget.doDerailsArr[0]
                                                    ["BillofLadingNo"]),
                                          ),
                                          // labelText(context, lblSlot),
                                        ]),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(context, 'HBL No.'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5, // hard coding child width
                                            child: labelText(
                                                context,
                                                widget.doDerailsArr[0]
                                                    ["HBLNo"]),
                                          ),
                                        ]),
                                  ]),
                              SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(
                                              context, 'SL/FF/CB Name'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2, // hard coding child width
                                            child: labelText(
                                                context,
                                                widget.doDerailsArr[0]
                                                    ["ContainerLineAgentFF"]),
                                          ),
                                          // labelText(context, lblSlot),
                                        ]),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(
                                              context, 'Gross Weight'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5, // hard coding child width
                                            child: labelText(
                                                context,
                                                returnWeightVals(
                                                    widget.doDerailsArr[0]
                                                        ["GrossWt"],
                                                    widget.doDerailsArr[0]
                                                        ["UnitWt"])),
                                          ),
                                        ]),
                                  ]),
                              SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(context, 'Consignee'),

                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2, // hard coding child width
                                            child: labelText(
                                                context,
                                                widget.doDerailsArr[0]
                                                    ["Consignee"]),
                                          ),
                                          // labelText(context, lblSlot),
                                        ]),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(context, 'Volume'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5, // hard coding child width
                                            child: labelText(
                                                context,
                                                returnWeightVals(
                                                    widget.doDerailsArr[0]
                                                        ["GrossVol"],
                                                    widget.doDerailsArr[0]
                                                        ["UnitVol"])),
                                          ),
                                        ]),
                                  ]),
                              SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(
                                              context, 'DO Validity Date'),

                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2, // hard coding child width
                                            child: labelText(
                                                context,
                                                returnFormattedDate(
                                                    widget.doDerailsArr[0]
                                                        ["revalidity"])),
                                          ),
                                          // labelText(context, lblSlot),
                                        ]),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          labelHeaderText(
                                              context, 'Measurements'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5, // hard coding child width
                                            child: labelText(
                                                context,
                                                returnWeightVals(
                                                    widget.doDerailsArr[0]
                                                        ["Measurements"],
                                                    widget.doDerailsArr[0]
                                                        ["MeasurementsUnit"])),
                                          ),
                                        ]),
                                  ]),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      labelHeaderText(
                                          context, 'ECR Date and Time'),
                                      SizedBox(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2, // hard coding child width
                                        child: labelText(
                                            context,
                                            widget.doDerailsArr[0][
                                                        "ExpectedCargoRelDt"] ==
                                                    ""
                                                ? ""
                                                : returnFormattedDateTime(widget
                                                        .doDerailsArr[0]
                                                    ["ExpectedCargoRelDt"])),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      labelHeaderText(context, 'Completed'),
                                      SizedBox(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5, // hard coding child width
                                        child: Container(
                                          height: 100,
                                          child: Checkbox(
                                            checkColor: Colors.white,

                                            //fillColor: MaterialStateProperty.resolveWith(getColor),
                                            value: isCompleted,
                                            // onChanged: null
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isCompleted = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        // ),

                                        //  labelText(context, lblCount),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //SizedBox(height: 10),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,

                                    //fillColor: MaterialStateProperty.resolveWith(getColor),
                                    value: isSelectAll,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isSelectAll = value!;

                                        for (var k = 0;
                                            k < containersArrayList.length;
                                            k++) {
                                          if (containersArrayList[k]
                                                  .isReleased ==
                                              false) {
                                            containersArrayList[k].isChecked =
                                                isSelectAll;
                                            containersArrayList[k].dtACR =
                                                isSelectAll ? acrDate : "";
                                          }
                                        }
                                      });
                                    },
                                  ),
                                  labelHeaderText(context, 'Select All'),
                                  SizedBox(width: 30),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 35),
                                        labelHeaderText(
                                            context, 'ECR Date and Time'),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 120,
                                              child: TextFormField(
                                                readOnly: true,
                                                controller: _dateController,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    border:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    hintText: "Select ECR Date",
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xff3a3a3a),
                                                    )),

                                                onTap: () async {
                                                  await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2025),
                                                  ).then((selectedDate) {
                                                    _dateController.text =
                                                        DateFormat('dd/MM/yyyy')
                                                            .format(
                                                                selectedDate!);
                                                    acrDate = _dateController
                                                            .text +
                                                        " " +
                                                        _timeController.text;
                                                  });
                                                }, //  "SCD_FromDate":"09/11/2021",
                                                // validator: (value) {
                                                //   if (value == null || value.isEmpty) {
                                                //     return 'Please enter date.';
                                                //   }
                                                //   return null;
                                                // },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 70,
                                              child: TextFormField(
                                                readOnly: true,
                                                controller: _timeController,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    border:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    hintText: "Select ECR Time",
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xff3a3a3a),
                                                    )),

                                                onTap: () async {
                                                  await showTimePicker(
                                                    context: context,
                                                    initialTime: selectedTime,
                                                  ).then((selectedDate1) {
                                                    // print("selectedDate1");
                                                    // print(selectedDate1!.hour
                                                    //     .toString());
                                                    // print(selectedDate1.minute
                                                    //     .toString());
                                                    _timeController.text =
                                                        selectedDate1!.hour
                                                                .toString() +
                                                            ":" +
                                                            selectedDate1.minute
                                                                .toString();
                                                    acrDate = _dateController
                                                            .text +
                                                        " " +
                                                        _timeController.text;
                                                  });
                                                }, //  "SCD_FromDate":"09/11/2021",
                                                // validator: (value) {
                                                //   if (value == null || value.isEmpty) {
                                                //     return 'Please enter date.';
                                                //   }
                                                //   return null;
                                                // },
                                              ),
                                            ),
                                          ],
                                        ),

                                        //  Row(
                                        //   children: [
                                        //     labelHeaderText(context, '19/03/2021'),
                                        //     SizedBox(width: 5),
                                        //     labelHeaderText(context, '16:15'),
                                        //   ],
                                        // ),
                                      ]),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                color: const Color(0xffF4D35E),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        // width: MediaQuery.of(context).size.width /
                                        //     7, // hard coding child width
                                        child: labelText(context, "  Select"),
                                      ),
                                      // SizedBox(
                                      //   width: 40,
                                      //   // width: MediaQuery.of(context).size.width /
                                      //   //     6, // hard coding child width
                                      //   child: labelText(context, 'Sr. No.'),
                                      // ),
                                      SizedBox(
                                        width: 150,
                                        // width: MediaQuery.of(context).size.width /
                                        //     2.5, // hard coding child width
                                        child: labelText(context, "Truck No."),
                                      ),

                                      SizedBox(
                                        width: 110,
                                        // width: MediaQuery.of(context).size.width /
                                        //     3.5, // hard coding child width
                                        child: labelText(context, "Weight"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: SizedBox(
                                          width: 200,
                                          // width: MediaQuery.of(context).size.width /
                                          //     2, // hard coding child width
                                          child: labelText(
                                              context, "ACR Date and Time"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70,
                                        // width: MediaQuery.of(context).size.width /
                                        //     3.5, // hard coding child width
                                        child: labelText(context, ""),
                                      ),
                                    ]),
                              ),
                              for (var i = 1;
                                  i <= doContainerDetsArr.length;
                                  i++)
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            40, //MediaQuery.of(context).size.width / 7, // hard coding child width
                                        // child: labelText(context, "1"),
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                                          value: containersArrayList.length > 0
                                              ? containersArrayList[i - 1]
                                                  .isChecked
                                              : false,
                                          onChanged: containersArrayList[i - 1]
                                                  .isReleased
                                              ? null
                                              : (bool? value) {
                                                  setState(() {
                                                    containersArrayList[i - 1]
                                                        .isChecked = value!;
                                                    containersArrayList[i - 1]
                                                        .dtACR = acrDate;
                                                  });
                                                },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: labelText(context, i.toString()),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: containersArrayList.length > 0
                                              ? containersArrayList[i - 1]
                                                      .isReleased
                                                  ? labelText(
                                                      context,
                                                      containersArrayList[i - 1]
                                                          .truckNo
                                                          .text)
                                                  : TextFormField(
                                                      obscureText: false,
                                                      maxLength: 10,
                                                      controller: containersArrayList
                                                                  .length >
                                                              0
                                                          ? containersArrayList[
                                                                  i - 1]
                                                              .truckNo
                                                          : controllerTruckNo,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Enter Truck No.",
                                                              counterText: "",
                                                              labelStyle:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xff3a3a3a),
                                                              )),
                                                    )
                                              : TextFormField(
                                                  obscureText: false,
                                                  maxLength: 10,
                                                  controller:
                                                      containersArrayList
                                                                  .length >
                                                              0
                                                          ? containersArrayList[
                                                                  i - 1]
                                                              .truckNo
                                                          : controllerTruckNo,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Enter Truck No.",
                                                      counterText: "",
                                                      labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        color: const Color(
                                                            0xff3a3a3a),
                                                      )),
                                                ),
                                        ),

                                        //child: labelText(context, "TruckNo"),
                                      ),
                                      SizedBox(
                                        width: 110,
                                        //child: labelText(context, "weight"),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: containersArrayList.length > 0
                                              ? containersArrayList[i - 1]
                                                      .isReleased
                                                  ? labelText(
                                                      context,
                                                      containersArrayList[i - 1]
                                                          .weight
                                                          .text)
                                                  : TextFormField(
                                                      obscureText: false,
                                                      maxLength: 10,
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(
                                                              decimal: true),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                r"[0-9.]")),
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          try {
                                                            final text =
                                                                newValue.text;
                                                            if (text.isNotEmpty)
                                                              double.parse(
                                                                  text);
                                                            return newValue;
                                                          } catch (e) {}
                                                          return oldValue;
                                                        }),
                                                      ],
                                                      controller: containersArrayList
                                                                  .length >
                                                              0
                                                          ? containersArrayList[
                                                                  i - 1]
                                                              .weight
                                                          : controllerweight,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Enter weight",
                                                              counterText: "",
                                                              labelStyle:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xff3a3a3a),
                                                              )),
                                                    )
                                              : TextFormField(
                                                  obscureText: false,
                                                  maxLength: 10,
                                                  keyboardType: TextInputType
                                                      .numberWithOptions(
                                                          decimal: true),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r"[0-9.]")),
                                                    TextInputFormatter
                                                        .withFunction((oldValue,
                                                            newValue) {
                                                      try {
                                                        final text =
                                                            newValue.text;
                                                        if (text.isNotEmpty)
                                                          double.parse(text);
                                                        return newValue;
                                                      } catch (e) {}
                                                      return oldValue;
                                                    }),
                                                  ],
                                                  controller:
                                                      containersArrayList
                                                                  .length >
                                                              0
                                                          ? containersArrayList[
                                                                  i - 1]
                                                              .weight
                                                          : controllerweight,
                                                  decoration: InputDecoration(
                                                      hintText: "Enter weight",
                                                      counterText: "",
                                                      labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        color: const Color(
                                                            0xff3a3a3a),
                                                      )),
                                                ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: SizedBox(
                                          width: 180,
                                          // width: MediaQuery.of(context).size.width /
                                          //     2, // hard coding child width
                                          child: labelText(
                                            context,
                                            containersArrayList == null
                                                ? ""
                                                : containersArrayList.length > 0
                                                    ? containersArrayList[i - 1]
                                                                .dtACR !=
                                                            ""
                                                        ? returnFormattedDateTime(
                                                            containersArrayList[
                                                                    i - 1]
                                                                .dtACR)
                                                        : ""
                                                    : "",
                                          ),
                                        ),
                                      ),
                                      // containersArrayList.length > 0
                                      //     ? containersArrayList[i - 1]
                                      //             .isReleased
                                      //         ? Container()
                                      //         :

                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 12, backgroundColor: const Color(0xff0461aa),
                                          ),
                                          onPressed: () {
                                            addBlankRow();
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Center(
                                              child: Text(
                                                "+",
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
                                      ),
                                      //  : Container(),
                                      // containersArrayList.length > 0
                                      //     ? containersArrayList[i - 1]
                                      //             .isReleased
                                      //         ? Container()
                                      //         : SizedBox(
                                      //             width: 10,
                                      //           )
                                      //     : Container(),
                                      // containersArrayList.length > 0
                                      //     ? containersArrayList[i - 1]
                                      //             .isReleased
                                      //         ? Container()
                                      //         :

                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 12, backgroundColor: const Color(0xff0461aa),
                                            ),
                                            onPressed: () {
                                              if (containersArrayList.length ==
                                                  1) return;

                                              var deleRow = i - 1;
                                              print("index to be removed == " +
                                                  deleRow.toString());

                                              removeRow(deleRow);
                                              // containersArrayList
                                              //     .removeAt(i - 1);
                                              // setState(() {
                                              //   print("index to be removed");
                                              // });
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              child: Center(
                                                child: Text(
                                                  "-",
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
                                        ),
                                      )
                                      //: Container(),
                                    ]),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFF0461AA)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          side: BorderSide(
                                              color: Color(0xFF0461AA))))),
                              onPressed: () async {
                                await releaseDO(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "CONFIRM CARGO RELEASE",
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
          bottomCompanyNameBar(context),
        ],
      ),
    );
  }

  void getDoContainerDetails() async {
    try {
      // await showLoadingMsg(context, true);
      print("****getDoContainerDetails**** ");

      _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
      _timeController.text = DateFormat('hh:mm').format(DateTime.now());
      acrDate = _dateController.text + " " + _timeController.text;

      setState(() {
        doContainerDetsArr = [];
        isLoading = true;
      });
      widget.doDetails['DoRequestId'] = widget.doDerailsArr[0]["DoRequestId"];
      widget.doDetails['HBLid'] = widget.doDerailsArr[0]["HBLid"];
      //this.widget.doNumber.toString();
      await Global()
          .postData(
        Settings.SERVICES['DoDetails'],
        widget.doDetails,
      )
          .then((response) {
        if (response.statusCode == 200) {
          print("data received in getDoContainerDetails ");
          var parsed = json.decode(response.body)['response'];
          var resp = json.decode(parsed).cast<Map<String, dynamic>>();
          // print(resp);
          // print(resp[0]["CntId"]);
          // print(resp[0]["DoRequestId"]);
          // print(resp[0]["TruckNo"]);

          for (int i = 0; i < resp.length; i++) {
            ContainerDetails blankContRow = new ContainerDetails(
                CntId: resp[i]["CntId"] == null
                    ? 0
                    : resp[i]["CntId"] == ""
                        ? 0
                        : resp[i]["CntId"],
                DoRequestId: resp[i]["DoRequestId"] == null
                    ? 0
                    : resp[i]["DoRequestId"] == ""
                        ? 0
                        : resp[i]["DoRequestId"],
                HBLid: resp[i]["HBLid"] == null
                    ? 0
                    : resp[i]["HBLid"] == ""
                        ? 0
                        : resp[i]["HBLid"],
                ContainerNo: resp[i]["ContainerNo"] == null
                    ? ""
                    : resp[i]["ContainerNo"] == ""
                        ? ""
                        : resp[i]["ContainerNo"],
                Size: resp[i]["Size"] == null
                    ? ""
                    : resp[i]["Size"] == ""
                        ? ""
                        : resp[i]["Size"],
                Type: resp[i]["Type"] == null
                    ? ""
                    : resp[i]["Type"] == ""
                        ? ""
                        : resp[i]["Type"],
                TruckNo: resp[i]["TruckNo"] == null
                    ? ""
                    : resp[i]["TruckNo"] == ""
                        ? ""
                        : resp[i]["TruckNo"],
                Weight: resp[i]["Weight"] == null
                    ? ""
                    : resp[i]["Weight"] == ""
                        ? ""
                        : resp[i]["Weight"],
                isCargoRelease: resp[i]["isCargoRelease"] == null
                    ? false
                    : resp[i]["isCargoRelease"] == ""
                        ? false
                        : resp[i]["isCargoRelease"] == 0
                            ? false
                            : true,
                CargoDateTime: resp[i]["CargoDateTime"] == null
                    ? ""
                    : resp[i]["CargoDateTime"] == ""
                        ? ""
                        : returnFormattedDateTime(resp[i]["CargoDateTime"]));
            doContainerDetsArr.add(blankContRow);

            TextEditingController _controllerPC1 = new TextEditingController();
            _controllerPC1.text = blankContRow.TruckNo.toString();
            TextEditingController _controllerWT1 = new TextEditingController();
            _controllerWT1.text = blankContRow.Weight.toString();
            ContainersArray _newPkgrow = new ContainersArray();
            _newPkgrow.isChecked = blankContRow.isCargoRelease;
            _newPkgrow.isReleased = blankContRow.isCargoRelease;
            _newPkgrow.dtACR = blankContRow.CargoDateTime.toString();
            _newPkgrow.index = i;
            _newPkgrow.truckNo = _controllerPC1;
            _newPkgrow.weight = _controllerWT1;
            _newPkgrow.cntId = blankContRow.CntId;
            _newPkgrow.containerNo = blankContRow.ContainerNo;
            containersArrayList.add(_newPkgrow);
          }

          // showLoadingMsg(context, false);
          setState(() {
            //doContainerDetsArr = resp;
            print("doContainerDetsArr.length.toString() = " +
                doContainerDetsArr.length.toString());
            print("containersArrayList.length.toString() = " +
                containersArrayList.length.toString());
            // setContainerListValues();
            isLoading = false;
          });
        } else {
          ContainerDetails blankContRow = new ContainerDetails(
              CntId: 0,
              DoRequestId: widget.doDerailsArr[0]["DoRequestId"],
              HBLid: widget.doDerailsArr[0]["HBLid"],
              ContainerNo: "",
              Size: "",
              Type: "",
              TruckNo: "",
              Weight: "0.00",
              isCargoRelease: false,
              CargoDateTime: acrDate);
          doContainerDetsArr.add(blankContRow);

          TextEditingController _controllerPC1 = new TextEditingController();
          _controllerPC1.text = blankContRow.TruckNo.toString();
          TextEditingController _controllerWT1 = new TextEditingController();
          _controllerWT1.text = blankContRow.Weight.toString();
          ContainersArray _newPkgrow = new ContainersArray();
          _newPkgrow.isChecked = false;
          _newPkgrow.isReleased = blankContRow.isCargoRelease;
          _newPkgrow.dtACR = blankContRow.CargoDateTime.toString();
          _newPkgrow.index = 0;
          _newPkgrow.truckNo = _controllerPC1;
          _newPkgrow.weight = _controllerWT1;
          _newPkgrow.cntId = blankContRow.CntId;
          _newPkgrow.containerNo = blankContRow.ContainerNo;
          containersArrayList.add(_newPkgrow);
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

  void setContainerListValues() {
    print("_______________setContainerListValues blank__________");
    // print("setContainerListValues doContainerDetsArr.length.toString()");
    // print(doContainerDetsArr.length.toString());
    if (doContainerDetsArr.length > 0) {
      //int i = 0;
      //for (var u in doContainerDetsArr) {
      for (int i = 0; i < doContainerDetsArr.length; i++) {
        //  print("setContainerListValues ___  i == " + i.toString());
        TextEditingController _controllerPC1 = new TextEditingController();
        if (doContainerDetsArr[i].TruckNo == null)
          _controllerPC1.text = "";
        else
          _controllerPC1.text = doContainerDetsArr[i].TruckNo.toString();
        // print("setContainerListValues TRuck No  =" + _controllerPC1.text);

        TextEditingController _controllerWT1 = new TextEditingController();
        if (doContainerDetsArr[i].Weight == null)
          _controllerWT1.text = "";
        else
          _controllerWT1.text = doContainerDetsArr[i].Weight.toString();
        //print("setContainerListValues Weight = " + _controllerWT1.text);

        ContainersArray _newPkgrow = new ContainersArray();
        if (doContainerDetsArr[i].isCargoRelease == null) {
          _newPkgrow.isChecked = false;
          _newPkgrow.isReleased = false;
        } else {
          _newPkgrow.isChecked = doContainerDetsArr[i].isCargoRelease;
          _newPkgrow.isReleased = doContainerDetsArr[i].isCargoRelease;
          // _newPkgrow.isChecked =
          //     int.parse(u["isCargoRelease"]) == 0 ? false : true;
          // _newPkgrow.isReleased =
          //     int.parse(u["isCargoRelease"]) == 0 ? false : true;
        }
        //   print("setContainerListValues isChecked = " +
        //       _newPkgrow.isChecked.toString());
        //  // print("setContainerListValues isReleased = " +
        //       _newPkgrow.isReleased.toString());

        if (doContainerDetsArr[i].CargoDateTime == null)
          _newPkgrow.dtACR = "";
        else
          _newPkgrow.dtACR = doContainerDetsArr[i].CargoDateTime.toString();

        //  print("setContainerListValues dtACR =" + _newPkgrow.dtACR.toString());
        _newPkgrow.index = i;
        // print("setContainerListValues index = " + i.toString());
        _newPkgrow.truckNo = _controllerPC1;
        _newPkgrow.weight = _controllerWT1;

        _newPkgrow.cntId = 0;
        //u["CntId"];
        _newPkgrow.containerNo = "";
        //u["ContainerNo"].toString();
        //  _newPkgrow.isChecked = false;
        containersArrayList.add(_newPkgrow);
        // i++;
      }

      // print(
      //     " setContainerListValues containersArrayList.length.toString() after adding values = " +
      //         containersArrayList.length.toString());

      for (var u in containersArrayList) {
        print(u.index);
        print(u.truckNo.text);
        print(u.weight.text);
      }
      // print(containersArrayList);
    }
  }

  void addBlankRow() {
    print("setContainerListValues Add blank row ");
    ContainerDetails blankContRow = new ContainerDetails(
        CntId: 0,
        DoRequestId: widget.doDerailsArr[0]["DoRequestId"],
        HBLid: widget.doDerailsArr[0]["HBLid"],
        ContainerNo: "",
        Size: "",
        Type: "",
        TruckNo: "",
        Weight: "0.00",
        isCargoRelease: false,
        CargoDateTime: acrDate);
    doContainerDetsArr.add(blankContRow);

    TextEditingController _controllerPC1 = new TextEditingController();
    _controllerPC1.text = blankContRow.TruckNo.toString();
    TextEditingController _controllerWT1 = new TextEditingController();
    _controllerWT1.text = blankContRow.Weight.toString();
    ContainersArray _newPkgrow = new ContainersArray();
    _newPkgrow.isChecked = false;
    _newPkgrow.isReleased = blankContRow.isCargoRelease;
    _newPkgrow.dtACR = blankContRow.CargoDateTime.toString();
    _newPkgrow.index = containersArrayList.length + 1;
    _newPkgrow.truckNo = _controllerPC1;
    _newPkgrow.weight = _controllerWT1;
    _newPkgrow.cntId = blankContRow.CntId;
    _newPkgrow.containerNo = blankContRow.ContainerNo;
    containersArrayList.add(_newPkgrow);

    // print("setContainerListValues doDerailsArr.length.toString() == " +
    //     doContainerDetsArr.length.toString());
    // print(doContainerDetsArr);
    // print("setContainerListValues Add blank row done");
    // setContainerListValues();

    setState(() {});
  }

  void removeRow(index) {
    containersArrayList.removeAt(index);
    doContainerDetsArr.removeAt(index);

    for (var i = 0; i < containersArrayList.length; i++) {
      containersArrayList[i].index = i++;
    }
    setState(() {});
  }

  releaseDO(context) async {
    if (containersArrayList.length > 0) {
      showLoadingDialog(context, true);
      int countChecked = 0, totalCountChecked = 0;
      for (var k = 0; k < containersArrayList.length; k++) {
        if (containersArrayList[k].isChecked == true &&
            containersArrayList[k].isReleased == false) countChecked++;

        if (containersArrayList[k].isChecked == true) totalCountChecked++;
      }

      if (countChecked == 0) {
        showLoadingDialog(context, false);
        showMessageBox(context, "OK", "Validation Failed",
            "Select containers to release!");
        return;
      }

      String finalStringPKG = "";
      String saveStringC = "";
      for (var k = 0; k < containersArrayList.length; k++) {
        if (containersArrayList[k].isChecked == true &&
            containersArrayList[k].isReleased == false) {
          // print("k == " + k.toString());
          saveStringC = "{\"CntId\": ${containersArrayList[k].cntId}," +
              "\"CntNo\":\"${containersArrayList[k].containerNo.toString()}\"," +
              "\"Weight\":\"${containersArrayList[k].weight.text.toString()}\"," +
              "\"TruckNo\":\"${containersArrayList[k].truckNo.text.toString()}\"," +
              "\"CargoRelDt\":\"${containersArrayList[k].dtACR.toString()}\" }";
          if (finalStringPKG == "")
            finalStringPKG = saveStringC;
          else
            finalStringPKG = finalStringPKG + "," + saveStringC;
        }
      }

      String saveString =
          "{\"DoRequestId\": \"${doContainerDetsArr[0].DoRequestId.toString()}\"," +
              "\"HBLid\":\"${doContainerDetsArr[0].HBLid.toString()}\"," +
              "\"Iscomplete\":${isCompleted ? 1 : 0}," +
              // ignore: unnecessary_brace_in_string_interps
              "\"ContainerList\":[${finalStringPKG}] }";
      //print(saveString);

      //String finalSaveString = "[" + saveString + "]";

      //saveTable.add(json.decode(saveString));
      print(json.encode(json.decode(saveString)));

      //print(json.decode(finalSaveString));
      // print(json.encode(finalSaveString));
      // saveTable.add({
      //   "DoRequestId": doContainerDetsArr[0]['DoRequestId'].toString(),
      //   "HBLid": doContainerDetsArr[0]['HBLid'].toString(),
      //   "Iscomplete": totalCountChecked == doContainerDetsArr.length ? 1 : 0,
      //   "ContainerList": saveContainersList
      // });
      showLoadingDialog(context, false);
      // print(saveTable);
      // print(json.encode(saveTable));
      saveData(json.decode(saveString), context);
    }
  }

  void saveData(saveTable, context) async {
    try {
      print("****saveData**** ");
      showLoadingDialog(context, true);
      await Global()
          .postData(
        Settings.SERVICES['CargoRelease'],
        saveTable,
      )
          .then((response) {
        print(response);
        if (response.statusCode == 200) {
          showLoadingDialog(context, false);
          print("data saved successfully ");

          var parsed = json.decode(response.body)['response'];
          var resp = json.decode(parsed).cast<Map<String, dynamic>>();
          print(resp);
          ackAlert(context, "Cargo Released",
              "Cargo has been Released Successfully.");
        } else {
          showLoadingDialog(context, false);
        }
      });
    } catch (e) {
      showLoadingDialog(context, false);
      print(e);
    }
  }

  Future ackAlert(BuildContext context, titleText, msgText) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleText,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xff0461aa)),
          ),
          content: Text(msgText),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: const Color(0xff0461aa)),
              ),
              onPressed: () {
                Navigator.of(context).pop("OK");
                Navigator.pop(context, "released");
              },
            ),
          ],
        );
      },
    );
  }
}
