// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DoctorModel {
  String name;
  String image;
  String bio;
  Color imageBox;
  List<String> specialties;
  double score;
  List<CalendarModel> calendar;
  List<TimeModel> time;

  DoctorModel({
    required this.name,
    required this.image,
    required this.bio,
    required this.imageBox,
    required this.specialties,
    required this.score,
    required this.calendar,
    required this.time,
  });

  static List<DoctorModel> getDoctor() {
    List<DoctorModel> doctors = [];

    doctors.add(DoctorModel(
        name: 'Dr. Senku',
        image: 'assets/images/senku.png',
        bio:
            'I am a technology kid, who\'s excited by mecha, space and Doraemon! I will save all of humanity, without exception, with the power of science!',
        imageBox: const Color.fromARGB(255, 255, 249, 163).withOpacity(0.5),
        specialties: ['Dental Surgeon', 'Aesthetic Surgeon', 'General Dentist'],
        score: 4.8,
        calendar: [
          CalendarModel(dayNumber: 14, dayName: 'Sun', isSelected: true),
          CalendarModel(dayNumber: 15, dayName: 'Mon', isSelected: false),
          CalendarModel(dayNumber: 16, dayName: 'Tue', isSelected: false),
          CalendarModel(dayNumber: 17, dayName: 'Wed', isSelected: false),
        ],
        time: [
          TimeModel(time: '1:00 AM', isSelected: true),
          TimeModel(time: '1:00 AM', isSelected: false),
          TimeModel(time: '00:00 PM', isSelected: false),
        ]));

    doctors.add(DoctorModel(
        name: 'Dr. Gojo',
        image: 'assets/images/gojo.png',
        bio:
            'Satoru Gojo is one of the main protagonists of the Jujutsu Kaisen series. He is a special grade jujutsu sorcerer and widely recognized as the strongest in the world. Satoru is the pride of the Gojo Clan, the first person to inherit both the Limitless and the Six Eyes in four hundred years. He works as a teacher at the Tokyo Jujutsu High and uses his influence to protect and train strong young allies.',
        imageBox: const Color.fromARGB(255, 148, 207, 255).withOpacity(0.5),
        specialties: ['Aesthetic Surgeon', 'Dental Surgeon', 'General Dentist'],
        score: 4.3,
        calendar: [
          CalendarModel(dayNumber: 18, dayName: 'Thus', isSelected: true),
          CalendarModel(dayNumber: 19, dayName: 'Fri', isSelected: false),
          CalendarModel(dayNumber: 20, dayName: 'Sat', isSelected: false),
          CalendarModel(dayNumber: 21, dayName: 'Sun', isSelected: false),
        ],
        time: [
          TimeModel(time: '2:00 AM', isSelected: true),
          TimeModel(time: '2:00 AM', isSelected: false),
          TimeModel(time: '00:00 PM', isSelected: false),
        ]));

    return doctors;
  }
}

class CalendarModel {
  final int dayNumber;
  final String dayName;
  bool isSelected;

  CalendarModel({
    required this.dayNumber,
    required this.dayName,
    required this.isSelected,
  });
}

class TimeModel {
  final String time;
  bool isSelected;

  TimeModel({
    required this.time,
    required this.isSelected,
  });
}
