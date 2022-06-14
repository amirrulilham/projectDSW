import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectsdw/DataLayer/Model/dependentModel.dart';
import 'package:projectsdw/ServicesLayer/profileInfoController/dependentBloc.dart';

class UpdateUserDependentEdit extends StatefulWidget {
  const UpdateUserDependentEdit({Key? key}) : super(key: key);

  @override
  State<UpdateUserDependentEdit> createState() =>
      _UpdateUserDependentEditState();
}

class _UpdateUserDependentEditState extends State<UpdateUserDependentEdit> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _relation = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _age = TextEditingController();
  final DependentBloc dependentBloc = DependentBloc();

  DependentModel? get dependentModel => null;

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('User Profile Edit'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                dependentBloc.add(GetDependentData(id));
                return dependentBloc;
              },
              child: BlocBuilder<DependentBloc, DependentState>(
                builder: (context, state) {
                  if (state is DependentInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DependentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateDependentLoad) {
                    _id.text = state.dependentModel.id.toString();
                    _name.text = state.dependentModel.name;
                    _relation.text = state.dependentModel.relation;
                    _gender.text = state.dependentModel.gender;
                    _age.text = state.dependentModel.age.toString();

                    return ListView(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          elevation: 10,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 1),
                          child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      controller: _name,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter your name',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _relation,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter your Relation',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _gender,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter Your Gender',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _age,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter age',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please select a age';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          70, 30, 70, 10),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            //add to model
                                            DependentModel dependentModel =
                                                DependentModel(
                                              id: id,
                                              name: _name.text,
                                              relation: _relation.text,
                                              gender: _gender.text,
                                              age: int.parse(_age.text),
                                            );

                                            //update to bloc
                                            dependentBloc.add(
                                                UpdateDependentData(
                                                    dependentModel));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Data Added Successfully'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )),
    );
  }
}
