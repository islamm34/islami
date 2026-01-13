import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_styles.dart';
import 'azkar_service.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  static const routeName = '/Sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int _counter = 0;
  int _targetCount = 0;
  bool _isTapped = false;
  SebhaDm? _currentZikr;
  bool _isLoading = true;
  int _zikrNumber = 0;
  int _totalAzkar = 0;

  @override
  void initState() {
    super.initState();
    _loadFirstZikr();
  }

  Future<void> _loadFirstZikr() async {
    setState(() {
      _isLoading = true;
    });

    final zikr = await AzkarService.getFirstZikr();

    if (zikr != null && mounted) {
      setState(() {
        _currentZikr = zikr;
        _targetCount = int.tryParse(zikr.count) ?? 1;
        _counter = 0;
        _isLoading = false;
        _zikrNumber = 1;
        _totalAzkar = AzkarService.getTotalAzkar();
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadNextZikr() async {
    setState(() {
      _isLoading = true;
    });

    final zikr = await AzkarService.getNextZikr();

    if (zikr != null && mounted) {
      setState(() {
        _currentZikr = zikr;
        _targetCount = int.tryParse(zikr.count) ?? 1;
        _counter = 0;
        _isLoading = false;
        _zikrNumber = AzkarService.getCurrentIndex();
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadPreviousZikr() async {
    setState(() {
      _isLoading = true;
    });

    final zikr = await AzkarService.getPreviousZikr();

    if (zikr != null && mounted) {
      setState(() {
        _currentZikr = zikr;
        _targetCount = int.tryParse(zikr.count) ?? 1;
        _counter = 0;
        _isLoading = false;
        _zikrNumber = AzkarService.getCurrentIndex() + 1;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleTap() {
    setState(() {
      _counter++;

      if (_targetCount > 0 && _counter >= _targetCount) {
        _loadNextZikr();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebha_background),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(AppAssets.imgHeader),
          ),

          Positioned(
            top: 285,
            right: 0,
            left: 0,
            child: Image.asset(AppAssets.sebha2, width: 145, height: 86),
          ),

          // عرض رقم الذكر والفئة
          if (_currentZikr != null && _currentZikr!.category.isNotEmpty)
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    _currentZikr!.category,
                    textDirection: TextDirection.rtl,
                    style: AppStyles.whiteBold34,
                  ),
                ],
              ),
            ),

          Positioned(
            bottom: 90,
            left: 18,
            right: 18,
            child: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _isTapped = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _isTapped = false;
                });
                _handleTap();
              },
              onTapCancel: () {
                setState(() {
                  _isTapped = false;
                });
              },
              child: Transform.scale(
                scale: _isTapped ? 0.95 : 1.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppAssets.SebhaBody1, fit: BoxFit.fitWidth),
                    if (_isLoading)
                      CircularProgressIndicator(color: AppColors.gold)
                    else if (_currentZikr != null)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  _cleanContent(_currentZikr!.content),
                                  textAlign: TextAlign.center,
                                  style: AppStyles.whiteBold24,
                                ),
                                SizedBox(height: 10),
                                // المرجع (إن وجد)
                                if (_currentZikr!.reference.isNotEmpty &&
                                    !_currentZikr!.reference.contains('stop'))
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      _cleanContent(_currentZikr!.reference),
                                      textAlign: TextAlign.center,
                                      style: AppStyles.goldBold24,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Text(
                            '$_counter / $_targetCount',
                            style: AppStyles.goldBold24,
                          ),
                        ],
                      )
                    else
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لم يتم تحميل الأذكار',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _loadFirstZikr,
                            child: Text('إعادة المحاولة'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _cleanContent(String content) {
    content = content.replaceAll('\\n', '\n');
    content = content.replaceAll('\\"', '"');
    content = content.replaceAll('\'', '');
    content = content.trim();

    if (content.toLowerCase().contains('stop')) {
      content = content.replaceAll(RegExp(r'stop', caseSensitive: false), '');
    }

    return content;
  }
}

class SebhaDm {
  String category;
  String count;
  String description;
  String reference;
  String content;

  SebhaDm({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory SebhaDm.fromJson(Map<String, dynamic> json) {
    String cleanContent(String? text) {
      if (text == null) return '';
      text = text.replaceAll('\\n', '\n');
      text = text.replaceAll('\\"', '"');
      text = text.replaceAll('\'', '');
      text = text.trim();
      return text;
    }

    return SebhaDm(
      category: cleanContent(json['category']?.toString()),
      count: cleanContent(json['count']?.toString()) ?? '0',
      description: cleanContent(json['description']?.toString()),
      reference: cleanContent(json['reference']?.toString()),
      content: cleanContent(json['content']?.toString()),
    );
  }
}
