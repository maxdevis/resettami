import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum eLogin {
  KEY_REMEMBER,
  KEY_USERNAME,
  KEY_PASSWORD,
  KEY_TOKEN,
  KEY_TYPE_AUTH
}

class Auth {

  final _storage = const FlutterSecureStorage();

  Future<void> setTypeAuth(String value) async {
    return await _storage.write(key: eLogin.KEY_TYPE_AUTH.toString(), value: value);
  }

  Future<void> setToken(String value) async {
    return await _storage.write(key: eLogin.KEY_TOKEN.toString(), value: value);
  }

  Future<void> setUsername(String value) async {
    return await _storage.write(key: eLogin.KEY_USERNAME.toString(), value: value);
  }

  Future<void> setPassword(String value) async {
    return await _storage.write(key: eLogin.KEY_PASSWORD.toString(), value: value);
  }

  Future<void> setRemember(String value) async {
    return await _storage.write(key: eLogin.KEY_REMEMBER.toString(), value: value);
  }

  Future<String> getTypeAuth() async {
    return await _storage.read(key: eLogin.KEY_TYPE_AUTH.toString()) ?? '';
  }

  Future<String> getToken() async {
    return await _storage.read(key: eLogin.KEY_TOKEN.toString()) ?? '';
  }

  Future<String> getUsername() async {
    return await _storage.read(key: eLogin.KEY_USERNAME.toString()) ?? '';
  }

  Future<String> getPassword() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await _storage.read(key: eLogin.KEY_PASSWORD.toString()) ?? '';
  }

  Future<bool> getRemeber() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return (await _storage.read(key: eLogin.KEY_REMEMBER.toString()) ?? 'false').toString() == 'true';
  }

}