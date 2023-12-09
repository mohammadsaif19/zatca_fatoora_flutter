## Zatca e-invoice (fatoora) QR code generator in Flutter

<img src="./assets//images/zatca.jpg" alt="UniPay Arabic by Saif">

This package strictly follows the guidelines provided by the Zatca authority to generate a simplified e-invoice (fatoora) QR code to print into the Bill/invoice of your business.

For more info kindly visit the official [Zatca Docs.](https://zatca.gov.sa/en/E-Invoicing/Pages/default.aspx)

## Features

- Simple QR code
- QR code with logo and custom styling
- Custom QR code builder, so you can show your magic 🪄

## Usage

For full example of the code, kindly have a look here [/example](https://pub.dev/packages/zatca_fatoora_flutter/example)` folder.

### Simple QR code:

```dart
        ZatcaFatoora.simpleQRCode(
          fatooraData: ZatcaFatooraDataModel(
            businessName: "Business name",
            vatRegistrationNumber: "323456789123453",
            date: DateTime.now(),
            totalAmountIncludingVat: 50.75,
          ),
        )
```

### Styled QR Code:

```dart
       ZatcaFatoora.styledQRCode(
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
        )
```

### Custom QR Code Builder:

```dart
      ZatcaFatoora.customQRCode(
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
        )
```

#### - Thanks for visiting here, hope you find this package useful if so then don't forget to give a like and star into the repo. Have a Bugs-free day 😉👨‍💻
