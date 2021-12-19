import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crud/bloc/person_bloc.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({Key? key}) : super(key: key);

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  void initState() {
    context.read<PersonBloc>().add(GetPersonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        if (state is PersonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonLoadingSuccses) {
          return CardPerson(data: state);
        } else if (state is PersonEmpetyState) {
          return GestureDetector(
            onTap: () {
              context.read<PersonBloc>().add(GetPersonEvent());
              setState(() {});
            },
            child: Center(
              child: Image.asset(
                'assets/images/kosong.png',
              ),
            ),
          );
        } else if (state is PersonLoadingError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                Center(
                  child: IconButton(
                    onPressed: () {
                      context.read<PersonBloc>().add(GetPersonEvent());
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class CardPerson extends StatefulWidget {
  final PersonLoadingSuccses data;
  const CardPerson({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CardPerson> createState() => _CardPersonState();
}

class _CardPersonState extends State<CardPerson> {
  // refresh
  final Completer _refreshCompleter = Completer();

  @override
  void initState() {
    _refreshCompleter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.read<PersonBloc>().add(GetPersonEvent());
        setState(() {});
        return _refreshCompleter.future;
      },
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.data.person.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const FlutterLogo(),
              title: Text(
                  '${widget.data.person[index].firstname} ${widget.data.person[index].lastname}'),
              subtitle: Text(widget.data.person[index].message),
            ),
          );
        },
      ),
    );
  }
}
