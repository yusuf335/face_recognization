import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesTitle extends StatelessWidget {
  final String title;
  final String assestPath;

  CategoriesTitle(this.title, this.assestPath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(15),
          child: Image.asset(
            this.assestPath,
          ),
        ),
        Text(
          this.title,
          style: GoogleFonts.varelaRound(
              fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
