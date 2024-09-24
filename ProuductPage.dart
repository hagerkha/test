import 'package:flutter/material.dart';
import 'package:scree/re.dart';

// صفحة تفاصيل المنتج
class ProductDetailPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  ProductDetailPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _selectedIndex = 0; // متغير لتخزين الفهرس الحالي

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // هنا يمكنك إضافة كود للتنقل إلى الصفحة المناسبة بناءً على الفهرس
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFF4B5A4)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: Color(0xFFF4B5A4), fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Living Room | Decorative Light | Bed',
              style: TextStyle(fontSize: 14, color: Color(0xFFDCBEB6)), // اللون الرمادي
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFFFAF0E6),
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.price.toString()}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4B5A4),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFF4B5A4)),
                    Icon(Icons.star, color: Color(0xFFF4B5A4)),
                    Icon(Icons.star, color: Color(0xFFF4B5A4)),
                    Icon(Icons.star, color: Color(0xFFF4B5A4)),
                    Icon(Icons.star_border, color: Colors.grey),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton('Preview'),
                SizedBox(width: 16), // المسافة بين الأزرار
                _buildFavoriteButton(),
                SizedBox(width: 16), // المسافة بين الأيقونة والزر الثاني
                _buildActionButton('Add to Cart'),
              ],
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF4B5A4),
        unselectedItemColor: Color(0xFFF4B5A4),
        backgroundColor: Color(0xFFF4B5A4),
        onTap: _onItemTapped, // تغيير الصفحة بناءً على الأيقونة المختارة
      ),
    );
  }

  // دالة لإنشاء زر العمل
  Widget _buildActionButton(String label) {
    return SizedBox(
      width: 130,
      height: 47,
      child: ElevatedButton(
        onPressed: () {
          if (label == 'Preview') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewPage(),
              ),
            );
          }
        },
        child: Text(label, style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF4B5A4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  // دالة لإنشاء زر المفضلة
  Widget _buildFavoriteButton() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4B5A4),
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(8),
      child: Icon(Icons.favorite, color: Colors.white),
    );
  }
}