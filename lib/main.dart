import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TextCubit/text_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
              home: BlocProvider(
          create: (context) => TextCubit(),
          child: MyHomePage(),
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String word = '';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding: EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: <Widget> [
                      BlocBuilder<TextCubit, String>(
                        bloc: context.read<TextCubit>(),
                         builder: (context, state) {
                            return Column(children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Type something: ',
                                  fillColor: Colors.grey[100],
                                  filled: true,
                                ),
                                      onChanged: (String? value) {
                                      state = value!;
                                     },
                                ),
                                SizedBox(
                                  height:20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    print(state);
                                    context.read<TextCubit>().capatalise(state);
                                  },
                                  child: const Text('Capitalize'),
                                ),

                            ],);
                      
                          }),
                          BlocBuilder(
                            bloc: context.read<TextCubit>(),
                            builder: (context, state) {
                               return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                  child: Text(
                                    'Capitalize: $state',
                                    style: TextStyle(fontWeight: FontWeight.w900,color: Colors.orange),
                                ),
                            );
                          }),
                        
                    ],
                  ),
                ),
            ),
          ),
      );
  }
}
