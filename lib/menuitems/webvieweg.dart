import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:e_do/menuitems/pdfscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  String _loadHTML() {
    return r'''
     <html>
<body onload='document.forms["myForm1"].submit()'>
	<form id='myForm1' name='myForm1' method='POST' action='https://edouat.kalelogistics.com/ReportBuilder/Export.aspx'
		target='_self'>
		<input type='hidden' id='OrgId' name='OrgId' value=884 />
		<input type='hidden' id='Branchid' name='Branchid' value=958 />
		<input type='hidden' id='CreatedBy' name='CreatedBy' value=1 />
		<input type='hidden' id='ReportName' name='ReportName' value=MEDO />
		<input type='hidden' id='Module' name='Module' value=MEDO />
		<input type='hidden' id='TemplateType' name='TemplateType' value=0 />
		<input type='hidden' id='SPName' name='SPName' value=CDX_GET_DO_REQUEST_FOR_REPORT_REPORTBUILDER />
		<input type='hidden' id='Mode' name='Mode' value='' />
		<input type='hidden' id='TemplateName' name='TemplateName' value='' />
		<input type='hidden' id='DoNo' name='DoNo' value=DOT163032021MSC />
		<input type='hidden' id='ParamId' name='ParamId' value=6192 />
		<input type='hidden' id='ParamName' name='ParamName' value=DoRequestId />
		<input type='hidden' id='HBLId' name='HBLId' value='0' />
		<input type='hidden' id='TemplateId' name='TemplateId' value=0 />
		<input type='hidden' id='ReportMode' name='ReportMode' value=DOPDF />
		<script>
		</script>
	</form>
</body>
</html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 12, backgroundColor: const Color(0xFF0461AA),
              ),
              onPressed: () {
                // if (_formKey.currentState!
                //     .validate()) {
                print("Process data");
                //showLoadingDialog(context);
                loginUser(context);
                // } else {
                //   print('validation failed');
                // }
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
    // return WebviewScaffold(
    //   withJavascript: true,
    //   appCacheEnabled: true,
    //   url:
    //       new Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),
    // );
  }

  loginUser(context) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://113.193.225.56:8080/DOAPI/api/GetViewDoPrint'));
    request.body = json.encode({"uniquedo": "DO00022032276676"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(response);
      print(await json.decode(json.encode(response.headers)));
      var hdarr = [];
      // hdarr = response.headers.entries.cast<>();
      //var myHeaders = new Headers();
      print(response.headers.length);
      Map<String, String> header = new Map();
      header = response.headers;
      // print(header["Content-Type"]);
      var searchKey = "content-disposition";
      header.forEach((key, value) {
        if (key.toUpperCase() == searchKey.toUpperCase()) {
          print(key + " -- " + value);
          // ignore: unnecessary_null_comparison
          if (value == null) return;

          final keyString = value;
          final splitted = keyString.split(';');
          print(splitted);
          final fileName = (splitted[1].toString().replaceAll("filename=", ""))
              .replaceAll("\"", "");
          print("fileName === " + fileName);

          var finalfilepath =
              "http://113.193.225.56:8080/DOAPI/ReportBuilder/" + fileName;
          viewPdf(context, finalfilepath);
        }
      });
//..hdarr = header.
      // for (int i = 0; i < header.length; i++) {
      //   print(header.keys);
      // }

//   print(response.headers.)
//   for (var pair of res.headers.entries()) {
//    console.log(pair[0]+ ': '+ pair[1]);
// }
      //print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    //  showLoadingDialog(context, true);

    // setState(() {
    //   isLoading = true;
    // });
    // showLoadingDialog(context);
    //DO00022032276676
    // final userCred = {'uniquedo': "DO00022032276676"};
    // await Global()
    //     .postData(
    //   Settings.SERVICES['ViewDO'],
    //   userCred,
    // )
    //     .then((response) async {
    //   // ignore: unnecessary_null_comparison
    //   if (response != null) {
    //     print(response);
    // if (response.statusCode == HttpStatus.unauthorized) {
    //   // showLoadingDialog(context, false);
    //   // print('Provided Username and Password is incorrect');
    //   // showAlertDialog(
    //   //     context, "OK", "Alert", "Username or Password is incorrect");
    // } else {
    //   var msg = json.decode(response.body)['Message'];
    //   var parsed = json.decode(msg)['StatusMessage'];
    //   var table = json.decode(parsed)['Table'];
    //print("parsed " + table.toString());

    // UserDetails _userDets = UserDetails.fromJson(table[0]);

    // if (_userDets != null) setPreferences(_userDets);

    // //.map<UserDetails>((item) => UserDetails.fromJson(item));
    // print("***********  UserDetails  ***********");
    // print("Welcome " +
    //     _userDets.UserId.toString() +
    //     "  " +
    //     _userDets.FirstName);

    // Global.displayName = _userDets.FirstName + " " + _userDets.LastName;
    // Global.currUserId = _userDets.UserId;

    // print(_userDets.OrgTypeName);
    // //Global
    // Global.orgId = _userDets.OrganizationId;
    // setState(() {
    //   isLoading = false;
    // });
    // showLoadingDialog(context, false);
    // if (_userDets.OrgTypeName.toUpperCase() == "TRANSPORTER") {
    //   print("***********  Transporter  ***********");

    // } else if ((_userDets.OrgTypeName.toUpperCase() ==
    //         ("Terminal Operator".toUpperCase())) ||
    //     (_userDets.OrgTypeName.toUpperCase() ==
    //         ("Port Operator".toUpperCase()))) {
    //   Global.isTerminal = true;
    //   Global.isTransporter = false;
    //   Global.isPortOperator = false;

    //   if (_userDets.OrgTypeName.toUpperCase() ==
    //       ("Port Operator".toUpperCase())) {
    //     Global.isPortOperator = true;
    //   }
    //   // Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();//
    //   print("***********  SHIPPING LINE  ***********");
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => ImportMenuEdo()),
    //     (Route<dynamic> route) => false,
    //   );
    // }
    // }
    //   }
    //   // ignore: invalid_return_type_for_catch_error
    // }).catchError((onError) => {print(onError)});
  }

  viewPdf(context, docURL) {
    createFileOfPdfUrl(docURL).then((f) {
      print(f);

      if (f.path.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFScreen(path: f.path),
          ),
        );
      }
    });
  }

  Future<File> createFileOfPdfUrl(docURL) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      final url = docURL;
      print("url = " + url.toString());
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      var dirExternalStorage = await getExternalStorageDirectory();

      List<Directory>? lstDir = await getExternalStorageDirectories();
      for (var u in lstDir!) {
        print(u.path.toString());
      }

      print("Application Download  files");
      print("${dir.path}/$filename");

      print("Download files");
      print("${dirExternalStorage!.path}/$filename");

      File file = File("${dirExternalStorage.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      print(e);
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}
