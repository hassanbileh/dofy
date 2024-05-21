import 'package:dofy/views/screens.dart';
import 'package:intl/intl.dart';
import 'package:dofy/constants/theme.dart';
import 'package:flutter/material.dart';

final formatter = DateFormat.yMMMd();

class BookingPageView extends StatefulWidget {
  const BookingPageView({super.key});

  @override
  State<BookingPageView> createState() => _BookingPageViewState();
}

class _BookingPageViewState extends State<BookingPageView> {
  late final TextEditingController _depart;
  late final TextEditingController _arrivee;
  String? _selectedDate;
  String? _nbrPassenger;

  @override
  void initState() {
    _depart = TextEditingController();
    _arrivee = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _depart.dispose();
    _arrivee.dispose();
    super.dispose();
  }

  void _afficherCalendrier() async {
    final now = DateTime.now();
    final first = DateTime(now.year, now.month, now.day + 2);
    final last = DateTime(now.year, now.month + 1, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: first,
      firstDate: first,
      lastDate: last,
    );
    setState(() {
      _selectedDate = formatter.format(pickedDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          BookingForm(
            depart: _depart,
            arrivee: _arrivee,
            afficherCalendrier: _afficherCalendrier,
            choisirPassager: () {},
            selectedDate: _selectedDate,
            nbrPassenger: _nbrPassenger,
            searchTickets: () {},
          ),
          const BookingFooter(),
        ],
      ),
    );
  }
}
