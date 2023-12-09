import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_api.dart';

class FoodItemList extends StatelessWidget {
  final List fooddatas;
  const FoodItemList({super.key, required this.fooddatas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: fooddatas.length,
      itemBuilder: (context, index) => FoodItemCard(
        title: fooddatas[index]["strMeal"],
        imageUrl: fooddatas[index]["strMealThumb"],
        katagori: fooddatas[index]["strCategory"],
        description:
            'Spaghetti Carbonara is a classic Italian pasta dish with eggs, cheese, and pancetta.',
      ),
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
            ),
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: title,
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

class FoodDetailScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String katagori;

  FoodDetailScreen({
    required this.title,
    required this.imageUrl,
    required this.katagori,
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  List mealdata = [];
  void setupDatadetail() async {
    Map data = await RecipeApi().getDatasDetail(widget.title);
    setState(() {
      mealdata = data["meals"];
    });
    print(mealdata);
  }

  @override
  void initState() {
    // TODO: implement initState
    setupDatadetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
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
                        Icons.fastfood,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Container(
                      width: 120.0,
                      child: Text(
                        widget.katagori,
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
                    mealdata[0]["strInstructions"],
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height:
                    16.0), // Tambahkan jarak agar tombol tidak terlalu dekat dengan konten sebelumnya
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
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
            ),
            SizedBox(
                height:
                    16.0), // Tambahkan jarak agar tombol tidak terlalu dekat dengan konten setelahnya
          ],
        ),
      ),
    );
  }
}
