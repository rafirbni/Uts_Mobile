import 'package:flutter/material.dart';
import 'package:flutter_application_1/indonesian.dart';
import 'package:flutter_application_1/italia.dart';
import 'package:flutter_application_1/jepang.dart';
import 'package:flutter_application_1/malaysia.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> countries = [
    'Italian',
    'Indonesian',
    'Jepang',
    'Malaysia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.orange, // Ubah latar belakang AppBar menjadi oranye
        elevation: 0, // Hapus bayangan AppBar
        title: Text(
          'Kategori Makanan',
          style: TextStyle(
            color: Colors.black, // Ubah warna teks AppBar menjadi hitam
            fontSize: 24.0, // Ukuran teks AppBar
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToFoodScreen(context, countries[index]);
            },
            child: CategoryCard(
              country: countries[index],
            ),
          );
        },
      ),
    );
  }

  void _navigateToFoodScreen(BuildContext context, String country) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        // Gunakan switch case untuk menentukan layar yang sesuai dengan negara
        switch (country) {
          case 'Indonesian':
            return IndonesianFoodScreen();
          case 'Italian':
            return ItaliaFoodScreen();
          case 'Jepang':
            return JepangFoodScreen();
          case 'Malaysia':
            return MalayFoodScreen();
          default:
            return Scaffold(); // Layar default jika tidak ada yang sesuai
        }
      },
    ));
  }
}

class CategoryCard extends StatelessWidget {
  final String country;

  CategoryCard({required this.country});

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';

    if (country == 'Italian') {
      imageUrl = 'assets/image/italia.JPG';
    } else if (country == 'Indonesian') {
      imageUrl = 'assets/image/indo.jpg';
    } else if (country == 'Jepang') {
      imageUrl = 'assets/image/jepang.png';
    } else if (country == 'Malaysia') {
      imageUrl = 'assets/image/malay.jpg';
    }

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Tambahkan sudut membulat pada Card
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Food from $country',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ubah warna teks judul menjadi oranye
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
