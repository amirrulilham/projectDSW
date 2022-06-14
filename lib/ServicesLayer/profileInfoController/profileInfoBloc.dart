import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projectsdw/DataLayer/Model/profileInfoModel.dart';
import 'package:projectsdw/DataLayer/Provider/profileInfoProvider.dart';

part 'profileInfoEvent.dart';
part 'profileInfoState.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  ProfileInfoBloc() : super(ProfileInfoInitial()) {
    final ProfileInfoProvider profileInfoProvider = ProfileInfoProvider();

    //get all Profile Info list
    on<GetProfileInfoList>((event, emit) async {
      emit(ProfileInfoLoading());
      final listProfileInfo =
          await profileInfoProvider.getAllProfileInfoDataProvider();
      emit(IndexProfileInfoLoad(listProfileInfo));
    });

    //insert Profile Info
    on<InsertProfileInfoData>((event, emit) async {
      await profileInfoProvider.saveProfileInfoData(event.profileInfoModel);
    });

    //delete
    on<DeleteProfileInfoData>((event, emit) async {
      await profileInfoProvider.deleteProfileInfoData(event.profileInfoId);
    });

    //get specific Profile Info
    on<GetProfileInfoData>((event, emit) async {
      emit(ProfileInfoLoading());
      final updateProfileInfo = await profileInfoProvider
          .getSpecificProfileInfoDataProvider(event.profileInfoId);
      emit(UpdateProfileInfoLoad(updateProfileInfo));
    });

    //get specific login Profile Info
    on<LoginProfileInfo>((event, emit) async {
      emit(ProfileInfoLoading());
      final updateProfileInfoLoad =
          await profileInfoProvider.getSpecificProfileInfoDataUsernameProvider(
              event.username, event.password);
      emit(UpdateProfileInfoLoad(updateProfileInfoLoad));
    });

    //update
    on<UpdateProfileInfoData>((event, emit) async {
      await profileInfoProvider
          .updateProfileInfoDataProvider(event.profileInfoModel);
    });
  }
}
