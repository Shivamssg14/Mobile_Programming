import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

const accent = Colors.deepPurpleAccent;
const cardBg = Color(0xFF1A1A24);
const cardBorder = Color(0xFF2B2B3A);
const chipBg = Color(0xFF2A2A3A);

const pageTitle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const sectionTitle = TextStyle(fontSize: 21, fontWeight: FontWeight.bold);
const nameStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = SkillSwapStore();
  await store.loadData();
  runApp(SkillSwapApp(store: store));
}

class SkillSwapApp extends StatelessWidget {
  const SkillSwapApp({super.key, required this.store});

  final SkillSwapStore store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillSwap',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          primary: accent,
        ),
        scaffoldBackgroundColor: const Color(0xFF0D0D12),
        dialogTheme: const DialogThemeData(backgroundColor: Color(0xFF1E1E2A)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D0D12),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: HomeScreen(store: store),
    );
  }
}


// Data

const _defaultName = 'Shivam Gupta';
const _defaultCourse = 'BSc IT Student';
const _defaultContact = 'shivam.gupta@ves.ac.com';
const _defaultTeach = ['Canva', 'Graphic Design', 'Excel'];
const _defaultLearn = ['Flutter', 'Python', 'Data Analytics'];

const _popularSkills = [
  'Python',
  'Flutter',
  'Java',
  'UI/UX',
  'Cybersecurity',
  'React',
  'Machine Learning',
  'Figma',
];

Map<String, dynamic> _student(
    String name,
    String course,
    String email,
    List<String> teach,
    List<String> learn,
    ) {
  return {
    'name': name,
    'course': course,
    'contact': email,
    'teach': teach,
    'learn': learn,
  };
}

final _students = [
  _student(
    'Sujal Verma',
    'BSc IT',
    'sujal.verma12@gmail.com',
    ['Java', 'C++', 'SQL'],
    ['Flutter', 'React'],
  ),
  _student(
    'Abhishek Singh',
    'BCA',
    'abhishek.singh25@gmail.com',
    ['Node.js', 'Express', 'MongoDB'],
    ['Python', 'DSA'],
  ),
  _student(
    'Faraz Khan',
    'BSc CS',
    'faraz.khan63@gmail.com',
    ['Cybersecurity', 'Networking', 'Linux'],
    ['UI/UX', 'Figma'],
  ),
  _student(
    'Vedant Patil',
    'BTech CSE',
    'vedant.patil895@gmail.com',
    ['Machine Learning', 'Python', 'Pandas'],
    ['Flutter', 'Dart'],
  ),
  _student(
    'Ameen Shaikh',
    'BSc IT',
    'ameen.shaikh@gmail.com',
    ['PHP', 'Laravel', 'MySQL'],
    ['React', 'Next.js'],
  ),
  _student(
    'Sneha Kulkarni',
    'BCA',
    'sneha.kulkarni01@gmail.com',
    ['UI/UX', 'Figma', 'Wireframing'],
    ['Flutter', 'Canva'],
  ),
  _student(
    'Riya Sharma',
    'BSc CS',
    'riya.sharma@gmail.com',
    ['HTML/CSS', 'JavaScript', 'Tailwind'],
    ['Python', 'Django'],
  ),
  _student(
    'Ananya Mishra',
    'BSc IT',
    'ananya.mishra@gmail.com',
    ['Cloud Computing', 'AWS', 'Docker'],
    ['DSA', 'Java'],
  ),
  _student(
    'Muskan Qureshi',
    'BCA',
    'muskan.qureshi@gmail.com',
    ['Graphic Design', 'Photoshop', 'Illustrator'],
    ['UI/UX', 'Web Dev'],
  ),
  _student(
    'Pooja Yadav',
    'BTech IT',
    'pooja.yadav@gmail.com',
    ['C#', '.NET', 'SQL Server'],
    ['Flutter', 'AI/ML'],
  ),
  _student(
    'Tanvi Mehta',
    'BSc CS',
    'tanvi.mehta@gmail.com',
    ['Data Analytics', 'PowerBI', 'Tableau'],
    ['Python', 'Excel'],
  ),
  _student(
    'Kavya Nair',
    'BSc IT',
    'kavya.nair@gmail.com',
    ['React Native', 'JavaScript'],
    ['Flutter', 'Firebase'],
  ),
  _student(
    'Durgesh Tripathi',
    'BSc IT',
    'durgesh.tripathi@gmail.com',
    ['Python', 'DSA', 'MPMC'],
    ['Canva', 'Flutter'],
  ),
  _student(
    'Jeel Tiwari',
    'BSc CS',
    'jeel.tiwari@gmail.com',
    ['Canva', 'Graphic Design'],
    ['Python', 'Excel'],
  ),
  _student(
    'Anuj Jain',
    'BCA',
    'anuj.jain@gmail.com',
    ['Flutter', 'Dart'],
    ['UI/UX', 'Python'],
  ),
  _student(
    'Archana Gupta',
    'BSc IT',
    'archana.gupta@gmail.com',
    ['UI/UX', 'Figma'],
    ['Flutter', 'Canva'],
  ),
];

