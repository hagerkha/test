import 'package:flutter/material.dart';
import 'ProuductPage.dart'; // تأكد من أن اسم الملف صحيح

// الصفحة الرئيسية للمنتجات
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية التطبيق باللون الأبيض
      appBar: AppBar(
        backgroundColor: Colors.white, // جعل خلفية شريط التطبيق بيضاء
        elevation: 0, // إزالة الظل أسفل شريط التطبيق
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Auxiliary furniture',
                  style: TextStyle(
                    color: Color(0xFFF4B5A4), // تغيير لون نص العنوان
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF4B5A4), // لون الدائرة
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8), // مساحة داخلية للدائرة
              child: Icon(
                Icons.search,
                color: Colors.white, // لون الأيقونة
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصف الذي يحتوي على "Living Room | Decorative Light | Bed"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '   Living Room    |    Decorative Light    |    Bed',
              style: TextStyle(fontSize: 14, color: Color(0xFFDCBEB6)), // اللون الرمادي
            ),
          ),
          Expanded(
            child: _buildProductGrid(context), // شبكة المنتجات
          ),
        ],
      ),
    );
  }

  // دالة لإنشاء شبكة المنتجات
  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        childAspectRatio: 0.6, // نسبة عرض إلى ارتفاع العنصر
      ),
      itemCount: 4, // عدد المنتجات
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return _buildProductItem(
              context,
              'assets/img_5.png',
              'Kitchen Hutch',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
              300.0,
            );
          case 1:
            return _buildProductItem(
              context,
              'assets/img_8.png',
              'Vintage Cabinet',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              400.0,
            );
          case 2:
            return _buildProductItem(
              context,
              'assets/img_7.png',
              'Marble Shelving',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
              500.0,
            );
          case 3:
            return _buildProductItem(
              context,
              'assets/img_6.png',
              'Kitchen Shelving',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
              600.0,
            );
          default:
            return SizedBox.shrink(); // في حالة حدوث خطأ
        }
      },
    );
  }

  // دالة لإنشاء عنصر منتج
  Widget _buildProductItem(BuildContext context, String imagePath, String title, String description, double price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              imagePath: imagePath,
              title: title,
              description: description,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize: 12)),
            Divider(),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${price.toString()}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFF4B5A4), // لون النص (السعر)
                  ),
                ),
                Row(
                  children: [
                    _buildIconInCircle(Icons.favorite_border, color: Color(0xFFF4B5A4)),
                    SizedBox(width: 8),
                    _buildIconInCircle(Icons.add_shopping_cart, color: Color(0xFFF4B5A4)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // دالة لإنشاء الأيقونة داخل دائرة مجوفة مع لون
  Widget _buildIconInCircle(IconData icon, {required Color color}) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 2.0,
        ),
      ),
      child: Icon(
        icon,
        color: color,
        size: 18,
      ),
    );
  }
}