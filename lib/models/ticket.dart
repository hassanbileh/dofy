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
}
