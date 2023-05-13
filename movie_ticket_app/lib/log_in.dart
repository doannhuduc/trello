import 'package:flutter/material.dart';

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
        backgroundColor: Colors.amber,
        leading: Icon(Icons.arrow_back),
        title: Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageHomepage(),
            textField_emailOrPhone(),
            textFieldPassword(),
            registration()
          ],
        ),
      ),
    );
  }

  Widget imageHomepage() {
    return Container(
      height: 250,
      width: 420,
      child: Image.asset(
        "assets/image/image_homepage.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
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

Widget registration() {
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
