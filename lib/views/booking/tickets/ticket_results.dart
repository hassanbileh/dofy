import 'package:dofy/assets/assets.dart';
import 'package:dofy/constants/theme.dart';
import 'package:dofy/models/ticket.dart';
import 'package:flutter/material.dart';

class TicketResults extends StatelessWidget {
  const TicketResults({super.key, this.tickets});
  final List<Ticket>? tickets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text("Tickets"),
      ),
      body: (tickets == null)
          ? Center(
            child: SizedBox(
                height: 300,
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Image.asset(Assets.waitingImage),
              ),
          )
          : Container(height: 200, width: 200, color: Colors.blue),
    );
  }
}
