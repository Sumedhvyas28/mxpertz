import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0; // Track selected category

  final List<String> _categories = [
    "Recommend",
    "Cell Phone",
    "Car Products",
    "Department Store",
    "More",
  ];

  final List<Map<String, String>> _categoryGrid = [
    {"name": "Electronics", "image": "assets/mobile.png"},
    {"name": "Clothing", "image": "assets/Cloth.png"},
    {"name": "Shoes", "image": "assets/mobile.png"},
    {"name": "Watches", "image": "assets/mobile.png"},
    {"name": "Accessories", "image": "assets/shoppin_bag.png"},
    {"name": "Beauty", "image": "assets/suit.png"},
    {"name": "Home", "image": "assets/furniture.png"},
    {"name": "Sports", "image": "assets/mobile.png"},
  ];

  final List<Map<String, dynamic>> _products = [
    {
      "name": "Multi Kit",
      "image": "assets/multikit.png",
      "price": "\$500",
      "rating": 4.6,
      "reviews": 86,
    },
    {
      "name": "Lip Stick",
      "image": "assets/lip.png",
      "price": "\$299",
      "rating": 4.8,
      "reviews": 120,
    },
    {
      "name": "Multi Kit",
      "image": "assets/multikit.png",
      "price": "\$500",
      "rating": 4.6,
      "reviews": 86,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Center(
          child: Image.asset("assets/splash_logo.png", height: 40),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, Andrea",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              const Text(
                "What are you looking for today?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Banner Image
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/shopping.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Category Tabs
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: _categoryTab(_categories[index], index == _selectedCategoryIndex),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Categories Grid
              SizedBox(
                height: 100,
                child: GridView.builder(
                  shrinkWrap: true, // Added shrinkWrap to prevent infinite height issue
                  physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                  itemCount: _categoryGrid.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            _categoryGrid[index]["image"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _categoryGrid[index]["name"]!,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Products Grid
              GridView.builder(
                shrinkWrap: true, // Added shrinkWrap
                physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return _buildProductCard(_products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryTab(String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.orange : Colors.black,
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black54),
              onPressed: () {},
            ),
          ),
          Center(
            child: Image.asset(
              product["image"],
              height: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product["name"],
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product["price"],
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 18),
              const SizedBox(width: 4),
              Text("${product["rating"]}"),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "${product["reviews"]} Reviews",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
