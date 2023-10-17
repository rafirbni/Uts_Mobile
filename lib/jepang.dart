import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fooditem.dart';

class JepangFoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(207, 255, 167, 36), // Hapus latar belakang AppBar
        elevation: 0, // Hapus bayangan AppBar
        title: Text(
          'Makanan Jepang',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Warna teks AppBar
            fontSize: 24.0, // Ukuran teks AppBar
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image/bag2.jpg'), // Ganti dengan path gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            FoodItemCard(
              title: 'Sushi',
              imageUrl: 'assets/image/sushi.jpg',
              katagori: 'Jepang',
              description:
                  'Sushi is a traditional Japanese dish of vinegared rice topped with various ingredients, such as seafood and vegetables.',
            ),
            SizedBox(height: 16.0),
            FoodItemCard(
              title: 'Tempura',
              imageUrl: 'assets/image/tempura.jpg',
              katagori: 'Jepang',
              description:
                  'Tempura is a Japanese dish consisting of battered and deep-fried seafood and vegetables.',
            ),
            SizedBox(height: 16.0),
            FoodItemCard(
              title: 'Ramen',
              imageUrl: 'assets/image/ramen.jpg',
              katagori: 'Jepang',
              description:
                  'Ramen is a Japanese dish with Chinese-style wheat noodles served in a meat or fish-based broth, often flavored with soy sauce or miso.',
            ),
            // Tambahkan makanan Indonesia lainnya di sini
          ],
        ),
      ),
    );
  }
}
