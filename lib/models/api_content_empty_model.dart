import 'package:customer_app/models/custom_model.dart';

class ApiContentEmptyModel extends ApiContentModel {
  ApiContentEmptyModel.fromJson(dynamic json);
  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  fromJson(dynamic json) {
    return ApiContentEmptyModel.fromJson(json);
  }
}
