import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ipAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pattern-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              const Text('IP Address Tracker'),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _ipAddressController,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              borderSide:
                                  const BorderSide(style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              borderSide:
                                  const BorderSide(style: BorderStyle.none),
                            ),
                            filled: true,
                            helperText: '',
                            hintText: 'Enter a IP Address',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              color: Colors.black,
                              icon: const Icon(Icons.keyboard_arrow_right),
                              tooltip: 'Increase volume by 10',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _ipAddressController.clear();
                                }
                              },
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a IP Address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
