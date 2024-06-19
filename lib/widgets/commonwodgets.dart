import 'package:flutter/material.dart';

showLoadingDialog(BuildContext context, isLoad) {
  isLoad
      ? showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SimpleDialog(
                backgroundColor: Colors.white,
                children: <Widget>[
                  Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please Wait....",
                        style: TextStyle(
                          color: Color(0xFF0461AA),
                        ),
                      )
                    ]),
                  )
                ]);
          })
      : Navigator.pop(context);
}

showAlertDialog(context, buttonText, titleText, msgText) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(buttonText),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      titleText,
      style: TextStyle(
          fontFamily: 'Roboto', fontSize: 16, color: Colors.red.shade800),
    ),
    content: Text(
      msgText,
      style: TextStyle(fontFamily: 'Roboto', fontSize: 12),
    ),
    actions: [
      okButton,
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

showMessageBox(context, buttonText, titleText, msgText) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(buttonText),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      titleText,
      style: TextStyle(
          fontFamily: 'Roboto', fontSize: 16, color: Colors.red.shade800),
    ),
    content: Text(
      msgText,
      style: TextStyle(fontFamily: 'Roboto', fontSize: 12),
    ),
    actions: [
      okButton,
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
