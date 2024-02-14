import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:prueba1/settings/app_value_notifier.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'), backgroundColor: Colors.green),
      drawer: Drawer(
        //menu de hamburguesa
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=14'),
              ),
              accountName: Text('Francisco González Rodríguez'),
              accountEmail: Text('20030114@itcelaya.edu.mx'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Practica 1"),
              subtitle: Text("Aqui va la descripción "),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text("Salir"),
              subtitle: Text("Adiós!!"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => {Navigator.pop(context), Navigator.pop(context)},
            ),
            DayNightSwitcherIcon(
              isDarkModeEnabled: AppValueNotifier.banTheme.value,
              onStateChanged: (isDarkModeEnabled) {
                AppValueNotifier.banTheme.value = isDarkModeEnabled;
              },
            ),
          ],
        ),
      ),
    );
  }
}
