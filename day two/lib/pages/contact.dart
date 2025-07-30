import 'package:day_two/pages/login.dart';
import 'package:day_two/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:day_two/widgets/card.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataContact = [
      {
        'img': 'assets/image/gambar-assets (2).jpg',
        'name': 'Hadiid',
        'telp': '12345678',
      },
      {
        'img': 'assets/image/gambar-assets (3).jpg',
        'name': 'Faiz KA',
        'telp': '87654321',
      },
      {
        'img': 'assets/image/gambar-assets (4).jpg',
        'name': 'Oman',
        'telp': '10298323',
      },
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Contact'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dataContact.length,
                itemBuilder: (context, index) {
                  var singleData = dataContact[index];
                  return ContactCard(
                    image: singleData['img'],
                    name: singleData['name'],
                    telp: singleData['telp'],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
