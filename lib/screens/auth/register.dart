import 'package:flutter/material.dart';
import 'package:storex/screens/account_screens/shipping_details.dart';
import 'form_constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = '';
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              'CREATE A FREE ACCOUNT',
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
              key: _formKeyRegister,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: inputText,
                    keyboardType: TextInputType.name,
                    controller: _fullNameController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length > 255) {
                        return 'Please enter a valid name';
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
                      hintText: 'Enter Your FullName(Surname First)',
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
                      hintText: 'Enter Your Email Address',
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
                      hintText: 'Enter your password',
                      //label: Text('Password'),
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
                    controller: _passwordConfirmController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value != _passwordController.text) {
                        return 'Passwords cannot be null and must match';
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
                      hintText: 'Re-type the password',
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
                      setState(() {
                        name = _fullNameController.text;
                      });
                      if (_formKeyRegister.currentState!.validate()) {
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

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return ShippingDetails(
                              name: name,
                            );
                          }),
                        );
                      }
                    },
                    child: SizedBox(
                      height: 70.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Register'),
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
