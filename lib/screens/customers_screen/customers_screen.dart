import 'package:customer_app/bloc/customer_bloc.dart';
import 'package:customer_app/screens/customers_screen/card_customers.dart';
import 'package:customer_app/screens/widgets/manage_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/get_all_customers_model.dart';
import '../../parameters/get_customers_params.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  bool isLoading = false;
  GetAllCustomersModel? getAllCustomers;
  @override
  void initState() {
    context
        .read<CustomerBloc>()
        .add(GetCustomerEvent(params: GetAllParams(body: GetAllParamsBody())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('customers'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      content: SingleChildScrollView(child: ManageCustomer()),
                    ));
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add),
        ),
        body: BlocConsumer<CustomerBloc, CustomerState>(
            listenWhen: (previous, cur) =>
                cur is GetAllLoadedState ||
                cur is GetAllLoadingState ||
                cur is DeleteFailedState ||
                cur is DeleteLoadedState ||
                cur is DeleteLoadingState,
            buildWhen: (previous, current) =>
                current is GetAllLoadedState || current is GetAllLoadingState,
            listener: (context, state) {
              if (state is GetAllLoadedState) {
                getAllCustomers = state.customers;
              } else if (state is DeleteLoadedState) {
                context.read<CustomerBloc>().add(GetCustomerEvent(
                    params: GetAllParams(body: GetAllParamsBody())));

                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Deleted")));
              } else if (state is DeleteFailedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Added")));
              }
            },
            builder: (context, state) {
              if (state is GetAllLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetAllLoadedState) {
                return ListView.builder(
                    itemCount: getAllCustomers?.customers.length ?? 0,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemBuilder: (context, index) {
                      return CustomerCard(
                        id: getAllCustomers!.customers[index].id,
                        firstName: getAllCustomers!.customers[index].firstName,
                        lastName: getAllCustomers!.customers[index].lastName,
                        email: getAllCustomers!.customers[index].email,
                        phoneNumber:
                            getAllCustomers!.customers[index].phoneNumber,
                        image: getAllCustomers!
                            .customers[index].avatar.firstOrNull?.originalUrl,
                      );
                    });
              } else {
                return Center(
                  child: Text('error'),
                );
              }
            }));
  }
}
