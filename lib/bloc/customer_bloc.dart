import 'package:customer_app/models/api_content_empty_model.dart';
import 'package:customer_app/parameters/create_customer_params.dart';
import 'package:customer_app/parameters/edit_customer_params.dart';
import 'package:customer_app/parameters/get_customers_params.dart';
import 'package:customer_app/repository/customer_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/get_all_customers_model.dart';
import '../parameters/delete_customer_params.dart';
part 'customer_bloc_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerBlocInitial()) {
    on<GetCustomerEvent>((event, emit) async {
      emit(GetAllLoadingState());
      var res = await CustomerRepository().getAllCustomers(event.params);
      res.fold((l) {
        emit(GetAllFailedState(msg: l.errors.first));
      }, (r) {
        emit(GetAllLoadedState(customers: r));
      });
    });

    on<AddCustomerEvent>((event, emit) async {
      emit(AddLoadingCustomerState());
      var res = await CustomerRepository().createCustomer(event.params);
      res.fold((l) {
        emit(AddFailedCustomerState(msg: l.errors.first));
      }, (r) {
        emit(AddedCustomerState(content: r));
      });
    });
    on<EditCustomerEvent>((event, emit) async {
      emit(EditLoadingState());
      var res = await CustomerRepository().editCustomer(event.params);
      res.fold((l) {
        emit(EditFailedState(msg: l.errors.first));
      }, (r) {
        emit(EditLoadedState(content: r));
      });
    });
    on<DeleteCustomerEvent>((event, emit) async {
      emit(DeleteLoadingState());
      var res = await CustomerRepository().deleteCustomer(event.params);
      res.fold((l) {
        emit(DeleteFailedState(msg: l.errors.first));
      }, (r) {
        emit(DeleteLoadedState(content: r));
      });
    });
  }
}
