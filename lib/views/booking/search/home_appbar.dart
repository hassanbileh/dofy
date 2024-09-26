import 'package:dofy/constants/routes.dart';
import 'package:dofy/constants/theme.dart';
import 'dart:developer' as devtools show log;
import 'package:dofy/enum/menu_action.dart';
import 'package:dofy/utilities/dialogs/logout_dialog.dart';
import 'package:dofy/services/auth/auth_services.dart';
import 'package:dofy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            backgroundColor: AppTheme.backgroundColor,
            stretch: false,
            expandedHeight: MediaQuery.sizeOf(context).height * 0.1,
            actions: [
              PopupMenuButton<MenuAction>(
                color: const Color.fromARGB(255, 74, 44, 156),
                onSelected: (value) async {
                  switch (value) {
                    case MenuAction.logout:
                      final shouldLogout = await showLogOutDialog(context);
                      devtools.log(shouldLogout.toString());
                      if (shouldLogout) {
                        //? en cas de deconnexion
                        await AuthService.firebase().logOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          loginRoute,
                          (_) => false,
                        );
                      }
                    default:
                  }
                },

                // Menu Action builder
                itemBuilder: (value) {
                  return [
                    //? Popup du menuItem
                    const PopupMenuItem<MenuAction>(
                      value: MenuAction.logout,
                      child: Row(
                        children: [
                          Text(
                            'Se deconnecter',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              stretchModes: [StretchMode.fadeTitle],
              background: HelloClient(),
            ),
          );
  }
}