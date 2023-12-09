import 'package:zatca_fatoora_flutter/zatca_fatoora_flutter.dart';

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../core/controller/fatoora_controller.dart';

///* `Fatoora` is the widget that will generate the QR code and render it to the UI as a widget
class FatooraQRCode extends StatefulWidget {
  ///* `FatooraData` Pass all the required data to generate the QR code, and make sure all data is valid otherwise it won't be complint with `ZATCA (Zakat, Tax and Customs Authority)`
  final ZatcaFatooraDataModel fatooraData;

  ///* [QRStyleData] is used to style the `QR code`
  final QRStyleData qrStyleData;

  const FatooraQRCode({
    Key? key,
    required this.fatooraData,
    QRStyleData? qrStyleData,
  })  : qrStyleData = qrStyleData ?? const QRStyleData(),
        super(key: key);

  @override
  State<FatooraQRCode> createState() => _FatooraQRCodeState();
}

class _FatooraQRCodeState extends State<FatooraQRCode> {
  @override
  Widget build(BuildContext context) {
    ZatcaFatooraDataModel fatooraData = widget.fatooraData;
    QRStyleData qrStyleData = widget.qrStyleData;
    return Container(
      width: qrStyleData.size,
      height: qrStyleData.size,
      color: qrStyleData.backgroundColor,
      child: PrettyQr(
        image: qrStyleData.image,
        size: 200,
        data: FatooraController.generateFatooraBase64Code(
            fatooraData: fatooraData),
        errorCorrectLevel: QrErrorCorrectLevel.M,
        roundEdges: qrStyleData.isBorderShapeRounded,
        elementColor: qrStyleData.qrColor,
      ),
    );
  }
}
