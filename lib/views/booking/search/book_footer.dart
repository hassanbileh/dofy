import 'package:dofy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingFooter extends StatelessWidget {
  const BookingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(top: 20.0),
      sliver: SliverToBoxAdapter(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Comment ça marche",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(),
          Explaination(
            icon: Icons.search,
            title: 'Rechercher',
            text: 'Trouvez des trains, bus et avions dans toute l\'Afrique et le monde entier.',
          ),
          Explaination(
            icon: Icons.bookmark_added,
            title: 'Comparer',
            text: 'Choisissez le plus rapide et le moins cher parmi nos 100+ partenaires.',
          ),
          Explaination(
            icon: Icons.book_online_sharp,
            title: 'Réserver',
            text: 'Réserver un ticket, où que vous soyez.',
          ),
        ],
      )),
    );
  }
}
