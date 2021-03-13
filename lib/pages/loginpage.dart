import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/provider/loginProvider.dart';
import 'package:quizz_app/screens/dashboard.dart';
import 'package:quizz_app/utilities/rejects.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
    @required this.formkey,
    @required this.emailField,
    @required this.passwordField,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;
  final TextEditingController emailField;
  final TextEditingController passwordField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Login'),
              SizedBox(
                height: 50,
              ),
              Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      onChanged: (value) {
                        Provider.of<LoginProvider>(context, listen: false)
                            .setMessage(null);
                      },
                      controller: emailField,
                      decoration: InputDecoration(
                        errorText:
                            Provider.of<LoginProvider>(context).getMessage(),
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: RejectsHandeler().emailValidation,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        Provider.of<LoginProvider>(context, listen: false)
                            .setMessage(null);
                      },
                      controller: passwordField,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        hintText: 'Password',
                      ),
                      validator: RejectsHandeler().passwordValidation,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<LoginProvider>(context, listen: false)
                            .logIn(emailField.text, passwordField.text)
                            .then((value) {
                          if (value) {
                            Navigator.pushNamed(context, DashBoard.id);
                          }
                        });
                      },
                      child: Provider.of<LoginProvider>(context).loading
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.teal),
                      ),
                    ),
                    Text('Swipe right to register')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