List<Map<String, dynamic>> _sampleRequests() {
  return [
    {
      'id': 'sample_1',
      'name': 'Rahul Sharma',
      'skill': 'Python',
      'description': 'Can teach you Python in exchange for Flutter',
      'status': 'pending',
      'type': 'received',
      'contact': 'rahul.sharma@example.com',
    },
    {
      'id': 'sample_2',
      'name': 'Priya Patel',
      'skill': 'Canva',
      'description': 'Wants to learn Canva from you',
      'status': 'pending',
      'type': 'received',
      'contact': 'priya.patel@example.com',
    },
    {
      'id': 'sample_3',
      'name': 'Durgesh Tripathi',
      'skill': 'DSA',
      'description': 'Accepted your SkillSwap request for DSA',
      'status': 'accepted',
      'type': 'sent',
      'contact': 'durgesh.t@example.com',
    },
  ];
}

class SkillSwapStore extends ChangeNotifier {
  late SharedPreferences _prefs;

  String userName = _defaultName;
  String userCourse = _defaultCourse;
  String userContact = _defaultContact;
  List<String> myTeachSkills = List.of(_defaultTeach);
  List<String> myLearnSkills = List.of(_defaultLearn);
  List<Map<String, dynamic>> requests = _sampleRequests();

  // Demo students, these never change.
  final students = _students;

  Future<void> loadData() async {
    _prefs = await SharedPreferences.getInstance();

    userName = _prefs.getString('userName') ?? userName;
    userCourse = _prefs.getString('userCourse') ?? userCourse;
    userContact = _prefs.getString('userContact') ?? userContact;
    myTeachSkills = _prefs.getStringList('myTeachSkills') ?? myTeachSkills;
    myLearnSkills = _prefs.getStringList('myLearnSkills') ?? myLearnSkills;

    final savedRequests = _prefs.getString('requests');
    if (savedRequests != null) {
      final decoded = jsonDecode(savedRequests);
      if (decoded is List) {
        requests = decoded.map((e) => Map<String, dynamic>.from(e)).toList();
      }
    }
  }

  Future<void> _saveProfile() async {
    await _prefs.setString('userName', userName);
    await _prefs.setString('userCourse', userCourse);
    await _prefs.setString('userContact', userContact);
    await _prefs.setStringList('myTeachSkills', myTeachSkills);
    await _prefs.setStringList('myLearnSkills', myLearnSkills);
  }

  Future<void> _saveRequests() async {
    await _prefs.setString('requests', jsonEncode(requests));
  }

  Map<String, dynamic>? requestFor(String name) {
    return requests.where((r) => r['name'] == name).firstOrNull;
  }

