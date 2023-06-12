// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class CustomEmoji {
  static const double _defaultSize = 20;

  /// <h1>This returns 🙌</h1>
  static Text handsUp({double size = _defaultSize}) {
    return Text(
      "🙌",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>This returns 👍</h1>
  static Text like({double size = _defaultSize}) {
    return Text(
      "👍",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>This returns 🥳</h1>
  static Text partyHat({double size = _defaultSize}) {
    return Text(
      "🥳",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>This returns 🔥</h1>
  static Text fire({double size = _defaultSize}) {
    return Text(
      "🔥",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>This returns 🤗</h1>
  static Text huggingFace({double size = _defaultSize}) {
    return Text(
      "🤗",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>This returns 👋</h1>
  static Text handWave({double size = _defaultSize}) {
    return Text(
      "👋",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>(svg) This returns ❤️</h1>
  static SvgPicture heart({double size = _defaultSize}) {
    return SvgPicture.asset(
      "assets/custom_icons/heart.svg",
      height: size,
      width: size,
    );
  }

  /// <h1> This returns 💃</h1>
  static Text girlDance({double size = _defaultSize}) {
    return Text(
      "💃",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1> This returns 🕺</h1>
  static Text boyDance({double size = _defaultSize}) {
    return Text(
      "🕺",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>This returns 😊</h1>
  static Text smileyBlushFace({double size = _defaultSize}) {
    return Text(
      "😊",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  /// <h1>you: 🤓🤓🤓🤓🤓🤓</h>
  static Text nerd({double size = _defaultSize}) {
    return Text(
      "🤓",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
