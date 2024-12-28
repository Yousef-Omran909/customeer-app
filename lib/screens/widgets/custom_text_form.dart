import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({this.hint = '', this.controller, super.key});
  final String hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder())),
    );
  }
}
// import 'package:flutter/material.dart';

// class CustomTextForm extends StatelessWidget {
//   const CustomTextForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5),
//       height: 48,
//       decoration: BoxDecoration(border: Border.all()),
//       child: TextFormField(
//           decoration: InputDecoration(
//         fillColor: Colors.white,
//         hintText: "search services",
//         hintStyle: TextStyle(color: Colors.grey),
//         suffixIcon: Container(
//             margin: EdgeInsets.only(right: 10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10), color: Colors.blue),
//             child: Image.asset("assets/images/search.png")),
//       )),
//     );
//   }
// }
