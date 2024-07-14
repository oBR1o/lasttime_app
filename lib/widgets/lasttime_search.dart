import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
            borderSide: const BorderSide(color: Color.fromARGB(255, 16, 44, 87), width: 1),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 16, 44, 87),
          ),
          hintText: 'Search',
          hintStyle: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 16, 44, 87),
          ),
        ),
      ),
    );
  }
}
