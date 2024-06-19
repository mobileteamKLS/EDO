import 'package:barcode_widget/barcode_widget.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

class QRDisplay extends StatelessWidget {
  final String? doNo;
  const QRDisplay({Key? key, this.doNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F7FB),
        appBar: generateAppBar(context, "Scan DO"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                      child: Text(
                        "DO # : " + this.doNo.toString(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0461AA),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 100,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Scan QR Code ", //+ this.doNumber.toString(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0461AA),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Place device on the QR Code to scan and proceed", //+ this.doNumber.toString(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF0461AA),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff6b6b6b)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: BarcodeWidget(
                        barcode: Barcode.qrCode(), // Barcode type and settings
                        data: this.doNo.toString(), // Content
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
