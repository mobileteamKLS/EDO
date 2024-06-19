import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'constants/constants.dart';

class Global {
  static bool isTerminal = false;
  static bool isTransporter = false;
  static bool isPortOperator = false;
  static int currUserId = 0;
  static int orgId = 0;
  static String displayName = "un";
  static String OrgTypeName = "dd";

  Future<Post> postData(service, payload) async {
    print("payload " + payload.toString());
    return fetchData(service, payload);
  }

  Future<Post> fetchData(apiname, payload) async {
    print("fetchData for API " +
        apiname.toString() +
        " payload " +
        payload.toString());

    var newURL = Settings.SERVER_URL + apiname;
    if (payload == "") {
      print("payload blank");
      return await http.post(
        Uri.parse(newURL),
        body: json.encode({}),
        headers: {
          'Content-Type': 'application/json',
        },
      ).then((http.Response response) {
        print(response.body);
        print(response.statusCode);

        final int statusCode = response.statusCode;
        if (statusCode == 401) {
          return Post.fromJson(response.body, statusCode);
        }
        if (statusCode < 200 || statusCode > 400) {
          throw new Exception("Error while fetching data");
        }
        print("sending data to post");
        return Post.fromJson(response.body, statusCode);
      });
    } else {
      print("Payload not blank");
      print(json.encode(payload));
      return await http.post(
        Uri.parse(newURL),
        body: json.encode(payload),
        headers: {
          'Content-Type': 'application/json',
        },
      ).then((http.Response response) {
        print("response received");
        print(response);
        print(response.body);
        print(response.statusCode);

        final int statusCode = response.statusCode;
        if (statusCode == 401) {
          return Post.fromJson(response.body, statusCode);
        }
        if (statusCode < 200 || statusCode > 400) {
          return Post.fromJson(response.body, statusCode);
        }
        print("sending data to post");
        return Post.fromJson(response.body, statusCode);
      });
    }

    //return http.get(Uri.parse('http://113.193.225.56:8080/POCMobile/api/DOAPILogin'));
  }

  Future<Post> setData(apiname, payload) async {
    return saveData(apiname, payload);
  }

  Future<Post> saveData(apiname, payload) async {
    var newURL = Settings.SERVER_URL + apiname;
    print(newURL);
    print("payload " + json.encode(payload));
    return await http
        .post(
          Uri.parse(newURL),
          body: json.encode(payload),
          headers: {
            'Content-Type': 'application/json',
          },
        )
        .then((http.Response response) {
          print("response received");
          print(response.body);

          final int statusCode = response.statusCode;
          if (statusCode == 401) {
            return Post.fromJson(response.body, statusCode);
          }
          if (statusCode < 200 || statusCode > 400 || json == null) {
            throw new Exception("Error while fetching data");
          }
          return Post.fromJson(response.body, statusCode);
        })
        .catchError((onError) {})
        .whenComplete(() {
          print("completed");
        })
        .catchError((onError) => print(onError));
  }
}

class Post {
  final int statusCode;
  final String body;

  Post({required this.statusCode, required this.body});

  factory Post.fromJson(String json, int statusCode) {
    return Post(
      statusCode: statusCode,
      body: json,
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["statusCode"] = statusCode;
    map["body"] = body;
    return map;
  }
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
