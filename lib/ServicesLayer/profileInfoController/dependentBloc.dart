import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projectsdw/DataLayer/Model/dependentModel.dart';
import 'package:projectsdw/DataLayer/Provider/dependentProvider.dart';

part 'dependentEvent.dart';
part 'dependentState.dart';

class DependentBloc extends Bloc<DependentEvent, DependentState> {
  DependentBloc() : super(DependentInitial()) {
    final DependentProvider dependentProvider = DependentProvider();

    //get all Dependent list
    on<GetDependentList>((event, emit) async {
      emit(DependentLoading());
      final listProfileInfo =
          await dependentProvider.getAllDependentDataProvider();
      emit(IndexDependentLoad(listProfileInfo));
    });

    //insert Dependent
    on<InsertDependentData>((event, emit) async {
      await dependentProvider.saveDependentData(event.dependentModel);
    });

    //delete
    on<DeleteDependentData>((event, emit) async {
      await dependentProvider.deleteDependentData(event.dependentId);
    });

    //get specific Profile Info
    on<GetDependentData>((event, emit) async {
      emit(DependentLoading());
      final updateDependent = await dependentProvider
          .getSpecificDependentDataProvider(event.dependentId);
      emit(UpdateDependentLoad(updateDependent));
    });

    //update
    on<UpdateDependentData>((event, emit) async {
      await dependentProvider.updateDependentDataProvider(event.dependentModel);
    });
  }
}
