class ErrorModel {
  late final List<String> errors;
  ErrorModel({this.errors = const []});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'] ?? [];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['errors'] = errors;
    return json;
  }
}
