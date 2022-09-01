import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DisplayPdfScreen extends StatelessWidget {
  String pdf;
  DisplayPdfScreen(this.pdf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: Text("عرض النتيجة"),
        actions: [
          InkWell(
            onTap: () {
              Share.share(pdf);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Icon(
                Icons.share,
                size: 24,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SfPdfViewer.network(
        pdf,
      ),
    );
  }
}
