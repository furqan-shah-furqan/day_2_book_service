import 'package:day_2_book_service/Provider/book_mark_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookMarkProvider>(context);
    final services = bookmarkProvider.bookMarkServices;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black)),
      body: services.isEmpty
          ? Center(child: Text('No Bookmarked Services yet..'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      tileColor: Colors.grey.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Text(
                        service.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          final messenger = ScaffoldMessenger.of(context);
                          bookmarkProvider.deleteBookMark(index);
                          messenger.showSnackBar(
                            SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              content: Text(
                                'Bookmarked Service deleted Successfully',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.delete_rounded,
                          color: Colors.red.shade300,
                          size: 25,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
