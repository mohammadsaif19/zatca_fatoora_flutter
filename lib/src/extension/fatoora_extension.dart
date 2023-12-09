import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../const/fatoora_texts.dart';
import '../core/controller/fatoora_controller.dart';

//* Num extension
extension NumExt on num {
  ///* Get value like `50.90999 to 50.90` or `50.00 to 50`
  num get formatted {
    if (this % 1 == 0) {
      return toInt();
    } else {
      return double.parse(toStringAsFixed(2));
    }
  }

  ///* Num to string
  String get string => formatted.toString();

  ///* Get vat 15% from total price
  num get vat {
    return (this * 15 / 100).formatted;
  }

  ///* Get price with vat 15% from total price
  num get includedVat {
    return (this + (this * 15 / 100)).formatted;
  }
}

///* Bytes builder extension
extension BytesBuilderExt on BytesBuilder {
  ///* Convert string or dynamic to bytes and add it to bytes builder
  List<int> convertAndToBytes({required int byteIndex, required String data}) {
    addByte(byteIndex);
    List<int> bytes = utf8.encode(data);
    addByte(bytes.length);
    add(bytes);
    return bytes;
  }
}

//* Locale extension
extension LocaleExt on Locale {
  //* Check if locale is arabic
  bool get isEnglish => this == FatooraController.defaultLocale;

  ///* Get localized validation message
  String get vatValidationMsg => isEnglish
      ? FatooraTexts.vatValidationErrorMessageEn
      : FatooraTexts.vatValidationErrorMessageAr;
}
