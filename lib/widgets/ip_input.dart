import 'package:flutter/material.dart';

const regExp = r'^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$';

class IpInput extends StatelessWidget {
  IpInput({Key? key, required this.setIpAddress}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _ipAddressController = TextEditingController();
  final Function setIpAddress;

  void _onIpSubmitted(BuildContext ctx) {
    if (_formKey.currentState!.validate()) {
      setIpAddress(_ipAddressController.text);
      _ipAddressController.clear();
      FocusScope.of(ctx).unfocus();
    }
  }

  String? _validateIpInput(String? input) {
    var isEmpty = input == null || input.isEmpty;
    if (isEmpty) return 'Please enter a IP address.';
    var matchesRegex = RegExp(regExp).hasMatch(input!);
    return matchesRegex ? null : 'The entered IP address is not valid.';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _ipAddressController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  onFieldSubmitted: ((_) {
                    _onIpSubmitted(context);
                  }),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(style: BorderStyle.none),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(style: BorderStyle.none),
                    ),
                    filled: true,
                    hintText: 'Enter a IP Address',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: (() {
                        _onIpSubmitted(context);
                      }),
                    ),
                  ),
                  validator: _validateIpInput,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