  Future<void> updateProfile({
    required String name,
    required String course,
    required String contact,
    required List<String> teach,
    required List<String> learn,
  }) async {
    userName = name;
    userCourse = course;
    if (contact.isNotEmpty) userContact = contact;
    myTeachSkills = teach;
    myLearnSkills = learn;

    await _saveProfile();
    notifyListeners();
  }

  Future<void> sendRequest(Map<String, dynamic> student) async {
    final name = student['name'];
    final alreadySent = requests.any((r) =>
    r['name'] == name &&
        (r['status'] == 'pending' || r['status'] == 'accepted'));
    if (alreadySent) return;

    requests.insert(0, {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': name,
      'skill': (student['teach'] as List).first,
      'description': 'You sent a skill swap request',
      'status': 'pending',
      'type': 'sent',
      'contact': student['contact'],
    });

    await _saveRequests();
    notifyListeners();
  }

  Future<void> updateRequest(String id, String status) async {
    final index = requests.indexWhere((r) => r['id'] == id);
    if (index == -1) return;

    requests[index]['status'] = status;
    await _saveRequests();
    notifyListeners();
  }

  Future<void> resetDemoData() async {
    await _prefs.clear();

    userName = _defaultName;
    userCourse = _defaultCourse;
    userContact = _defaultContact;
    myTeachSkills = List.of(_defaultTeach);
    myLearnSkills = List.of(_defaultLearn);
    requests = _sampleRequests();

    notifyListeners();
  }
}


// Shared widgets

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.name,
    this.radius = 20,
    this.solid = false,
  });

  final String name;
  final double radius;
  final bool solid;

  @override
  Widget build(BuildContext context) {
    final trimmed = name.trim();

    return CircleAvatar(
      radius: radius,
      backgroundColor: solid ? accent : accent.withValues(alpha: 0.2),
      child: Text(
        trimmed.isEmpty ? 'S' : trimmed[0].toUpperCase(),
        style: TextStyle(
          fontSize: radius * 0.75,
          fontWeight: FontWeight.bold,
          color: solid ? Colors.white : accent,
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.only(bottom: 12),
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: child,
    );
  }
}

class SkillChip extends StatelessWidget {
  const SkillChip(this.label, {super.key, this.small = false});

  final String label;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: small ? Colors.white70 : Colors.white,
          fontSize: small ? 11 : null,
        ),
      ),
      backgroundColor: chipBg,
      side: BorderSide.none,
      visualDensity: small ? VisualDensity.compact : null,
    );
  }
}

class SkillBox extends StatelessWidget {
  const SkillBox({
    super.key,
    required this.title,
    required this.skills,
    required this.color,
  });

  final String title;
  final List<String> skills;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 12),
          if (skills.isEmpty)
            const Text('No skills added yet.',
                style: TextStyle(color: Colors.grey))
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final skill in skills) SkillChip(skill)],
            ),
        ],
      ),
    );
  }
}

InputDecoration searchDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: const Icon(Icons.search, color: Colors.grey),
    filled: true,
    fillColor: cardBg,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
  );
}

void openEditProfile(BuildContext context, SkillSwapStore store) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => EditProfileScreen(store: store)),
  );
}


