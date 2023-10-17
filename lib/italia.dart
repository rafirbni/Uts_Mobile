import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fooditem.dart';

class ItaliaFoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(207, 255, 167, 36), // Hapus latar belakang AppBar
        elevation: 0, // Hapus bayangan AppBar
        title: Text(
          'Makanan Italia',
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
                'assets/image/bag3.jpg'), // Ganti dengan path gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            FoodItemCard(
              title: 'Spaghetti Carbonara',
              imageUrl: 'assets/image/Carbonara-pepper-web.jpg',
              katagori: 'Italian',
              description:
                  'Spaghetti Carbonara is a classic Italian pasta dish with eggs, cheese, and pancetta.',
            ),
            SizedBox(height: 16.0),
            FoodItemCard(
              title: 'Margherita Pizza',
              imageUrl: 'assets/image/piza.jpg',
              katagori: 'Italian',
              description:
                  'Margherita Pizza is a simple and delicious pizza with tomatoes, mozzarella, and basil.',
            ),
            // Tambahkan makanan Indonesia lainnya di sini
          ],
        ),
      ),
    );
  }
}
