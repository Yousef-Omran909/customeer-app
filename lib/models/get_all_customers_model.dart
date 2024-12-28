import 'package:customer_app/models/custom_model.dart';

class GetAllCustomersModel extends ApiContentModel {
  late final List<CustomerModel> customers;
  GetAllCustomersModel({this.customers = const []});

  @override
  GetAllCustomersModel.fromJson(dynamic json) {
    customers = [];
    for (var e in json['data']) {
      customers.add(CustomerModel.fromJson(e));
    }
    // for(int i=0;i<)
    // json.forEach((v) {
    //   customers.add(CustomerModel.fromJson(v));
    // });
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['customer'] = customers.map((v) => v.toJson()).toList();

    return json;
  }

  @override
  fromJson(dynamic json) {
    return GetAllCustomersModel.fromJson(json);
  }
}

class CustomerModel {
  late final int id;
  late final String lastName;
  late final String firstName;
  late final String fullName;
  late final String userName;
  late final String email;
  late final String phoneNumber;
  late final num wallet;
  late final List<Avatar> avatar;

  CustomerModel({
    this.id = 0,
    this.lastName = '',
    this.firstName = '',
    this.fullName = '',
    this.userName = '',
    this.email = '',
    this.phoneNumber = '',
    this.wallet = 0,
    this.avatar = const [],
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    lastName = json['last_name'] ?? '';
    firstName = json['first_name'] ?? '';
    fullName = json['full_name'] ?? '';
    userName = json['user_name'] ?? '';
    email = json['email'] ?? '';
    phoneNumber = json['phone_number'] ?? '';
    wallet = num.parse(json['wallet'] ?? '');
    avatar = [];
    if (json['avatar'] != null) {
      json['avatar'].forEach((v) {
        avatar.add(Avatar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['full_name'] = fullName;
    data['user_name'] = userName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['wallet'] = wallet;
    data['avatar'] = avatar.map((v) => v.toJson()).toList();

    return data;
  }
}

class Avatar {
  late final int id;
  late final String originalUrl;
  late final String previewUrl;

  Avatar({this.id = 0, this.originalUrl = '', this.previewUrl = ''});

  Avatar.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    originalUrl = json['original_url'] ?? '';
    previewUrl = json['preview_url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['original_url'] = originalUrl;
    data['preview_url'] = previewUrl;
    return data;
  }
}
