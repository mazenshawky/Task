class City {
  final int id;
  final String name;

  const City({
    required this.id,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'],
    name: json['name'],
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is City &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}