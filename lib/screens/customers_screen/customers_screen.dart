import 'package:customer_app/bloc/customer_bloc.dart';
import 'package:customer_app/models/get_all_customers_model.dart';
import 'package:customer_app/screens/customers_screen/card_customers.dart';
import 'package:customer_app/screens/widgets/manage_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../parameters/get_customers_params.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  bool isLoading = false;
  GetAllCustomersModel? customerData;

  @override
  void initState() {
    context
        .read<CustomerBloc>()
        .add(GetCustomerEvent(params: GetAllParams(body: GetAllParamsBody())));
    super.initState();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
                      content: SingleChildScrollView(
                          child: ManageCustomer(
                        firstNameController: firstNameController,
                        emailController: emailController,
                        lastNameController: lastNameController,
                        phoneController: phoneNumberController,
                      )),
                    ));
          },
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<CustomerBloc, CustomerState>(
            builder: ((context, state) {
          if (state is GetAllLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllLoadedState) {
            return ListView.builder(
                itemCount: state.customers!.customers.length,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  return CustomerCard(
                    id: state.customers!.customers[index].id,
                    firstName: state.customers!.customers[index].firstName,
                    lastName: state.customers!.customers[index].lastName,
                    email: state.customers!.customers[index].email,
                    phoneNumber: state.customers!.customers[index].phoneNumber,
                    image: state.customers!.customers[index].avatar.firstOrNull
                        ?.originalUrl,
                  );
                });
          } else {
            return Center(
              child: Text('error'),
            );
          }
        })));
  }
}
