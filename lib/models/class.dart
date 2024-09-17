class Classe {
  final String documentId;
  final String nom;
  final int capacite;
  final int places;
  final String? description;
  final double prixClasse;
  final String trainId;
  final String trainNum;

  const Classe({
    required this.documentId,
    required this.nom,
    required this.capacite,
    required this.places,
    required this.description,
    required this.prixClasse,
    required this.trainId,
    required this.trainNum,
  });
}

class ClasseData {
  static const classes = [
    Classe(
      documentId: '1',
      nom: 'VIP',
      capacite: 60,
      places: 30,
      description: 'Classe VIP',
      prixClasse: 3999.99,
      trainId: 'T101',
      trainNum: 'T101',
    ),
    Classe(
      documentId: '2',
      nom: 'Business',
      capacite: 100,
      places: 50,
      description: 'Classe Business',
      prixClasse: 2999.99,
      trainId: 'T101',
      trainNum: 'T101',
    ),
    Classe(
      documentId: '3',
      nom: 'Economie',
      capacite: 150,
      places: 100,
      description: 'Classe Economie',
      prixClasse: 1999.99,
      trainId: 'T101',
      trainNum: 'T101',
    ),
  ];
}
