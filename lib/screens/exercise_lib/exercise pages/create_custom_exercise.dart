// import 'package:flutter/material.dart';
// import 'package:mhealthapp/screens/Settings/settings_1.dart';
// import 'package:mhealthapp/screens/challenges.dart';
// import 'package:mhealthapp/screens/exercise_lib/exercise%20pages/custom_exercise_model.dart';
// import '/screens/home_page.dart';
// import 'create_custom_exercise_popup1.dart';

// class CreateCustomExercisePage extends StatefulWidget {
//   const CreateCustomExercisePage({super.key});

//   @override
//   State<CreateCustomExercisePage> createState() =>
//       _CreateCustomExercisePageState();
// }

// class _CreateCustomExercisePageState extends State<CreateCustomExercisePage> {
//   ExerciseModel? exercise; // null = not created yet

//   void _startCreateFlow() {
//     showDialog(
//       context: context,
//       builder: (_) => CreateCustomExercisePopup1(
//         exercise: ExerciseModel(),
//         onComplete: (ExerciseModel createdExercise) {
//           // callback when user finishes popup4
//           setState(() {
//             exercise = createdExercise;
//           });
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.emoji_events_outlined,
//                   color: Colors.black),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ChallengesPage()),
//                 );
//               },
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   SizedBox(width: 6),
//                   Text("mHealth", style: TextStyle(color: Colors.black)),
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.settings, color: Colors.deepPurple),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SettingsPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),

//       // 🔹 BODY
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
//         child: exercise == null
//             ? _buildBlankState(context) // before creation
//             : _buildExerciseDetails(context, exercise!), // after creation
//       ),

//       // 🔹 Bottom Nav
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.deepPurple,
//         unselectedItemColor: Colors.black,
//         currentIndex: 2,
//         onTap: (index) {
//           if (index == 0) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           } else if (index == 2) {
//             Navigator.pushNamedAndRemoveUntil(
//                 context, '/', (route) => false);
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.format_list_bulleted), label: 'Exercise'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart), label: 'Activity'),
//         ],
//       ),
//     );
//   }

//   // ---------- Blank state UI ----------
//   Widget _buildBlankState(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: MediaQuery.of(context).size.width * 0.07,
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//         const Text(
//           "Create a Custom Exercise",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Create a custom exercise that is not already defined in the platform. "
//           "Your created exercises can be accessed here, or the library when they’re created.",
//           style: TextStyle(fontSize: 15),
//         ),
//         const SizedBox(height: 20),
//         GestureDetector(
//           onTap: _startCreateFlow,
//           child: const Text(
//             "+ Create Custom Exercise",
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.deepPurple,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // ---------- Exercise details UI ----------
//   Widget _buildExerciseDetails(BuildContext context, ExerciseModel exercise) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//               size: MediaQuery.of(context).size.width * 0.07,
//             ),
//             onPressed: () => Navigator.pop(context),
//           ),
//           Text(
//             exercise.name.isNotEmpty ? exercise.name : "Custom Exercise",
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),

//           // Photo
//           Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: exercise.photo == null
//                   ? Colors.grey.shade300
//                   : Colors.deepPurple,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: exercise.photo == null
//                 ? const Center(child: Text("No photo added"))
//                 : const Center(
//                     child: Icon(Icons.image,
//                         color: Colors.white, size: 64),
//                   ),
//           ),
//           const SizedBox(height: 20),

//           if (exercise.warnings.isNotEmpty)
//             Text("⚠️ ${exercise.warnings.first}",
//                 style: const TextStyle(
//                     color: Colors.red, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 10),

//           const Text("Exercise Description",
//               style:
//                   TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 6),
//           Text(exercise.description.isNotEmpty
//               ? exercise.description
//               : "No description provided."),

//           const SizedBox(height: 20),
//           const Text("You will need:",
//               style:
//                   TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           if (exercise.equipment.isNotEmpty)
//             ...exercise.equipment
//                 .map((e) => Text("• $e"))
//                 .toList()
//           else
//             const Text("No equipment required"),

//           const SizedBox(height: 20),
//           const Text("Steps:",
//               style:
//                   TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           if (exercise.steps.isNotEmpty)
//             ...exercise.steps
//                 .asMap()
//                 .entries
//                 .map((e) => Text("${e.key + 1}. ${e.value}"))
//                 .toList()
//           else
//             const Text("No steps added"),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:mhealthapp/screens/Settings/settings_1.dart';
import 'package:mhealthapp/screens/challenges.dart';
import 'package:mhealthapp/screens/exercise_lib/exercise%20pages/custom_exercise_model.dart';
import 'package:mhealthapp/screens/home_page.dart';
import 'create_custom_exercise_popup1.dart';

class CreateCustomExercisePage extends StatefulWidget {
  const CreateCustomExercisePage({super.key});

  @override
  State<CreateCustomExercisePage> createState() =>
      _CreateCustomExercisePageState();
}

class _CreateCustomExercisePageState extends State<CreateCustomExercisePage> {
  ExerciseModel? exercise; // null until user finishes flow

  void _startFlow() {
    showDialog(
      context: context,
      builder: (_) => CreateCustomExercisePopup1(
        exercise: ExerciseModel(),
        onComplete: (created) {
          setState(() {
            exercise = created;
          });
        },
      ),
    );
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
              icon: Icon(Icons.emoji_events_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengesPage()));
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 6),
                  Text("mHealth", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.deepPurple),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              exercise == null
                  ? _buildBlankState()
                  : _buildExerciseDetails(exercise!),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: 'Exercise'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Activity'),
        ],
      ),
    );
  }

  Widget _buildBlankState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Create a Custom Exercise",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Create a custom exercise that is not already defined. "
          "Your created exercises can be accessed here or in the library.",
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: _startFlow,
          child: const Text(
            "+ Create Custom Exercise",
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseDetails(ExerciseModel e) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(e.name, style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          // Photo
          Container(
            height: 200,
            width: double.infinity,
            color: e.photo == null ? Colors.grey.shade300 : Colors.deepPurple,
            child: e.photo == null
                ? const Center(child: Text("No photo"))
                : const Icon(Icons.image, color: Colors.white, size: 60),
          ),
          const SizedBox(height: 16),

          if (e.warnings.isNotEmpty)
            Text("⚠️ ${e.warnings.first}",
                style: const TextStyle(color: Colors.red)),

          const SizedBox(height: 12),
          const Text("Description",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(e.description),

          const SizedBox(height: 12),
          const Text("Body Parts",
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...e.bodyParts.map((b) => Text("• $b")),

          const SizedBox(height: 12),
          const Text("Equipment",
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...e.equipment.map((eq) => Text("• $eq")),

          const SizedBox(height: 12),
          const Text("Steps",
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...e.steps.asMap().entries.map(
                (s) => Text("${s.key + 1}. ${s.value}"),
              ),
        ],
      ),
    );
  }
}
