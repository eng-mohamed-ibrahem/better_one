import 'dart:async';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: deprecated_member_use
/// This class doesn't work correctly, it's left for debugging purposes
/// Encrypts and decrypts strings using the encrypt package and stores the key in flutter secure storage.
class EncryptionHandler {
  factory EncryptionHandler() => _instance;
  static final EncryptionHandler _instance = EncryptionHandler._();
  EncryptionHandler._() {
    _storage = const FlutterSecureStorage();
    _encryptionKey();
  }

  late final FlutterSecureStorage _storage;
  late final String encryptionKey;
  final Completer<String> _completer = Completer<String>();

  /// get the encryption key
  Future<void> _encryptionKey() async {
    var keyString =
        await readKey('encryptionKey') ?? 'my32lengthsupersecretnooneknows1';
    if (await readKey('encryptionKey') == null) {
      await saveKey('encryptionKey', keyString);
    }
    encryptionKey = keyString;
    _completer.complete(keyString);
  }

  /// read the encryption key using flutter secure storage
  Future<String?> readKey(String key) async {
    return await _storage.read(
      key: key,
      iOptions: const IOSOptions(accessibility: IOSAccessibility.first_unlock),
    );
  }

  /// save the encryption key using flutter secure storage
  Future<void> saveKey(String key, String value) async {
    await _storage.write(
      key: key,
      value: value,
      iOptions: const IOSOptions(accessibility: IOSAccessibility.first_unlock),
    );
  }

  /// decrypt the text using encrypt package
  Future<String> decrypt(String text) async {
    await _completer.future;
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
    return decrypted;
  }

  /// encrypt the text using encrypt package
  Future<String> encrypt(String text) async {
    await _completer.future;
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }
}
