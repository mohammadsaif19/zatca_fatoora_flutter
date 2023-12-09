import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class QRStyleData {
  ///* Size of the QR code e.g: `200`
  final double size;

  ///* Background color of the QR code e.g: `Colors.white`
  final Color backgroundColor;

  ///* Color of the QR code e.g: `Colors.black`
  final Color qrColor;

  ///* Image in center of the QR code e.g: `AssetImage('images/logo.png')`
  final ImageProvider? image;

  ///* if you want to make the QR code border rounded or not e.g: `true`
  final bool isBorderShapeRounded;

  const QRStyleData({
    this.size = 200,
    this.backgroundColor = FatooraColorsPalette.backgroundColor,
    this.qrColor = FatooraColorsPalette.qrColor,
    this.image,
    this.isBorderShapeRounded = true,
  });
}
