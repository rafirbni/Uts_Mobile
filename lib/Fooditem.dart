import 'package:flutter/material.dart';

class FoodItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        SizedBox(height: 16.0),
        FoodItemCard(
          title: 'MeatBall',
          imageUrl: 'assets/image/bakso.jpeg',
          katagori: 'Indonesian',
          description:
              'Bakso is a popular Indonesian meatball soup. Like many other dishes in Indonesia, it grew out of Asian and European influences in the country. Throughout Indonesia, there are many variations of bakso, but all of them include three main ingredients: broth, noodles, and meatballs.',
        ),
      ],
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String katagori;
  final String description;

  FoodItemCard({
    required this.title,
    required this.imageUrl,
    required this.katagori,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodDetailScreen(
              title: title,
              imageUrl: imageUrl,
              katagori: katagori,
              description: description,
            ),
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: title,
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
                    title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Food from \t" + katagori,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String katagori;
  final String description;

  FoodDetailScreen({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.katagori,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange, Colors.red],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color.fromARGB(255, 255, 136, 0),
                    ),
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Container(
                    width: 120.0,
                    child: Text(
                      katagori,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Food Description:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Changed to center alignment
              children: <Widget>[
                Expanded(
                  // Added Expanded widget
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Tambahkan logika untuk menambahkan makanan ke keranjang di sini
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: Icon(Icons.shopping_cart),
                    label: Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
