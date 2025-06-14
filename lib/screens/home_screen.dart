import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasum/l10n/app_localizations.dart';
import 'package:fasum/screens/detail_screen.dart';
import 'package:fasum/screens/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fasum/screens/sign_in_screen.dart';
import 'package:fasum/screens/add_post_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedcategory;

  List<String> get categories => [
    AppLocalizations.of(context).categoryJalanRusak,
    AppLocalizations.of(context).categoryMarkaPudar,
    AppLocalizations.of(context).categoryLampuMati,
    AppLocalizations.of(context).categoryTrotoarRusak,
    AppLocalizations.of(context).categoryRambuRusak,
    AppLocalizations.of(context).categoryJembatanRusak,
    AppLocalizations.of(context).categorySampahMenumpuk,
    AppLocalizations.of(context).categoryPohonTumbang,
    AppLocalizations.of(context).categorySaluranTersumbat,
    AppLocalizations.of(context).categorySungaiTercemar,
    AppLocalizations.of(context).categorySampahSungai,
    AppLocalizations.of(context).categoryTamanRusak,
    AppLocalizations.of(context).categoryFasilitasRusak,
    AppLocalizations.of(context).categoryPipaBocor,
    AppLocalizations.of(context).categoryVandalisme,
    AppLocalizations.of(context).categoryBanjir,
    AppLocalizations.of(context).categoryLainnya,
  ];

  String formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inSeconds < 60) {
      return AppLocalizations.of(context).secondsAgo(diff.inSeconds);
    } else if (diff.inMinutes < 60) {
      return AppLocalizations.of(context).minutesAgo(diff.inMinutes);
    } else if (diff.inHours < 48) {
      return AppLocalizations.of(context).hoursAgo(diff.inHours);
    } else if (diff.inDays < 2) {
      return AppLocalizations.of(context).oneDayAgo;
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (route) => false,
    );
  }

  void _showcategoryFilter() async {
    final result = await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                ListTile(
                  leading: const Icon(Icons.clear),
                  title: const Text('Semua Kategori'),
                  onTap: () => Navigator.pop(context, null),
                ),
                const Divider(),
                ...categories.map(
                  (category) => ListTile(
                    title: Text(category),
                    trailing:
                        selectedcategory == category
                            ? Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                            )
                            : null,
                    onTap: () => Navigator.pop(context, category),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    if (result != null) {
      setState(() {
        selectedcategory = result;
      });
    } else {
      setState(() {
        selectedcategory = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Fasum',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _showcategoryFilter,
            icon: Icon(Icons.filter_list),
            tooltip: "Filter Kategori",
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings),
            tooltip: AppLocalizations.of(context).settings,
          ),
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
        ],
      ),
      body: RefreshIndicator(
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance
                  .collection('posts')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final posts =
                snapshot.data!.docs.where((doc) {
                  final data = doc.data();
                  final category =
                      data['Category'] ?? data['category'] ?? 'Lainnya';
                  return selectedcategory == null ||
                      selectedcategory == category;
                }).toList();

            if (posts.isEmpty) {
              return const Center(
                child: Text("Tidak Ada Laporan Untuk Kategori Ini"),
              );
            }
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final data = posts[index].data();
                final ImageBase64 = data['image'];
                final description = data['description'];
                final createdAt =
                    data['createdAt'] is Timestamp
                        ? (data['createdAt'] as Timestamp).toDate()
                        : (data['createdAt'] is String
                            ? DateTime.parse(data['createdAt'])
                            : DateTime.now());
                final fullName = data['fullName'] ?? 'Anonim';
                final latitude = data['latitude'];
                final longitude = data['longitude'];
                final category =
                    data['Category'] ?? data['category'] ?? 'Lainnya';
                String heroTag =
                    'fasum-image-${createdAt.millisecondsSinceEpoch}';

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailScreen(
                              imageBase64: ImageBase64,
                              description: description ?? '',
                              createdAt: createdAt,
                              fullName: fullName,
                              latitude: latitude,
                              longitude: longitude,
                              category: category,
                              heroTag: heroTag,
                            ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    shadowColor: Theme.of(context).colorScheme.shadow,
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (ImageBase64 != null)
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Hero(
                              tag: heroTag,
                              child: Image.memory(
                                base64Decode(ImageBase64),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fullName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                formatTime(createdAt),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                category ?? '',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                description ?? '',
                                style: const TextStyle(fontSize: 16),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
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
          },
        ),
        onRefresh: () async {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
