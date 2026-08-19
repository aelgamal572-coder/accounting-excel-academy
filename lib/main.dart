import 'package:flutter/material.dart';

void main() {
  runApp(const AccountingAcademy());
}

class AccountingAcademy extends StatelessWidget {
  const AccountingAcademy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accounting & Excel Academy',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounting & Excel Academy'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Learn Accounting & Excel',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'تعلم المحاسبة والإكسيل من الصفر بطريقة عملية.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          _buildCard(
            context,
            '📘 Accounting',
            'تعلم المحاسبة من الصفر',
            Icons.menu_book,
            const AccountingPage(),
          ),

          _buildCard(
            context,
            '📊 Excel',
            'Excel للمحاسبين',
            Icons.table_chart,
            const ExcelPage(),
          ),

          _buildCard(
            context,
            '🎯 Quizzes',
            'اختبر معلوماتك',
            Icons.quiz,
            const QuizPage(),
          ),

          _buildCard(
            context,
            '💼 Interview',
            'أسئلة انترفيو المحاسبة',
            Icons.work,
            const InterviewPage(),
          ),

          _buildCard(
            context,
            '⭐ Premium',
            'محتوى متقدم بدون إعلانات',
            Icons.star,
            const PremiumPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Widget page,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 35),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}

class AccountingPage extends StatelessWidget {
  const AccountingPage({super.key});

  final List<String> lessons = const [
    'Accounting Basics',
    'Accounting Equation',
    'Debit & Credit',
    'Journal Entries',
    'Ledger',
    'Trial Balance',
    'Adjusting Entries',
    'Financial Statements',
    'Depreciation',
    'Bank Reconciliation',
  ];

  @override
  Widget build(BuildContext context) {
    return CoursePage(
      title: '📘 Accounting',
      lessons: lessons,
    );
  }
}

class ExcelPage extends StatelessWidget {
  const ExcelPage({super.key});

  final List<String> lessons = const [
    'Excel Basics',
    'SUM & AVERAGE',
    'IF Function',
    'SUMIF',
    'COUNTIF',
    'VLOOKUP',
    'XLOOKUP',
    'IFERROR',
    'Pivot Tables',
    'Accounting Excel Project',
  ];

  @override
  Widget build(BuildContext context) {
    return CoursePage(
      title: '📊 Excel',
      lessons: lessons,
    );
  }
}

class CoursePage extends StatelessWidget {
  final String title;
  final List<String> lessons;

  const CoursePage({
    super.key,
    required this.title,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final bool premium = index >= 3;

          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(lessons[index]),
              subtitle: Text(
                premium ? '⭐ PREMIUM' : 'FREE',
              ),
              trailing: Icon(
                premium ? Icons.lock : Icons.play_arrow,
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🎯 Quizzes')),
      body: const Center(
        child: Text(
          'اختبارات المحاسبة والإكسيل\n\nComing Soon',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

class InterviewPage extends StatelessWidget {
  const InterviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('💼 Interview')),
      body: const Center(
        child: Text(
          'Accounting Interview Questions\n\n'
          'English Question + Arabic Explanation\n\n'
          'Coming Soon',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('⭐ Premium')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Premium Membership',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              'افتح كل الدروس والمشاريع والاختبارات '
              'واحصل على تجربة بدون إعلانات.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Subscribe'),
            ),
          ],
        ),
      ),
    );
  }
}
