import 'package:e_do/auth/userlogin.dart';
import 'package:e_do/dashboard/contactdetails.dart';
import 'package:e_do/dashboard/fulltimesupport.dart';
import 'package:e_do/menu/importmenu.dart';
import 'package:e_do/widgets/menulistitem.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      // drawer: NavDrawer(),
      appBar: generateAppBar(context, "Home"),

      //  AppBar(
      //   backgroundColor: Color(0xFF0461AA),
      //   title: Center(
      //     child: Text(
      //       'Home',
      //       style: TextStyle(
      //         fontFamily: 'Roboto',
      //         fontSize: 14,
      //         color: const Color(0xffffffff),
      //       ),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, bottom: 8.0, top: 10.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffffffff),
                ),
                width: double.infinity,
                child: Center(
                    child: Image.asset('assets/images/CODEX-PCS_logo_-1.png')),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 28.0, bottom: 28.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Container(
                        //   height: 130,
                        //   width: MediaQuery.of(context).size.width / 3.2,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(24.0),
                        //     color: const Color(0xffffffff),
                        //     border: Border.all(
                        //         width: 1.0, color: const Color(0xffe1e1e1)),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: const Color(0x14000000),
                        //         offset: Offset(0, 3),
                        //         blurRadius: 4,
                        //       ),
                        //     ],
                        //   ),
                        //   child: Center(
                        //       child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Image.asset('assets/icons/icon_Vessel.png'),
                        //       SizedBox(
                        //         height: 5.0,
                        //       ),
                        //       Text(
                        //         'Vessel',
                        //         style: TextStyle(
                        //           fontFamily: 'Roboto',
                        //           fontSize: 13,
                        //           color: const Color(0xff0461aa),
                        //         ),
                        //         textAlign: TextAlign.center,
                        //       )
                        //     ],
                        //   )),
                        // ),
                        SizedBox(
                          width: 5.0,
                        ),
                        GestureDetector(
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width / 3.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffe1e1e1)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x14000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/icon_Import.png'),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Import',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 13,
                                    color: const Color(0xff0461aa),
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImportMenu()),
                            );
                          },
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        // Container(
                        //   height: 130,
                        //   width: MediaQuery.of(context).size.width / 3.2,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(24.0),
                        //     color: const Color(0xffffffff),
                        //     border: Border.all(
                        //         width: 1.0, color: const Color(0xffe1e1e1)),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: const Color(0x14000000),
                        //         offset: Offset(0, 3),
                        //         blurRadius: 4,
                        //       ),
                        //     ],
                        //   ),
                        //   child: Center(
                        //       child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Image.asset('assets/icons/icon_Export.png'),
                        //       SizedBox(
                        //         height: 5.0,
                        //       ),
                        //       Text(
                        //         'Export',
                        //         style: TextStyle(
                        //           fontFamily: 'Roboto',
                        //           fontSize: 13,
                        //           color: const Color(0xff0461aa),
                        //         ),
                        //         textAlign: TextAlign.center,
                        //       )
                        //     ],
                        //   )),
                        // ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    // Container(
                    //   height: 130,
                    //   width: MediaQuery.of(context).size.width / 3.2,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(24.0),
                    //     color: const Color(0xffffffff),
                    //     border: Border.all(
                    //         width: 1.0, color: const Color(0xffe1e1e1)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: const Color(0x14000000),
                    //         offset: Offset(0, 3),
                    //         blurRadius: 4,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Center(
                    //       child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset(
                    //           'assets/icons/icon_Transshipment.png'),
                    //       SizedBox(
                    //         height: 5.0,
                    //       ),
                    //       Text(
                    //         'Transshipment',
                    //         style: TextStyle(
                    //           fontFamily: 'Roboto',
                    //           fontSize: 13,
                    //           color: const Color(0xff0461aa),
                    //         ),
                    //         textAlign: TextAlign.center,
                    //       )
                    //     ],
                    //   )),
                    // ),
                    // SizedBox(
                    //   width: 5.0,
                    // ),
                    // Container(
                    //   height: 130,
                    //   width: MediaQuery.of(context).size.width / 3.2,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(24.0),
                    //     color: const Color(0xffffffff),
                    //     border: Border.all(
                    //         width: 1.0, color: const Color(0xffe1e1e1)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: const Color(0x14000000),
                    //         offset: Offset(0, 3),
                    //         blurRadius: 4,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Center(
                    //       child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset('assets/icons/icon_Payment.png'),
                    //       SizedBox(
                    //         height: 5.0,
                    //       ),
                    //       Text(
                    //         'Payment',
                    //         style: TextStyle(
                    //           fontFamily: 'Roboto',
                    //           fontSize: 13,
                    //           color: const Color(0xff0461aa),
                    //         ),
                    //         textAlign: TextAlign.center,
                    //       )
                    //     ],
                    //   )),
                    // ),
                    // SizedBox(
                    //   width: 5.0,
                    // ),
                    // Container(
                    //   height: 130,
                    //   width: MediaQuery.of(context).size.width / 3.2,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(24.0),
                    //     color: const Color(0xffffffff),
                    //     border: Border.all(
                    //         width: 1.0, color: const Color(0xffe1e1e1)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: const Color(0x14000000),
                    //         offset: Offset(0, 3),
                    //         blurRadius: 4,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Center(
                    //       child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset('assets/icons/icon_Other.png'),
                    //       SizedBox(
                    //         height: 5.0,
                    //       ),
                    //       Text(
                    //         'Other',
                    //         style: TextStyle(
                    //           fontFamily: 'Roboto',
                    //           fontSize: 13,
                    //           color: const Color(0xff0461aa),
                    //         ),
                    //         textAlign: TextAlign.center,
                    //       )
                    //     ],
                    //   )),
                    // ),
                    //   ],
                    // ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: double.infinity,
                height: 230,
                color: Color(0xFF0461AA),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                      child: Text(
                        'Additional Services',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // GestureDetector(
                            //     child: Container(
                            //       height: 130,
                            //       width: 160,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(24.0),
                            //         color: const Color(0xffffffff),
                            //         border: Border.all(
                            //             width: 1.0,
                            //             color: const Color(0xffe1e1e1)),
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: const Color(0x14000000),
                            //             offset: Offset(0, 3),
                            //             blurRadius: 4,
                            //           ),
                            //         ],
                            //       ),
                            //       child: Center(
                            //           child: Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.center,
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Image.asset(
                            //               'assets/icons/More_Services.png'),
                            //           SizedBox(
                            //             height: 5.0,
                            //           ),
                            //           Text(
                            //             'More Services',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 13,
                            //               color: const Color(0xff0461aa),
                            //             ),
                            //             textAlign: TextAlign.center,
                            //           )
                            //         ],
                            //       )),
                            //     ),
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => MoreServices()),
                            //       );
                            //     }),
                            // SizedBox(
                            //   width: 10.0,
                            // ),
                            // GestureDetector(
                            //     child: Container(
                            //       height: 130,
                            //       width: 160,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(24.0),
                            //         color: const Color(0xffffffff),
                            //         border: Border.all(
                            //             width: 1.0,
                            //             color: const Color(0xffe1e1e1)),
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: const Color(0x14000000),
                            //             offset: Offset(0, 3),
                            //             blurRadius: 4,
                            //           ),
                            //         ],
                            //       ),
                            //       child: Center(
                            //           child: Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.center,
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Image.asset(
                            //               'assets/icons/ApplicableCharges.png'),
                            //           SizedBox(
                            //             height: 5.0,
                            //           ),
                            //           Text(
                            //             'Applicable Charges',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 13,
                            //               color: const Color(0xff0461aa),
                            //             ),
                            //             textAlign: TextAlign.center,
                            //           )
                            //         ],
                            //       )),
                            //     ),
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 ApplicableCharges()),
                            //       );
                            //     }),
                            // SizedBox(
                            //   width: 10.0,
                            // ),
                            GestureDetector(
                                child: Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width / 2.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    color: const Color(0xffffffff),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffe1e1e1)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x14000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/icons/contact_us.png'),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Contact Us',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 13,
                                          color: const Color(0xff0461aa),
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContactDetails()),
                                  );
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                                child: Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width / 2.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    color: const Color(0xffffffff),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffe1e1e1)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x14000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/icons/fulltimeservice.png'),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        '24 X 7 Support',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 13,
                                          color: const Color(0xff0461aa),
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FullTimeSupport()),
                                  );
                                }),
                            // SizedBox(
                            //   width: 10.0,
                            // ),
                            // GestureDetector(
                            //     child: Container(
                            //       height: 130,
                            //       width: 160,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(24.0),
                            //         color: const Color(0xffffffff),
                            //         border: Border.all(
                            //             width: 1.0,
                            //             color: const Color(0xffe1e1e1)),
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: const Color(0x14000000),
                            //             offset: Offset(0, 3),
                            //             blurRadius: 4,
                            //           ),
                            //         ],
                            //       ),
                            //       child: Center(
                            //           child: Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.center,
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Image.asset(
                            //               'assets/icons/icon_Other.png'),
                            //           SizedBox(
                            //             height: 5.0,
                            //           ),
                            //           Text(
                            //             'Other',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 13,
                            //               color: const Color(0xff0461aa),
                            //             ),
                            //             textAlign: TextAlign.center,
                            //           )
                            //         ],
                            //       )),
                            //     ),
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => OtherServices()),
                            //       );
                            //     }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 140,
              color: Color(0xFFFFFFFF),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child:
                    Center(child: Image.asset('assets/images/Kale Logo.png')),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 80,
            //   color: Color(0xFFFFFFFF),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Terms and conditions',
            //         style: TextStyle(
            //           fontFamily: 'Roboto',
            //           fontSize: 12,
            //           color: const Color(0xff3A3A3A),
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       SizedBox(
            //         width: 30.0,
            //       ),
            //       Text(
            //         'Privacy Policy',
            //         style: TextStyle(
            //           fontFamily: 'Roboto',
            //           fontSize: 12,
            //           color: const Color(0xff3A3A3A),
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        'No',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          color: const Color(0xff0461aa),
          fontWeight: FontWeight.w500,
          height: 1,
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.center,
      ),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text(
        'Yes',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          color: const Color(0xff0461aa),
          fontWeight: FontWeight.w500,
          height: 1,
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserLogin()),
        );
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      content: Text(
        'Are you sure you want to sign out?',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: const Color(0xff3a3a3a),
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            cancelButton,
            continueButton,
          ],
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.donut_large_rounded,
                    size: 56,
                    color: const Color(0xff0461aa),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, PCS User',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff3a3a3a),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Business: Shipping Line',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: const Color(0xff3a3a3a),
                      ),
                    ),
                    Text(
                      '12 Apr 2021  23:30',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: const Color(0xff3a3a3a),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0xfff4f7fb),
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.expand_more,
              size: 36,
              color: const Color(0xff0461aa),
            ),
            title: Text(
              'Vessel',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            trailing: Icon(
              Icons.expand_more,
              size: 36,
              color: const Color(0xff0461aa),
            ),
            title: Text(
              'Import',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            trailing: Icon(
              Icons.expand_more,
              size: 36,
              color: const Color(0xff0461aa),
            ),
            title: Text(
              'Export',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            trailing: Icon(
              Icons.expand_more,
              size: 36,
              color: const Color(0xff0461aa),
            ),
            title: Text(
              'Transshipment',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            trailing: Icon(
              Icons.expand_more,
              size: 36,
              color: const Color(0xff0461aa),
            ),
            title: Text(
              'Payment',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            trailing: Icon(
              Icons.expand_more,
              size: 36,
              color: const Color(0xff0461aa),
            ),
            title: Text(
              'Other',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            title: Text(
              'Notification',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff0461aa),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {},
          ),
          Divider(
            height: 15.0,
            color: const Color(0xff707070),
          ),
          ListTile(
            title: Text(
              'Sign Out',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xffE41D22),
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            onTap: () => {showAlertDialog(context)},
          ),
          ListTile(
            title: Center(
              child: Text(
                'App Version no. 2.0.0',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: const Color(0xff707070),
                  height: 1,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
