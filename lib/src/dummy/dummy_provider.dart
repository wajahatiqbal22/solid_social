// Project imports:
import 'package:flutter/material.dart';
import 'package:solid_social/utils/assets/posts.dart';

import '../../utils/assets/emojis.dart';

class DummyProvider {
  /// <h3>Provides dummy content for stories</h3>
  static List storyList = [
    {
      "name": "Novac",
      "imageUrl": "assets/sample_images/avatars/avatar8.png",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Derick",
      "imageUrl": "assets/sample_images/avatars/avatar9.png",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Mevis",
      "imageUrl": "assets/sample_images/avatars/avatar10.png",
      "isOnline": true,
      "hasStory": false,
    },
    {
      "name": "Emannual",
      "imageUrl": "assets/sample_images/avatars/avatar11.png",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Gracy",
      "imageUrl": "assets/sample_images/avatars/avatar9.png",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Robert",
      "imageUrl": "assets/sample_images/avatars/avatar10.png",
      "isOnline": false,
      "hasStory": true,
    },
    {
      "name": "Cindy",
      "imageUrl": "assets/sample_images/avatars/avatar3.png",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "James",
      "imageUrl": "assets/sample_images/avatars/avatar2.png",
      "isOnline": true,
      "hasStory": true,
    }
  ];

  static List postList = [
    {
      "username": 'JamesJ',
      "profilePicture": 'assets/sample_images/avatars/avatar2.png',
      "caption":
          'Hello everyone on the community, I’m so happy to be here with y’all. I’m James, a Fashion Designer...',
      "timeUpdated": '30min',
      "commentCount": 0,
      "attachments": [
        "assets/sample_images/image1.png",
      ],
      "emojiItems": <EmojiButton>{
        EmojiButton(
          reactionCount: 2,
          emojiIcon: CustomEmoji.boyDance(),
        ),
      },
    },
    {
      "username": 'Jasmine',
      "profilePicture": 'assets/sample_images/avatars/avatar3.png',
      "caption":
          'Hello everyone on the community, I’m so happy to be here with y’all.',
      "timeUpdated": '45min',
      "commentCount": 16,
      "emojiItems": <EmojiButton>{
        EmojiButton(
          reactionCount: 2,
          emojiIcon: CustomEmoji.fire(),
        ),
      },
    }
  ];

  static List communityCategoryList = [
    {
      "text": "Shopping",
      "isFocused": true,
    },
    {
      "text": "Cars",
      "isFocused": false,
    },
    {
      "text": "Walking",
      "isFocused": false,
    },
    {
      "text": "Wine",
      "isFocused": false,
    },
    {
      "text": "Hiking",
      "isFocused": false,
    },
    {
      "text": "Soccer",
      "isFocused": false,
    },
    {
      "text": "Songwriter",
      "isFocused": false,
    },
    {
      "text": "Reading",
      "isFocused": false,
    },
    {
      "text": "Art",
      "isFocused": false,
    },
    {
      "text": "Tea",
      "isFocused": false,
    },
    {
      "text": "DIY",
      "isFocused": false,
    },
    {
      "text": "Back Packing",
      "isFocused": false,
    },
    {
      "text": "Triathlon",
      "isFocused": false,
    },
    {
      "text": "Brunch",
      "isFocused": false,
    },
    {
      "text": "Self Care",
      "isFocused": false,
    },
    {
      "text": "Coffee",
      "isFocused": false,
    },
    {
      "text": "Language Exchange",
      "isFocused": false,
    },
    {
      "text": "Anime",
      "isFocused": false,
    },
    {
      "text": "Meditation",
      "isFocused": false,
    },
    {
      "text": "Gardening",
      "isFocused": false,
    },
    {
      "text": "Reggaeton",
      "isFocused": false,
    },
    {
      "text": "Yoga",
      "isFocused": true,
    },
    {
      "text": "Cycling",
      "isFocused": false,
    },
    {
      "text": "Netflix",
      "isFocused": false,
    },
    {
      "text": "E-Sports",
      "isFocused": false,
    },
    {
      "text": "Sailing",
      "isFocused": false,
    },
    {
      "text": "K-Pop",
      "isFocused": false,
    },
    {
      "text": "Motorcycling",
      "isFocused": false,
    },
    {
      "text": "Country Music",
      "isFocused": false,
    },
    {
      "text": "Martial Arts",
      "isFocused": false,
    },
    {
      "text": "Craft Beer",
      "isFocused": false,
    },
    {
      "text": "Collecting",
      "isFocused": false,
    },
    {
      "text": "Trivia",
      "isFocused": false,
    },
    {
      "text": "Skateboarding",
      "isFocused": false,
    },
    {
      "text": "Singing",
      "isFocused": false,
    },
    {
      "text": "Catan",
      "isFocused": false,
    },
    {
      "text": "Running",
      "isFocused": false,
    },
    {
      "text": "Board Games",
      "isFocused": false,
    },
    {
      "text": "Festivals",
      "isFocused": false,
    },
    {
      "text": "Writing",
      "isFocused": false,
    },
    {
      "text": "Active Lifestyle",
      "isFocused": false,
    },
    {
      "text": "Bowling",
      "isFocused": false,
    },
    {
      "text": "Wagon Cooking",
      "isFocused": false,
    },
    {
      "text": "Cryptocurrency",
      "isFocused": true,
    },
    {
      "text": "Expositions",
      "isFocused": false,
    },
    {
      "text": "Fishing",
      "isFocused": false,
    },
    {
      "text": "Sushi",
      "isFocused": false,
    },
    {
      "text": "Working Out",
      "isFocused": false,
    },
    {
      "text": "Dancing",
      "isFocused": false,
    },
    {
      "text": "BBQ",
      "isFocused": false,
    },
  ];
}

Widget stories(List storyList) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      children: <Widget>[
        Row(
          children: List.generate(storyList.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: <Widget>[
                  // image box
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        storyList[index]['hasStory']

                            // if has story
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                storyList[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )

                            // if doesn't have story
                            : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          storyList[index]['imageUrl']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                        storyList[index]['isOnline']
                            ? Positioned(
                                top: 38,
                                left: 40,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    width: 75,
                    child: Align(
                      child: Text(
                        storyList[index]['name'],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ],
    ),
  );
}
