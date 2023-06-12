import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/extensions/string_extension.dart';
import 'package:solid_social/src/home/tabs/timeline/widgets/feed.dart';

Future<AttachmentType?> showAttachmentTypeSheet(BuildContext context) async {
  return await showModalBottomSheet<AttachmentType>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: AttachmentType.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CupertinoButton.filled(
                    child: Text(e.name.capitalizeFirstLetter),
                    onPressed: () => context.pop(e),
                  ),
                ),
              )
              .toList(),
          title: const Text('Pick from'),
          cancelButton: CupertinoButton.filled(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        );
      });
}

Future<ImageSource?> showImageSourceSheet(BuildContext context) async {
  return await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: ImageSource.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CupertinoButton.filled(
                    child: Text(e.name.capitalizeFirstLetter),
                    onPressed: () => context.pop(e),
                  ),
                ),
              )
              .toList(),
          title: const Text('Pick from'),
          cancelButton: CupertinoButton.filled(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        );
      });
}
