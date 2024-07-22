class DefaultResponse {
  bool? _success;
  dynamic _data;
  String? _message;

  DefaultResponse({bool? success, dynamic? data, String? message}) {
    if (success != null) {
      _success = success;
    }
    if (data != null) {
      _data = data;
    }
    if (message != null) {
      _message = message;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;

  dynamic get data => _data;
  set data(dynamic data) => _data = data;

  String? get message => _message;
  set message(String? message) => _message = message;

  DefaultResponse.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = _success;
    if (_data != null) {
      data['data'] = _data;
    }
    data['message'] = _message;
    return data;
  }
}
