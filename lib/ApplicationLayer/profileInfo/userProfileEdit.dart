import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectsdw/DataLayer/Model/profileInfoModel.dart';
import 'package:projectsdw/ServicesLayer/profileInfoController/profileInfoBloc.dart';

class UpdateProfileInfoPage extends StatefulWidget {
  const UpdateProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<UpdateProfileInfoPage> createState() => _UpdateProfileInfoPageState();
}

class _UpdateProfileInfoPageState extends State<UpdateProfileInfoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _icNum = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phoneNum = TextEditingController();
  TextEditingController _emailAddress = TextEditingController();
  final ProfileInfoBloc profileInfoBloc = ProfileInfoBloc();

  ProfileInfoModel? get profileInfoModel => null;

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
                profileInfoBloc.add(GetProfileInfoData(id));
                return profileInfoBloc;
              },
              child: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
                builder: (context, state) {
                  if (state is ProfileInfoInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProfileInfoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateProfileInfoLoad) {
                    _icNum.text = state.profileInfoModel.icNum;
                    _type.text = state.profileInfoModel.type;
                    _name.text = state.profileInfoModel.name;
                    _address.text = state.profileInfoModel.address;
                    _username.text = state.profileInfoModel.username;
                    _password.text = state.profileInfoModel.password;
                    _phoneNum.text = state.profileInfoModel.phoneNum;
                    _emailAddress.text = state.profileInfoModel.emailAddress;

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
                                      controller: _icNum,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Identification Number/Passport',
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
                                      controller: _type,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Type [Malaysian Citizen/Visitor]',
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
                                      controller: _name,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter Full Name',
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
                                      controller: _address,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter Address',
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
                                      controller: _username,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter Username',
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
                                      controller: _password,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter Password',
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
                                      controller: _phoneNum,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter Phone Number',
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
                                      controller: _emailAddress,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter Email Address',
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          70, 30, 70, 10),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            //add to model
                                            ProfileInfoModel profileModel =
                                                ProfileInfoModel(
                                              id: id,
                                              icNum: _icNum.text,
                                              type: _type.text,
                                              name: _name.text,
                                              address: _address.text,
                                              username: _username.text,
                                              password: _password.text,
                                              phoneNum: _phoneNum.text,
                                              emailAddress: _emailAddress.text,
                                            );

                                            //update to bloc
                                            profileInfoBloc.add(
                                                UpdateProfileInfoData(
                                                    profileModel));

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
