import 'dart:convert';

import 'package:customer_app/models/app_exception_model.dart';
import 'package:dio/dio.dart';
import '../constant.dart';
import '../parameters/model_params.dart';

class RemoteApi {
  static Dio dio = Dio();
  //Get
  Future<Map<String, dynamic>> get(ParamsModel params) async {
    try {
      var response = await dio.get(kUrl + (params.url ?? ''),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmIwN2FkZDZkZjM2NDk4MTkyNjAwNmYxZTM3ZWY1NzU1MWQ3ZDAzNzFlMDllMzRhYWIxZjg4ZjczMzBiNjJkNDFkNTkwODBkYzYzODNlYmEiLCJpYXQiOjE3MjgyOTU4OTguMTM5MTk4LCJuYmYiOjE3MjgyOTU4OTguMTM5MjAyLCJleHAiOjE3NTk4MzE4OTguMTMxODM2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Z4rnxMsQ-PRHpTyKk0__LXA-vU-sd6pStRdLdOf-HMzTOrFrMnveWIRqvPPMUw-7o2GE6q9oZam40qYlhfMqWyQTetFfW45NXouk2OJiTCtwJBk24RSUsy2NaEy8QjrN00HoldMzW-xrVazyxgSrZ1Y9RNU__oAqvYf0SGBO3aCPtyPb-uYkcVhu5m7hyLQFX6HjgWsZEpH0SEnd_uge5LjneSIJKynRrzfOByiXiJ2RdKpEEHNuNGx2ZWAB0dSLguzLEN3Igc7bn-rRvV2i-DYrhillQbv1c9UfrqjQ-xndXHIu5S3py6Qa7hSuYQEnnya7J3U-jLlAwlQzSgtOc5uEGMQBHSjgbUi0keYbU16870p9FR5jg4ijgBe8ns440Sl6_LhOB40AhBCsgfF13Qzz61SkyJ79O1T8njn03e0GTUL0rKyyEEkRQg6v4SKV75Y38JCEjYGIi3NofrLXhs9jfjCAwyWdNkXns4Eh50YK2KWXKOSo2pf4H7pMNAXIpkb9LPixtTanE9xusqBtOnIVEPAalYmgSaHyYv4tPWwEufNB_KvFmC27pRjOBPTiD0SwwNWaJDZLa8xAsJ6TS0nreLGTg_KCrAY5xD1cfTJVUqLzMt6TgkVljnHICgcnLA0vxaAk4cmr6T6t6PabnPvSUDqxOI4-TLaYE7PLxSA"
          }),
          queryParameters: params.urlParams);
      return responseReturn(response);
    } on DioException catch (e) {
      print(e);
      if (e.response == null) {
        print("///////////////////");
        throw AppException(msg: "no internet connection");
      }
      return responseReturn(e.response!);
    } on Exception catch (e) {
      throw AppException(msg: "$e");
    }
  }

  //post
  Future<Map<String, dynamic>> post(ParamsModel params) async {
    try {
      var response = await dio.post(kUrl + (params.url ?? ''),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmIwN2FkZDZkZjM2NDk4MTkyNjAwNmYxZTM3ZWY1NzU1MWQ3ZDAzNzFlMDllMzRhYWIxZjg4ZjczMzBiNjJkNDFkNTkwODBkYzYzODNlYmEiLCJpYXQiOjE3MjgyOTU4OTguMTM5MTk4LCJuYmYiOjE3MjgyOTU4OTguMTM5MjAyLCJleHAiOjE3NTk4MzE4OTguMTMxODM2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Z4rnxMsQ-PRHpTyKk0__LXA-vU-sd6pStRdLdOf-HMzTOrFrMnveWIRqvPPMUw-7o2GE6q9oZam40qYlhfMqWyQTetFfW45NXouk2OJiTCtwJBk24RSUsy2NaEy8QjrN00HoldMzW-xrVazyxgSrZ1Y9RNU__oAqvYf0SGBO3aCPtyPb-uYkcVhu5m7hyLQFX6HjgWsZEpH0SEnd_uge5LjneSIJKynRrzfOByiXiJ2RdKpEEHNuNGx2ZWAB0dSLguzLEN3Igc7bn-rRvV2i-DYrhillQbv1c9UfrqjQ-xndXHIu5S3py6Qa7hSuYQEnnya7J3U-jLlAwlQzSgtOc5uEGMQBHSjgbUi0keYbU16870p9FR5jg4ijgBe8ns440Sl6_LhOB40AhBCsgfF13Qzz61SkyJ79O1T8njn03e0GTUL0rKyyEEkRQg6v4SKV75Y38JCEjYGIi3NofrLXhs9jfjCAwyWdNkXns4Eh50YK2KWXKOSo2pf4H7pMNAXIpkb9LPixtTanE9xusqBtOnIVEPAalYmgSaHyYv4tPWwEufNB_KvFmC27pRjOBPTiD0SwwNWaJDZLa8xAsJ6TS0nreLGTg_KCrAY5xD1cfTJVUqLzMt6TgkVljnHICgcnLA0vxaAk4cmr6T6t6PabnPvSUDqxOI4-TLaYE7PLxSA"
          }),
          data: params.urlParams);
      return responseReturn(response);
    } on DioException catch (e) {
      return responseReturn(e.response!);
    } on Exception catch (e) {
      throw AppException(msg: "$e");
    }
  }

  //put
  Future<Map<String, dynamic>> put(ParamsModel params) async {
    try {
      var response = await dio.put(kUrl + (params.url ?? ''),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmIwN2FkZDZkZjM2NDk4MTkyNjAwNmYxZTM3ZWY1NzU1MWQ3ZDAzNzFlMDllMzRhYWIxZjg4ZjczMzBiNjJkNDFkNTkwODBkYzYzODNlYmEiLCJpYXQiOjE3MjgyOTU4OTguMTM5MTk4LCJuYmYiOjE3MjgyOTU4OTguMTM5MjAyLCJleHAiOjE3NTk4MzE4OTguMTMxODM2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Z4rnxMsQ-PRHpTyKk0__LXA-vU-sd6pStRdLdOf-HMzTOrFrMnveWIRqvPPMUw-7o2GE6q9oZam40qYlhfMqWyQTetFfW45NXouk2OJiTCtwJBk24RSUsy2NaEy8QjrN00HoldMzW-xrVazyxgSrZ1Y9RNU__oAqvYf0SGBO3aCPtyPb-uYkcVhu5m7hyLQFX6HjgWsZEpH0SEnd_uge5LjneSIJKynRrzfOByiXiJ2RdKpEEHNuNGx2ZWAB0dSLguzLEN3Igc7bn-rRvV2i-DYrhillQbv1c9UfrqjQ-xndXHIu5S3py6Qa7hSuYQEnnya7J3U-jLlAwlQzSgtOc5uEGMQBHSjgbUi0keYbU16870p9FR5jg4ijgBe8ns440Sl6_LhOB40AhBCsgfF13Qzz61SkyJ79O1T8njn03e0GTUL0rKyyEEkRQg6v4SKV75Y38JCEjYGIi3NofrLXhs9jfjCAwyWdNkXns4Eh50YK2KWXKOSo2pf4H7pMNAXIpkb9LPixtTanE9xusqBtOnIVEPAalYmgSaHyYv4tPWwEufNB_KvFmC27pRjOBPTiD0SwwNWaJDZLa8xAsJ6TS0nreLGTg_KCrAY5xD1cfTJVUqLzMt6TgkVljnHICgcnLA0vxaAk4cmr6T6t6PabnPvSUDqxOI4-TLaYE7PLxSA"
          }),
          queryParameters: params.urlParams);
      return responseReturn(response);
    } on DioException catch (e) {
      return responseReturn(e.response!);
    } on Exception catch (e) {
      throw AppException(msg: "$e");
    }
  }

  //delete
  Future<Map<String, dynamic>> delete(ParamsModel params) async {
    try {
      var response = await dio.delete(kUrl + (params.url ?? ''),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmIwN2FkZDZkZjM2NDk4MTkyNjAwNmYxZTM3ZWY1NzU1MWQ3ZDAzNzFlMDllMzRhYWIxZjg4ZjczMzBiNjJkNDFkNTkwODBkYzYzODNlYmEiLCJpYXQiOjE3MjgyOTU4OTguMTM5MTk4LCJuYmYiOjE3MjgyOTU4OTguMTM5MjAyLCJleHAiOjE3NTk4MzE4OTguMTMxODM2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Z4rnxMsQ-PRHpTyKk0__LXA-vU-sd6pStRdLdOf-HMzTOrFrMnveWIRqvPPMUw-7o2GE6q9oZam40qYlhfMqWyQTetFfW45NXouk2OJiTCtwJBk24RSUsy2NaEy8QjrN00HoldMzW-xrVazyxgSrZ1Y9RNU__oAqvYf0SGBO3aCPtyPb-uYkcVhu5m7hyLQFX6HjgWsZEpH0SEnd_uge5LjneSIJKynRrzfOByiXiJ2RdKpEEHNuNGx2ZWAB0dSLguzLEN3Igc7bn-rRvV2i-DYrhillQbv1c9UfrqjQ-xndXHIu5S3py6Qa7hSuYQEnnya7J3U-jLlAwlQzSgtOc5uEGMQBHSjgbUi0keYbU16870p9FR5jg4ijgBe8ns440Sl6_LhOB40AhBCsgfF13Qzz61SkyJ79O1T8njn03e0GTUL0rKyyEEkRQg6v4SKV75Y38JCEjYGIi3NofrLXhs9jfjCAwyWdNkXns4Eh50YK2KWXKOSo2pf4H7pMNAXIpkb9LPixtTanE9xusqBtOnIVEPAalYmgSaHyYv4tPWwEufNB_KvFmC27pRjOBPTiD0SwwNWaJDZLa8xAsJ6TS0nreLGTg_KCrAY5xD1cfTJVUqLzMt6TgkVljnHICgcnLA0vxaAk4cmr6T6t6PabnPvSUDqxOI4-TLaYE7PLxSA"
          }),
          data: params.urlParams);
      return responseReturn(response);
    } on DioException catch (e) {
      return responseReturn(e.response!);
    } on Exception catch (e) {
      throw AppException(msg: "$e");
    }
  }

  responseReturn(Response response) {
    final data = json.decode(response.toString());
    switch (response.statusCode) {
      case 200 || 201:
        print(response.statusCode);
        print(json.decode(response.toString()));
        return json.decode(response.toString());
      case 400 || 409 || 404 || 410 || 415 || 422 || 405:
        throw AppException(
            msg:
                (data['errors'] as List).firstOrNull ?? 'something went wrong');
      case 401:
        throw AppException(
            msg:
                (data['errors'] as List).firstOrNull ?? 'something went wrong');
      case 403:
        throw AppException(
            msg:
                (data['errors'] as List).firstOrNull ?? 'something went wrong');
      default:
        throw AppException(
            msg:
                (data['errors'] as List).firstOrNull ?? 'something went wrong');
    }
  }
}
