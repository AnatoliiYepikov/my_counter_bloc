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
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
      child: Builder(builder: (context) {
        //CounterBloc counterBloc = context.watch<CounterBloc>();
        CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
        return Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    //context.read<CounterBloc>().add(IncrementCounterEvent());
                    counterBloc.add(IncrementCounterEvent());
                  },
                  icon: const Icon(Icons.plus_one)),
              IconButton(
                  onPressed: () {
                    //context.read<CounterBloc>().add(DecrementCounterEvent());
                    counterBloc.add(DecrementCounterEvent());
                  },
                  icon: const Icon(Icons.exposure_minus_1)),
              IconButton(
                  onPressed: () {
                    context
                        .read<UserBloc>()
                        .add(GetUserEvent(context.read<CounterBloc>().state));
                  },
                  icon: const Icon(Icons.person)),
              IconButton(
                  onPressed: () {
                    context
                        .read<UserBloc>()
                        .add(GetJobEvent(context.read<CounterBloc>().state));
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
                      //UserBloc bloc = context.watch<UserBloc>();
                      final users = context.select(
                        (UserBloc bloc) => bloc.state.users,
                      );
                      return Column(
                        children: [
                          Text(
                            state.toString(),
                            style: const TextStyle(fontSize: 55),
                          ),
                          if (users.isNotEmpty)
                            ...users.map((e) => Text(e.name)),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    //bloc: userBloc,
                    builder: (context, state) {
                      //final users = state.users;

                      return Column(
                        children: [
                          if (state.isLoading)
                            const CircularProgressIndicator(),
                          //if (users.isNotEmpty)
                          // ...users.map((e) => Text(e.name)),
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
                          if (state.isLoading)
                            const CircularProgressIndicator(),
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
      }),
    );
  }
}
