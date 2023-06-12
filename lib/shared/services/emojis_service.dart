import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:solid_social/shared/entities/emoji/emoji.dart';

abstract class EmojiService {
  List<Emoji> getEmojis();
  Map<String, dynamic> getEmojisMap();
}

class IEmojiService implements EmojiService {
  IEmojiService() {
    _init();
  }

  late Box _box;
  static const String emojisBoxKey = "emojis";
  static const String emojisServiceBoxName = "emojis_service";

  _init() async {
    _box = await Hive.openBox(emojisServiceBoxName);
    // _box.clear();
    Map<String, dynamic> emojis = Map<String, dynamic>.from(_box.get(emojisBoxKey) ?? {});
    if (emojis.isEmpty) {
      final rawEmojis = await rootBundle.loadString("assets/emojis/some_emojis.json");

      final emojis = jsonDecode(rawEmojis);
      await _box.put(emojisBoxKey, emojis);
    }
  }

  @override
  List<Emoji> getEmojis() {
    Map<String, dynamic> emojis = Map<String, String>.from(_box.get(emojisBoxKey));
    return emojis.entries.map((e) => Emoji(code: e.key, emoji: e.value)).toList();
  }

  @override
  Map<String, dynamic> getEmojisMap() {
    return Map<String, dynamic>.from(_box.get(emojisBoxKey));
  }
}
