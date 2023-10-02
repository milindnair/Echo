import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Center vertically
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically

              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/logo.png'),
                const Text(
                  "Echo: Be heard, be you.",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFA78295)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF331D2C)),
                fixedSize: MaterialStateProperty.all<Size>(const Size(220, 50)),
              ),
              child: Text(
                'Log in',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: Color(0xFFE966A0)),
                fixedSize: const Size(330, 50),
              ),
              child: Text(
                'Dont have an account? Sign up',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
