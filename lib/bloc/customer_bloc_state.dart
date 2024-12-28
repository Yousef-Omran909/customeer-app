part of 'customer_bloc.dart';

sealed class CustomerState extends Equatable {
  const CustomerState();
  @override
  List<Object> get props => [];
}

final class CustomerBlocInitial extends CustomerState {}

//////////////////  Get ALL States /////////////////////

class GetAllLoadingState extends CustomerState {}

class GetAllLoadedState extends CustomerState {
  const GetAllLoadedState({this.customers});
  final GetAllCustomersModel? customers;
  @override
  List<Object> get props => [customers as GetAllCustomersModel];
}

class GetAllFailedState extends CustomerState {
  const GetAllFailedState({required this.msg});
  final String msg;
  @override
  List<Object> get props => [msg];
}

///////////////// ADD CUSTOMER STATE ///////////////

class AddedCustomerState extends CustomerState {
  const AddedCustomerState({required this.content});
  final ApiContentEmptyModel? content;
  @override
  List<Object> get props => [content!];
}

class FailedAddCustomerState extends CustomerState {
  const FailedAddCustomerState({required this.msg});
  final String msg;
  @override
  List<Object> get props => [msg];
}

class LoadingAddState extends CustomerState {}

//////////////// Edit Customer State  ////////////