import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

class ImportReleaseCompleted extends StatelessWidget {
  final doDerailsArr;
  const ImportReleaseCompleted({Key? key, this.doDerailsArr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: generateAppBar(context, "Cargo Released"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x40000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "DO # : " + doDerailsArr!["DONo"].toString(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          " Release Confirmation already done.",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                // height: 250,
                //width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffe1e1e1)),
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
                      left: 18.0, bottom: 18.0, top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: labelText(context, 'DO No. : '),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.5, // hard coding child width
                                      child: labelHeaderText(
                                          context, doDerailsArr!["DONo"]),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: labelText(context, 'MBL No. : '),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.5, // hard coding child width
                                      child: labelHeaderText(
                                          context,
                                          doDerailsArr!["BillofLadingNo"] ==
                                                  null
                                              ? ""
                                              // : "dsfdfafdfdfdfatrtdrftdtdtfafadfaf"), //
                                              : doDerailsArr![
                                                  "BillofLadingNo"]),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: labelText(context, 'HBL No. : '),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.5, // hard coding child width
                                      child: labelHeaderText(
                                          context, doDerailsArr!["HBLNo"]),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    labelText(context, 'DO Validity : '),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5, // hard coding child width
                                        child: labelHeaderText(
                                          context,
                                          doDerailsArr == null
                                              ? ""
                                              : doDerailsArr!.length > 0
                                                  ? doDerailsArr![
                                                              "revalidity"] !=
                                                          ""
                                                      ? returnFormattedDateTime(
                                                          doDerailsArr![
                                                              "revalidity"])
                                                      : ""
                                                  : "",
                                        )
                                        //context, doDerailsArr[index]["revalidity"]),
                                        ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  labelText(context, 'SL/FF/CB Name : '),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      // hard coding child width
                                      child: labelHeaderText(
                                          context,
                                          doDerailsArr![
                                              "ContainerLineAgentFF"]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  labelText(context, 'Consignee : '),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: labelHeaderText(
                                          context, doDerailsArr!["Consignee"]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2, // hard coding child width
                                      child: labelText(context,
                                          'Expected Cargo Release Date/Time : ')),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5, // hard coding child width
                                        child: labelHeaderText(
                                          context,
                                          doDerailsArr == null
                                              ? ""
                                              : doDerailsArr!.length > 0
                                                  ? doDerailsArr![
                                                              "ExpectedCargoRelDt"] !=
                                                          ""
                                                      ? returnFormattedDateTime(
                                                          doDerailsArr![
                                                              "ExpectedCargoRelDt"])
                                                      : ""
                                                  : "",
                                        )
                                        //context, doDerailsArr[index]["revalidity"]),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2, // hard coding child width
                                      child: labelText(context,
                                          'Actual Cargo Release Date/Time : ')),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5, // hard coding child width
                                        child: labelHeaderText(
                                          context,
                                          doDerailsArr == null
                                              ? ""
                                              : doDerailsArr!.length > 0
                                                  ? doDerailsArr![
                                                              "CargoDateTime"] !=
                                                          ""
                                                      ? returnFormattedDateTime(
                                                          doDerailsArr![
                                                              "CargoDateTime"])
                                                      : ""
                                                  : "",
                                        )
                                        //context, doDerailsArr[index]["revalidity"]),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
