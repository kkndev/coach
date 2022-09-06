import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/user_details_bloc.dart';
import '../bloc/user_details_event.dart';
import '../bloc/user_details_state.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DetailsPage')),
      body: Center(
        child:
            BlocBuilder<UserDetailsBloc, UserDetailsState>(builder: (_, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('User name: ${state.name}, age: ${state.age}'),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go back to home page'),
              ),
              const _Form(),
            ],
          );
        }),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              label: Text('name'),
            ),
            controller: _nameController,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text('age'),
            ),
            keyboardType: TextInputType.number,
            controller: _ageController,
          ),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isNotEmpty &&
                  _ageController.text.isNotEmpty) {
                context
                    .read<UserDetailsBloc>()
                    .add(UpdateName(_nameController.text));
                context
                    .read<UserDetailsBloc>()
                    .add(UpdateAge(int.parse(_ageController.text)));
              }
            },
            child: const Text('update user'),
          ),
        ],
      ),
    );
  }
}
