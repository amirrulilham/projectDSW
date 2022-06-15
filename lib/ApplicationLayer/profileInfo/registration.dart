import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectsdw/DataLayer/Model/profileInfoModel.dart';
import 'package:projectsdw/ServicesLayer/profileInfoController/profileInfoBloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('REGISTRATION'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
            create: (_) => profileInfoBloc,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Card(
                    elevation: 10,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _icNum,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText:
                                      'Enter  Identification Number/Passport',
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
                                  labelText: 'Enter  Full Name',
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
                                  labelText: 'Enter  Address',
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
                                  labelText: 'Enter  Username',
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
                                    return 'Please select a password';
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
                                  labelText: 'Enter  Phone Number',
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
                                padding:
                                    const EdgeInsets.fromLTRB(70, 30, 70, 10),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      //add to model
                                      ProfileInfoModel profileInfoModel =
                                          ProfileInfoModel(
                                        icNum: _icNum.text,
                                        type: _type.text,
                                        name: _name.text,
                                        address: _address.text,
                                        username: _username.text,
                                        password: _password.text,
                                        phoneNum: _phoneNum.text,
                                        emailAddress: _emailAddress.text,
                                      );

                                      //add to bloc
                                      profileInfoBloc.add(InsertProfileInfoData(
                                          profileInfoModel));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Data Added Successfully'),
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
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
