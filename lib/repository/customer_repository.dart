import 'package:customer_app/models/api_content_empty_model.dart';
import 'package:customer_app/models/custom_model.dart';
import 'package:customer_app/models/error_model.dart';
import 'package:customer_app/models/get_all_customers_model.dart';
import 'package:customer_app/parameters/create_customer_params.dart';
import 'package:customer_app/parameters/delete_customer_params.dart';
import 'package:customer_app/parameters/edit_customer_params.dart';
import 'package:customer_app/remote/remote_api.dart';
import 'package:dartz/dartz.dart';
import '../models/app_exception_model.dart';
import '../parameters/get_customers_params.dart';

class CustomerRepository {
  final remoteDataSource = RemoteApi();

  CustomerRepository();
  //get all customers
  Future<Either<ErrorModel, GetAllCustomersModel?>> getAllCustomers(
      GetAllParams params) async {
    try {
      final remote = await remoteDataSource.get(params);
      final data = CustomModel<GetAllCustomersModel>.fromJson(
        remote,
        parser: GetAllCustomersModel.fromJson,
      );
      return right(data.data);
    } on AppException catch (e) {
      return left(ErrorModel(errors: [e.toString()]));
    }
  }

  // create customer
  Future<Either<ErrorModel, ApiContentEmptyModel?>> createCustomer(
      CreateCustomerParams params) async {
    try {
      final remote = await remoteDataSource.post(params);
      final data = CustomModel<ApiContentEmptyModel>.fromJson(
        remote,
        parser: ApiContentEmptyModel.fromJson,
      );
      print(params);
      return right(data.data);
    } on AppException catch (e) {
      return left(ErrorModel(errors: [e.toString()]));
    }
  }

  // Edit todo
  Future<Either<ErrorModel, ApiContentEmptyModel?>> editCustomer(
      EditCustomerParams params) async {
    try {
      final remote = await remoteDataSource.put(params);
      final data = CustomModel<ApiContentEmptyModel>.fromJson(
        remote,
        parser: ApiContentEmptyModel.fromJson,
      );
      print(params);
      return right(data.data);
    } on AppException catch (e) {
      return left(ErrorModel(errors: [e.toString()]));
    }
  }

  //Delete customer
  Future<Either<ErrorModel, ApiContentEmptyModel?>> deleteCustomer(
      DeleteCustomerParams params) async {
    try {
      final remote = await remoteDataSource.delete(params);
      final data = CustomModel<ApiContentEmptyModel>.fromJson(
        remote,
        parser: ApiContentEmptyModel.fromJson,
      );
      print(params);
      return right(data.data);
    } on Exception catch (e) {
      return left(ErrorModel(errors: [e.toString()]));
    }
  }
}
