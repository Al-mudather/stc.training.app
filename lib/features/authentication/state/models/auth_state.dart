import 'package:flutter/foundation.dart' show immutable;
import 'package:stc_training/features/authentication/typedefs/user_id.dart';
import 'package:stc_training/features/authentication/state/models/auth_results.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
  });

  //Todo: When the app is running for the first time the state is unKnown
  const AuthState.unKnown()
      : result = null,
        isLoading = false,
        userId = null;

  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        userId: userId,
      );

  //Todo: Implement equality on the model level
  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  // Todo: implement hashCode
  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        userId,
      );
}
