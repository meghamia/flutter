import 'package:flutter/material.dart';


/*class LoginPage1 extends StatelessWidget{
   String username, email, password, confirmPassword, phoneNumber;


   LoginPage1({required this.username,required this.email,required this.password,required this.confirmPassword, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${username}'),
            Text('email: ${email}'),
            Text('password: ${password}'),
            Text('confirmPassword: ${confirmPassword}'),
            Text('phoneNumber: ${phoneNumber}'),



          ],
        ),
      ),
    );
  }
}
*/



class LoginPage1 extends StatelessWidget {
  final String username, email, password, confirmPassword, phoneNumber;

  LoginPage1({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display User Data'),
      ),
      body: Center(
        child: Container(
          //width: 300,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.blueGrey,
              width: 5.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${username}'),
              Text('Email: ${email}'),
              Text('Password: ${password}'),
              Text('Confirm Password: ${confirmPassword}'),
              Text('Phone Number: ${phoneNumber}'),
              SizedBox(height: 5.0),
              Text(
                "(Your response has been recorded!)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
