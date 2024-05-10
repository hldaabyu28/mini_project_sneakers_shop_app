import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _messages = []; // List of maps to store messages and their types

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot AI', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF4F4FEC),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _messages.clear();
              });
            },
            icon: Icon(Icons.refresh),
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: _messages[index]['type'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                      decoration: BoxDecoration(
                        color: _messages[index]['type'] == 'user' ? Color(0xFF4F4FEC) : Colors.green, // User message: blue, AI message: green
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        _messages[index]['content'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4F4FEC),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _submitForm,
                    child: const Text('Send' , style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() async {
    if (_messageController.text.trim().isEmpty) return;

    // Check if user message contains keywords related to shoes only
    if (!_containsShoeKeywords(_messageController.text.trim())) {
      // If not, prompt the user to ask questions related to shoes only
      setState(() {
        _messages.add({'content': "Please ask questions related to shoes only.", 'type': 'user'});
      });
      _messageController.clear();
      return;
    }

    // Add user message to the chat list
    setState(() {
      _messages.add({'content': _messageController.text.trim(), 'type': 'user'});
    });

    // Send user message to the server and get response
    String key = 'sk-proj-tXTwZmBklQzxliExg9PhT3BlbkFJ2toN4t71UbBXTpQ6wEJ9';
    final apiKey = key;
    const apiUrl = 'https://api.openai.com/v1/chat/completions';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode(
        <String, dynamic>{
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": _messageController.text.trim(),
            }
          ],
          'max_tokens': 250,
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      setState(() {
        // Add AI response to the chat list
        _messages.add({'content': responseData['choices'][0]['message']['content'], 'type': 'ai'});
      });
    } else {
      print('Failed to get response. Status code: ${response.statusCode}');
    }

    // Clear text field after sending message
    _messageController.clear();
  }

  // Function to check if user message contains keywords related to shoes
  bool _containsShoeKeywords(String message) {
    final shoeKeywords = ['harga', 'produk', 'merk', 'ukuran', 'warna', 'sepatu', 'sepatu', 'shoes', 'shoes'];
    for (String keyword in shoeKeywords) {
      if (message.toLowerCase().contains(keyword)) {
        return true;
      }
    }
    return false;
  }
}
