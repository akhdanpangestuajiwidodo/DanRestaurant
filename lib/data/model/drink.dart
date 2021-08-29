class Drink {
  late String name;

  Drink(this.name);

  Drink.fromJson(Map<String, dynamic> drink){
    name = drink['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}