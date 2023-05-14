import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leading: Icon(Icons.arrow_back),
        title: Text("Forgot Password"),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
              child: Text(
            "Please enter your email or phone number",
            style: TextStyle(fontSize: 18),
          )),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black38),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "CONTINUE",
              style: TextStyle(fontSize: 18),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey),
                fixedSize: MaterialStatePropertyAll(Size(380, 40))),
          ),
        ],
      ),
    );
  }
}