
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {

  final storage = new FlutterSecureStorage();

  Future<String> getUsername() async {
    String username = await storage.read(key: "username");
    return username;
  }

  Future logout() async {
    await storage.delete(key: "token");
    await storage.delete(key: "email");
    await storage.delete(key: "username");
    await storage.delete(key: "password");
  }

  Future<String> getToken() async {
    String token = await storage.read(key: "token");
    return token;
  }

}
