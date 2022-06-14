import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectsdw/ServicesLayer/profileInfoController/dependentBloc.dart';

import 'UserDependentEdit.dart';
import 'userDependentAdd.dart';

class UserDependentView extends StatefulWidget {
  const UserDependentView({Key? key}) : super(key: key);

  @override
  State<UserDependentView> createState() => _IndexDependentstate();
}

class _IndexDependentstate extends State<UserDependentView> {
  final DependentBloc dependentBloc = DependentBloc();

  //get data when initial this state
  @override
  void initState() {
    dependentBloc.add(GetDependentList());
    super.initState();
  }

  refresh() {
    setState(() {
      initState();
    });
  }

  //refresh when pop
  onGoBack(dynamic value) {
    setState(() {
      initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Dependent Profile View'),
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: const FractionalOffset(1.0, 0.3),
          children: [
            Container(
              height: 40.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserDependentAdd()),
                  ).then(onGoBack);
                },
                child: const Text('Add Dependent'),
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
              create: (_) => dependentBloc,
              child: BlocBuilder<DependentBloc, DependentState>(
                  builder: (context, state) {
                if (state is DependentInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DependentLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is IndexDependentLoad) {
                  return _UI(context, state.dependentModel, onGoBack, refresh,
                      dependentBloc);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
        ),
      ),
    );
  }
}

//display list data
Widget _UI(BuildContext context, state, onGoBack, refresh, dependentBloc) {
  return ListView.builder(
      itemCount: state == null ? 0 : state.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  state[index].name.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UpdateUserDependentEdit(),
                                                  settings: RouteSettings(
                                                    arguments: {
                                                      "id": state[index]
                                                          .id
                                                          .toString(),
                                                    },
                                                  ))).then(onGoBack);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          dependentBloc.add(DeleteDependentData(
                                              state[index].id));
                                          refresh();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              state[index].age.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
