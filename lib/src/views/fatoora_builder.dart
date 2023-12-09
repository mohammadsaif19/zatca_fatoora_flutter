import 'package:zatca_fatoora_flutter/zatca_fatoora_flutter.dart';

import 'package:flutter/material.dart';

import '../core/controller/fatoora_controller.dart';

///* FatooraBuilder is a builder widget responsible for return context, data, and widget
class FatooraBuilder extends StatefulWidget {
  ///* `FatooraData` Pass all the required data to generate the QR code, and make sure all data is valid otherwise it won't be complint with `ZATCA (Zakat, Tax and Customs Authority)`
  final ZatcaFatooraDataModel fatooraData;

  ///* [QRStyleData] is used to style the `QR code`
  final QRStyleData? qrStyleData;

  ///* Builder function to return the context, qr-data, and widget
  final Widget Function(BuildContext context, String qrData, Widget qrCode)
      builder;

  const FatooraBuilder({
    Key? key,
    required this.fatooraData,
    this.qrStyleData,
    required this.builder,
  }) : super(key: key);

  @override
  State<FatooraBuilder> createState() => _FatooraBuilderState();
}

class _FatooraBuilderState extends State<FatooraBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      FatooraController.generateFatooraBase64Code(
          fatooraData: widget.fatooraData),
      ZatcaFatoora.styledQRCode(
        fatooraData: widget.fatooraData,
        qrStyleData: widget.qrStyleData,
      ),
    );
  }
}
