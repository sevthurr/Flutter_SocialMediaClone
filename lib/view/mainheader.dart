import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/userdata.dart';

class Mainheader extends StatelessWidget {
  const Mainheader({super.key, required this.userdata});

  final Userdata userdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage (userdata.myUserAccount.img),
          radius: 40,
        ),
        Text(
          userdata.myUserAccount.name,
          style: GoogleFonts.poppins (
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(userdata.myUserAccount.email, style: GoogleFonts.poppins()),
        const SizedBox (height: 20),
      ],
    );
  }
}