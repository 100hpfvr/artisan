import 'package:artisan/screens/login/login_screen.dart';
import 'package:artisan/stores/page_store.dart';
import 'package:artisan/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (userManagerStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 13),
        color: Colors.deepOrange,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userManagerStore.isLoggedIn
                        ? userManagerStore.user.name
                        : "Acesse sua conta agora!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                      userManagerStore.isLoggedIn
                          ? userManagerStore.user.email
                          : "Clique aqui",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
