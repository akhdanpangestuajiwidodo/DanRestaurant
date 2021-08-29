class Food {
  late String name;

  Food(this.name);

  Food.fromJson(Map<String, dynamic> food){
    name = food['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}