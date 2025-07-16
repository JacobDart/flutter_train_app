import 'package:flutter/material.dart';

// 좌석 선택 페이지
class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  SeatPage({required this.departureStation, required this.arrivalStation});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  // 선택된 좌석들을 담는 리스트
  List<String> selectedSeatList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택'), backgroundColor: Colors.purple),
      body: Column(
        children: [
          // 출발역 -> 도착역 표시
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.departureStation,
                  style: TextStyle(fontSize: 30, color: Colors.purple),
                ),
                SizedBox(width: 20),
                Icon(Icons.arrow_forward, size: 30),
                SizedBox(width: 20),
                Text(
                  widget.arrivalStation,
                  style: TextStyle(fontSize: 30, color: Colors.purple),
                ),
              ],
            ),
          ),
          // 좌석 상태 설명
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 24, height: 24, color: Colors.purple),
                SizedBox(width: 5),
                Text('선택됨'),
                SizedBox(width: 20),
                Container(width: 24, height: 24, color: Colors.grey),
                SizedBox(width: 5),
                Text('빈자리'),
              ],
            ),
          ),
          // 좌석 목록 표시
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: 21, // A,B,C,D 표시용 + 20개 좌석 행 가운데 넣어야하는데
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // A,B,C,D 표시
                    return Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Center(child: Text('')),
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text('A', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text('B', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text('C', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text('D', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // 좌석 줄 표시
                    int rowNum = index;
                    return Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 번호 표시
                          Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text(
                                rowNum.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          // A 좌석
                          InkWell(
                            onTap: () {
                              String seatNumber = rowNum.toString() + 'A';
                              setState(() {
                                if (selectedSeatList.contains(seatNumber)) {
                                  selectedSeatList.remove(seatNumber);
                                } else {
                                  selectedSeatList.add(seatNumber);
                                }
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              color:
                                  selectedSeatList.contains(
                                    rowNum.toString() + 'A',
                                  )
                                  ? Colors.purple
                                  : Colors.grey,
                            ),
                          ),
                          SizedBox(width: 4),
                          // B 좌석
                          InkWell(
                            onTap: () {
                              String seatNumber = rowNum.toString() + 'B';
                              setState(() {
                                if (selectedSeatList.contains(seatNumber)) {
                                  selectedSeatList.remove(seatNumber);
                                } else {
                                  selectedSeatList.add(seatNumber);
                                }
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              color:
                                  selectedSeatList.contains(
                                    rowNum.toString() + 'B',
                                  )
                                  ? Colors.purple
                                  : Colors.grey,
                            ),
                          ),
                          SizedBox(width: 4),
                          // C 좌석
                          InkWell(
                            onTap: () {
                              String seatNumber = rowNum.toString() + 'C';
                              setState(() {
                                if (selectedSeatList.contains(seatNumber)) {
                                  selectedSeatList.remove(seatNumber);
                                } else {
                                  selectedSeatList.add(seatNumber);
                                }
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              color:
                                  selectedSeatList.contains(
                                    rowNum.toString() + 'C',
                                  )
                                  ? Colors.purple
                                  : Colors.grey,
                            ),
                          ),
                          SizedBox(width: 4),
                          // D 좌석
                          InkWell(
                            onTap: () {
                              String seatNumber = rowNum.toString() + 'D';
                              setState(() {
                                if (selectedSeatList.contains(seatNumber)) {
                                  selectedSeatList.remove(seatNumber);
                                } else {
                                  selectedSeatList.add(seatNumber);
                                }
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              color:
                                  selectedSeatList.contains(
                                    rowNum.toString() + 'D',
                                  )
                                  ? Colors.purple
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
