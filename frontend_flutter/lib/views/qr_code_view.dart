// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QrCodeView extends StatelessWidget {
//   final String data;

//   const QrCodeView({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Create the QrCode object
//     final qrCode = QrCode.fromData(
//       data: registrationNumber,
//       version: QrCodeVersion.auto,
//       errorCorrectLevel: QrErrorCorrectionLevel.L,
//     );

//     return Scaffold(
//       appBar: AppBar(title: const Text('QR Code')),
//       body: Center(
//         child: QrImage(
//         qrCode: QrCode.fromData(
//           data: registrationNumber,
//           version: QrCodeVersion.auto,
//           errorCorrectLevel: QrErrorCorrectionLevel.L,
//         ),
//           size: 200.0,
//         ),
//       ),
//     );
//   }
// }