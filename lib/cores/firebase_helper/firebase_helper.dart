// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../exception/base_exception.dart';

String USERCOLLECTION = "users";
String CourseCOLLECTION = "courses";
String QuizDataCOLLECTION = "quizData";
String SurveyDataCOLLECTION = "survey";
String SurveyAnswerCOLLECTION = "survey_answer";

class FirebaseHelper {
  /// -------- Utile ---------
  Timestamp get timestamp => Timestamp.now();

  /// -------- AUTHENTICATION ---------
  FirebaseAuth get auth => FirebaseAuth.instance;

  String get currentUserId {
    final String? userId = auth.currentUser?.uid;
    if (userId == null) throw const BaseFailures(message: 'User not found!');

    return userId;
  }

  /// -------- FIRESTORE ---------
  CollectionReference<Map<String, dynamic>> userCollectionRef() {
    return FirebaseFirestore.instance.collection(USERCOLLECTION);
  }

  CollectionReference<Map<String, dynamic>> courseCollectionRef() {
    return FirebaseFirestore.instance.collection(CourseCOLLECTION);
  }

  CollectionReference<Map<String, dynamic>> quizDataCollectionRef() {
    return FirebaseFirestore.instance.collection(QuizDataCOLLECTION);
  }

  DocumentReference<Map<String, dynamic>> surveyDataCollectionRef() {
    return FirebaseFirestore.instance
        .collection(SurveyDataCOLLECTION)
        .doc("question_list");
  }

  CollectionReference<Map<String, dynamic>> surveyAnswerCollectionRef() {
    return FirebaseFirestore.instance.collection(SurveyAnswerCOLLECTION);
  }

  /// -------- Storage ---------
  Reference storageRef() => FirebaseStorage.instance.ref();

  /// ------- Batch Write ------
  WriteBatch batch() => FirebaseFirestore.instance.batch();
}
