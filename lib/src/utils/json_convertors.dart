import 'package:freezed_annotation/freezed_annotation.dart';

class HttpUriConverter implements JsonConverter<Uri?, String?> {
  const HttpUriConverter();

  @override
  Uri? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    return createHttpUri(json);
  }

  @override
  String? toJson(Uri? object) {
    if (object == null) return null;
    return object.toString();
  }

  static Uri createHttpUri(String path) {
    Uri? uri = Uri.tryParse(path);

    //! Logic can be extended to allow localhost and IP address as well as per the requirement
    if (uri != null && (uri.isScheme('http') || uri.isScheme('https'))) {
      return uri;
    } else {
      throw ArgumentError('Invalid URL: $path');
    }
  }
}
