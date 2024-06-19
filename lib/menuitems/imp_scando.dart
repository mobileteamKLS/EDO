import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

class ImportScanDo extends StatefulWidget {
  const ImportScanDo({Key? key}) : super(key: key);

  @override
  _ImportScanDoState createState() => _ImportScanDoState();
}

class _ImportScanDoState extends State<ImportScanDo> {
  final tokenController = TextEditingController();
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: generateAppBar(context, "Scan DO"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                //  mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: TextFormField(
                            obscureText: false,
                            controller: tokenController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: isValid
                                      ? const Color(0xff3a3a3a)
                                      : Colors.red.shade800,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: isValid
                                      ? const Color(0xff3a3a3a)
                                      : Colors.red.shade800,
                                ),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: isValid
                                      ? const Color(0xff3a3a3a)
                                      : Colors.red.shade800,
                                ),
                              ),
                              labelText: "Search DO Request No./DO No.",
                              labelStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: isValid
                                    ? Colors.black
                                    : Colors.red.shade800,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation:
                                    MaterialStateProperty.all<double>(12),
                                // elevation: 12,
                                // primary: const Color(0xFF95B701),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF95B701)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                            color: Color(0xFF95B701))))),
                            onPressed: () async {
                              // if (tokenController.text == "") {
                              //   setState(() {
                              //     isValid = false;
                              //     return;
                              //   });
                              // } else {
                              //   setState(() {
                              //     isValid = true;
                              //   });
                              //   await getShipmentDetails(
                              //       tokenController.text);
                              // }
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Go",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: const Color(0xff3a3a3a),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Place device on the QR code to scan and proceed.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: const Color(0xff3a3a3a),
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xff6b6b6b),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff6b6b6b)),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
