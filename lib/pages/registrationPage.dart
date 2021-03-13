import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/provider/registrationProvider.dart';
import 'package:quizz_app/utilities/rejects.dart';

class RegistartionPage extends StatelessWidget {
  const RegistartionPage({
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
              Text('Registration'),
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
                        Provider.of<RegistrationProvider>(context,
                                listen: false)
                            .setMessage(null);
                      },
                      controller: emailField,
                      decoration: InputDecoration(
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
                      onChanged: (value) {},
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
                        Provider.of<RegistrationProvider>(context,
                                listen: false)
                            .register(emailField.text, passwordField.text)
                            .then((value) {
                          if (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Registered"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Failed to register"),
                              ),
                            );
                          }
                        });
                      },
                      child: Provider.of<RegistrationProvider>(context)
                              .getLoading()
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.teal),
                      ),
                    ),
                    Text('Swipe Right to login')
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
