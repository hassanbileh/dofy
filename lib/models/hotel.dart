import 'package:flutter/material.dart';

@immutable
class Hotel {
  final String hotelName, distance, price, imageUrl, rating,voters;

  const Hotel({
    required this.hotelName,
    required this.distance,
    required this.price,
    required this.imageUrl,
    required this.voters,
    required this.rating,
  });
}