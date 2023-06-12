class Emoji {
  final String code;
  final String emoji;

  Emoji({required this.code, required this.emoji});

  factory Emoji.fromJson(Map<String, dynamic> json) => Emoji(code: json["code"], emoji: json["emoji"]);
}
