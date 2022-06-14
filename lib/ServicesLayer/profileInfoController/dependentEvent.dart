part of 'dependentBloc.dart';

abstract class DependentEvent extends Equatable {
  const DependentEvent();
  @override
  List<Object> get props => [];
}

//get list of Dependent data
class GetDependentList extends DependentEvent {}

//add data
class InsertDependentData extends DependentEvent {
  final DependentModel dependentModel;
  const InsertDependentData(this.dependentModel);
}

//delete profile info data
class DeleteDependentData extends DependentEvent {
  final int dependentId;
  const DeleteDependentData(this.dependentId);
}

//get specific profile info data
class GetDependentData extends DependentEvent {
  final int dependentId;
  const GetDependentData(this.dependentId);
}

//udata profile info data
class UpdateDependentData extends DependentEvent {
  final DependentModel dependentModel;
  const UpdateDependentData(this.dependentModel);
}
