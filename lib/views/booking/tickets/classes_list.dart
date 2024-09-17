import 'package:dofy/models/class.dart';
import 'package:dofy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClassesList extends StatelessWidget {
  const ClassesList({super.key, required this.classes});
  final List<Classe> classes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            ClassOnTicket(
              className: classes[index].nom,
              height: 48,
              width: 100,
              places: classes[index].places,
              prixClasse: classes[index].prixClasse,
            ),
            const SizedBox(width: 5.0,)
          ],
        );
      },
    );
  }
}
