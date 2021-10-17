import 'package:flutter/material.dart';
import 'package:practica2/src/routes/pages.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              children: [
                createTxtEmail(),
                SizedBox(height: 10),
                createTxtPassword(),
                SizedBox(height: 10),
                createLoginButton()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 150),
            child: Center(
              child: Image(
                image: AssetImage('assets/logo.png'),
                width: 130,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createLoginButton() {
    return _loading
        ? Center(child: CircularProgressIndicator())
        : ElevatedButton(
            onPressed: () async {
              setState(() {
                _loading = true;
              });
              await Future.delayed(Duration(seconds: 1));
              setState(() {
                _loading = false;
              });
              Navigator.pushReplacementNamed(context, Routes.DASHBOARD);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.login),
                SizedBox(width: 10),
                Text('Login'),
              ],
            ),
          );
  }

  TextFormField createTxtEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        hintText: 'Email',
      ),
    );
  }

  TextFormField createTxtPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        hintText: 'Password',
      ),
    );
  }
}
