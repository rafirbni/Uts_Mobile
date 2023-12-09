import 'package:flutter/material.dart';
import 'package:flutter_application_1/listfoodcategory.dart';
import 'package:flutter_application_1/models/recipe_api.dart';

import 'Fooditem.dart';
import 'katagori.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List datafixcategories = [];
  List datafixpopular = [];

  void setupDataCategories() async {
    Map data = await RecipeApi().getDatasCategory();
    setState(() {
      datafixcategories = data["categories"];
    });
    print(datafixcategories);
  }

  void setupDataPopular() async {
    Map data = await RecipeApi().getDatasPopular();
    setState(() {
      datafixpopular = data["meals"];
    });
    print(datafixpopular);
  }

  @override
  void initState() {
    // TODO: implement initState
    setupDataCategories();
    setupDataPopular();
    super.initState();
  }

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
                          child: ListView.builder(
                            itemCount: datafixcategories.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ListFoodCategories(
                                      category: datafixcategories[index]
                                          ['strCategory']),
                                ));
                              },
                              child: CategoryCard(
                                categoryName: datafixcategories[index]
                                    ['strCategory'],
                                iconData: Icons.restaurant_menu,
                              ),
                            ),
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
                              builder: (context) => CategoryScreen(
                                  categorydata: datafixcategories),
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
                child: FoodItemList(fooddatas: datafixpopular),
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
