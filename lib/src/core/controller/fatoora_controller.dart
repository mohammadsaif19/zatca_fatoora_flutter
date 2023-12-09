import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:zatca_fatoora_flutter/src/extension/fatoora_extension.dart';
import 'package:zatca_fatoora_flutter/zatca_fatoora_flutter.dart';

class FatooraController {
  FatooraController._();

  ///* Default locale
  static const Locale defaultLocale = Locale('en', 'US');

  ///* Generate the encrypted `base64` code of the invoice
  static String generateFatooraBase64Code(
      {required ZatcaFatooraDataModel fatooraData}) {
    BytesBuilder bytesBuilder = BytesBuilder();
    //* Business name
    bytesBuilder.convertAndToBytes(
        byteIndex: 1, data: fatooraData.businessName);

    //* VAT registration number
    bytesBuilder.convertAndToBytes(
        byteIndex: 2, data: fatooraData.vatRegistrationNumber);

    //* DateTime
    bytesBuilder.convertAndToBytes(
        byteIndex: 3, data: fatooraData.date.toIso8601String());

    //* Total amount
    bytesBuilder.convertAndToBytes(
        byteIndex: 4, data: fatooraData.totalAmountIncludingVat.string);

    //* VAT amount
    bytesBuilder.convertAndToBytes(
        byteIndex: 5, data: fatooraData.totalAmountIncludingVat.vat.string);

    //* Encode to base64
    Uint8List qrBytes = bytesBuilder.toBytes();

    //* Convert to base64
    String qrCodeBase64 = base64.encode(qrBytes);

    return qrCodeBase64;
  }

  ///* Generate the encrypted `base64` code of the invoice to pass into `QR code as data`
  // static String generateInvoiceQRData({required FatooraData fatooraData}) =>
  //     FatooraController.generateFatooraBase64Code(fatooraData: fatooraData);
}
