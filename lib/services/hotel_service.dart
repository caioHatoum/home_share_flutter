import 'package:app_test/ui/widgets/history_item.dart';
import 'package:app_test/ui/widgets/list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelService {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Widget>> searchHotels() async {
    var hotels = await firestore.collection('hoteis').get();
    var result = <Widget>[];
    hotels.docs.forEach((element) {
      var name = element.get('nome');
      var neighborhood = element.get('bairro');
      var image = element.get('imagem');
      var description = element.get('descricao');
      var item = ListItem(element.id, name, neighborhood, image, description);
      result.add(item);
    });
    return result;
  }

  Future<void> add(String userId, String hotelId) {
    var hotels = firestore.collection('history');
    return hotels.add({
      'user_id': userId,
      'hotel_id': hotelId,
      'created_at': DateTime.now()
    });
  }

  Future<List<Widget>> getHistory() async {
    var result = <Widget>[];
    var prefs = await SharedPreferences.getInstance();
    var history = await firestore
      .collection('history')
      .where('user_id', isEqualTo: prefs.getString('id'))
      .get();
    var hotels = await firestore
      .collection('hoteis')
      .get();
    history.docs.forEach((element) {
      var createdAt = element.get('created_at');
      var hotelId = element.get('hotel_id');
      hotels.docs.forEach((hotel) {
        if (hotel.id == hotelId) {
          var name = hotel.get('nome');
          var neighborhood = hotel.get('bairro');
          var image = hotel.get('imagem');
          var description = hotel.get('descricao');
          var item = HistoryItem(hotel.id, name, neighborhood, image, description, createdAt);
          result.add(item);
        }
      });
    });

    return result;
  }

}