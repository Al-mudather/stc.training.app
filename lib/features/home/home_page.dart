import 'package:flutter/material.dart';
import 'package:stc_training/features/home/components/marketing_section.dart';
import 'package:stc_training/features/home/components/search_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: const Column(
        children: [
          SearchSection(),
          SizedBox(
            height: 15,
          ),
          MarketingSection(),
        ],
      ),
    );
  }
}
