import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF4B5A4), // الخلفية
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'User Reviews',
            style: TextStyle(color: Colors.white), // لون العنوان
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF4B5A4), // لون الخلفية للدائرة
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.white), // أيقونة البحث باللون الأبيض
              onPressed: () {
                // إضافة وظيفة البحث هنا
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('603 Reviews', style: TextStyle(fontSize: 20)),
                TextButton(
                  onPressed: () {
                    // إضافة وظيفة "See All" هنا
                  },
                  child: Text('See All'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: List.generate(5, (index) {
                  // List of reviewer images and names
                  List<String> reviewerImages = [
                    'assets/img_9.png',
                    'assets/img_10.png',
                    'assets/img_11.png',
                    'assets/img_12.png',
                    'assets/img_13.png', // تعديل هنا لتجنب التكرار
                  ];

                  List<String> reviewerNames = [
                    'Hagar',
                    'Ahmed',
                    'Mena',
                    'Oumnia',
                    'Amnia', // تعديل الاسم
                  ];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFFAF0E6), // Background color
                    child: Row(
                      children: [
                        // Reviewer image
                        CircleAvatar(
                          radius: 25, // Smaller size for the image
                          backgroundImage: AssetImage(reviewerImages[index]), // Different image for each reviewer
                        ),
                        SizedBox(width: 12),
                        // Review text and name
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Reviewer name
                              Text(
                                reviewerNames[index],
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              // Review text
                              Text(
                                'This is a review text that describes the product experience.',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              // Star and rating
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.star, color: Color(0xFFCC7861)), // إصلاح هنا
                                  SizedBox(width: 4),
                                  Text('5', style: TextStyle(fontSize: 16)),
                                  SizedBox(width: 16),
                                  Icon(Icons.visibility, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text('609', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Color(0xFFF4B5A4),
        selectedItemColor: Color(0xFFF4B5A4),
        backgroundColor: Color(0xFFF4B5A4),
      ),
    );
  }
}
