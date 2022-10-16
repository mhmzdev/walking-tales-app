// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LeaderboardItem {
  String? name;
  String? url;
  int? steps;
  LeaderboardItem({
    required this.name,
    required this.url,
    required this.steps,
  });

  LeaderboardItem copyWith({
    String? name,
    String? url,
    int? steps,
  }) {
    return LeaderboardItem(
      name: name ?? this.name,
      url: url ?? this.url,
      steps: steps ?? this.steps,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'steps': steps,
    };
  }

  factory LeaderboardItem.fromMap(Map<String, dynamic> map) {
    return LeaderboardItem(
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      steps: map['steps'] != null ? map['steps'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaderboardItem.fromJson(String source) =>
      LeaderboardItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LeaderboardItem(name: $name, url: $url, steps: $steps)';

  @override
  bool operator ==(covariant LeaderboardItem other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url && other.steps == steps;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode ^ steps.hashCode;
}
