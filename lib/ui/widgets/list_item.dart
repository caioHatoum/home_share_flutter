import 'package:app_test/locator.dart';
import 'package:app_test/services/dialog_service.dart';
import 'package:app_test/services/hotel_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListItem extends StatelessWidget {
  const ListItem(this.uid, this.name, this.neighborhood, this.image, this.description);

  final String uid;
  final String name;
  final String neighborhood;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(name),
            subtitle: Text(neighborhood),
            trailing: Icon(Icons.more_vert)
          ),
          Container(
            child: Image.network(image)
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(description)
          ),
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF252DB7),
                width: 1
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5)
              ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Reservar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      textAlign: TextAlign.center
                    )
                  ]
                ),
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  var id = prefs.getString('id');
                  var hotelService = HotelService();
                  await hotelService.add(id, uid);
                  await locator<DialogService>().showDialog(
                    title: 'Sucesso',
                    description: 'Hotel agendado com sucesso!'
                  );
                }
              )
            )
          )
        ]
      )
    );
  }
}