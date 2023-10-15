import 'package:flutter/material.dart';
import 'package:snapchat/filter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const filters = [
      'assets/01.png',
      'assets/02.png',
      'assets/03.png',
      'assets/04.png',
      'assets/05.png',
      'assets/06.png',
      'assets/07.png',
      'assets/08.png',
      'assets/09.png',
      'assets/10.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Snapchat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          children: List.generate(
            filters.length,
            (index) => _Item(
              filter: filters[index],
              title: index.toString(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
    required this.filter,
    required this.title,
  });

  final String filter;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FilterPage(
                filter: filter,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                filter,
                height: MediaQuery.sizeOf(context).height * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
