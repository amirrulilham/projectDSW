import 'package:projectsdw/DataLayer/Model/profileInfoModel.dart';
import '../Repository/profileDb.dart';

class ProfileInfoProvider {
  final _profileInfoProvider = Db.instance;

  //get all user
  Future<List<ProfileInfoModel>> getAllProfileInfoDataProvider() {
    return _profileInfoProvider.getAllProfileInfoData();
  }

  //insert profileinfo data
  Future<int> saveProfileInfoData(profileInfoModel) {
    return _profileInfoProvider.addProfileInfo(profileInfoModel);
  }

  //get specific profileinfo data
  Future<ProfileInfoModel> getSpecificProfileInfoDataProvider(int value) {
    return _profileInfoProvider.getSpecificProfileInfoData(value);
  }

  //get specific username data
  Future<ProfileInfoModel> getSpecificProfileInfoDataUsernameProvider(
      String username, String password) {
    return _profileInfoProvider.getSpecificProfileInfoDataUsername(
        username, password);
  }

  //update profileInfo data
  Future<int> updateProfileInfoDataProvider(profileInfoModel) {
    return _profileInfoProvider.updateProfileInfo(profileInfoModel);
  }

  //delete Profile Info data
  Future<int> deleteProfileInfoData(int value) {
    return _profileInfoProvider.deleteProfileInfo(value);
  }
}
