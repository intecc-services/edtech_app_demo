import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatelessWidget {
  final String url;

  const PDFViewerPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.network(
        url,
        canShowPaginationDialog: true,
        pageSpacing: 4,
        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
          print(details.description);
        },
      ),
    );
  }
}
