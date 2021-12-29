import 'package:flutter/material.dart';
import 'package:storex/screens/account_screen.dart';
import 'package:storex/wrapper.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoreX'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.orange,
                width: double.infinity,
                height: 50.0,
                child: Center(
                  child: Text(
                    'Welcome ${widget.name}',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'raleway_black',
                        color: Colors.white),
                  ),
                )),
            Container(
                color: Colors.grey.shade900,
                width: double.infinity,
                height: 50.0,
                child: const Center(
                  child: Text(
                    'Add Shipping '
                    'Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'raleway_black',
                        color: Colors.white),
                  ),
                )),
            buildForm()
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    final GlobalKey<FormState> _shippingFormKey = GlobalKey<FormState>();
    TextEditingController _addressController = TextEditingController();
    TextEditingController _stateController = TextEditingController();
    TextEditingController _lgaController = TextEditingController();
    TextEditingController _zipCodeController = TextEditingController();
    TextEditingController _phoneNumberController = TextEditingController();
    final Color _fillColor = Colors.grey.shade300;
    final TextStyle _hintStyle = TextStyle(color: Colors.orange);
    const TextStyle _errorStyle = TextStyle(
      fontFamily: 'raleway_medium',
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5,
    );
    final InputBorder _enabledBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    );
    final InputBorder _focusedBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    );
    final InputBorder _errorBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    );
    final InputBorder _focusedErrorBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    );
    final InputBorder _border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    );
    const EdgeInsetsGeometry _contentPadding = EdgeInsets.all(20.0);
    final TextStyle _style = TextStyle(
        color: Colors.grey.shade900,
        fontFamily: 'raleway_regular',
        fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _shippingFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please input a valid State of residence";
                }
                return null;
              },
              style: _style,
              keyboardType: TextInputType.text,
              controller: _stateController,
              decoration: InputDecoration(
                  errorStyle: _errorStyle,
                  contentPadding: _contentPadding,
                  hintText: 'Enter state of residence',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: _fillColor,
                  filled: true,
                  hintStyle: _hintStyle,
                  enabledBorder: _enabledBorder,
                  focusedBorder: _focusedBorder,
                  errorBorder: _errorBorder,
                  focusedErrorBorder: _focusedErrorBorder,
                  border: _border),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please input a valid LGA of residence";
                }
                return null;
              },
              style: _style,
              keyboardType: TextInputType.text,
              controller: _lgaController,
              decoration: InputDecoration(
                  errorStyle: _errorStyle,
                  contentPadding: _contentPadding,
                  hintText: 'Enter LGA of residence',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: _fillColor,
                  filled: true,
                  hintStyle: _hintStyle,
                  enabledBorder: _enabledBorder,
                  focusedBorder: _focusedBorder,
                  errorBorder: _errorBorder,
                  focusedErrorBorder: _focusedErrorBorder,
                  border: _border),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please input a valid residential address";
                }
                return null;
              },
              style: _style,
              keyboardType: TextInputType.text,
              controller: _addressController,
              decoration: InputDecoration(
                  errorStyle: _errorStyle,
                  contentPadding: _contentPadding,
                  hintText: 'Enter address of residence',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: _fillColor,
                  filled: true,
                  hintStyle: _hintStyle,
                  enabledBorder: _enabledBorder,
                  focusedBorder: _focusedBorder,
                  errorBorder: _errorBorder,
                  focusedErrorBorder: _focusedErrorBorder,
                  border: _border),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty || value.length > 6) {
                  return "Please input a valid zip code";
                }
                return null;
              },
              style: _style,
              keyboardType: TextInputType.number,
              controller: _zipCodeController,
              decoration: InputDecoration(
                  errorStyle: _errorStyle,
                  contentPadding: _contentPadding,
                  hintText: 'Enter zip code',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: _fillColor,
                  filled: true,
                  hintStyle: _hintStyle,
                  enabledBorder: _enabledBorder,
                  focusedBorder: _focusedBorder,
                  errorBorder: _errorBorder,
                  focusedErrorBorder: _focusedErrorBorder,
                  border: _border),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty || value.length > 11) {
                  return "Please input a valid phone number";
                }
                return null;
              },
              style: _style,
              keyboardType: TextInputType.number,
              controller: _phoneNumberController,
              decoration: InputDecoration(
                  errorStyle: _errorStyle,
                  contentPadding: _contentPadding,
                  hintText: 'Enter valid phone number',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: _fillColor,
                  filled: true,
                  hintStyle: _hintStyle,
                  enabledBorder: _enabledBorder,
                  focusedBorder: _focusedBorder,
                  errorBorder: _errorBorder,
                  focusedErrorBorder: _focusedErrorBorder,
                  border: _border),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_shippingFormKey.currentState!.validate()) {
                  //display a snack bar if the form is valid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Processing...'),
                    ),
                  );
                  /*
                          Remove all the form values
                         */
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const Wrapper();
                  }));
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: const EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
