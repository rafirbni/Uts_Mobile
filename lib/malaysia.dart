import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fooditem.dart';

class MalayFoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(207, 255, 167, 36), // Hapus latar belakang AppBar
        elevation: 0, // Hapus bayangan AppBar
        title: Text(
          'Makanan Malaysia',
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
                'assets/image/bag4.jpg'), // Ganti dengan path gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            FoodItemCard(
              title: 'Nasi Lemak',
              imageUrl: 'assets/image/namak.jpg',
              katagori: 'Malaysia',
              description:
                  'Nasi Lemak is a traditional Malaysian dish of fragrant rice cooked in coconut milk, served with a spicy sambal, fried crispy anchovies, and boiled or fried egg.',
            ),
            SizedBox(height: 16.0),
            FoodItemCard(
              title: 'Roti Canai',
              imageUrl: 'assets/image/roti.jpg',
              katagori: 'Malaysia',
              description:
                  'Roti Canai is a popular Malaysian flatbread served with dhal (lentil curry) or other types of curry. It is often enjoyed as a breakfast or snack item.',
            ),
            SizedBox(height: 16.0),
            FoodItemCard(
              title: 'Satay',
              imageUrl: 'assets/image/satay.jpeg',
              katagori: 'Malaysia',
              description:
                  'Satay is a famous Malaysian dish of skewered and grilled meat, usually served with a peanut sauce and rice cakes or ketupat (rice dumplings).',
            ),
            // Tambahkan makanan Indonesia lainnya di sini
          ],
        ),
      ),
    );
  }
}
