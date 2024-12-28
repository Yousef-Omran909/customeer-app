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

class AddFailedCustomerState extends CustomerState {
  const AddFailedCustomerState({required this.msg});
  final String msg;
  @override
  List<Object> get props => [msg];
}

class AddLoadingCustomerState extends CustomerState {}

//////////////// Edit Customer State  ////////////

class EditLoadingState extends CustomerState {}

class EditLoadedState extends CustomerState {
  const EditLoadedState({required this.content});

  final ApiContentEmptyModel? content;
  @override
  List<Object> get props => [content!];
}

class EditFailedState extends CustomerState {
  const EditFailedState({required this.msg});
  final String msg;
  @override
  List<Object> get props => [msg];
}
////////////Delete Customer state/////////////

class DeleteLoadingState extends CustomerState {}

class DeleteLoadedState extends CustomerState {
  const DeleteLoadedState({required this.content});
  final ApiContentEmptyModel? content;

  @override
  List<Object> get props => [content!];
}

class DeleteFailedState extends CustomerState {
  const DeleteFailedState({required this.msg});

  final String msg;
  @override
  List<Object> get props => [msg];
}