// Home


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.store});

  final SkillSwapStore store;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  NavigationDestination _navItem(
      IconData icon, IconData activeIcon, String label) {
    return NavigationDestination(
      icon: Icon(icon, color: Colors.grey),
      selectedIcon: Icon(activeIcon, color: accent),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeContent(
        store: widget.store,
        onBrowse: () => setState(() => selectedIndex = 1),
        onRequests: () => setState(() => selectedIndex = 2),
      ),
      BrowseScreen(store: widget.store),
      RequestsScreen(store: widget.store),
      ProfileScreen(store: widget.store),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: const Color(0xFF14141E),
        indicatorColor: accent.withValues(alpha: 0.3),
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        destinations: [
          _navItem(Icons.home_outlined, Icons.home, 'Home'),
          _navItem(Icons.search, Icons.search, 'Browse'),
          _navItem(Icons.swap_horiz, Icons.swap_horiz, 'Requests'),
          _navItem(Icons.person_outline, Icons.person, 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.store,
    required this.onBrowse,
    required this.onRequests,
  });

  final SkillSwapStore store;
  final VoidCallback onBrowse;
  final VoidCallback onRequests;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final acceptedCount =
            store.requests.where((r) => r['status'] == 'accepted').length;

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome back',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          store.userName,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Avatar(name: store.userName, radius: 26, solid: true),
                  ],
                ),
                const SizedBox(height: 20),
                if (acceptedCount > 0)
                  _AcceptedBanner(count: acceptedCount, onTap: onRequests),
                TextField(
                  readOnly: true,
                  onTap: onBrowse,
                  decoration: searchDecoration('Search for a skill or student...'),
                ),
                const SizedBox(height: 25),
                _heroCard(context),
                const SizedBox(height: 30),
                const Text('Popular Skills', style: sectionTitle),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final skill in _popularSkills) SkillChip(skill),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Students (${store.students.length})',
                        style: sectionTitle),
                    TextButton(onPressed: onBrowse, child: const Text('See All')),
                  ],
                ),
                const SizedBox(height: 10),
                for (final student in store.students.take(5))
                  StudentCard(store: store, student: student),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _heroCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Find your perfect skill match',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Teach what you know. Learn what you want.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple.shade900,
            ),
            onPressed: () => openEditProfile(context, store),
            child: const Text('Edit My Profile & Skills'),
          ),
        ],
      ),
    );
  }
}

