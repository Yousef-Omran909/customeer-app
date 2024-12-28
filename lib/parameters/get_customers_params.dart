import '../constant.dart';
import 'model_params.dart';

class GetAllParams extends ParamsModel<GetAllParamsBody> {
  const GetAllParams({super.body}) : super(baseUrl: kUrl);

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => 'customer';

  @override
  Map<String, String> get urlParams => body?.toJson() ?? {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class GetAllParamsBody extends BaseBodyModel {
  GetAllParamsBody();

  @override
  Map<String, String> toJson() => {"limit": "10", "with_pagination": "yes"};
}
