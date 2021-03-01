import 'package:flutter/material.dart';
import 'package:wastetastic/screens/Reusable_Widgets.dart';
import 'POI_DetailScreen.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    //List<WastePOI> favorites = retrieveFavoritesFromDatabase(username)
    //List<POI_card> fav_card_list =[]
    //for (WastePOI w in favorites):
    //  card_list.add(POI_card(name: w.name, address: w.address, postalCode: w.postalCode, description: w.POI_desc, TO_POI_page: Waste_page(w),);

    return Column(
      children: [
        header_card(
          title: 'Favourites',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: //fav_card_list
                  [
                POI_card(
                  name: 'POI1',
                  address: 'address',
                  postalcode: 310204,
                  description: 'description',
                  TO_POI_page: () {
                    Navigator.pushNamed(
                      context,
                      POI_DetialScreen.id,
                      arguments: "name",
                    );
                  },
                ),
                POI_card(
                  name: 'POI2',
                  address: 'address',
                  postalcode: 321045,
                  description: 'description',
                ),
                POI_card(
                  name: 'POI3',
                  address: 'address',
                  postalcode: 321045,
                  description: 'description',
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
