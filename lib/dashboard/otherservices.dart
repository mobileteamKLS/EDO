import 'package:flutter/material.dart';

class OtherServices extends StatelessWidget {
  const OtherServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: Color(0xFF0461AA),
        title: Center(
          child: Text(
            'Other Services',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                    //  mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        //leading: Icon(Icons.album),
                        title: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Other Services Description here',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff3a3a3a),
                              fontWeight: FontWeight.w500,
                              height: 1.4285714285714286,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(child: Image.asset('assets/images/Kale Logo.png')),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            color: Color(0xFFFFFFFF),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terms and conditions',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: const Color(0xff3A3A3A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: const Color(0xff3A3A3A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
