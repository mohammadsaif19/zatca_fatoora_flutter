import 'package:flutter/material.dart';

import 'core/models/fatoora_data.dart';
import 'core/models/qr_data.dart';
import 'views/fatoora_builder.dart';
import 'views/fatoora_qr_code_view.dart';

class ZatcaFatoora {
  ZatcaFatoora._();

  ///* Generate Simple QR code to show in the E-Invoice (Fatoora)
  static Widget simpleQRCode({
    required ZatcaFatooraDataModel fatooraData,
  }) =>
      FatooraQRCode(fatooraData: fatooraData);

  ///* Generate QR code from the invoice as `Widget` to show in the `UI` with Custom style with color, logo, and so on...
  static Widget styledQRCode({
    required ZatcaFatooraDataModel fatooraData,
    QRStyleData? qrStyleData,
  }) =>
      FatooraQRCode(fatooraData: fatooraData, qrStyleData: qrStyleData);

  ///* Builder class `widget` to return the context, QR-Code Data as String, and widget of `QR code`
  static Widget customQRCode({
    required ZatcaFatooraDataModel fatooraData,
    QRStyleData? qrStyleData,
    required Widget Function(BuildContext context, String qrData, Widget qrCode)
        builder,
  }) {
    return FatooraBuilder(
      fatooraData: fatooraData,
      qrStyleData: qrStyleData,
      builder: builder,
    );
  }
}
