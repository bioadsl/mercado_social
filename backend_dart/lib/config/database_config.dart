import 'package:mysql1/mysql1.dart';

class DatabaseConfig {
  static final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'SUA_SENHA_AQUI',
    db: 'market_control',
  );

  static Future<MySqlConnection> getConnection() async {
    return await MySqlConnection.connect(settings);
  }
}
