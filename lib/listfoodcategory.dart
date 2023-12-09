import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fooditem.dart';
import 'package:flutter_application_1/models/recipe_api.dart';

class ListFoodCategories extends StatefulWidget {
  final String category;
  const ListFoodCategories({super.key, required this.category});

  @override
  State<ListFoodCategories> createState() => _ListFoodCategoriesState();
}

class _ListFoodCategoriesState extends State<ListFoodCategories> {
  List categorydatas = [];

  void setupData() async {
    Map data = await RecipeApi().getDatasdtlCategory(widget.category);
    setState(() {
      categorydatas = data["meals"];
    });

    print(categorydatas);
  }

  @override
  void initState() {
    // TODO: implement initState
    setupData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(207, 255, 167, 36), // Hapus latar belakang AppBar
        elevation: 0, // Hapus bayangan AppBar
        title: Text(
          widget.category,
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
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: categorydatas.length,
          itemBuilder: (context, index) => FoodItemCard(
            title: categorydatas[index]['strMeal'],
            imageUrl: categorydatas[index]['strMealThumb'],
            katagori: widget.category,
            description: "Food From ${widget.category}",
          ),
        ),
      ),
    );
  }
}
