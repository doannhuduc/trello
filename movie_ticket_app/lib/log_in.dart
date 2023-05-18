import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/create_account.dart';
import 'package:movie_ticket_app/forgot_password.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String? erorTextEmail;
  String? erorTextPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary500,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Log In", style: AppStyle.textAppar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageHomepage(),
            textField_emailOrPhone(),
            textFieldPassword(),
            registration(context)
          ],
        ),
      ),
    );
  }
}

Widget imageHomepage() {
  return Image.asset(
    "assets/image/image_login.jpg",
    height: 250,
    width: 420,
    fit: BoxFit.cover,
  );
}

Widget textField_emailOrPhone() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: TextField(
      decoration: InputDecoration(
          // errorText: ,
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: "Email or phone number",
          hintStyle: TextStyle(color: Colors.black38)),
    ),
  );
}

Widget textFieldPassword() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: TextField(
      decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.black38),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: Colors.black38,
          )),
      obscureText: true,
    ),
  );
}

Widget registration(context) {
  return Column(
    children: [
      SizedBox(height: 40),
      ElevatedButton(
        onPressed: () {},
        child: Text(
          "LOG IN",
          style: TextStyle(fontSize: 18),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red[900]),
            fixedSize: MaterialStatePropertyAll(Size(380, 40))),
      ),
      SizedBox(height: 20),
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ForgotPassword();
            },
          ));
        },
        child: Text("Forgot Password",
            style: TextStyle(
                fontStyle: FontStyle.italic, color: Colors.blue, fontSize: 16)),
      ),
      SizedBox(height: 20),
      Text(
        "or",
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
      ),
      SizedBox(height: 20),
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CreateAccount();
            },
          ));
        },
        child: Container(
          height: 40,
          width: 320,
          child: Center(
              child: Text(
            "Create Membership Account",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          )),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(8)),
        ),
      )
    ],
  );
}
