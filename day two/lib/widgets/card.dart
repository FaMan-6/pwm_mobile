import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String image;
  final String name;
  final String telp;
  const ContactCard({
    super.key,
    required this.image,
    required this.name,
    required this.telp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(image)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Nama: $name'), Text('Nomer: $telp')],
            ),
          ],
        ),
      ),
    );
  }
}
