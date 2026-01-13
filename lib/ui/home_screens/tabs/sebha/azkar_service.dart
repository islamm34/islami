import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:islami/ui/home_screens/tabs/sebha/sebha.dart';

class AzkarService {
  static List<SebhaDm> _allAzkar = [];
  static int _currentIndex = 0;

  static Future<List<SebhaDm>> loadAzkarFromJson() async {
    try {
      final String response = await rootBundle.loadString('assets/data/azkar.json');
      final Map<String, dynamic> data = json.decode(response);

      List<SebhaDm> allAzkar = [];

      // تطبيق function لعمل flatten للـ nested arrays
      void flattenAndAdd(dynamic item) {
        if (item is List) {
          for (var element in item) {
            flattenAndAdd(element);
          }
        } else if (item is Map<String, dynamic>) {
          allAzkar.add(SebhaDm.fromJson(item));
        }
      }

      data.forEach((category, items) {
        if (items is List) {
          for (var item in items) {
            flattenAndAdd(item);
          }
        } else if (items is Map<String, dynamic>) {
          allAzkar.add(SebhaDm.fromJson(items));
        }
      });

      // تصفية الأذكار التي تحتوي على "stop"
      allAzkar = allAzkar.where((zikr) {
        return !zikr.content.toLowerCase().contains('stop') &&
            !zikr.category.toLowerCase().contains('stop');
      }).toList();

      print('Total azkar loaded: ${allAzkar.length}');
      return allAzkar;
    } catch (e) {
      print('Error loading azkar: $e');
      return [];
    }
  }

  // دالة للحصول على التالي بالترتيب
  static Future<SebhaDm?> getNextZikr() async {
    try {
      if (_allAzkar.isEmpty) {
        _allAzkar = await loadAzkarFromJson();
        _currentIndex = 0;
      }

      if (_allAzkar.isEmpty) {
        print('Azkar list is empty');
        return null;
      }

      // إذا وصلنا للنهاية، نعود للبداية
      if (_currentIndex >= _allAzkar.length) {
        _currentIndex = 0;
      }

      final zikr = _allAzkar[_currentIndex];

      // تنظيف وتجهيز العدد
      String cleanCount = zikr.count.trim();
      cleanCount = cleanCount.replaceAll(RegExp(r'[^0-9]'), '');
      final count = int.tryParse(cleanCount) ?? 1;

      // تحديث المؤشر للذكر التالي
      _currentIndex++;

      print('Current index: ${_currentIndex - 1}, Total: ${_allAzkar.length}');
      print('Zikr: ${zikr.content.substring(0, min(50, zikr.content.length))}...');

      return SebhaDm(
        category: zikr.category,
        count: count.toString(),
        description: zikr.description,
        reference: zikr.reference,
        content: zikr.content,
      );
    } catch (e) {
      print('Error getting next zikr: $e');
      return null;
    }
  }

  // دالة للحصول على السابق بالترتيب
  static Future<SebhaDm?> getPreviousZikr() async {
    try {
      if (_allAzkar.isEmpty) {
        _allAzkar = await loadAzkarFromJson();
        _currentIndex = 0;
      }

      if (_allAzkar.isEmpty) {
        print('Azkar list is empty');
        return null;
      }

      // نعود خطوة للخلف
      _currentIndex--;
      if (_currentIndex < 0) {
        _currentIndex = _allAzkar.length - 1; // نعود للنهاية
      }

      final zikr = _allAzkar[_currentIndex];

      String cleanCount = zikr.count.trim();
      cleanCount = cleanCount.replaceAll(RegExp(r'[^0-9]'), '');
      final count = int.tryParse(cleanCount) ?? 1;

      print('Current index: $_currentIndex, Total: ${_allAzkar.length}');

      return SebhaDm(
        category: zikr.category,
        count: count.toString(),
        description: zikr.description,
        reference: zikr.reference,
        content: zikr.content,
      );
    } catch (e) {
      print('Error getting previous zikr: $e');
      return null;
    }
  }

  // دالة للحصول على أول ذكر
  static Future<SebhaDm?> getFirstZikr() async {
    if (_allAzkar.isEmpty) {
      _allAzkar = await loadAzkarFromJson();
    }

    _currentIndex = 0;

    if (_allAzkar.isNotEmpty) {
      return _allAzkar[_currentIndex];
    }

    return null;
  }

  // دالة للحصول على رقم الذكر الحالي
  static int getCurrentIndex() {
    return _currentIndex;
  }

  // دالة للحصول على إجمالي عدد الأذكار
  static int getTotalAzkar() {
    return _allAzkar.length;
  }
}

int min(int a, int b) => a < b ? a : b;