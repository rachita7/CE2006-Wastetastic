import 'package:flutter/material.dart';

class RecycleInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Lets Recycle'),
      ),
      content: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  "Recycling is good... \nblah.... blah.... blah.................................................."),
              SizedBox(
                height: 250,
              ),
              Text("Scroll"),
              SizedBox(
                height: 250,
              ),
              Text("Recycling is good... \nblah.... blah.... blah...."),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.grey,
          child: const Text('Okay, got it!'),
        ),
      ],
    );
  }
}
