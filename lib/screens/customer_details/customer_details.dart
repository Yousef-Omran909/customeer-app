import 'package:customer_app/screens/customers_screen/customers_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/manage_customer.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails(
      {this.firstName,
      this.lastName,
      this.isEdit,
      this.phoneNumber,
      this.email,
      this.id,
      super.key,
      this.image});
  final String? firstName, lastName, phoneNumber, email, image;
  final bool? isEdit;
  final int? id;
  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    firstNameController.text = widget.firstName ?? '';
    lastNameController.text = widget.lastName ?? '';
    emailController.text = widget.email ?? '';
    phoneController.text = widget.phoneNumber ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CustomersScreen()));
          },
        ),
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: SingleChildScrollView(
          child: ManageCustomer(
            id: widget.id,
            isEdit: widget.isEdit,
            firstNameController: firstNameController,
            lastNameController: lastNameController,
            emailController: emailController,
            phoneController: phoneController,
            image: widget.image,
          ),
        ),
      ),
    );
  }
}
