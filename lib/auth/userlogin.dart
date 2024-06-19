import 'dart:convert';
import 'dart:io';

import 'package:e_do/auth/forgotpassword.dart';
import 'package:e_do/constants/constants.dart';
import 'package:e_do/dashboard/contactdetails.dart';
import 'package:e_do/dashboard/dashboard.dart';
import 'package:e_do/dashboard/fulltimesupport.dart';
import 'package:e_do/datastructure/userdetails.dart';
import 'package:e_do/widgets/commonwodgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  static final userCred = {'Loginid': "", "Password": ""};
  ValueChanged _onChangedUser = (val) => userCred['Loginid'] = val;
  ValueChanged _onChangedPwd = (val) => userCred['Password'] = val;
  bool showPassword = false;
  bool isUserNameEntered = true;
  bool isPasswordEntered = true;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    //getStoredPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: _formKey,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Home_Screen_img1_2.png',
                    height: 250,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 200.0),
                        child: Center(
                          child: Container(
                            height: 500.0,
                            width: MediaQuery.of(context).size.width / 1.05,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    //  mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 65.0),
                                        child: Text(
                                          'Welcome',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: const Color(0xff3a3a3a),
                                            height: 1.7142857142857142,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const ListTile(
                                        //leading: Icon(Icons.album),
                                        title: Padding(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: Text(
                                            'Sign in to your account',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 18,
                                              color: const Color(0xff3a3a3a),
                                              fontWeight: FontWeight.w500,
                                              height: 1.4285714285714286,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                onChanged: _onChangedUser,
                                                obscureText: false,
                                                //controller: _newPasswordTextFieldController,
                                                decoration: InputDecoration(
                                                    labelText: "Enter Username",
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 12,
                                                      color: // Colors.red,
                                                          isUserNameEntered
                                                              ? const Color(
                                                                  0xff3a3a3a)
                                                              : Colors
                                                                  .red.shade800,
                                                    )),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    setState(() {
                                                      isUserNameEntered = false;
                                                    });
                                                    return 'Required';
                                                  } else {
                                                    setState(() {
                                                      isUserNameEntered = true;
                                                    });
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                onChanged: _onChangedPwd,
                                                obscureText:
                                                    showPassword ? false : true,
                                                //controller: _newPasswordTextFieldController,

                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                          // Based on passwordVisible state choose the icon
                                                          showPassword
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: const Color(
                                                              0xFF0461AA)),
                                                      onPressed: () {
                                                        // Update the state i.e. toogle the state of passwordVisible variable
                                                        setState(() {
                                                          showPassword =
                                                              !showPassword;
                                                        });
                                                      },
                                                    ),
                                                    labelText: "Enter Password",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        color: isPasswordEntered
                                                            ? const Color(
                                                                0xff3a3a3a)
                                                            : Colors
                                                                .red.shade800)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    setState(() {
                                                      isPasswordEntered = false;
                                                    });
                                                    return 'Required';
                                                  } else {
                                                    setState(() {
                                                      isPasswordEntered = true;
                                                    });
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                            GestureDetector(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0,
                                                          bottom: 15.0),
                                                  child: Text(
                                                    'Forgot Password?',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 13,
                                                      color: const Color(
                                                          0xff3a3a3a),
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgotPassword()),
                                                  );
                                                }),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 12, backgroundColor: const Color(0xFF0461AA),
                                                ),
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    print("Process data");
                                                    //showLoadingDialog(context);
                                                    loginUser(context);
                                                  } else {
                                                    print('validation failed');
                                                  }
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      "Sign in",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
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
                                FractionalTranslation(
                                  translation: Offset(0.0, -0.10),
                                  child: Align(
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        'assets/icons/Group 2920.png', //icon_GenerateDO.png',
                                        fit: BoxFit.fill, height: 102,
                                        width: 102,
                                      ),

                                      // CircleAvatar(
                                      //     radius: 46.0,
                                      //     child: Icon(
                                      //         Icons.account_circle_sharp,
                                      //         color: Colors.red)
                                      //     // child: Image.asset(
                                      //     //   'assets/icons/Group 2920.png', //icon_GenerateDO.png',
                                      //     //   fit: BoxFit.cover, height: 62,
                                      //     //   width: 62,
                                      //     // ), //Text("A"),
                                      //     ),
                                    ),
                                    alignment: FractionalOffset(0.5, 0.0),
                                  ),
                                ),
                              ],
                            ),
                            // Container(
                            //   color: Colors.pink,
                            //   height: 450.0,
                            //   width: 200,
                            // )

                            //Text("hi"),
                          ),
                        ),
                      ),
                      // Image.asset(
                      //   'assets/images/Home_Screen_img1_2.png',
                      //   height: 250,
                      //   fit: BoxFit.fitWidth,
                      // ),
                    ],
                  ),
                ],
              ),
              // Stack(
              //   children: [
              //     Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(top: 10.0),
              //           child: Container(
              //             height: 300.0,
              //             width: 380,
              //             // alignment: Alignment.center,
              //             child: Card(
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15.0),
              //               ),
              //               child: Column(
              //                 //  mainAxisSize: MainAxisSize.min,
              //                 children: <Widget>[
              //                   const ListTile(
              //                     title: Padding(
              //                       padding: EdgeInsets.only(top: 20.0),
              //                       child: Text(
              //                         'Sign in using OTP',
              //                         style: TextStyle(
              //                           fontFamily: 'Roboto',
              //                           fontSize: 18,
              //                           color: const Color(0xff3a3a3a),
              //                           fontWeight: FontWeight.w500,
              //                           height: 1.4285714285714286,
              //                         ),
              //                         textHeightBehavior:
              //                             TextHeightBehavior(
              //                                 applyHeightToFirstAscent:
              //                                     false),
              //                         textAlign: TextAlign.center,
              //                       ),
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Column(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.start,
              //                       children: <Widget>[
              //                         Padding(
              //                           padding:
              //                               EdgeInsets.only(top: 20.0),
              //                           child: Text(
              //                             'Enter E-mail ID or Mobile No. to receive OTP',
              //                             style: TextStyle(
              //                               fontFamily: 'Roboto',
              //                               fontSize: 13,
              //                               color:
              //                                   const Color(0xff3a3a3a),
              //                             ),
              //                             textAlign: TextAlign.left,
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding:
              //                               const EdgeInsets.all(15.0),
              //                           child: TextFormField(
              //                             obscureText: false,
              //                             //controller: _newPasswordTextFieldController,
              //                             decoration: InputDecoration(
              //                                 labelText:
              //                                     "Enter E-mail ID or Mobile No.",
              //                                 labelStyle: TextStyle(
              //                                   fontFamily: 'Roboto',
              //                                   fontSize: 12,
              //                                   color: const Color(
              //                                       0xff3a3a3a),
              //                                 )),
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding:
              //                               const EdgeInsets.all(8.0),
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment
              //                                     .spaceBetween,
              //                             children: [
              //                               Padding(
              //                                 padding:
              //                                     const EdgeInsets.only(
              //                                         left: 18.0),
              //                                 child: Text(
              //                                   "Clear",
              //                                   style: TextStyle(
              //                                     color: const Color(
              //                                         0xFF0461AA),
              //                                   ),
              //                                 ),
              //                               ),
              //                               Padding(
              //                                 padding:
              //                                     const EdgeInsets.all(
              //                                         8.0),
              //                                 child: ElevatedButton(
              //                                   style: ElevatedButton
              //                                       .styleFrom(
              //                                     elevation: 12,
              //                                     primary: const Color(
              //                                         0xFF0461AA),
              //                                   ),
              //                                   onPressed: () {
              //                                     Navigator.push(
              //                                       context,
              //                                       MaterialPageRoute(
              //                                           builder: (context) =>
              //                                               ImportMenuEdo()),
              //                                     );
              //                                   },
              //                                   child: Container(
              //                                     width: 100,
              //                                     height: 50,
              //                                     child: Center(
              //                                       child: Text(
              //                                         "Submit",
              //                                         style: TextStyle(
              //                                             color: Colors
              //                                                 .white),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             // Container(
              //             //   color: Colors.pink,
              //             //   height: 450.0,
              //             //   width: 200,
              //             // )

              //             //Text("hi"),
              //           ),
              //         ),
              //         // Image.asset(
              //         //   'assets/images/Home_Screen_img1_2.png',
              //         //   height: 250,
              //         //   fit: BoxFit.fitWidth,
              //         // ),
              //       ],
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // GestureDetector(
                              //     child: Container(
                              //       height: 130,
                              //       width:
                              //           MediaQuery.of(context).size.width / 2.5,
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
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
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
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(
                              //       //       builder: (context) => MoreServices()),
                              //       // );
                              //     }),
                              // SizedBox(
                              //   width: 10.0,
                              // ),
                              // GestureDetector(
                              //     child: Container(
                              //       height: 130,
                              //       width:
                              //           MediaQuery.of(context).size.width / 2.5,
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
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
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
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(
                              //       //       builder: (context) =>
                              //       //           ApplicableCharges()),
                              //       // );
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          builder: (context) =>
                                              ContactDetails()),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              SizedBox(
                                width: 10.0,
                              ),
                              // GestureDetector(
                              //     child: Container(
                              //       height: 130,
                              //       width:
                              //           MediaQuery.of(context).size.width / 2.5,
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
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
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
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(
                              //       //       builder: (context) =>
                              //       //           OtherServices()),
                              //       // );
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
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Color(0xFFFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child:
                      Center(child: Image.asset('assets/images/Kale Logo.png')),
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 80,
              //   color: Color(0xFFFFFFFF),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Terms and Conditions',
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
      ),
    );
  }

  loginUser(context) async {
    try {
      showLoadingDialog(context, true);

      setState(() {
        isLoading = true;
      });
      // showLoadingDialog(context);
      await Global()
          .postData(
        Settings.SERVICES['Login'],
        userCred,
      )
          .then((response) async {
        if (response != null) {
          if (response.statusCode == HttpStatus.unauthorized) {
            showLoadingDialog(context, false);
            print('Provided Username and Password is incorrect');
            showAlertDialog(
                context, "OK", "Alert", "Username or Password is incorrect");
          } else {
            print("***********  UserDetails  ***********");
            var msg = json.decode(response.body)['Message'];
            var parsed = json.decode(msg)['StatusMessage'];
            var table = json.decode(parsed)['Table'];
            print(table[0].toString());

            UserDetails _userDets = UserDetails.fromJson(table[0]);
            showLoadingDialog(context, false);
            setState(() {
              isLoading = false;
            });

            if (_userDets.OrgTypeName == 'Terminal Operator' ||
                _userDets.OrgTypeName == "Inland Container Depot" ||
                _userDets.OrgTypeName == "Container Depot" ||
                _userDets.OrgTypeName == "Empty Depot" ||
                _userDets.OrgTypeName == "Importer" ||
                _userDets.OrgTypeName == "Customs Broker" ||
                _userDets.OrgTypeName == "Freight Forwarders") {
              setPreferences(_userDets);

              print("Welcome " +
                  _userDets.UserId.toString() +
                  "  " +
                  _userDets.FirstName +
                  "  ORG ID = " +
                  _userDets.OrganizationId.toString());

              Global.displayName =
                  _userDets.FirstName + " " + _userDets.LastName;
              Global.currUserId = _userDets.UserId;

              print(_userDets.OrgTypeName);
              Global.orgId = _userDets.OrganizationId;
              Global.OrgTypeName = _userDets.OrgTypeName;
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => DashboardPage()));
            } else {
              // $("body").mLoading('hide');
              // errmsg =
              //     "You are not authenticate user for access this application.</br>";
              // $.alert(errmsg);
              showAlertDialog(context, "OK", "Alert",
                  "You are not authenticate user for access this application.");
              return false;
            }
          }
        }
        // ignore: invalid_return_type_for_catch_error
      }).catchError((onError) => {print(onError)});
    } catch (e) {
      showMessageBox(context, "OK", "Validation Failed", e.toString());
    }
  }

  void setPreferences(UserDetails _userDets) async {
    print(_userDets);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn_DO", true);
    prefs.setString("userType_DO", _userDets.OrgTypeName);
    prefs.setString("logindate_DO", DateTime.now().toString());
    prefs.setString(
        "displayName_DO", _userDets.FirstName + " " + _userDets.LastName);

    prefs.setInt("UserId_DO", _userDets.UserId);
    prefs.setInt("orgId_DO", _userDets.OrganizationId);
    prefs.setString("OrgTypeName_DO", _userDets.OrgTypeName.toString());
  }
}
