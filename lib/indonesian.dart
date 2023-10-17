import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fooditem.dart';

class IndonesianFoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(207, 255, 167, 36), // Hapus latar belakang AppBar
        elevation: 0, // Hapus bayangan AppBar
        title: Text(
          'Makanan Indonesia',
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
                'assets/image/bag.jpg'), // Ganti dengan path gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            FoodItemCard(
              title: 'Nasi Goreng',
              imageUrl: 'assets/image/nasgor.jpe',
              katagori: 'Indonesian',
              description:
                  'Nasi Goreng is a popular Indonesian fried rice dish.',
            ),
            SizedBox(height: 16.0),
            FoodItemCard(
              title: 'Rendang',
              imageUrl: 'assets/image/rendang.jpg',
              katagori: 'Indonesian',
              description: 'Rendang is a flavorful Indonesian beef stew.',
            ),
            SizedBox(height: 16.0),
            FoodItemCard(
              title: 'MeatBall',
              imageUrl: 'assets/image/bakso.jpeg',
              katagori: 'Indonesian',
              description:
                  'Bakso is a popular Indonesian meatball soup. Like many other dishes in Indonesia, it grew out of Asian and European influences in the country. Throughout Indonesia, there are many variations of bakso, but all of them include three main ingredients: broth, noodles, and meatballs.',
            ),
            // Tambahkan makanan Indonesia lainnya di sini
          ],
        ),
      ),
    );
  }
}
