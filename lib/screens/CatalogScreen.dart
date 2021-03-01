import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Reusable_Widgets.dart';
import 'package:wastetastic/Constants.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String selectedCategory = 'NORMAL WASTE';
  @override
  Widget build(BuildContext context) {
    /*List<WastePOI> WastePOIs = retrievePOIFromDatabase();
    List<WastePOI> catalog_Cat = [];
    for (WastePOI wPOi in WastePOIs):
      if(wPOI.wasteCategory == selectedCategory)catalog_Cat.add(wPOI);
    List<POI_card> fav_card_list =[];
    for (WastePOI w in catalog_selectCat):
      card_list.add(POI_card(name: w.name, address: w.address, postalCode: w.postalCode, description: w.POI_desc, TO_POI_page: Waste_page('name'),);
*/
    return Column(
      children: [
        header_card(
          title: 'Catalog',
        ),
        DropdownButtonFormField<String>(
          value: selectedCategory,
          icon: Icon(Icons.arrow_drop_down),
          decoration: InputDecoration(
            icon: Icon(Icons.receipt_long),
            prefix: Text("Filter by Waste Category: "),
          ),
          iconSize: 24,
          elevation: 20,
          style: TextStyle(color: Colors.white),
          onChanged: (String newValue) {
            setState(() {
              selectedCategory = newValue;
            });
          },
          dropdownColor: Colors.grey[900],
          items: kWasteCategory.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: //catalog_card_list,
                  [
                POI_card(
                  name: 'POI1',
                  address: 'address',
                  postalcode: 310204,
                  description: 'description',
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
