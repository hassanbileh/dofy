import 'package:flutter/material.dart';

class ClassOnTicket extends StatelessWidget {
  final int places;
  final double? prixClasse;
  final String className;
  final double? height;
  final double width;

  const ClassOnTicket({
    super.key,
    required this.className,
    this.height,
    required this.width,
    required this.places,
    required this.prixClasse,
  });

  @override
  Widget build(BuildContext context) {
    return (places <= 0)
        ? Container(
            height: 48,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 233, 115, 104)),
                color: const Color.fromARGB(255, 231, 39, 22).withOpacity(0.2),
                borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        className,
                        overflow: TextOverflow.ellipsis,
                      )),
                      const Expanded(
                        child: Text(
                          "Occupé",
                          style: TextStyle(fontSize: 8, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '(${places.toString()})',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.monetization_on_outlined,
                              size: 10,
                              color: Colors.black,
                            ),
                            Text(
                              prixClasse.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            height: 48,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 22, 231, 130)),
                color: const Color.fromARGB(255, 22, 231, 130).withOpacity(0.2),
                borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        className,
                        overflow: TextOverflow.ellipsis,
                      )),
                      const Expanded(
                        child: Text(
                          "Libre",
                          style: TextStyle(fontSize: 8, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '(${places.toString()})',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.monetization_on_outlined,
                              size: 10,
                              color: Colors.black,
                            ),
                            Text(
                              prixClasse.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
