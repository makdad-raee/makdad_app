import 'package:flutter/material.dart';
import 'package:makdad_app/core/utils/componants.dart';
import 'package:makdad_app/features/data/presentation/views/search/search_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          leading: const SizedBox(),
          leadingWidth: 0,
          actions: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: CircleAvatar(
                      backgroundColor: defaulColor,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Expanded(
                    child: SearchFormField(),
                  ),
                ],
              ),
            )
          ],
          bottom: const TabBar(
              labelColor: defaulColor,
              indicatorColor: defaulColor,
              tabs: [
                Text(
                  "Account",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                ),
                Text(
                  "Groups",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                ),
                Text(
                  "Pages",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                ),
                Text(
                  "#News",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                )
              ]),
        ),
        body: const TabBarView(children: [
          AccountSearchSort(),
          GroupsSearchSorting(),
          PagesSearchSorting(),
          NewsSesarchSort(),
        ]),
      ),
    );
  }
}

class AccountSearchSort extends StatelessWidget {
  const AccountSearchSort({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NewsSesarchSort extends StatelessWidget {
  const NewsSesarchSort({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GroupsSearchSorting extends StatelessWidget {
  const GroupsSearchSorting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PagesSearchSorting extends StatelessWidget {
  const PagesSearchSorting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
