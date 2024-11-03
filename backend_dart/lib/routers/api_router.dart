import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class ApiRouter {
  final _authService = AuthService();
  final _userService = UserService();
  final router = Router();

  ApiRouter() {
    router.post('/register', (Request request) async {
      final userData = jsonDecode(await request.readAsString());
      return _userService.registerUser(userData);
    });

    router.post('/login', (Request request) async {
      final credentials = jsonDecode(await request.readAsString());
      return _authService.loginUser(credentials);
    });
  }
}
