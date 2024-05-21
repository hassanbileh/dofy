import 'package:flutter/material.dart';
import 'package:dofy/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Deconnexion',
    content: 'Vous etes sure de vouloir vous deconnecter ?',
    optionsBuilder: () => {
      'Annuler': false,
      'Deconnexion': true,
    },
  ).then((value) => value ?? false);
}
