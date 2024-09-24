import 'package:flutter/material.dart';
import 'Auxiliary Furniture.dart';

class list extends StatelessWidget { // تغيير اسم الكلاس ليتبع تنسيق الأسماء
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen', style: TextStyle(color: Color(0xFFF4B5A4))), // لون العنوان
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black), // إضافة أيقونة البحث
              onPressed: () {
                // إضافة وظيفة البحث هنا
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Display two items per row
          crossAxisSpacing: 4, // Horizontal space between items
          mainAxisSpacing: 8, // Vertical space between items
          childAspectRatio: 0.8, // Width to height ratio
          children: [
            _buildCategoryContainer(context, 'Auxiliary Furniture'),
            _buildCategoryContainer(context, 'Decor'),
            _buildCategoryContainer(context, 'Chairs'),
            _buildCategoryContainer(context, 'Lights'),
            _buildCategoryContainer(context, 'Tables'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContainer(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        if (text == 'Auxiliary Furniture') {
          // Navigate to ProductPage when Auxiliary Furniture is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(),
            ),
          );
        }
      },
      child: Container(
        width: 200, // Use the passed width
        height: 300, // Use the passed height
        padding: EdgeInsets.only(top: 8), // Padding
        decoration: BoxDecoration(
          color: Color(0xFFF4B5A4), // Background color
          borderRadius: BorderRadius.circular(20), // جعل الزوايا دائرية
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // لون الظل
              spreadRadius: 2, // انتشار الظل
              blurRadius: 5, // شدة الظل
              offset: Offset(0, 3), // اتجاه الظل
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white, // لون النص
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
