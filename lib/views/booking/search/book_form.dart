import 'package:dofy/constants/theme.dart';
import 'package:dofy/widgets/components/custom_textfield.dart';
import 'package:dofy/widgets/components/gradient_button.dart';
import 'package:dofy/widgets/widgets.dart';
import 'package:flutter/material.dart';

typedef VoidCall = void Function();

class BookingForm extends StatelessWidget {
  const BookingForm({
    super.key,
    required this.depart,
    required this.arrivee,
    required this.afficherCalendrier,
    required this.choisirPassager,
    required this.selectedDate,
    required this.nbrPassenger,
    required this.searchTickets,
  });
  final TextEditingController depart;
  final TextEditingController arrivee;
  final VoidCall afficherCalendrier;
  final VoidCall choisirPassager;
  final String? selectedDate;
  final String? nbrPassenger;
  final VoidCall searchTickets;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20.0),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            width: MediaQuery.sizeOf(context).width * 0.95,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  //Station de Départ
                  CustomTextField(
                    controller: depart,
                    prefixIcon: Icons.directions_subway_sharp,
                    iconColor: Colors.grey[500],
                    hintText: "Station de départ",
                    labelText: "Départ",
                    kbType: TextInputType.name,
                  ),
                  //Station de D'arrivée
                  CustomTextField(
                    controller: arrivee,
                    prefixIcon: Icons.location_on_sharp,
                    iconColor: Colors.grey[500],
                    hintText: "Station d'arrivée",
                    labelText: "Arrivée",
                    kbType: TextInputType.name,
                  ),

                  //Date & Nb Passengers
                  Row(
                    children: [
                      // Calendar
                      Expanded(
                        child: CustomButton(
                          height: 50,
                          width: 130,
                          margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                          icon: Icons.calendar_month_outlined,
                          iconColor: AppTheme.formIconColor,
                          value: selectedDate,
                          content: 'Date',
                          function: afficherCalendrier,
                        ),
                      ),
                      //Nbr Passengers
                      Expanded(
                        child: CustomButton(
                          height: 50,
                          width: 130,
                          margin: const EdgeInsets.only(
                            left: 10.0,
                            top: 5.0,
                            right: 8.0,
                          ),
                          icon: Icons.person,
                          iconColor: AppTheme.formIconColor,
                          value: nbrPassenger,
                          content: '(1) Passagers',
                          function: choisirPassager,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  // Search Button
                  Center(
                    child: GradientButton(
                      buttonText: 'Search Tickets',
                      onPressed: searchTickets,
                      height: 50,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
