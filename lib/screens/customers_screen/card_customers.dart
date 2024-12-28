import 'package:customer_app/parameters/delete_customer_params.dart';
import 'package:customer_app/repository/customer_repository.dart';
import 'package:customer_app/screens/customer_details/customer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard(
      {super.key,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.id,
      this.image});
  final int? id;
  final String? firstName, lastName, phoneNumber, email, image;
  final bool isEdit = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                CustomerRepository().deleteCustomer(DeleteCustomerParams(
                    body: DeleteCustomerParamsBody(id: id)));
              },
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'delete',
            ),
          ],
        ),
        child: Card(
          elevation: 10,
          child: ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerDetails(
                            id: id,
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            phoneNumber: phoneNumber,
                            image: image,
                            isEdit: isEdit,
                          )));
            },
            contentPadding: EdgeInsets.all(10),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: image != null
                  ? Image.network('$image')
                  : Image.asset("assets/images/R.png"),
            ),
            title: Text(
              "$firstName $lastName",
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("$email"), Text("$phoneNumber")],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
