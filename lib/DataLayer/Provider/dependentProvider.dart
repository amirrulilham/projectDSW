import 'package:projectsdw/DataLayer/Model/dependentModel.dart';
import '../Repository/profileDb.dart';

class DependentProvider {
  final _dependentProvider = Db.instance;

  //get all user
  Future<List<DependentModel>> getAllDependentDataProvider() {
    return _dependentProvider.getAllDependentData();
  }

  //insert dependent data
  Future<int> saveDependentData(dependentModel) {
    return _dependentProvider.addDependent(dependentModel);
  }

  //get specific Dependent data
  Future<DependentModel> getSpecificDependentDataProvider(int value) {
    return _dependentProvider.getSpecificDependentData(value);
  }

  //update dependent data
  Future<int> updateDependentProvider(dependentModel) {
    return _dependentProvider.updateDependent(dependentModel);
  }

  //delete dependent data
  Future<int> deleteDependentData(int value) {
    return _dependentProvider.deleteDependent(value);
  }

  updateDependentDataProvider(DependentModel dependentModel) {}
}
