import 'package:flutter/material.dart';
import '../Settings/settings_1.dart';
import '../challenges.dart';
import '/screens/home_page.dart';
import 'exercise pages/create_custom_exercise.dart';

class ExerciseLibraryPage extends StatefulWidget {
  const ExerciseLibraryPage({super.key});

  @override
  State<ExerciseLibraryPage> createState() => _ExerciseLibraryPageState();
}

class _ExerciseLibraryPageState extends State<ExerciseLibraryPage> {
  final TextEditingController _searchController = TextEditingController();

  // Predefined mapping of exercise names to routes
  final Map<String, String> _exerciseRoutes = {
    "arms": "/arms",
    "legs": "/legs",
    "shoulders": "/shoulders",
    "back": "/back",
    "abdomen": "/abdomen",
    "chest": "/chest",
    "stretches": "/stretches",
    "yoga": "/yoga",
  };

  void _searchExercise(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();

    if (_exerciseRoutes.containsKey(query)) {
      Navigator.pushNamed(context, _exerciseRoutes[query]!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Exercise not found"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_events_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  ChallengesPage()));
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 6),
                  Text("mHealth", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.deepPurple),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),

              // 🔍 Search bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search exercises...",
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.deepPurple),
                    onPressed: () => _searchExercise(context),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (_) => _searchExercise(context),
              ),

              const SizedBox(height: 20),

              sectionTitle("Workout Routines"),
              const SizedBox(height: 8),
              _buildRoutineGroup(),
              const SizedBox(height: 8),

              // New button to navigate to Create Custom Exercise Page
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateCustomExercisePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Create Custom Exercise"),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("View all >",
                      style: TextStyle(color: Colors.deepPurple)),
                ),
              ),
              const SizedBox(height: 20),
              sectionTitle("Your Exercises"),
              const SizedBox(height: 8),
              _buildExerciseTile("Calf Raises", "Legs"),
              _buildExerciseTile("Chin-ups", "Back"),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("View all >",
                      style: TextStyle(color: Colors.deepPurple)),
                ),
              ),
              const SizedBox(height: 20),
              sectionTitle("Pre-Defined Exercises"),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2,
                children: [
                  _buildExerciseButton("Arms", () {
                    Navigator.pushNamed(context, '/arms');
                  }),
                  _buildExerciseButton("Legs", () {
                    Navigator.pushNamed(context, '/legs');
                  }),
                  _buildExerciseButton("Shoulders", () {
                    Navigator.pushNamed(context, '/shoulders');
                  }),
                  _buildExerciseButton("Back", () {
                    Navigator.pushNamed(context, '/back');
                  }),
                  _buildExerciseButton("Abdomen", () {
                    Navigator.pushNamed(context, '/abdomen');
                  }),
                  _buildExerciseButton("Chest", () {
                    Navigator.pushNamed(context, '/chest');
                  }),
                  _buildExerciseButton("Stretches", () {
                    Navigator.pushNamed(context, '/stretches');
                  }),
                  _buildExerciseButton("Yoga", () {
                    Navigator.pushNamed(context, '/yoga');
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 2,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          } else if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  HomePage()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), label: 'Exercise'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Activity'),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) => Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      );

  Widget _buildRoutineGroup() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildInnerRoutineTile("Custom Workout Routine 1"),
          const Divider(height: 1, color: Colors.white),
          _buildInnerRoutineTile("Monday Pilates"),
          const Divider(height: 1, color: Colors.white),
          _buildInnerRoutineTile("Quick Full Body"),
        ],
      ),
    );
  }

  Widget _buildInnerRoutineTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildExerciseTile(String name, String category) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Colors.black, fontSize: 16)),
          Text(category, style: const TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildExerciseButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}
