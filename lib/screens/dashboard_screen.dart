import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=14'),
                  ),
                  accountName: Text('Franco GR'),
                  accountEmail: Text('20030114@itcelaya.edu.mx'))
            ],
          ),
        ));
  }
}
