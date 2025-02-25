import 'package:appwrite/appwrite.dart';


Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('67b5ac1600194ea00fc2')
    .setSelfSigned(status: true);