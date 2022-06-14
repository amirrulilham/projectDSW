part of 'profileInfoBloc.dart';

abstract class ProfileInfoEvent extends Equatable {
  const ProfileInfoEvent();
  @override
  List<Object> get props => [];
}

//get list of profile data
class GetProfileInfoList extends ProfileInfoEvent {}

//add data
class InsertProfileInfoData extends ProfileInfoEvent {
  final ProfileInfoModel profileInfoModel;
  const InsertProfileInfoData(this.profileInfoModel);
}

//delete profile info data
class DeleteProfileInfoData extends ProfileInfoEvent {
  final int profileInfoId;
  const DeleteProfileInfoData(this.profileInfoId);
}

//get specific profile info data
class GetProfileInfoData extends ProfileInfoEvent {
  final int profileInfoId;
  const GetProfileInfoData(this.profileInfoId);
}

class LoginProfileInfo extends ProfileInfoEvent {
  final String username, password;
  const LoginProfileInfo(this.username, this.password);
}

//update profile info data
class UpdateProfileInfoData extends ProfileInfoEvent {
  final ProfileInfoModel profileInfoModel;
  const UpdateProfileInfoData(this.profileInfoModel);
}
