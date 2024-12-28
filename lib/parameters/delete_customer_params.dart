import '../constant.dart';
import 'model_params.dart';

class DeleteCustomerParams extends ParamsModel<DeleteCustomerParamsBody> {
  DeleteCustomerParams({super.body}) : super(baseUrl: kUrl);

  @override
  RequestType? get requestType => RequestType.delete;

  @override
  String? get url => 'customer/${body?.id ?? 0}';

  @override
  Map<String, dynamic> get urlParams => body?.toJson() ?? {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class DeleteCustomerParamsBody extends BaseBodyModel {
  DeleteCustomerParamsBody({this.id});
  final int? id;
  @override
  Map<String, dynamic> toJson() => {};
}
