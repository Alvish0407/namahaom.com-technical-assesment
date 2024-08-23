import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage.g.dart';

enum SecureStorageKey {
  loginDetails,
}

@riverpod
Future<SecureStorage> secureStorage(SecureStorageRef ref) =>
    SecureStorage.getInstance(keys: {SecureStorageKey.loginDetails});

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

// extension LoginDetailsX on SecureStorage {
//   LoginDetails? get loginDetails {
//     final loginDetailsStr = get(SecureStorageKey.loginDetails);
//     if (loginDetailsStr != null) {
//       return LoginDetails.fromJson(jsonDecode(loginDetailsStr));
//     }
//     return null;
//   }
// }
