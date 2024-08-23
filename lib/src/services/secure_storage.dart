import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/cart/domain/cart_model.dart';

part 'secure_storage.g.dart';

enum SecureStorageKey { cart }

@riverpod
Future<SecureStorage> secureStorage(SecureStorageRef ref) =>
    SecureStorage.getInstance(keys: {SecureStorageKey.cart});

class SecureStorage {
  SecureStorage._(this._flutterSecureStorage, this._cache);

  late final FlutterSecureStorage _flutterSecureStorage;

  late final Map<SecureStorageKey, String> _cache;

  static Future<SecureStorage> getInstance({required Set<SecureStorageKey> keys}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    final cache = <SecureStorageKey, String>{};
    await keys
        .map((key) => flutterSecureStorage.read(key: key.name).then((value) {
              if (value != null) {
                cache[key] = value;
              }
            }))
        .wait;
    return SecureStorage._(flutterSecureStorage, cache);
  }

  String? get(SecureStorageKey key) => _cache[key];

  Future<void> set(SecureStorageKey key, String value) {
    _cache[key] = value;
    return _flutterSecureStorage.write(key: key.name, value: value);
  }

  Future<void> remove(SecureStorageKey key) {
    _cache.remove(key);
    return _flutterSecureStorage.delete(key: key.name);
  }
}

extension SecureStorageX on SecureStorage {
  Cart? get getDecodedCart {
    final cartDetailsStr = get(SecureStorageKey.cart);
    if (cartDetailsStr != null) {
      return Cart.fromJson(jsonDecode(cartDetailsStr));
    }
    return null;
  }
}
