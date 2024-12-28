import 'package:customer_app/bloc/customer_bloc.dart';
import 'package:customer_app/parameters/create_customer_params.dart';
import 'package:customer_app/parameters/edit_customer_params.dart';
import 'package:customer_app/repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../parameters/get_customers_params.dart';
import 'custom_button.dart';
import 'custom_text_form.dart';

class ManageCustomer extends StatefulWidget {
  ManageCustomer(
      {super.key,
      this.isEdit = false,
      this.firstName,
      this.lastName,
      this.email,
      this.id,
      this.phoneNumber,
      this.image});
  final bool isEdit;
  final String? firstName, lastName, email, phoneNumber, image;

  final int? id;

  @override
  State<ManageCustomer> createState() => _ManageCustomerState();
}

class _ManageCustomerState extends State<ManageCustomer> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    firstNameController.text = widget.firstName ?? '';
    lastNameController.text = widget.lastName ?? '';
    emailController.text = widget.email ?? '';
    phoneNumberController.text = widget.phoneNumber ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerBloc, CustomerState>(
      listenWhen: (pre, cur) =>
          cur is AddedCustomerState ||
          cur is AddFailedCustomerState ||
          cur is AddLoadingCustomerState ||
          cur is EditLoadingState ||
          cur is EditFailedState ||
          cur is EditLoadedState,
      buildWhen: (previous, cur) =>
          cur is AddedCustomerState ||
          cur is AddFailedCustomerState ||
          cur is AddLoadingCustomerState ||
          cur is EditLoadingState ||
          cur is EditFailedState ||
          cur is EditLoadedState,
      listener: (context, state) {
        if (state is AddedCustomerState || state is EditLoadedState) {
          context.read<CustomerBloc>().add(
              GetCustomerEvent(params: GetAllParams(body: GetAllParamsBody())));
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Added")));
        } else if (state is AddFailedCustomerState ||
            state is EditFailedState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("invalid")));
        }
      },
      builder: (context, state) {
        print(state);
        if (state is AddLoadingCustomerState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Center(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: widget.image != null
                        ? Image.network('${widget.image}')
                        : Image.asset("assets/images/R.png")),
              ),
              CustomTextForm(
                hint: "first name",
                controller: firstNameController,
              ),
              CustomTextForm(
                hint: "last name",
                controller: lastNameController,
              ),
              CustomTextForm(
                hint: "email",
                controller: emailController,
              ),
              CustomTextForm(
                hint: "phone number",
                controller: phoneNumberController,
              ),
              const SizedBox(
                height: 10,
              ),
              widget.isEdit
                  ? CustomButton(
                      text: "edit",
                      onPressed: () {
                        context.read<CustomerBloc>().add(EditCustomerEvent(
                            params: EditCustomerParams(
                                body: EditCustomerParamsBody(
                                    id: widget.id,
                                    cityId: 1,
                                    countryId: 6,
                                    currencyId: 1,
                                    email: emailController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    stateId: 8))));
                      },
                    )
                  : CustomButton(
                      text: "Add",
                      onPressed: () {
                        context.read<CustomerBloc>().add(AddCustomerEvent(
                            params: CreateCustomerParams(
                                body: CreateCustomerParamsBody(
                                    cityId: 1,
                                    countryId: 6,
                                    currencyId: 1,
                                    email: emailController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    stateId: 8))));
                      },
                    ),
            ],
          );
        }
      },
    );
  }
}
