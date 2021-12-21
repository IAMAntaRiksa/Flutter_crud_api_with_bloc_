import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crud/bloc/person_bloc.dart';
import 'package:crud/data/model/person.dart';
import 'package:crud/ui/home/add/person_screen.dart';
import 'package:crud/ui/home/home_body_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Person? dataperson;
    return BlocProvider(
      create: (context) => PersonBloc(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Crud Api With Bloc',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return EditPersonScreen(newPerson: true);
                }));
              },
              label: const Icon(Icons.add),
              backgroundColor: Colors.red),
          body: const HomeBodyScreen(),
        ),
      ),
    );
  }
}
