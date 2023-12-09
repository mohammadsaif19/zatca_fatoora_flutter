import 'package:flutter/material.dart';
import 'package:zatca_fatoora_flutter/zatca_fatoora_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fatoora',
      theme: ThemeData(useMaterial3: true),
      home: const FatooraSimpleQRCodeView(),
      // home: const FatooraStyledQRCodeView(),
      // home: const FatooraCustomQRCodeView(),
    );
  }
}

///* Simple QR code view --------------------------------------------------------------
class FatooraSimpleQRCodeView extends StatelessWidget {
  const FatooraSimpleQRCodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fatoora Simple QR Code")),
      body: Center(
        child: ZatcaFatoora.simpleQRCode(
          fatooraData: ZatcaFatooraDataModel(
            businessName: "Business name",
            vatRegistrationNumber: "323456789123453",
            date: DateTime.now(),
            totalAmountIncludingVat: 50.75,
          ),
        ),
      ),
    );
  }
}

///* QR code view with your own style --------------------------------------------------------------
class FatooraStyledQRCodeView extends StatelessWidget {
  const FatooraStyledQRCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fatoora Styled QR Code")),
      body: Center(
        child: ZatcaFatoora.styledQRCode(
          fatooraData: ZatcaFatooraDataModel(
            businessName: "Business name",
            vatRegistrationNumber: "323456789123453",
            date: DateTime.now(),
            totalAmountIncludingVat: 50.85,
          ),

          // Provide your own style to the QR code data
          qrStyleData: QRStyleData(
            image: const AssetImage("assets/images/logo.jpeg"),
            size: 200,
            backgroundColor: Colors.green.withOpacity(.1),
            qrColor: Colors.green,
            isBorderShapeRounded: true,
          ),
        ),
      ),
    );
  }
}

///* Custom QR code view --------------------------------------------------------------
class FatooraCustomQRCodeView extends StatelessWidget {
  const FatooraCustomQRCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fatoora Custom QR Code")),
      body: Center(
        child: ZatcaFatoora.customQRCode(
          fatooraData: ZatcaFatooraDataModel(
            businessName: "Business name",
            vatRegistrationNumber: "323456789123453",
            date: DateTime.now(),
            totalAmountIncludingVat: 50.75,
          ),
          builder: (BuildContext context, String qrData, Widget qrCode) {
            // debugPrint("QR Code data: $qrData");
            return Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: qrCode,
            );
          },
        ),
      ),
    );
  }
}
