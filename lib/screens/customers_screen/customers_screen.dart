import 'package:customer_app/bloc/customer_bloc.dart';
import 'package:customer_app/screens/customers_screen/card_customers.dart';
import 'package:customer_app/screens/widgets/manage_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/get_all_customers_model.dart';
import '../../parameters/get_customers_params.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  bool isLoading = false;
  List<CustomerModel> customers = [];
  final refreshController = RefreshController();
  int page = 1;
  paginationGetAllFun() {
    context.read<CustomerBloc>().add(GetCustomerEvent(
        params: GetAllParams(body: GetAllParamsBody(page: 1))));
  }

  onLoading(int pageNum) {
    context.read<CustomerBloc>().add(GetCustomerEvent(
        params: GetAllParams(body: GetAllParamsBody(page: pageNum))));
  }

  @override
  void initState() {
    paginationGetAllFun();
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
                customers.addAll(state.customers?.customers ?? []);
                refreshController.loadComplete();
                refreshController.refreshCompleted();
              } else if (state is DeleteLoadedState) {
                paginationGetAllFun();
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Deleted")));
              } else if (state is DeleteFailedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Added")));
              }
            },
            builder: (context, state) {
              if (state is GetAllLoadingState && page == 1) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SmartRefresher(
                  onRefresh: () {
                    customers = [];
                    paginationGetAllFun();
                  },
                  controller: refreshController,
                  enablePullUp: true,
                  onLoading: () {
                    page++;
                    onLoading(page);
                  },
                  child: ListView.builder(
                      itemCount: customers.length,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      itemBuilder: (context, index) {
                        return CustomerCard(
                          id: customers[index].id,
                          firstName: customers[index].firstName,
                          lastName: customers[index].lastName,
                          email: customers[index].email,
                          phoneNumber: customers[index].phoneNumber,
                          image:
                              customers[index].avatar.firstOrNull?.originalUrl,
                        );
                      }),
                );
              }
            }));
  }
}
