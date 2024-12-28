import 'package:customer_app/screens/customers_screen/customers_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/manage_customer.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails(
      {this.firstName,
      this.lastName,
      this.isEdit = false,
      this.phoneNumber,
      this.email,
      this.id,
      super.key,
      this.image});
  final String? firstName, lastName, phoneNumber, email, image;
  final bool isEdit;
  final int? id;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: SingleChildScrollView(
            child: ManageCustomer(
              id: id,
              isEdit: isEdit,
              firstName: firstName,
              lastName: lastName,
              email: email,
              phoneNumber: phoneNumber,
              image: image,
            ),
          ),
        ),
      ),
    );
  }
}
