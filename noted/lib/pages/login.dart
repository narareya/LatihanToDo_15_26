// import 'package:flutter/material.dart';
// <<<<<<< nm-UI-Login



// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
// State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
// =======
// import 'package:get/get.dart';
// import 'package:noted/components/custom_button.dart';
// import 'package:noted/components/custom_textfield.dart';
// import 'package:noted/controller/Auth_controller.dart';

// class loginPage extends StatelessWidget {
//   loginPage({super.key});
//   final authController = Get.find<AuthController>();

// >>>>>>> nm-start-feature
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
// <<<<<<< nm-UI-Login
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Welcome to the Login Page',
//               style: TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate back to the previous screen
//                 Navigator.pop(context);
//               },
//               child: const Text('Go Back'),
//             ),
//           ],
//         ),
//       ),
// =======

//       body: Container(
//         margin: EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomTextField(controller: authController.username, label: "Username"),
//             CustomTextField(controller: authController.password, label: "Password", obscure: true,),
//             SizedBox(height: 20,),
//             CustomButton(myText: "Login", onPressed: () {
//               authController.login();
//             })
//           ],
//         ),
//       )
// >>>>>>> nm-start-feature
    );
  }
}