import 'package:flutter/material.dart';
import 'package:flutter_application_1/indonesian.dart';
import 'package:flutter_application_1/italia.dart';
import 'package:flutter_application_1/jepang.dart';
import 'package:flutter_application_1/malaysia.dart';

import 'Fooditem.dart';
import 'katagori.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Welcome in KanMakan!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    SizedBox(
                      height: 56.0,
                      child: CircleAvatar(
                        radius: 40.0, // Besar avatar diperbesar
                        backgroundImage: AssetImage('assets/image/makan.jpeg'),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Kamu mau makan apa?',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 255, 155, 47),
          elevation: 0,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/image/background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: <Widget>[
              Container(
                color: Color.fromARGB(168, 236, 235, 235),
                margin: EdgeInsets.symmetric(vertical: 16.0),
                height: 150.0,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 6.0), // Spasi antara judul dan kategori
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        IndonesianFoodScreen(),
                                  ));
                                },
                                child: CategoryCard(
                                  categoryName: 'Indonesian',
                                  iconData: Icons.local_pizza,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => JepangFoodScreen(),
                                  ));
                                },
                                child: CategoryCard(
                                  categoryName: 'Japanes',
                                  iconData: Icons.fastfood,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ItaliaFoodScreen(),
                                  ));
                                },
                                child: CategoryCard(
                                  categoryName: 'Italian',
                                  iconData: Icons.lock_clock,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MalayFoodScreen(),
                                  ));
                                },
                                child: CategoryCard(
                                  categoryName: 'Malaysian',
                                  iconData: Icons.food_bank,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.view_list,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryScreen(),
                            ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular Food',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FoodItemList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData iconData;

  CategoryCard({
    required this.categoryName,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.only(left: 10.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 50.0, // Besar ikon kategori diperbesar
              color: Colors.orange,
            ),
            SizedBox(height: 3.0),
            Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CategoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kategori Makanan'),
//       ),
//       body: Center(
//         child: Text('Ini adalah halaman kategori.'),
//       ),
//     );
//   }
// }
