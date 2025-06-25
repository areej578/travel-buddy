import 'package:flutter/material.dart';
import 'theme/colors.dart';

class RecommendationsScreen extends StatelessWidget {
  final List results;

  const RecommendationsScreen({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    final bool isFallback = results.length > 0 && results[0]['score'] == null;

    return Scaffold(
      backgroundColor: AppColors.lilac,
      appBar: AppBar(
        title: const Text(
          'Recommended Trips',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: AppColors.purple,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lilac, AppColors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: results.isEmpty
            ? const Center(
          child: Text(
            "No results found 😞",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: results.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  isFallback
                      ? "No perfect match. Showing best alternatives:"
                      : "Perfect matches found for your trip!",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              );
            }

            final pkg = results[index - 1];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [AppColors.softBlue, AppColors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                title: Text(
                  pkg['destination'] ?? "Unknown",
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      "Duration: ${pkg['duration']} days",
                      style: const TextStyle(
                          fontFamily: 'Poppins', color: Colors.black),
                    ),
                    Text(
                      "Cost: \$${pkg['total_cost']}",
                      style: const TextStyle(
                          fontFamily: 'Poppins', color: Colors.black),
                    ),
                    if (pkg['type'] != null)
                      Text(
                        "Type: ${pkg['type']}",
                        style: const TextStyle(
                            fontFamily: 'Poppins', color: Colors.black),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
