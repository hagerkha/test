import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'list.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !const bool.fromEnvironment('dart.vm.product'),
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // قائمة الصفحات للتنقل بينها
  static List<Widget> _pages = <Widget>[
    HomeScreen(),
   list(),  // صفحة List الجديدة
    CartPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF4B5A4),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],  // عرض الصفحة بناءً على الاختيار
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
}

// الصفحة الرئيسية (Home)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildWelcomeSection(),
          SizedBox(height: 20),
          _buildCategoriesSection(),
          SizedBox(height: 20),
          _buildKitchenSection(),
          SizedBox(height: 20),
          _buildProductList(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Hi, Welcome Back',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Create spaces that bring joy',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/img.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/imm.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryIcon(Icons.chair, 'Chairs'),
                _buildCategoryIcon(Icons.table_chart, 'Tables'),
                _buildCategoryIcon(Icons.bed, 'Beds'),
                _buildCategoryIcon(Icons.kitchen, 'Kitchen'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFF4B5A4),
            child: Icon(icon, size: 30, color: Colors.brown),
          ),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildKitchenSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF4B5A4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kitchen Cart',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet            , consectetur adipiscing elit.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: -20,
            top: -20,
            child: Image.asset(
              'assets/im.png',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildProductItem(
            'assets/img_2.png',
            'Aluminum Chair',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            120,
            4.5,
          ),
          _buildProductItem(
            'assets/img_3.png',
            'Stylish Chair',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            120,
            4.0,
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String imagePath, String title, String description, double price, double rating) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(description, style: TextStyle(fontSize: 14)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${price.toString()}', style: TextStyle(fontSize: 16, color: Colors.pink)),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildRatingStars(rating),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Shop Now',
                  style: TextStyle(
                    color: Color(0xFFF4B5A4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: Color(0xFFF4B5A4), size: 16);
        } else if (index < rating) {
          return Icon(Icons.star_half, color: Color(0xFFF4B5A4), size: 16);
        } else {
          return Icon(Icons.star_border, color: Color(0xFFF4B5A4), size: 16);
        }
      }),
    );
  }
}



// صفحات أخرى
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Cart Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Favorites Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Profile Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
