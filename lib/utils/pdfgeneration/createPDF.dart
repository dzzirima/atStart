import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class CreatePdf {
  static Future<void> createPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text("Hello world"),
        ),
      ),
    );

    try {
      final output = await getTemporaryDirectory();
      print(output.toString());
      final file = File("${output.path}/example.pdf");

      await file.writeAsBytes(await pdf.save());

      //previewing it
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) => pdf.save(),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
