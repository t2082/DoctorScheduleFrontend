import 'package:flutter/material.dart';
import 'package:schedule_doctor/models/doctor.dart';

class DetailPage extends StatefulWidget {
  final DoctorModel doctorModel;
  const DetailPage({required this.doctorModel, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<CalendarModel> calendarData = [];
  List<TimeModel> timeData = [];

  @override
  void initState() {
    super.initState();
    calendarData = widget.doctorModel.calendar;
    timeData = widget.doctorModel.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Detail Doctor',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [info(), calendar(), time(), const Spacer(), bookButton()],
        ),
      ),
    );
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // Ảnh
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: widget.doctorModel.imageBox,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(widget.doctorModel.image),
                    ),
                  ),
                ),
                // Thông tin
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorModel.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        widget.doctorModel.specialties.first,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 16),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.doctorModel.score.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Biography',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black.withOpacity(0.9)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.doctorModel.bio,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black.withOpacity(0.9)),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Specialities',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black.withOpacity(0.9)),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Text(
                widget.doctorModel.specialties[index],
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    decoration: TextDecoration.underline),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: widget.doctorModel.specialties.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget calendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, left: 16),
          child: Text(
            'Calendar',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (var item in calendarData) {
                      item.isSelected = false;
                    }
                    calendarData[index].isSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: calendarData[index].isSelected
                            ? const Color(0xff51A8FF)
                            : Colors.white),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(
                            calendarData[index].dayNumber.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            calendarData[index].dayName,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 40),
              itemCount: calendarData.length),
        )
      ],
    );
  }

  Widget time() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, left: 16),
          child: Text(
            'Time',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(16),
          
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (var item in timeData) {
                      item.isSelected = false;
                    }
                    timeData[index].isSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: timeData[index].isSelected
                            ? const Color(0xff51A8FF)
                            : Colors.white),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        timeData[index].time,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 40),
              itemCount: timeData.length),
        )
      ],
    );
  }

  Widget bookButton() {
    return MaterialButton(
      onPressed: () {},
      height: 55,
      minWidth: double.infinity,
      elevation: 0,
      color: const Color(0xff51A8FF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Text(
        'Book Appointment',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