class _AcceptedBanner extends StatelessWidget {
  const _AcceptedBanner({required this.count, required this.onTap});

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.green.shade900.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.greenAccent.shade400),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.greenAccent,
              child: Icon(Icons.handshake, color: Colors.black, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$count active skill swap${count > 1 ? 's' : ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                  const Text(
                    'Tap to view contact info.',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.greenAccent),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Browse
// ---------------------------------------------------------------------------

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.store, required this.student});

  final SkillSwapStore store;
  final Map<String, dynamic> student;

  @override
  Widget build(BuildContext context) {
    final name = student['name'] as String;
    final teach = List<String>.from(student['teach']);

    return AppCard(
      child: Row(
        children: [
          Avatar(name: name, radius: 27),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: nameStyle),
                const SizedBox(height: 4),
                Text(student['course'],
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 5,
                  children: [
                    for (final skill in teach.take(3))
                      SkillChip(skill, small: true),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                size: 18, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ProfileDetailScreen(store: store, student: student),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key, required this.store});

  final SkillSwapStore store;

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final query = search.toLowerCase();

    final results = widget.store.students.where((student) {
      final searchable = [
        student['name'],
        ...(student['teach'] as List),
        ...(student['learn'] as List),
      ].join(' ').toLowerCase();
      return searchable.contains(query);
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Browse Skills', style: pageTitle),
            const SizedBox(height: 5),
            Text(
              'Showing ${results.length} students available for skill swap.',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => setState(() => search = value),
              decoration:
              searchDecoration('Search by name or skill (e.g. Sujal, Java)...'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: results.isEmpty
                  ? const Center(
                child: Text(
                  'No skill matches found.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) => StudentCard(
                  store: widget.store,
                  student: results[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({
    super.key,
    required this.store,
    required this.student,
  });

  final SkillSwapStore store;
  final Map<String, dynamic> student;

  @override
  Widget build(BuildContext context) {
    final name = student['name'] as String;

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          final status = store.requestFor(name)?['status'];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Avatar(name: name, radius: 50),
                const SizedBox(height: 15),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  student['course'],
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 30),
                SkillBox(
                  title: 'Skills I Can Teach',
                  skills: List<String>.from(student['teach']),
                  color: accent,
                ),
                SkillBox(
                  title: 'Skills I Want To Learn',
                  skills: List<String>.from(student['learn']),
                  color: Colors.greenAccent,
                ),
                const SizedBox(height: 10),
                _actionArea(context, status),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _actionArea(BuildContext context, String? status) {
    if (status == 'accepted') {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.shade900.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.greenAccent),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.greenAccent),
                SizedBox(width: 8),
                Text(
                  'SkillSwap Request Accepted',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Contact Email: ${student['contact']}'),
          ],
        ),
      );
    }

    if (status == 'pending') {
      return SizedBox(
        width: double.infinity,
        height: 52,
        child: OutlinedButton.icon(
          icon: Icon(Icons.hourglass_top, color: Colors.orange),
          label: Text(
            'Request Sent (Pending)...',
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: null,
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: Colors.white,
        ),
        icon: const Icon(Icons.swap_horiz),
        label: const Text('Send Skill Swap Request',
            style: TextStyle(fontSize: 16)),
        onPressed: () async {
          await store.sendRequest(student);
          if (!context.mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Swap request sent to ${student['name']}!')),
          );
        },
      ),
    );
  }
}


// Requests


class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key, required this.store});

  final SkillSwapStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final pending =
        store.requests.where((r) => r['status'] == 'pending').toList();
        final accepted =
        store.requests.where((r) => r['status'] == 'accepted').toList();

        return DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Text('Skill Requests', style: pageTitle),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Manage pending requests and connected skill swaps.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 15),
                TabBar(
                  labelColor: accent,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: accent,
                  tabs: [
                    _tab('Pending', pending.length),
                    _tab(
                      'Accepted Swaps',
                      accepted.length,
                      badgeColor: Colors.greenAccent,
                      badgeTextColor: Colors.black,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      pending.isEmpty
                          ? const Center(
                        child: Text(
                          'No pending requests.',
                          style:
                          TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                          : ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          for (final r in pending)
                            _pendingCard(context, r),
                        ],
                      ),
                      accepted.isEmpty
                          ? const _EmptyAccepted()
                          : ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          for (final r in accepted)
                            _acceptedCard(context, r),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Tab _tab(String label, int count,
      {Color? badgeColor, Color? badgeTextColor}) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          if (count > 0) ...[
            const SizedBox(width: 6),
            Badge(
              backgroundColor: badgeColor,
              textColor: badgeTextColor,
              label: Text('$count'),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _respond(
      BuildContext context,
      Map<String, dynamic> request,
      String status,
      ) async {
    await store.updateRequest(request['id'], status);
    if (!context.mounted) return;

    final message = status == 'accepted'
        ? 'Accepted swap with ${request['name']}!'
        : 'Request declined.';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _pendingCard(BuildContext context, Map<String, dynamic> request) {
    final isSent = request['type'] == 'sent';

    return AppCard(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar(name: request['name']),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(request['name'], style: nameStyle),
                    Text(
                      request['description'],
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Skill: ${request['skill']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: accent,
              ),
            ),
          ),
          const SizedBox(height: 15),
          if (isSent)
            const Row(
              children: [
                Icon(Icons.schedule, size: 16, color: Colors.orangeAccent),
                SizedBox(width: 6),
                Text(
                  'Waiting for student to accept...',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent),
                    ),
                    onPressed: () => _respond(context, request, 'rejected'),
                    child: const Text('Decline'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _respond(context, request, 'accepted'),
                    child: const Text('Accept'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _acceptedCard(BuildContext context, Map<String, dynamic> request) {
    return AppCard(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar(name: request['name']),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(request['name'], style: nameStyle),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Connected',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Swapping: ${request['skill']}',
                      style: const TextStyle(
                        color: accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.chat_bubble_outline, size: 18),
              label: const Text('Contact & Connect'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent.shade400,
                foregroundColor: Colors.black,
              ),
              onPressed: () => _showContactDialog(context, request),
            ),
          ),
        ],
      ),
    );
  }

  void _showContactDialog(BuildContext context, Map<String, dynamic> request) {
    final contact = request['contact'] as String;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Row(
            children: [
              Avatar(name: request['name']),
              const SizedBox(width: 10),
              Expanded(
                child: Text(request['name'],
                    style: const TextStyle(fontSize: 18)),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "You're matched! Here are your partner's contact details to arrange your SkillSwap session:",
                style: TextStyle(fontSize: 13, color: Colors.white70),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF12121A),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: cardBorder),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined, color: accent),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        contact,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, size: 20, color: Colors.grey),
                      tooltip: 'Copy email',
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: contact));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Email copied')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class _EmptyAccepted extends StatelessWidget {
  const _EmptyAccepted();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.handshake_outlined, size: 50, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'No accepted swaps yet.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Text(
            'Accept a request or send one to connect!',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}


// My profile


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.store});

  final SkillSwapStore store;

  Future<void> _confirmReset(BuildContext context) async {
    final shouldReset = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Undo Chnages ?'),
          content: const Text(
            'This will restore the original demo profile and requests.',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );

    if (shouldReset == true) await store.resetDemoData();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Avatar(name: store.userName, radius: 55, solid: true),
                const SizedBox(height: 15),
                Text(
                  store.userName,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  store.userCourse,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                if (store.userContact.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    store.userContact,
                    style: const TextStyle(color: accent, fontSize: 13),
                  ),
                ],
                const SizedBox(height: 30),
                SkillBox(
                  title: 'Skills I Can Teach',
                  skills: store.myTeachSkills,
                  color: accent,
                ),
                SkillBox(
                  title: 'Skills I Want To Learn',
                  skills: store.myLearnSkills,
                  color: Colors.greenAccent,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => openEditProfile(context, store),
                    icon: const Icon(Icons.edit),

                    label: const Text('Update Profile & Skills'),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () => _confirmReset(context),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Undo Changes'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.store});

  final SkillSwapStore store;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final nameController = TextEditingController(text: widget.store.userName);
  late final courseController =
  TextEditingController(text: widget.store.userCourse);
  late final contactController =
  TextEditingController(text: widget.store.userContact);
  late final teachController =
  TextEditingController(text: widget.store.myTeachSkills.join(', '));
  late final learnController =
  TextEditingController(text: widget.store.myLearnSkills.join(', '));

  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    contactController.dispose();
    teachController.dispose();
    learnController.dispose();
    super.dispose();
  }

  List<String> parseSkills(String value) {
    return value
        .split(',')
        .map((skill) => skill.trim())
        .where((skill) => skill.isNotEmpty)
        .toSet()
        .toList();
  }

  Future<void> saveProfile() async {
    final name = nameController.text.trim();
    final course = courseController.text.trim();
    final teach = parseSkills(teachController.text);
    final learn = parseSkills(learnController.text);

    if (name.isEmpty || course.isEmpty || teach.isEmpty || learn.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields.')),
      );
      return;
    }

    await widget.store.updateProfile(
      name: name,
      course: course,
      contact: contactController.text.trim(),
      teach: teach,
      learn: learn,
    );
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated')),
    );
    Navigator.pop(context);
  }

  Widget _field(
      TextEditingController controller,
      String label,
      IconData icon, {
        String? hint,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey),
          filled: true,
          fillColor: cardBg,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update My Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _field(nameController, 'Your Name *', Icons.person),
            _field(courseController, 'Course *', Icons.school),
            _field(contactController, 'Contact Email / Phone',
                Icons.contact_mail),
            _field(teachController, 'Skills I Can Teach *',
                Icons.cast_for_education,
                hint: 'Python, Canva, Excel'),
            _field(learnController, 'Skills I Want To Learn *',
                Icons.lightbulb,
                hint: 'Flutter, Python, UI/UX'),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Separate multiple skills using commas.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                ),
                onPressed: saveProfile,
                child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
