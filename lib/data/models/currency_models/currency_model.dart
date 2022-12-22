class CurrencyModel {
  String code;
  String caption;
  String fullCaption;
  int sort;
  String group;
  String initialValue;
  String regExp;
  bool required;
  String type;
  List values;

  CurrencyModel(
      {required this.code,
      required this.caption,
      required this.fullCaption,
      required this.sort,
      required this.group,
      required this.initialValue,
      required this.regExp,
      required this.required,
      required this.type,
      required this.values});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'] ?? "",
      caption: json['caption'] ?? "",
      fullCaption: json['fullCaption'] ?? "",
      sort: json['sort'] ?? 0,
      group: json['group'] ?? "",
      initialValue: json['initial_value'] ?? "",
      regExp: json['regExp'] ?? "",
      required: json['required'] ?? true,
      type: json['type'] ?? "",
      values: json['values'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] = code;
    data['caption'] = caption;
    data['fullCaption'] = fullCaption;
    data['sort'] = sort;
    data['group'] = group;
    data['initial_value'] = initialValue;
    data['regExp'] = regExp;
    data['required'] = required;
    data['type'] = type;
    data['values'] = values;
    return data;
  }
}
