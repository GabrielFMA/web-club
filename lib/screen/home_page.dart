// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:web_simclub/components/menu.dart'; // Importe a biblioteca dart:async

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDataWithDelay();
  }

  Future<void> _fetchDataWithDelay() async {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? const Center(child: CircularProgressIndicator()) : const MenuWidget(),
      backgroundColor: Colors.green[200],
    );
  }
}
