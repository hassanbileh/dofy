import 'package:dofy/constants/theme.dart';
import 'package:dofy/models/class.dart';
import 'package:dofy/models/ticket.dart';
import 'package:dofy/views/screens.dart';
import 'package:flutter/material.dart';

class TicketResults extends StatelessWidget {
  const TicketResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tickets = TicketData.tickets;
    var classes = ClasseData.classes;
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text("Tickets"),
      ),
      body: TicketsList(
        tickets: tickets,
        classes: classes,
      ),
    );
  }
}
