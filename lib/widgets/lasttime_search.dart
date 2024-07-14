import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';

class LastTimeSearch extends StatefulWidget {
  const LastTimeSearch({super.key});

  @override
  State<LastTimeSearch> createState() => _LastTimeSearchState();
}

class _LastTimeSearchState extends State<LastTimeSearch> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: _searchController,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        onChanged: (key) {
          context.read<LastTimeBloc>().add(SearchEvent(key));
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
          ),
        ),
      ),
    );
  }
}
