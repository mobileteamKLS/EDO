import 'dart:async';
// import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatefulWidget {
  final String? path;
  final String? pgTitle;

  PDFScreen({Key? key, this.path, this.pgTitle}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    print("pages ==" + pages.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pgTitle.toString()),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.share),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : pages != 0
                  ? Center(
                      child: Center(child: Text(errorMessage)),
                    )
                  : Center(
                      child: Center(child: Text("No attachments")),
                    )
        ],
      ),
      floatingActionButton: pages == 0
          ? new Container()
          : FutureBuilder<PDFViewController>(
              future: _controller.future,
              builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
                if (snapshot.hasData) {
                  return FloatingActionButton.extended(
                    label: Text("Go to ${pages! ~/ 2}"),
                    onPressed: () async {
                      await snapshot.data!.setPage(pages! ~/ 2);
                    },
                  );
                }

                return Container();
              },
            ),
    );
  }
}
