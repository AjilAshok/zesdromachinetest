import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key, required this.password});
  final TextEditingController password;

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Stack(
        alignment: const Alignment(0, 0),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A405A),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                controller: widget.password,
                obscureText: _isPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password',
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
