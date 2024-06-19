import 'package:e_do/auth/userlogin.dart';
import 'package:e_do/constants/constants.dart';
import 'package:e_do/widgets/commonwodgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../global.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  static final userCred = {'Loginid': ""};
  ValueChanged _onChangedUser = (val) => userCred['Loginid'] = val;
  bool isPasswordSent = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/Home_Screen_img1_2.png',
                        height: 300,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180.0),
                        child: Center(
                          child: Container(
                            height: 350.0,
                            width: MediaQuery.of(context).size.width / 1.05,
                            alignment: Alignment.center,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: isPasswordSent
                                  ? Center(
                                      child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "We've sent password reset instructions to your email address. If it doesn't arrive, be sure to check your spam folder.",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                color: const Color(0xff3a3a3a),
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Back to sign in',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 13,
                                                color: const Color(0xff0461aa),
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            UserLogin()));
                                          },
                                        ),
                                      ],
                                    ))
                                  : Column(
                                      //  mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const ListTile(
                                          //leading: Icon(Icons.album),
                                          title: Padding(
                                            padding: EdgeInsets.only(top: 30.0),
                                            child: Text(
                                              'Forgot Password?\nProvide your Email ID below.',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
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
                                                  obscureText: false,
                                                  onChanged: _onChangedUser,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          "Enter your Email ID",
                                                      labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        color: const Color(
                                                            0xff3a3a3a),
                                                      )),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      // setState(() {
                                                      //   isUserNameEntered = false;
                                                      // });
                                                      return 'required';
                                                    } else {
                                                      // setState(() {
                                                      //   isUserNameEntered = true;
                                                      // });
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 12, backgroundColor: const Color(0xFF0461AA),
                                                  ),
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      print("Process data");
                                                      //showLoadingDialog(context);
                                                      loginUser(context);
                                                    } else {
                                                      print(
                                                          'validation failed');
                                                    }
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    height: 50,
                                                    child: Center(
                                                      child: Text(
                                                        "Submit",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Back to sign in',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 13,
                                                      color: const Color(
                                                          0xff0461aa),
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  UserLogin()));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Color(0xFFFFFFFF),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          color: Color(0xFFFFFFFF),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                                child:
                                    Image.asset('assets/images/Kale Logo.png')),
                          ),
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Terms and Conditions',
                        //       style: TextStyle(
                        //         fontFamily: 'Roboto',
                        //         fontSize: 12,
                        //         color: const Color(0xff3A3A3A),
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 30.0,
                        //     ),
                        //     Text(
                        //       'Privacy Policy',
                        //       style: TextStyle(
                        //         fontFamily: 'Roboto',
                        //         fontSize: 12,
                        //         color: const Color(0xff3A3A3A),
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  loginUser(context) async {
    await Global()
        .postData(
      Settings.SERVICES['ForgotPassword'],
      userCred,
    )
        .then((response) async {
      if (response != null) {
        if (response.statusCode == HttpStatus.unauthorized) {
          // print('Provided username and password is incorrect');
          showAlertDialog(context, "OK", "Alert", "username is incorrect");
        } else {
          setState(() {
            isPasswordSent = true;
          });
        }
      }
      // ignore: invalid_return_type_for_catch_error
    }).catchError((onError) => {print(onError)});
  }
}
