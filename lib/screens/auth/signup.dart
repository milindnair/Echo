import 'package:echo/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:echo/widgets/auth_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildStyledTextField({
    required String hintText,
    required Function(String?) validator,
  }) {
    return SizedBox(
      height: 50.0,
      width: 300.0,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        validator: (value) => validator(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFE1D1),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create an Account",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 70),
                CustomInput(
                  hintText: 'First and Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
               CustomInput(
                  hintText: 'Enter your Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
               CustomInput(
                  hintText: '10 digit Phone number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
               CustomInput(
                  hintText: 'Please enter a secured Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
               CustomInput(
                  hintText: 'Repeat Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Values don\'t match, please try again!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 60),
                AuthButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Invalid Email or Password')),
                      );
                    }
                  },
                  text: "Sign Up",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
