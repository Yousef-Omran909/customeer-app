class CustomModel<T extends ApiContentModel> {
  late final T Function(dynamic)? parser;
  late final String status;
  late final String message;
  late final T? data;

  CustomModel({this.status = 'success', this.data, this.message = ''});

  CustomModel.fromJson(dynamic json, {this.parser}) {
    status = json['status'] ?? '';
    message = json['message'] ?? '';
    if (parser != null) {
      data = parser?.call(json['data'] ?? {});
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

abstract class ApiContentModel {
  ApiContentModel();
  Map<String, dynamic> toJson();
  fromJson(dynamic json);
}
