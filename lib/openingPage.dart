import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'home_design_course.dart';

class Opening extends StatelessWidget {
  const Opening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/home.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "KanMakan",
              style: GoogleFonts.pacifico(
                fontSize: 50,
                color: Color.fromARGB(255, 6, 2, 2),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "- SESEORANG TAK BISA BERPIKIR JERNIH, MENCINTAI DENGAN BENAR DAN TIDUR DENGAN BAIK JIKA BELUM MAKAN DENGAN BAIK -",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 1, 1).withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: TempContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class TempContainer extends StatelessWidget {
  const TempContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Text(
        "Get Started",
        style: TextStyle(
          color: Color.fromARGB(255, 17, 15, 15),
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
