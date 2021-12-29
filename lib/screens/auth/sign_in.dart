import 'package:flutter/material.dart';
import 'package:storex/screens/account_screens/shipping_details.dart';
import 'package:storex/screens/auth/register.dart';
import 'form_constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              'LOG IN',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 22.0,
                  fontFamily: 'raleway_bold'),
            ),
          ),
          Container(
            //color: Colors.grey.shade700,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: inputText,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      disabledBorder: disabledBorder,
                      filled: true,
                      fillColor: fillColor,
                      border: generalBorder,
                      focusedBorder: focusedBorder,
                      enabledBorder: enabledBorder,
                      //labelStyle: labelStyle,
                      hintStyle: hintStyle,
                      errorBorder: errorBorder,
                      focusedErrorBorder: focusedErrorBorder,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'example@domain.com',
                      // label: const Center(
                      //   child: Text('Email'),
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: inputText,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be null';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      filled: true,
                      fillColor: fillColor,
                      border: generalBorder,
                      focusedBorder: focusedBorder,
                      enabledBorder: enabledBorder,
                      //labelStyle: _labelStyle,
                      hintStyle: hintStyle,
                      errorBorder: errorBorder,
                      focusedErrorBorder: focusedErrorBorder,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'your password',
                      //label: Text('Password'),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = _emailController.text;
                        });
                        //display a snack bar if the form is valid
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing...'),
                          ),
                        );
                        /*
                          Remove all the form values
                         */
                        _emailController.text = '';
                        _passwordController.text = '';
                      }
                    },
                    child: SizedBox(
                      height: 70.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Log In'),
                          Icon(Icons.arrow_right_alt)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
