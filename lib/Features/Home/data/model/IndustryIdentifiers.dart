class IndustryIdentifiers {
  final String? type;
  final String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifiers(
      type: json['type'],
      identifier: json['identifier'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['identifier'] = identifier;
    return data;
  }
}
