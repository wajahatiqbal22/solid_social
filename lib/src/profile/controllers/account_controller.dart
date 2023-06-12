// Dart imports:
import 'dart:io';

// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/exceptions/db_exception/db_exception.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap_controller.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';

class AccountController extends BootstrapController {
  AccountController(super.services, {required this.currentUser});

  final SolidSocialUser currentUser;

  Loading _state = Loading.idle;

  Loading get state => _state;

  set state(Loading state) {
    _state = state;
    notifyListeners();
  }

  Future<void> changeUserDetails(
    SolidSocialUser currentUser, {
    File? bannerFile,
    File? photoFile,
    String? firstName,
    String? lastName,
    String? bio,
    Function(SolidSocialUser)? onDetailsChanged,
    Function(DBException)? onError,
  }) async {
    try {
      state = Loading.processing;
      if (firstName != null) currentUser = currentUser.copyWith(firstName: firstName);

      if (lastName != null) currentUser = currentUser.copyWith(lastName: lastName);

      // currentUser = currentUser.copyWith(firstName:  firstName, lastName: lastName)
      final userFromDB = await services.userService.changeUserDetails(
        currentUser,
        photoFile: photoFile,
        bannerFile: bannerFile,
        bio: bio,
      );
      currentUser = userFromDB;
      onDetailsChanged?.call(currentUser);
      state = Loading.loaded;
    } on DBException catch (e, s) {
      state = Loading.error;
      onError?.call(e);
    }
  }
}
