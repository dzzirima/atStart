import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

class CreatePdf {
  final products = <Product>[
    Product('19874', "chicken Gafa", 3.99, 2),
    Product('98452', "lorem.sentence(6)", 15, 2),
    Product('28375', "lorem.sentence(4)", 6.95, 3),
    Product('95673', "lorem.sentence(3)", 49.99, 4),
    Product('23763', "lorem.sentence(2)", 560.03, 1),
    Product('55209', "lorem.sentence(5)", 26, 1),
    Product('09853', "lorem.sentence(5)", 26, 1),
    Product('23463', "lorem.sentence(5)", 34, 1),
    Product('56783', "lorem.sentence(5)", 7, 4),
    Product('78256', "lorem.sentence(5)", 23, 1),
    Product('23745', "lorem.sentence(5)", 94, 1),
    Product('07834', "lorem.sentence(5)", 12, 1),
    Product('23547', "lorem.sentence(5)", 34, 1),
    Product('98387', "lorem.sentence(5)", 7.99, 2),
  ];

  Future<void> createPdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
      build: (context) => [_contentTable(context)],
    ));

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

  pw.Widget _contentTable(pw.Context context) {
    PdfColor baseColor = PdfColors.teal;
    PdfColor _baseTextColor = PdfColors.teal;
    PdfColor _darkColor = PdfColors.blueGrey800;

    const tableHeaders = [
      'SKU#',
      'Item Description',
      'Price',
      'Quantity',
      'Total'
    ];

    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        color: baseColor,
      ),
      headerHeight: 25,
      cellHeight: 40,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.center,
        4: pw.Alignment.centerRight,
      },
      headerStyle: pw.TextStyle(
        color: _baseTextColor,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: PdfColors.blueGrey800,
        fontSize: 10,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.blueGrey900,
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        products.length,
        (row) => List<String>.generate(
          tableHeaders.length,
          (col) => products[row].getIndex(col),
        ),
      ),
    );
  }
}

class Product {
  const Product(
    this.sku,
    this.productName,
    this.price,
    this.quantity,
  );

  final String sku;
  final String productName;
  final double price;
  final int quantity;
  double get total => price * quantity;

  String getIndex(int index) {
    switch (index) {
      case 0:
        return sku;
      case 1:
        return productName;
      case 2:
        return _formatCurrency(price);
      case 3:
        return quantity.toString();
      case 4:
        return _formatCurrency(total);
    }
    return '';
  }
}

String _formatCurrency(double amount) {
  return '\$${amount.toStringAsFixed(2)}';
}

String _formatDate(DateTime date) {
  final format = DateFormat.yMMMd('en_US');
  return format.format(date);
}
