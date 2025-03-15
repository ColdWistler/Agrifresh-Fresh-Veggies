import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildCategoryChips(),
              const SizedBox(height: 16),
              _buildDealsCard(),
              const SizedBox(height: 24),
              _buildExclusiveOfferHeader(),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: [
                    _buildProductCard("Rayo saag", "Rs 30", "1Lb, Priced"),
                    _buildProductCard("Tomato", "Rs 25", "1Lb, Priced"),
                    _buildProductCard("Cabbage", "Rs 12", "1 KG"),
                    _buildProductCard("Cauli Flower", "Rs 20", "1KG Priced"),
                    _buildProductCard("Bell Pepper Red", "Rs 60", "1 KG"),
                    _buildProductCard("Red potato", "Rs 30", "1 KG"),
                    _buildProductCard(
                      "Bell Pepper Red",
                      "Rs 60",
                      "1Lb, Priced",
                    ),
                    _buildProductCard("Organic Ginger", "Rs 40", "1Lb, Priced"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              user.displayName ?? "User", // Use Firebase user's display name
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            user.photoURL ?? 'assets/images/avatar.png',
          ), // Use Firebase user's photo URL
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "What do you looking for?",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Icon(Icons.tune, color: Colors.grey[700]),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text("Popular", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text("Veggie", style: TextStyle(color: Colors.black87)),
        ),
      ],
    );
  }

  Widget _buildDealsCard() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/deals.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("50% Off All Items", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Shop Now"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExclusiveOfferHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Exclusive Offer",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See all", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildProductCard(String name, String price, String quantity) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/vegetables/${name.toLowerCase().replaceAll(" ", "_")}.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        quantity,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              width: 28,
              height: 28,
              child: Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 60,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF36805B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.search, color: Colors.white),
          Icon(Icons.notifications_none, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, color: Colors.white),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.home, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
