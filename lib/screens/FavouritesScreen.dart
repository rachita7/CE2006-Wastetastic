import 'package:flutter/material.dart';
import 'package:wastetastic/screens/Reusable_Widgets.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header_card(
          title: 'Favourites',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                POI_card(
                  name: 'POI1',
                  address: 'haha',
                  postalcode: 310204,
                  description: 'yooo',
                ),
                POI_card(
                  name: 'POI1',
                  address: 'haha',
                  postalcode: 321045,
                  description: 'yooo',
                ),
                POI_card(
                  name: 'POI1',
                  address: 'haha',
                  postalcode: 321045,
                  description: 'yooo',
                ),
              ], //@todo logic to create all of user favourite POI_cards
              //@todo create function/logic to go to POI page from Favourites page when pressed
            ),
          ),
        )
      ],
    );
  }
}
