import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:wastetastic/entity/WasteCategory.dart';
import 'package:direct_select/direct_select.dart';
import 'package:wastetastic/Constants.dart';

final _formKey = GlobalKey<FormState>();

int selectedIndex = 0;
String selectedTime;
String selectedDate;
String enteredWeight;
var selectedCategory = WasteCategory.values[0];

class AddWasteScreen extends StatefulWidget {
  @override
  _AddWasteScreenState createState() => _AddWasteScreenState();
}

class _AddWasteScreenState extends State<AddWasteScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
            child: Text(
              "Add New Record",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 5.0,
            thickness: 5.0,
            indent: 100.0,
            endIndent: 100.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          Row(
            children: [
              /* Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("add weight"),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text("enter date"),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text("enter time"),
                  ],
                ),
              ),*/
              Expanded(
                //flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DateTimePicker(
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          dateLabelText: 'Date',
                          icon: Icon(Icons.event),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Please enter Date';
                            }
                            return null;
                          },
                          onSaved: (val) => selectedDate = val,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        DateTimePicker(
                          type: DateTimePickerType.time,
                          initialValue: '12:00',
                          timeLabelText: "Time",
                          icon: Icon(Icons.access_time),
                          onSaved: (val) => selectedTime = val,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter Weight',
                            suffixText: 'Kg',
                            icon: Icon(Icons.shopping_cart_rounded),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter weight';
                            }
                            return null;
                          },
                          onSaved: (val) => enteredWeight = val,
                          //onEditingComplete: (val) => enteredWeight = val,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.receipt_long,
                              ),
                            ),
                            DirectSelect(
                              backgroundColor: Colors.black,
                              mode: DirectSelectMode.tap,
                              itemExtent: 35.0,
                              selectedIndex: selectedIndex,
                              child: Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      kWasteCategoryTextWidgets[selectedIndex],
                                ),
                              ),
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectedIndex = index;
                                  selectedCategory =
                                      WasteCategory.values[selectedIndex];
                                });
                              },
                              items: kWasteCategoryTextWidgets,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar.
                                  print(
                                      'date: $selectedDate \n time: $selectedTime \n'
                                      'weight: $enteredWeight \n category: $selectedCategory');
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Processing Data')));
                                }
                              },
                              child: Text('Add Record'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
