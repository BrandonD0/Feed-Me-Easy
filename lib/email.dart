import 'dart:convert';

import 'package:http/http.dart' as http;

Future sendEmail({
  required String name,
  required String email,
}) async {
  final serviceId = 'service_4FME';
  final templateId = 'template_i4f3oov';
  final userId = 'user_hiwRL2WznDmsLziufhS3q';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'origin': 'http://localhost',
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'to_email': email,
        'user_email': 'feedmeeasy.productservice@gmail.com',
        'user_subject': '',
        'user message': '', 
      },
      'accessToken': 'aebe5fe5680a818ddd1aea6ba7922187',
    }),
  );
  print(response.body);
}

//sendEmail(name: 'Yo', email: '19005926@galileo.edu'),