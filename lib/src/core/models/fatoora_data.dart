//*------------------------------------- Requirements -------------------------------------
// 1. Business name
// 2. VAT registration number
// 3. DateTime
// 4. Total amount
// 5. VAT amount

import 'package:flutter/material.dart';
import 'package:zatca_fatoora_flutter/src/extension/fatoora_extension.dart';

import '../controller/fatoora_controller.dart';

///* `Zatca Fatoora Data Model` Pass all the required data to generate the QR code, and make sure all data is valid otherwise it won't be complint with `ZATCA (Zakat, Tax and Customs Authority)`
class ZatcaFatooraDataModel {
  ///* Businsess Name e.g: `Al-Baik Food Co.`
  late String businessName;

  ///* [15 Digit] VAT registration number of the company e.g: `323456789123453`, make sure your company is registered with `ZATCA (Zakat, Tax and Customs Authority)`
  late String vatRegistrationNumber;

  ///* Date of the invoice e.g: `DateTime.now()`
  late DateTime date;

  ///* Total amount of the invoice including `vat` in [SAR] e.g: `50.45`
  late num totalAmountIncludingVat;

  ///* Default locale is Arabic `Locale('ar', 'SA')`
  late Locale locale;

  late num vat;

  ZatcaFatooraDataModel({
    required this.businessName,
    required this.vatRegistrationNumber,
    required this.date,
    required this.totalAmountIncludingVat,
    this.locale = FatooraController.defaultLocale,
  })  : vat = totalAmountIncludingVat.vat.formatted,
        assert(vatRegistrationNumber.length == 15, locale.vatValidationMsg),
        assert(vatRegistrationNumber.startsWith("3"), locale.vatValidationMsg),
        assert(vatRegistrationNumber.split("").last == "3",
            locale.vatValidationMsg);

  ///* Convert `FatooraData` to `Map`
  Map<String, dynamic> toMap() => {
        'businessName': businessName,
        'vatRegistrationNumber': vatRegistrationNumber,
        'date': date,
        'totalAmountIncludingVat': totalAmountIncludingVat,
      };
}
