import '../constant.dart';
import 'model_params.dart';

class EditCustomerParams extends ParamsModel<EditCustomerParamsBody> {
  EditCustomerParams({super.body}) : super(baseUrl: kUrl);

  @override
  RequestType? get requestType => RequestType.put;

  @override
  String? get url => 'customer/${body?.id ?? 0}';

  @override
  Map<String, dynamic> get urlParams => body?.toJson() ?? {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class EditCustomerParamsBody extends BaseBodyModel {
  EditCustomerParamsBody(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.countryId,
      this.stateId,
      this.cityId,
      this.currencyId});
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final int? currencyId;
  @override
  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "avatar": null,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "currency_id": currencyId
      };
  EditCustomerParamsBody copyWith(
          {final String? firstName,
          final String? lastName,
          final String? email,
          final String? phoneNumber,
          final int? countryId,
          final int? stateId,
          final int? cityId,
          final int? currencyId}) =>
      EditCustomerParamsBody(
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          countryId: countryId ?? this.countryId,
          cityId: cityId ?? this.cityId,
          currencyId: currencyId ?? this.currencyId,
          stateId: stateId ?? this.stateId);
}
