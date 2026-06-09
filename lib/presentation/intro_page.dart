import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF334155)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, I'm Pronoy Sarkar",
                  style: GoogleFonts.montserrat(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Flutter Developer",
                  style: GoogleFonts.montserrat(
                    fontSize: 28,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: 600,
                  child: Text(
                    "I build scalable mobile applications using Flutter, Firebase, REST APIs, Stripe and RevenueCat.",
                    style: GoogleFonts.montserrat(fontSize: 18),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Projects"),
                    ),

                    const SizedBox(width: 20),

                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("Contact"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/pic_for_portfolio.PNG"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
