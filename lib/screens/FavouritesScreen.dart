import 'package:flutter/material.dart';
import 'package:wastetastic/widgets/POI_card.dart';
import 'POI_DetailScreen.dart';
import 'package:wastetastic/Constants.dart';
import 'package:wastetastic/entity/WastePOI.dart';
import 'package:wastetastic/widgets/header_card.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    //List<WastePOI> favorites = retrieveFavoritesFromDatabase(username)
    List<POI_card> fav_card_list = [];
    for (WastePOI w in kFav_POI_list) {
      String POICategory = w.wasteCategory.toString().split('.').last;
      POICategory = POICategory.replaceAll('_', ' ');
      fav_card_list.add(
        POI_card(
          name: w.POI_name,
          address: w.address,
          postalcode: w.POI_postalcode,
          description: w.POI_description,
          wasteCategory: POICategory,
          fav: true,
          TO_POI_page: () {
            Navigator.pushNamed(
              context,
              POI_DetialScreen.id,
              arguments: w,
            );
          },
          FavFunct: () {
            setState(() {
              if (kFav_POI_list.contains(w))
                kFav_POI_list.remove(w);
              else
                kFav_POI_list.add(w);
              //@todo add function to favourite/un-favourite POI
            });
          },
        ),
      );
    }

    return Column(
      children: [
        header_card(
          title: 'Favourites',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: fav_card_list
                /*  [
                POI_card(
                  name: 'POI1',
                  address: 'address',
                  postalcode: 310204,
                  description: 'description',
                  TO_POI_page: () {
                    Navigator.pushNamed(
                      context,
                      POI_DetialScreen.id,
                      arguments: kSample,
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
              ],*/ //@todo logic to create all of user favourite POI_cards
                //@todo create function/logic to go to POI page from Favourites page when pressed
                ),
          ),
        )
      ],
    );
  }
}
