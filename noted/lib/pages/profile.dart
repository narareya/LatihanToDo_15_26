import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCAB5),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Card 1 - Person 1 (John)
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0DAC7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      // Profile Image 1
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/cat.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      // Person 1 Info
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '👤 John Doe',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5D5D5D),
                                ),
                              ),
                              
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const Text(
                                  '📧 john.doe@email.com',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF5D5D5D),
                                  ),
                                ),
                              ),
                              
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                child: const Text(
                                  '📱 +62 812 1111 2222',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF5D5D5D),
                                  ),
                                ),
                              ),
                              
                              const Text(
                                '📍 Jakarta, Indonesia',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5D5D5D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Profile Card 2 - Person 2 (Sarah)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0DAC7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      // Profile Image 2
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/cat.jpg', // Same image or different
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      // Person 2 Info
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '👩 Sarah Smith',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5D5D5D),
                                ),
                              ),
                              
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const Text(
                                  '📧 sarah.smith@email.com',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF5D5D5D),
                                  ),
                                ),
                              ),
                              
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                child: const Text(
                                  '📱 +62 813 3333 4444',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF5D5D5D),
                                  ),
                                ),
                              ),
                              
                              const Text(
                                '📍 Bandung, Indonesia',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5D5D5D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}