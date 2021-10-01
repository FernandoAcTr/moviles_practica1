import 'package:flutter/material.dart';
import 'package:practica2/src/ui/pages/intenciones/widgets/card_option_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Intenciones extends StatefulWidget {
  const Intenciones({Key? key}) : super(key: key);

  @override
  _IntencionesState createState() => _IntencionesState();
}

class _IntencionesState extends State<Intenciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intenciones'),
        brightness: Brightness.dark,
      ),
      body: ListView(
        children: [
          _createCardOption('Abrir página web', 'https://celaya.tecnm.mx/', Icons.language, _launchURL),
          _createCardOption('Llamada telefónica', 'Cel: 4111267600', Icons.phone, _callPhone),
          _createCardOption('Enviar SMS', 'Cel: 4111267600', Icons.sms, _sendSMS),
          _createCardOption('Enviar email', 'to: fernando@gmail.com', Icons.email, _sendEmail),
          _createCardOption('Tomar fotografía', 'Abrir cámara', Icons.camera, () {}),
        ],
      ),
    );
  }

  Widget _createCardOption(String title, String subtitle, IconData icon, [VoidCallback? onTap]) {
    return CardOption(
      title: title,
      subtitle: subtitle,
      icon: icon,
      onTap: onTap,
    );
  }

  void _launchURL() async {
    final url = 'https://celaya.tecnm.mx/';
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  void _callPhone() async {
    final phone = 'tel:4111267600';
    await canLaunch(phone) ? await launch(phone) : throw 'Could not call $phone';
  }

  void _sendSMS() async {
    final phone = 'sms:4111267600';
    await canLaunch(phone) ? await launch(phone) : throw 'Could not send sms to $phone';
  }

  void _sendEmail() async {
    final email = Uri(
      scheme: 'mailto',
      path: 'fernando@gmail.com',
      query: 'subject=Saludo&body=Bienvenido :)',
    ).toString();
    await canLaunch(email) ? await launch(email) : throw 'Could not send email $email';
  }
}
