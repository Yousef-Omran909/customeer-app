import '../constant.dart';
import 'model_params.dart';

class GetAllParams extends ParamsModel<GetAllParamsBody> {
  const GetAllParams({super.body}) : super(baseUrl: kUrl);

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => 'customer';

  @override
  Map<String, dynamic> get urlParams => body?.toJson() ?? {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class GetAllParamsBody extends BaseBodyModel {
  GetAllParamsBody({required this.page});
  final int page;
  @override
  Map<String, dynamic> toJson() =>
      {"with_pagination": "yes", "limit": "10", "page": page};
}
