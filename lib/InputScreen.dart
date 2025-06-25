import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'theme/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'RecommendationScreen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController daysController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  String selectedRegion = "Worldwide";
  String selectedType = "Any";

  final List<String> types = ["Any", "Beach", "Hills", "Lake", "City"];

  final List<String> imageAssets = [
    'assets/images/hills.jpg',
    'assets/images/lake.jpg',
    'assets/images/any.jpg',
    'assets/images/city.jpg',
    'assets/images/beach.jpg',
    'assets/images/image(6).jpg',
  ];

  Future<void> fetchRecommendations() async {
    final days = int.tryParse(daysController.text);
    final budget = double.tryParse(budgetController.text);

    if (days == null || budget == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid inputs")),
      );
      return;
    }

    final url = Uri.parse("https://4d4f-35-223-166-169.ngrok-free.app/recommend");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "days": days,
          "budget": budget,
          "preferences": {
            "region_source": selectedRegion,
            "type": selectedType.toLowerCase()
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecommendationsScreen(results: data['results']),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server Error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      debugPrint("❌ Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.lilac,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lilac, AppColors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.45,
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      height: screenHeight * 0.45,
                    ),
                    items: imageAssets.map((path) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            path,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.softBlue, AppColors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        '✈️ Plan Your Trip',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: AppColors.deepText,
                        ),
                      ),
                      const SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: ["Worldwide", "Pakistan"].map((region) {
                          final bool isSelected = selectedRegion == region;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ChoiceChip(
                              label: Text(region),
                              selected: isSelected,
                              onSelected: (_) =>
                                  setState(() => selectedRegion = region),
                              selectedColor: Colors.white.withOpacity(0.85),
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? AppColors.purple
                                    : Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              backgroundColor: Colors.white24,
                              side: BorderSide(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 16),

                      TextField(
                        controller: daysController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontFamily: 'Poppins'),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lilac.withOpacity(0.25),
                          labelText: 'Travel Days',
                          labelStyle: const TextStyle(fontFamily: 'Poppins'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: budgetController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontFamily: 'Poppins'),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lilac.withOpacity(0.25),
                          labelText: 'Your Budget (\$)',
                          labelStyle: const TextStyle(fontFamily: 'Poppins'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: const Color(0xFFF3E9FD),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedType,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFE9DAF9),
                            labelText: 'Preference (Type)',
                            labelStyle:
                            const TextStyle(fontFamily: 'Poppins'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: const TextStyle(fontFamily: 'Poppins'),
                          borderRadius: BorderRadius.circular(16),
                          items: types
                              .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedType = value!;
                            });
                          },
                        ),
                      ),

                      const SizedBox(height: 18),

                      ElevatedButton(
                        onPressed: fetchRecommendations,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.softBlue,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("Get Recommendations"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
