import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

void main() {
  runApp(const SerajApp());
}

class SerajApp extends StatelessWidget {
  const SerajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سِراج',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A4D2E), // أخضر ملكي
        scaffoldBackgroundColor: const Color(0xFFFDFBF7), // بيج فاتح
        fontFamily: 'Cairo',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        title: const Text(
          'سِراج .. رفيقك في التعلم',
          style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // الآية الكريمة
            const Text(
              '﴿ وَقُل رَّبِّ زِدْنِي عِلْمًا ﴾',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A4D2E),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            
            // بطاقة عرض الكتاب المدرسي
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Color(0xFFD4AF37), width: 1.5),
              ),
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.menu_book, color: Color(0xFF0A4D2E), size: 36),
                title: const Text(
                  'كتاب العربية لغتي (الصف الثاني)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0A4D2E)),
                ),
                subtitle: const Text('تصفح الكتاب المدرسي الرسمي أوفلاين'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFD4AF37)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerScreen(),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 40),
            
            // حقوق المصمم
            const Divider(color: Color(0xFFD4AF37), thickness: 1),
            const SizedBox(height: 10),
            const Text(
              'تصميم: مُعتز محمد الأحمد\nمدرسةُ الأندلس الثالثة',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0A4D2E),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({super.key});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late PdfControllerPinch _pdfControllerPinch;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  Future<void> _initPdf() async {
    try {
      _pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openAsset('assets/books/arabic_book.pdf'),
      );
    } catch (e) {
      // التعامل مع أي خطأ في تحميل الملف
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        title: const Text('كتاب العربية لغتي', style: TextStyle(color: Color(0xFFD4AF37))),
        iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF0A4D2E)))
          : PdfViewPinch(
              controller: _pdfControllerPinch,
            ),
    );
  }
}
