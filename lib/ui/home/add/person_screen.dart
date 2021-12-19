import 'package:crud/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPersonScreen extends StatefulWidget {
  final bool newPerson;
  const EditPersonScreen({
    Key? key,
    required this.newPerson,
  }) : super(key: key);
  static const String routeName = '/editperson';

  @override
  State<EditPersonScreen> createState() => _EditPersonScreenState();
}

class _EditPersonScreenState extends State<EditPersonScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameEditingControlle = TextEditingController();
  final _lasNameEditingControlle = TextEditingController();
  final _messageEditingControlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Data'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  PersonFirtName(
                      firstNameEditingControlle: _firstNameEditingControlle),
                  const SizedBox(height: 15),
                  PersonLastName(
                      lasNameEditingControlle: _lasNameEditingControlle),
                  const SizedBox(height: 15),
                  PersonMessage(
                      messageEditingControlle: _messageEditingControlle),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<PersonBloc>(context).add(
                              CreatePersonEvent(
                                  firstName: _firstNameEditingControlle.text,
                                  lastName: _lasNameEditingControlle.text,
                                  message: _messageEditingControlle.text));

                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: Text(widget.newPerson ? 'Add' : 'Edit'))
                ],
              )),
        ));
  }
}

class PersonMessage extends StatelessWidget {
  const PersonMessage({
    Key? key,
    required TextEditingController messageEditingControlle,
  })  : _messageEditingControlle = messageEditingControlle,
        super(key: key);

  final TextEditingController _messageEditingControlle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 10,
      controller: _messageEditingControlle,
      validator: (value) => value!.isEmpty ? "Masukan Kata Message" : null,
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: Colors.black38),
        border: OutlineInputBorder(),
        labelText: 'Message',
      ),
    );
  }
}

class PersonLastName extends StatelessWidget {
  const PersonLastName({
    Key? key,
    required TextEditingController lasNameEditingControlle,
  })  : _lasNameEditingControlle = lasNameEditingControlle,
        super(key: key);

  final TextEditingController _lasNameEditingControlle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _lasNameEditingControlle,
      validator: (value) => value!.isEmpty ? "Masukan Kata Last Name" : null,
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: Colors.black38),
        border: OutlineInputBorder(),
        labelText: 'Last Name',
      ),
    );
  }
}

class PersonFirtName extends StatelessWidget {
  const PersonFirtName({
    Key? key,
    required TextEditingController firstNameEditingControlle,
  })  : _firstNameEditingControlle = firstNameEditingControlle,
        super(key: key);

  final TextEditingController _firstNameEditingControlle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _firstNameEditingControlle,
      validator: (value) => value!.isEmpty ? "Masukan Kata" : null,
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: Colors.black38),
        border: OutlineInputBorder(),
        labelText: 'Name',
      ),
    );
  }
}
