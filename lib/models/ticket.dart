import 'package:dofy/models/class.dart';

class Ticket {
  const Ticket(
    this.documentId,
    this.depart,
    this.destination,
    this.jour,
    this.heureDepart,
    this.heureArrive,
    this.status,
    this.trainNum,
    this.company,
    this.companyEmail,
    this.classes,
  );
  final String documentId;
  final String depart;
  final String destination;
  final String jour;
  final String heureDepart;
  final String heureArrive;
  final bool status;
  final String trainNum;
  final String company;
  final String companyEmail;
  final List<Classe> classes;
}

class TicketData {
  static const List<Ticket> tickets = [
    Ticket(
      '1',
      'Nagad',
      'Dire Dawa',
      '31 Mai 2024',
      '8h00',
      '15h30',
      true,
      'T101',
      'DjibTrain',
      'hasbilbilofficial@gmail.com',
      ClasseData.classes,
    ),
    Ticket(
      '2',
      'Nagad',
      'Addis Abeba',
      '27 Mai 2024',
      '8h00',
      '15h30',
      true,
      'N21b',
      'EthTrain',
      'hasbilbilofficial@gmail.com',
      ClasseData.classes,
    ),
    Ticket(
      '3',
      'Dire Dawa',
      'Addis Abeba',
      '3 Juin 2024',
      '8h00',
      '15h30',
      true,
      'T101',
      'DjibTrain',
      'hasbilbilofficial@gmail.com',
      ClasseData.classes,
    ),
    Ticket(
      '3',
      'Nagad',
      'Dire Dawa',
      '10 Juin 2024',
      '8h00',
      '15h30',
      true,
      'N21b',
      'DjibTrain',
      'hasbilbilofficial@gmail.com',
      ClasseData.classes,
    ),
    Ticket(
      '4',
      'Addis Abeba',
      'Djibouti',
      '15 Juin 2024',
      '8h00',
      '15h30',
      true,
      'T101',
      'DjibTrain',
      'hasbilbilofficial@gmail.com',
      ClasseData.classes,
    ),
    Ticket(
      '5',
      'Nagad',
      'Dire Dawa',
      '17 Mai 2024',
      '8h00',
      '15h30',
      true,
      'N21b',
      'DjibTrain',
      'hasbilbilofficial@gmail.com',
      ClasseData.classes,
    ),
  ];
}
