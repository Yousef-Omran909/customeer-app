part of 'customer_bloc.dart';

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();
  @override
  List<Object> get props => [];
}

class GetCustomerEvent extends CustomerEvent {
  const GetCustomerEvent({required this.params});
  final GetAllParams params;
  @override
  List<Object> get props => [params];
}

class AddCustomerEvent extends CustomerEvent {
  const AddCustomerEvent({required this.params});
  final CreateCustomerParams params;
  @override
  List<Object> get props => [params];
}

class EditCustomerEvent extends CustomerEvent {
  const EditCustomerEvent({required this.params});
  final EditCustomerParams params;
  @override
  List<Object> get props => [params];
}

class DeleteCustomerEvent extends CustomerEvent {
  const DeleteCustomerEvent({required this.params});
  final DeleteCustomerParams params;
  @override
  List<Object> get props => [params];
}
