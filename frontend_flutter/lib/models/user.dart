class User {
  final String fullName;
  final DateTime birthDate;
  final String gender;
  final String maritalStatus;
  final String idNumber;
  final String address;
  final String phone;
  final String email;

  User({
    required this.fullName,
    required this.birthDate,
    required this.gender,
    required this.maritalStatus,
    required this.idNumber,
    required this.address,
    required this.phone,
    required this.email,
  });

  // Converte o objeto User para JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'birthDate': birthDate.toIso8601String(), // Converte a data para string
      'gender': gender,
      'maritalStatus': maritalStatus,
      'idNumber': idNumber,
      'address': address,
      'phone': phone,
      'email': email,
    };
  }

  // Cria um objeto User a partir de JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
      idNumber: json['idNumber'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
