class Criteria {
  final String type;
  final String text;
  final Map<String, dynamic>? variable;

  Criteria({
    required this.type,
    required this.text,
    this.variable,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) {
    return Criteria(
      type: json['type'],
      text: json['text'],
      variable: json['variable'] != null ? Map<String, dynamic>.from(json['variable']) : null,
    );
  }
}

class Variable {
  final String type;
  final dynamic values;

  Variable({
    required this.type,
    required this.values,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      type: json['type'],
      values: json['values'],
    );
  }
}

class Rule {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<Criteria> criteria;

  Rule({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    List<Criteria> criteriaList = [];
    if (json['criteria'] != null) {
      var criteriaJsonList = json['criteria'] as List;
      criteriaList = criteriaJsonList.map((criteriaJson) => Criteria.fromJson(criteriaJson)).toList();
    }

    return Rule(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criteria: criteriaList,
    );
  }
}