class FutureTestModel {
  final String value;

  FutureTestModel({required this.value});

  factory FutureTestModel.fromJson(Map<String, dynamic> json) {
    return FutureTestModel(
      value: json['value'],
    );
  }
}
