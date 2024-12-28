import 'package:customer_app/bloc/customer_bloc.dart';
import 'package:customer_app/parameters/create_customer_params.dart';
import 'package:customer_app/parameters/edit_customer_params.dart';
import 'package:customer_app/repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../parameters/get_customers_params.dart';
import 'custom_button.dart';
import 'custom_text_form.dart';

class ManageCustomer extends StatelessWidget {
  ManageCustomer(
      {super.key,
      this.isEdit,
      this.firstNameController,
      this.lastNameController,
      this.emailController,
      this.id,
      this.phoneController,
      this.image});
  final bool? isEdit;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final String? image;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerBloc, CustomerState>(
      builder: (context, state) {
        if (state is LoadingAddState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AddedCustomerState) {
          return Column(
            children: [
              Center(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: image != null
                        ? Image.network('$image')
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
                controller: phoneController,
              ),
              SizedBox(
                height: 10,
              ),
              isEdit == true
                  ? CustomButton(
                      text: "edit",
                      onPressed: () {
                        print(isEdit);
                        CustomerRepository().editCustomer(EditCustomerParams(
                            body: EditCustomerParamsBody(
                                id: id,
                                cityId: 1,
                                countryId: 6,
                                currencyId: 1,
                                email: emailController?.text,
                                firstName: firstNameController?.text,
                                lastName: lastNameController?.text,
                                phoneNumber: phoneController?.text,
                                stateId: 8)));
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
                                    email: emailController?.text,
                                    firstName: firstNameController?.text,
                                    lastName: lastNameController?.text,
                                    phoneNumber: phoneController?.text,
                                    stateId: 8))));
                      },
                    ),
            ],
          );
        } else {
          return Column(
            children: [
              Center(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: image != null
                        ? Image.network('$image')
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
                controller: phoneController,
              ),
              SizedBox(
                height: 10,
              ),
              isEdit == true
                  ? CustomButton(
                      text: "edit",
                      onPressed: () {
                        print(isEdit);
                        CustomerRepository().editCustomer(EditCustomerParams(
                            body: EditCustomerParamsBody(
                                id: id,
                                cityId: 1,
                                countryId: 6,
                                currencyId: 1,
                                email: emailController?.text,
                                firstName: firstNameController?.text,
                                lastName: lastNameController?.text,
                                phoneNumber: phoneController?.text,
                                stateId: 8)));
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
                                    email: emailController?.text,
                                    firstName: firstNameController?.text,
                                    lastName: lastNameController?.text,
                                    phoneNumber: phoneController?.text,
                                    stateId: 8))));
                      },
                    ),
            ],
          );
        }
      },
      listener: (context, state) {
        if (state is AddedCustomerState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Added")));

          context.read<CustomerBloc>().add(
              GetCustomerEvent(params: GetAllParams(body: GetAllParamsBody())));
        } else if (state is FailedAddCustomerState) {
          context.read<CustomerBloc>().add(
              GetCustomerEvent(params: GetAllParams(body: GetAllParamsBody())));
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("invalid")));
        }
      },
    );
  }
}
