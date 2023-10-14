import 'package:echo/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:echo/widgets/auth_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  Widget _buildStyledTextField({
    required String hintText,
    required Function(String?) validator,
    required TextEditingController controller,
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
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _isLogin = false;

    Future<void> _submitHandler() async {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      _formKey.currentState!.save();

      if (_isLogin) {
        // Log the user in
        // You can access email and password using _emailController.text and _passwordController.text
      } else {
        try {
          final userCredentials = await _firebase
              .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );

              FirebaseFirestore.instance.collection('users').doc(userCredentials.user!.uid).set({
                'name': _nameController.text,
                'email': _emailController.text,
                'phone': _phoneController.text,
                'password': _passwordController.text,
              });

        } on FirebaseAuthException catch (error) {
          if (error.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message ?? 'Authentication failed!'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

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
                _buildStyledTextField(
                  hintText: 'First and Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: _nameController,
                ),
                const SizedBox(height: 20),
                _buildStyledTextField(
                  hintText: 'Enter your Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: _emailController,
                ),
                const SizedBox(height: 20),
                _buildStyledTextField(
                  hintText: '10 digit Phone number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your number';
                    }
                    return null;
                  },
                  controller: _phoneController,
                ),
                const SizedBox(height: 20),
                _buildStyledTextField(
                  hintText: 'Please enter a secured Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                ),
                const SizedBox(height: 20),
                _buildStyledTextField(
                  hintText: 'Repeat Password',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value != _passwordController.text) {
                      return 'Values don\'t match, please try again!';
                    }
                    return null;
                  },
                  controller: _repeatPasswordController,
                ),
                const SizedBox(height: 60),
                AuthButton(
                  onPressed: _submitHandler,
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
