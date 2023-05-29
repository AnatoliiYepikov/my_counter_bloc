import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_bloc/user_bloc/user_bloc.dart';

import 'counter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context)
                    .add(IncrementCounterEvent());
              },
              icon: const Icon(Icons.plus_one)),
          IconButton(
              onPressed: () {
                //counterBloc.add(DecrementCounterEvent());
              },
              icon: const Icon(Icons.exposure_minus_1)),
          IconButton(
              onPressed: () {
                //userBloc.add(GetUserEvent(counterBloc.state));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                //userBloc.add(GetJobEvent(counterBloc.state));
              },
              icon: const Icon(Icons.work)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BlocBuilder<CounterBloc, int>(
                //bloc: counterBloc,
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: const TextStyle(fontSize: 55),
                  );
                },
              ),
              BlocBuilder<UserBloc, UserState>(
                //bloc: userBloc,
                builder: (context, state) {
                  final users = state.users;

                  return Column(
                    children: [
                      if (state.isLoading) const CircularProgressIndicator(),
                      if (users.isNotEmpty) ...users.map((e) => Text(e.name)),
                    ],
                  );
                },
              ),
              BlocBuilder<UserBloc, UserState>(
                //bloc: userBloc,
                builder: (context, state) {
                  final jobs = state.jobs;
                  return Column(
                    children: [
                      if (state.isLoading) const CircularProgressIndicator(),
                      if (jobs.isNotEmpty) ...jobs.map((e) => Text(e.name)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
