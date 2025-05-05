import 'package:flutter/material.dart';
import 'package:mobile_final_project/views/login_view.dart';
import 'package:mobile_final_project/models/restuarant.dart';
import 'package:mobile_final_project/views/search_view.dart';
import 'package:mobile_final_project/widgets/RestaurantItem.dart';

class RestaurantView extends StatelessWidget {
  RestaurantView({super.key});
  List<Restaurant> allRestaurants = [
    Restaurant("test", "test"),
    Restaurant("test", "test"),
    Restaurant("test", "test"),
    Restaurant("test", "test"),
    Restaurant("test", "test"),
    Restaurant("test", "test"),
  ]; //just for test
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B3C60),
      appBar: AppBar(
        leading: IconButton(
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              ),
          icon: Icon(Icons.logout, color: Colors.white),
        ),
        title: Text(
          "All restaurants",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Amaranth-Regular",
          ),
        ),
        backgroundColor: Color(0xff576CD6),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchView()),
                ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: allRestaurants.length,
          //length of retrieved restaurants from api
          itemBuilder:
              (context, index) => RestaurantItem(
                name: allRestaurants[index].name,
                address: allRestaurants[index].address,
              ),
        ),
      ),
    );
  }
}
