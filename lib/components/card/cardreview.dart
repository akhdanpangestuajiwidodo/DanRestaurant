import 'package:dan_resto/data/api/api_service.dart';
import 'package:dan_resto/data/model/customerreview.dart';
import 'package:dan_resto/provider/reviewprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CardReview extends StatefulWidget {
  final List<CustomerReview> reviews;
  final String id;

  CardReview({required this.reviews, required this.id});

  @override
  _CardReview createState() => _CardReview();
}

class _CardReview extends State<CardReview> {
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReviewProvider>(
      create: (_) => ReviewProvider(apiService: ApiServices()),
      child: SingleChildScrollView(
        child: Consumer<ReviewProvider>(builder: (context, state, _) {
          return Column(
            children: [
              ElevatedButton(
                child: Text("Add Review"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('Add Review'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      icon: Icon(Icons.account_box),
                                    ),
                                  ),
                                  TextField(
                                    controller: _reviewController,
                                    decoration: InputDecoration(
                                      labelText: 'Review',
                                      icon: Icon(Icons.message),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                child: Text("Submit"),
                                onPressed: () {
                                  setState(() {
                                    state.addReview(
                                        widget.id,
                                        _nameController.text,
                                        _reviewController.text);
                                    _buildListItem(widget.reviews);
                                    Navigator.pop(context);
                                  });
                                  _nameController.clear();
                                  _reviewController.clear();
                                }),
                          ],
                        );
                      });
                },
              ),
              _buildListItem(widget.reviews),
            ],
          );
        }),
      ),
    );
  }
}

Widget _buildReviewItem(BuildContext context, CustomerReview review) {
  return Card(
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(review.name),
      subtitle: Text(review.review),
      trailing: Text(review.date),
      leading: Icon(Icons.chat_bubble),
    ),
  );
}

Widget _buildListItem(List<CustomerReview> review) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: review.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildReviewItem(context, review[index]);
      });
}
