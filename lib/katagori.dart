import 'package:flutter/material.dart';
import 'package:flutter_application_1/listfoodcategory.dart';

class CategoryScreen extends StatelessWidget {
  final List categorydata;
  CategoryScreen({super.key, required this.categorydata});
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
        itemCount: categorydata.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListFoodCategories(
                          category: categorydata[index]["strCategory"])));
            },
            child: CategoryCard(
              category: categorydata[index]["strCategory"],
              imageUrl: categorydata[index]["strCategoryThumb"],
            ),
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final String imageUrl;

  CategoryCard({required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
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
            child: Image.network(
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
                  category,
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
