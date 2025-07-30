import 'package:day_two/pages/contact.dart';
import 'package:day_two/widgets/card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> skill = [
      'HTML',
      'CSS',
      'FLutter',
      'Dart',
      'JS',
      'PostgreeSQL',
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'assets/image/profile pic edit.jpg',
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Muhammad Faiz Abdurrahman',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Bio',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel molestie elit. Etiam bibendum libero eu placerat semper. Morbi ex arcu, suscipit eget magna at, euismod auctor ex.',
            ),
            SizedBox(height: 20),
            Text(
              'Skill',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: skill.length,
                itemBuilder: (context, index) {
                  var singleSkill = skill[index];
                  return Container(
                    alignment: Alignment.center,
                    height: 10,
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(singleSkill),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap:
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
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
                      'Next',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
