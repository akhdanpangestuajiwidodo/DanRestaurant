class Category {
  late String name;

  Category({required this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
  };

}