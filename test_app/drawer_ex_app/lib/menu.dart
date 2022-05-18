

import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mail",),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "page1st");
            }, 
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "page2nd");
            }, 
            icon: Icon(Icons.email_outlined),
          ),
        ],
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "page1st");
              }, 
              child: Text("보낸 편지함"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "page2nd");
              }, 
              child: Text("받은 편지함"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Pikachu"), 
              accountEmail: Text("peterhd@daum.net"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                   "images/pikachu-1.jpg",
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "page1st");
              },
              leading: const Icon(
                Icons.mail,
                color: Colors.black,
              ),
              title: const Text("보낸 메일함"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "page2nd");
              },
              leading: const Icon(
                Icons.mail_outlined,
                color: Colors.black,
              ),
              title: const Text("받은 메일함"),
            )
          ],
        ),
      ),
    );
  }
}