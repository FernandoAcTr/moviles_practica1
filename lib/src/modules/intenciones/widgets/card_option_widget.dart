import 'package:flutter/material.dart';

class CardOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  const CardOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Container(
          height: 40,
          padding: EdgeInsets.only(right: 10),
          child: Icon(icon),
          decoration: BoxDecoration(border: Border(right: BorderSide(width: 1.0))),
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
