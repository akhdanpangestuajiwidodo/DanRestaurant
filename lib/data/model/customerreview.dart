class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({required this.review, required this.date, required this.name});

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json['name'],
    review: json['review'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'review': review,
    'date': date,
  };
}