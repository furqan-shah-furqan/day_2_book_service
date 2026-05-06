import 'package:day_2_book_service/Provider/book_mark_provider.dart';
import 'package:day_2_book_service/models/booking_model.dart';
import 'package:day_2_book_service/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import 'book_mark_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String message = '';

  void bookService(UserModel user, ProductModel service) {
    BookingModel booking = BookingModel(
      id: '1',
      userid: user.id,
      serviceid: service.id,
      status: 'pending',
    );
    print('${user.name}Booked ${service.title}');
    print('Booking status ${booking.status}');
    print('Discount Apply ${service.discount}%');
  }

  final UserModel currentUser = UserModel(
    id: '1',
    name: 'ROBO',
    email: 'robo@gmail.com',
  );

  List<ProductModel> services = [
    ProductModel(id: '1', title: 'Car Wash', price: 500, discount: 5),
    ProductModel(id: '2', title: 'Engine Check', price: 1500, discount: 10),
    ProductModel(id: '3', title: 'Car redesign', price: 9999, discount: 9),
    ProductModel(id: '4', title: 'Tyre Change', price: 4000, discount: 12),
    ProductModel(id: '5', title: 'New Color', price: 6440, discount: 3),
    ProductModel(id: '5', title: 'Tunning', price: 3240, discount: 20),
  ];

  List<bool> bookMarks = [];

  @override
  void initState() {
    super.initState();
    bookMarks = List.generate(services.length, (index) => false);
  }

  void bookMark(int index) {
    setState(() {
      bookMarks[index] = !bookMarks[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // main Heading..
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Book Your Service',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookMarkPage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.bookmark_outline_rounded, size: 22),
                        ),
                      ],
                    ),
                    // sub Heading..
                    Text(
                      'find truseted experts nearby..',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),

              // Category.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        width: 335,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Explore.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Explore & Book Services',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    final bookmarkprovider = Provider.of<BookMarkProvider>(
                      context,
                    );
                    final isSaved = bookmarkprovider.isbookMark(service);

                    return Container(
                      height: 400,
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Image Showing.
                          // Lower Card Part
                          Container(
                            padding: EdgeInsets.all(8.0),
                            // margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // height: 70,
                            width: 158,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID: ${service.id}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  'Title: ${service.title}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),

                                Text(
                                  "Price: ${service.price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                Text(
                                  "Discount: ${service.discount}%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myButton(() => bookService(currentUser, service)),
                              // SizedBox(width: 6),
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  bookmarkprovider.toggleBookMark(service);
                                },
                                icon: Icon(
                                  isSaved
                                      ? Icons.bookmark
                                      : Icons.bookmark_border_outlined,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
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

Widget myButton(void Function()? onTap) {
  return SizedBox(
    height: 40,
    width: 100,
    child: Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 0, left: 8),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: Colors.grey.shade100,
        onPressed: onTap,
        child: Text(
          'Book Now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    ),
  );
}
