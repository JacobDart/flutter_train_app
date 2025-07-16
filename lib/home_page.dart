import 'package:flutter/material.dart';
import 'station_list_page.dart';
import 'seat_page.dart';

// 홈 페이지 클래스!!
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 출발역 지정
  String startStation = '선택';
  // 도착역 지정
  String endStation = '선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매'), backgroundColor: Colors.purple),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            // 위에 여백 지정
            SizedBox(height: 100),
            // 출발역, 도착역 선택하는 박스 영역 설정
            Container(
              margin: EdgeInsets.all(20),
              height: 200,
              color: Colors.white,
              child: Row(
                children: [
                  // 출발역 부분
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // 출발역 선택 페이지로 이동하는 코드
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StationListPage(title: '출발역'),
                          ),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              startStation = value;
                            });
                          }
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '출발역',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          Text(
                            startStation,
                            style: TextStyle(fontSize: 40, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 중간 선
                  Container(width: 2, height: 50, color: Colors.grey),
                  // 도착역 부분
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // 도착역 선택 페이지로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StationListPage(title: '도착역'),
                          ),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              endStation = value;
                            });
                          }
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '도착역',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          Text(
                            endStation,
                            style: TextStyle(fontSize: 40, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 중간 여백
            SizedBox(height: 20),
            // 좌석 선택 버튼
            Container(
              margin: EdgeInsets.all(20),
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // 출발역과 도착역이 모두 선택되었는지 확인
                  if (startStation != '선택' && endStation != '선택') {
                    // 좌석 선택 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeatPage(
                          departureStation: startStation,
                          arrivalStation: endStation,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ), // 라운딩 요소
                ),
                child: Text(
                  '좌석 선택',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
