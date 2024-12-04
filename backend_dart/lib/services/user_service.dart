import 'package:shelf/shelf.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Adicione essa biblioteca ao backend.
import 'dart:convert';
import 'dart:io';
import '../config/database_config.dart';

class UserService {
  Future<Response> registerUser(Map<String, dynamic> userData) async {
    final conn = await DatabaseConfig.getConnection();

    try {
      // Gerar um número de inscrição único
      final registrationNumber = DateTime.now().millisecondsSinceEpoch.toString();

      final result = await conn.query(
        'INSERT INTO users (full_name, birth_date, gender, marital_status, id_number, address, phone, email, password, registration_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          userData['full_name'],
          userData['birth_date'],
          userData['gender'],
          userData['marital_status'],
          userData['id_number'],
          userData['address'],
          userData['phone'],
          userData['email'],
          userData['password'],
          registrationNumber,
        ],
      );

      // Gerar o QR code com os dados do usuário e o número de inscrição
      final qrCodeData = jsonEncode({
        'full_name': userData['full_name'],
        'registration_number': registrationNumber,
      });

      final qrCode = await _generateQRCode(qrCodeData);

      return Response.ok(jsonEncode({
        'message': 'User registered successfully',
        'registration_number': registrationNumber,
        'qr_code': qrCode,
      }));
    } finally {
      await conn.close();
    }
  }

  Future<String> _generateQRCode(String data) async {
    final qrImage = QrPainter(
      data: data,
      version: QrVersions.auto,
      gapless: true,
    );
    final pngBytes = await qrImage.toImageData(200).then((byteData) => byteData!.buffer.asUint8List());
    final base64Image = base64Encode(pngBytes);
    return 'data:image/png;base64,$base64Image';
  }
}
