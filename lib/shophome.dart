import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({super.key});

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

List<Map<String, String>> items = [
  {'url': 'assets/image/laptopp.png', 'text': 'Premium Laptop Collection'},
  {'url': 'assets/image/work.jpg', 'text': 'Professional Workspace'},
  {'url': 'assets/image/light.jpg', 'text': 'Ambient Lighting'},
];

List<Map<String, String>> products = [
  {'url': 'assets/image/airpodes.jpg', 'text': 'Airpodes', 'price': '249 \$'},
  {'url': 'assets/image/bag.jpg', 'text': 'Bag', 'price': '139 \$'},
  {'url': 'assets/image/headphone.jpg', 'text': 'Headphone', 'price': '399 \$'},
  {'url': 'assets/image/keyboard.jpg', 'text': 'Keyboard', 'price': '249 \$'},
  {
    'url': 'assets/image/macbook.jpg',
    'text': 'MacBook Pro 16',
    'price': '2,499 \$',
  },
  {
    'url': 'assets/image/mouse.jpg',
    'text': 'Wireless Mouse',
    'price': '199 \$',
  },
  {'url': 'assets/image/watch.jpg', 'text': 'Smart Watch', 'price': '399 \$'},
];

List<Map<String, String>> offers = [
  {
    'title': '50% Off Electronics',
    'text': 'Limited time offer on all tech gadgets',
    'offer': '50% OFF',
  },
  {
    'title': 'Free Shipping Weekend',
    'text': 'No delivery charges on orders above \$50',
    'offer': 'FREE SHIP',
  },
  {
    'title': 'Buy 2 Get 1 Free',
    'text': 'On selected accessories and peripherals',
    'offer': 'B2G1',
  },
  {
    'title': 'Student Discount',
    'text': 'Extra 20% off with valid student ID',
    'offer': '20% OFF',
  },
  {
    'title': 'Bundle Deals',
    'text': 'Save more when you buy complete setups',
    'offer': 'BUNDLE',
  },
];

class _ShopHomePageState extends State<ShopHomePage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return FadeIn(
      duration: Duration(milliseconds: 400),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Our Products',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color(0xFF2B3467),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // first part for slider
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    physics: BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return Stack(
                        children: [
                          Container(
                            height: screenheight * 0.3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "${items[i]['url']}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenheight * 0.12,
                            left: 5,
                            child: IconButton(
                              onPressed: () {
                                if (i > 0) {
                                  _pageController.animateToPage(
                                    i - 1,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenheight * 0.12,
                            right: 5,
                            child: IconButton(
                              onPressed: () {
                                if (i < items.length) {
                                  _pageController.animateToPage(
                                    i + 1,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenheight * 0.22,
                            left: 10,
                            child: Container(
                              height: screenheight * 0.06,
                              width: screenwidth * 0.65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black.withOpacity(0.3),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${items[i]['text']}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              // sec part for our products
              Center(
                child: Text(
                  'Shop Our Collection',
                  style: TextStyle(
                    color: Color(0xFF2B3467),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 9 / 10,
                  ),
                  itemBuilder: (context, i) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 185, 174, 174),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          //Column for products container
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    constraints.maxHeight *
                                    0.7, // أو أي نسبة مناسبة
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    '${products[i]['url']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.3,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${products[i]['text']}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF2B3467),
                                            ),
                                          ),
                                          Text(
                                            '${products[i]['price']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF2B3467),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 5,
                                        bottom: 5,
                                        child: InkWell(
                                          onTap: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  '${products[i]['text']} Added to cart',
                                                ),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(
                                                0xFF2B3467,
                                              ).withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Icon(
                                                Icons.shopping_cart_outlined,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hot Offers ',
                    style: TextStyle(
                      color: Color(0xFF2B3467),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.local_fire_department,
                    size: 30,
                    color: const Color.fromARGB(255, 230, 98, 21),
                  ),
                ],
              ),
              //this part introduce hot offers
              Padding(
                padding: const EdgeInsetsGeometry.all(15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: offers.length,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: screenwidth * 0.01,
                        vertical: screenheight * 0.01,
                      ),
                      child: ListTile(
                        title: Text(
                          '${offers[i]['title']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenwidth * 0.04,
                          ),
                        ),
                        subtitle: Text(
                          '${offers[i]['text']}',
                          style: TextStyle(fontSize: screenwidth * 0.035),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            // go to ogger page
                          },
                          child: Container(
                            height: screenheight * 0.05,
                            width: screenwidth * 0.17,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B3467),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '${offers[i]['offer']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
