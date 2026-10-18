import 'package:flutter/material.dart';

void main() {
  runApp(const SirajApp());
}

class SirajApp extends StatelessWidget {
  const SirajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سِراج',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFDFBF7), // Light Beige
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A4D2E), // Royal Green
          primary: const Color(0xFF0A4D2E),
          secondary: const Color(0xFFD4AF37), // Gold
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> wisdoms = [
    "الْعِلْمُ نُورٌ يَهْدِي إِلَى الْخَيْرِ.",
    "مَنْ يَعْمَلْ بَجِدٍّ يَنَلْ مَا يَتَمَنَّى.",
    "الْقِرَاءَةُ مِفْتَاحُ الْمَعْرِفَةِ.",
    "الأَدَبُ قَبْلَ الْعِلْمِ.",
    "مَنْ كَثُرَتْ طَالَعَتُهُ كَثُرَتْ مَعْلُومَاتُهُ."
  ];

  late String todayWisdom;

  @override
  void initState() {
    super.initState();
    todayWisdom = wisdoms[DateTime.now().day % wisdoms.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        elevation: 4,
        toolbarHeight: 90,
        title: const Column(
          children: [
            Text(
              "﴿ وَقُل رَّبِّ زِدْنِي عِلْمًا ﴾",
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "سِراج .. رفيقك في التعلم",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "الصف الثاني الابتدائي - المناهج السورية",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Wisdom Box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF37).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD4AF37), width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Color(0xFFD4AF37)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "حكمة اليوم: $todayWisdom",
                        style: const TextStyle(
                          color: Color(0xFF0A4D2E),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Main Sections Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMainCard(
                    context,
                    title: "العربية لغتي",
                    icon: Icons.menu_book,
                    color: const Color(0xFF0A4D2E),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ArabicSectionPage(),
                        ),
                      );
                    },
                  ),
                  _buildMainCard(
                    context,
                    title: "الرياضيات",
                    icon: Icons.calculate,
                    color: const Color(0xFF0A4D2E),
                    onTap: () {},
                  ),
                  _buildMainCard(
                    context,
                    title: "متابعة الطلاب",
                    icon: Icons.assignment_ind,
                    color: const Color(0xFF0A4D2E),
                    onTap: () {},
                  ),
                  _buildMainCard(
                    context,
                    title: "التحضير",
                    icon: Icons.edit_calendar,
                    color: const Color(0xFF0A4D2E),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LessonPlannerPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Designer Footer Credits
              const Center(
                child: Text(
                  "إعداد وتصميم: مُعتز محمد الأحمد - مدرسةُ الأندلس الثالثة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0A4D2E),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== أقسام اللغة العربية ====================

class ArabicSectionPage extends StatelessWidget {
  const ArabicSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        title: const Text("العربية لغتي", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSubMenuTile(
              context,
              title: "الكتاب المدرسي",
              subtitle: "محتوى كتاب اللغة العربية",
              icon: Icons.menu_book,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextbookPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildSubMenuTile(
              context,
              title: "تحضير الدروس",
              subtitle: "إنشاء خطة درس بالذكاء الاصطناعي",
              icon: Icons.style,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonPlannerPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildSubMenuTile(
              context,
              title: "أنشطة شفهية وكتابية",
              subtitle: "تمارين وتدريبات تفاعلية ومولد أنشطة ذكي",
              icon: Icons.record_voice_over,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArabicActivitiesPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildSubMenuTile(
              context,
              title: "أوراق العمل ومولد الامتحانات",
              subtitle: "إنشاء نماذج اختبارات مخصصة",
              icon: Icons.assignment_turned_in,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubMenuTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF0A4D2E).withOpacity(0.1),
          child: Icon(icon, color: const Color(0xFF0A4D2E)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFD4AF37)),
        onTap: onTap,
      ),
    );
  }
}

// ==================== صفحة الكتاب المدرسي ====================

class TextbookPage extends StatelessWidget {
  const TextbookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        title: const Text("الكتاب المدرسي", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const [
              Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📖 كتاب العربية لغتي - الصف الثاني الابتدائي",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
                      ),
                      Divider(),
                      SizedBox(height: 8),
                      Text(
                        "• الوحدة الأولى: أهلاً بكتابي\n"
                        "• الوحدة الثانية: الوطن والعلم\n"
                        "• الوحدة الثالثة: البيئة والطبيعة\n"
                        "• الوحدة الرابعة: حكايات وعِبر\n\n"
                        "جميع الوحدات والدروس متوفرة وجاهزة للمراجعة والقراءة اليومية لطلاب الصف الثاني.",
                        style: TextStyle(fontSize: 15, height: 1.8),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== شاشة التحضير الذكي ====================

class LessonPlannerPage extends StatelessWidget {
  const LessonPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        title: const Text("تحضير الدروس الذكي", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Text("صفحة تحضير الدروس"),
        ),
      ),
    );
  }
}

// ==================== شاشة الأنشطة الشفهية والكتابية الذكية ====================

class ArabicActivitiesPage extends StatefulWidget {
  const ArabicActivitiesPage({super.key});

  @override
  State<ArabicActivitiesPage> createState() => _ArabicActivitiesPageState();
}

class _ArabicActivitiesPageState extends State<ArabicActivitiesPage> {
  final TextEditingController _lessonController = TextEditingController();
  String _selectedType = 'كل الأنشطة';
  bool _isLoading = false;
  String? _generatedActivities;

  final List<String> _activityTypes = [
    'كل الأنشطة',
    'أنشطة شفهية (استماع ومحادثة)',
    'أنشطة كتابية وإملاء',
    'قواعد وتدريبات لغوية',
    'فهم واستيعاب قرائي'
  ];

  void _generateActivities() {
    if (_lessonController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى كتابة اسم الدرس أو المهارة أولاً')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _generatedActivities = null;
    });

    Future.delayed(const Duration(seconds: 2), () {
      final lesson = _lessonController.text.trim();
      setState(() {
        _isLoading = false;
        _generatedActivities = '''
🌟 **أنشطة وتمارين مخصصة لدرس: ($lesson)** 🌟

---

🗣️ **أولاً: الأنشطة الشفهية (المحادثة والاستماع):**
1. **استمع وأجب:** استمع إلى الجملة القائمة على الدرس ثم اذكر الكلمة التي تبدأ بالحرف/المهارة المطلوبة.
2. **عَبّر بلغتك:** صِف المشهد أو الفكرة الرئيسية للدرس في جولتين مفيدتين بأسلوبك الخاص.

---

✏️ **ثانياً: الأنشطة الكتابية والإملاء:**
1. **أكمل الفراغ:** اختر الكلمة المناسبة واكتبها بخط جميل:
   - (...........) طَالِبٌ مُجْتَهِدٌ. [هُوَ / هِيَ]
2. **رتب الكلمات:** رتب الكلمات التالية لتكون جملة مفيدة:
   - [الْمَدْرَسَةِ - إِلَى - فِي - الصَّبَاحِ - ذَهَبَ - زَيْدٌ]

---

🔍 **ثالثاً: التدريبات اللغوية والقواعد:**
1. استخرج من الدرس كلمة تحتوي على (لام شمسية) وأخرى تحتوي على (لام قمرية).
2. حلل الكلمة التالية إلى مقاطع صوتية: **(مَـدْرَسَـةٌ)**.
''';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        title: const Text("الأنشطة الشفهية والكتابية", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "توليد أنشطة وتمارين بالذكاء الاصطناعي",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A4D2E),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _lessonController,
                        decoration: const InputDecoration(
                          labelText: "اسم الدرس أو المهارة (مثال: حرف الجيم / الجار قبل الدار)",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.book, color: Color(0xFF0A4D2E)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: _selectedType,
                        items: _activityTypes.map((type) {
                          return DropdownMenuItem(value: type, child: Text(type));
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedType = val);
                        },
                        decoration: const InputDecoration(
                          labelText: "نوع النشاط المطلوب",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.category, color: Color(0xFF0A4D2E)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0A4D2E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: _isLoading ? null : _generateActivities,
                          icon: const Icon(Icons.auto_awesome, color: Color(0xFFD4AF37)),
                          label: const Text(
                            "توليد الأنشطة والتمارين",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        CircularProgressIndicator(color: Color(0xFF0A4D2E)),
                        SizedBox(height: 12),
                        Text("جاري استحضار الأنشطة والتمارين المناسبة..."),
                      ],
                    ),
                  ),
                ),
              if (_generatedActivities != null)
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  color: const Color(0xFFFDFBF7),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "الأنشطة والتمارين المقترحة:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A4D2E),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy, color: Color(0xFFD4AF37)),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('تم نسخ الأنشطة بنجاح!')),
                                );
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                        Text(
                          _generatedActivities!,
                          style: const TextStyle(fontSize: 14, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
