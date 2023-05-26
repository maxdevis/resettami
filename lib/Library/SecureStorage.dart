import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

class SecureStorage {
  // Create an instance and enable secure encryption:
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      synchronizable: false,
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  Future<void> saveData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    return await storage.read(key: key);
  }

  Future<Map<String, String>> readAllData(String key) async {
    return await storage.readAll();
  }

  Future<bool> containsData(String key) async {
    return await storage.containsKey(key: key);
  }

  Future<void> deleteData(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAllData() async {
    await storage.deleteAll();
  }
}
