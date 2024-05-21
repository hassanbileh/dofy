import 'package:dofy/models/hotel.dart';
import 'package:flutter/material.dart';
import 'package:dofy/widgets/booking/hotel_content.dart';

class HotelList extends StatelessWidget {
  const HotelList({super.key, required this.hotels});
  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 8.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          color: const Color.fromRGBO(255, 255, 255, 1),
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  left: 15.0,
                ),
                child: Text(
                  'Besoin d\'un hébergement ?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final hotel = hotels[index];
                    return HotelContent(
                      hotel: hotel,
                    );
                  },
                  itemCount: hotels.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
