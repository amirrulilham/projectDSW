part of 'dependentBloc.dart';

abstract class DependentState extends Equatable {
  const DependentState();
  @override
  List<Object> get props => [];
}

class DependentInitial extends DependentState {}

class DependentLoading extends DependentState {}

//update dependent  load
class UpdateDependentLoad extends DependentState {
  final DependentModel dependentModel;
  const UpdateDependentLoad(this.dependentModel);
}

//display list Dependent Index
class IndexDependentLoad extends DependentState {
  final List<DependentModel> dependentModel;
  const IndexDependentLoad(this.dependentModel);
}

class DependentError extends DependentState {
  final String? message;
  const DependentError(this.message);
}
