part of 'profileInfoBloc.dart';

abstract class ProfileInfoState extends Equatable {
  const ProfileInfoState();
  @override
  List<Object> get props => [];
}

class ProfileInfoInitial extends ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

//update profile Info load
class UpdateProfileInfoLoad extends ProfileInfoState {
  final ProfileInfoModel profileInfoModel;
  const UpdateProfileInfoLoad(this.profileInfoModel);
}

//update profile Info load
class ProfileInfoLoginLoad extends ProfileInfoState {
  final ProfileInfoModel profileInfoModel;
  const ProfileInfoLoginLoad(this.profileInfoModel);
}

//display list profile Info Index
class IndexProfileInfoLoad extends ProfileInfoState {
  final List<ProfileInfoModel> profileInfoModel;
  const IndexProfileInfoLoad(this.profileInfoModel);
}

class ProfileInfoError extends ProfileInfoState {
  final String? message;
  const ProfileInfoError(this.message);
}

class ProfileInfoLoginError extends ProfileInfoState {
  final String? message;
  const ProfileInfoLoginError(this.message);
}
