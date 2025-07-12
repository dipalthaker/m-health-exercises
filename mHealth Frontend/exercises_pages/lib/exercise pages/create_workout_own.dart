import 'package:exercises_pages/exercise%20pages/create_workout_own_popup.dart';
import 'package:flutter/material.dart';

class BuildRoutinePage extends StatelessWidget {
  const BuildRoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.08;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Exercise'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Activity'),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),

            const Text(
              'Build Your Own Workout Routine',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Choose exercises from your Exercise Library to build your personalized workout routine!',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                hintText: 'Name your routine',
                hintStyle: const TextStyle(
                    color: Color(0xFF6B578C), fontWeight: FontWeight.w500),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF6B578C)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF6B578C)),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () {
                showDialog(
                context: context,
                builder: (context) => const AddExercisePopup(),);
              },
              child: const Text(
                '+ Add Exercise',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B578C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  AppBar appBar(){
    return AppBar(backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(Icons.emoji_events, color: Color(0xFF6B578C), size: 48),
        ),
        title: const Text(
          'mHealth',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.settings, color: Color(0xFF6B578C), size: 48),
          ),
        ],
     );
     }
        
}
