# :trolleybus: 유로버스 :trolleybus:

[![euroverseMAIN](https://user-images.githubusercontent.com/57661883/77535422-ee1e1c80-6edd-11ea-8aad-bfdfd6ceaf36.png)](https://youtu.be/2Q8ZXSbwx8Q)
###### 이미지를 클릭하면 구현영상을 볼 수 있습니다.<br>
* * *
# :bookmark: 목차

1.[개요](https://github.com/zi-seong/euroverse/blob/master/README.md#1개요-smiley)<br>
2.[담당 모듈](https://github.com/zi-seong/euroverse/blob/master/README.md#2담당-모듈-dart)<br>
3.[의존성 및 버전 정보](https://github.com/zi-seong/euroverse/blob/master/README.md#3의존성-및-버전-정보-two_men_holding_hands)<br>
4.[분석 및 설계 과정](https://github.com/zi-seong/euroverse/blob/master/README.md#4분석-및-설계-과정-bar_chart)<br>
5.[추가 학습](https://github.com/zi-seong/euroverse/blob/master/README.md#5추가-학습-pencil2)<br>
6.[참고 사항](https://github.com/zi-seong/euroverse/blob/master/README.md#6참고-사항-interrobang)<br>






## 1.개요 :smiley:
+ 총 개발 기간 : 2개월  
    + 분석 및 설계 : 2020/01/01 ~ 2020/01/23  
    + 구현 : 2020/01/24 ~ 2020/03/07  
+ 총 개발 인원 : 6명  
+ 시스템 개요 : MVC2 모델을 기반으로 스프링 프레임워크를 이용하여 만든 유럽 여행 플래너 및 커뮤니티 사이트입니다. 크게 회원 관리, 주문 관리, 플래너, 커뮤니티, 채팅 및 알람 모듈로 구성되어 있습니다.
<br>

## 2.담당 모듈 :dart:

회원관리<br>


<br>

## 3.의존성 및 버전 정보 :two_men_holding_hands:
+ Laguage : Java    
+ Back-end : Spring Framework 4.0.1 / MyBatis / Apache Tomcat / Selenium
+ Front : HTML5 / BootStrap 4 / CSS3 / jQuery / Ajax / JSP
+ Database : Oracle 10g / MongoDB 3.6.1  
+ VCS tool : GitHub  
+ IDE : Eclipse  
+ Open Source : Sweetalert / FullCalendar / SummerNote / Owl carousel / AOS / Swiper / Foreign exchange rates API / 공공데이터포털API / 청기와 LAB / I'mPort API / JavaMail API / 네이버로그인 API / 카카오로그인 API / GoogleMap API

<br>

## 4.분석 및 설계 과정 :bar_chart:
1. 주제 선정

    2.1. 업무 분석 : Use Case Modeling
        2.1.1 현업 요구사항 정의서 작성  
        2.1.2 요구사항 추적표 작성
        2.1.3 Use Case 유형정의 작성    
        2.1.4 Use Case Diagram 작성    
        2.1.5 Use Case 정의서 작성
    
    2.2. 업무 분석 : Application Modeling
        2.2.1 Class Diagram 작성    
        2.2.2 VOPC(View Of Participating Class) Diagram 작성

    2.3. 화면 분석
        2.3.1 화면 정의서 작성

    2.4. 데이터 분석(Logical)
        2.4.1 ERD(Logical) 작성
        
    3.1 업무 분석 : Application Modeling 
        3.1.1 설계표준 정의
        3.1.2 Class Diagram 작성
        3.1.3 VOPC(View Of Participating Class) Diagram 작성

    3.2 화면 분석
        3.2.1 화면 정의서 

    3.3 데이터 분석(Physical)
        3.3.1 ERD(Physical) 작성
        3.3.2 테이블 목록 작성
        3.3.3 테이블 정의서 작성

<br>

## 5.추가 학습 :pencil2:
### **⚡️ AWS 이용한 배포 [(Euroverse 바로가기)](http://13.125.136.145:8080/)**  
학원 수료 후 AWS를 이용해 배포를 해보았습니다. 아마존 **EC2**의 **인스턴스**를 2개 생성하여 각각 **웹 서버와 MongoDB**를 설치하였고, 아마존 **RDS**를 이용하여 Oracle 12를 설정했습니다. 각 인스턴스끼리 연동을 한 뒤 **탄력적 IP**를 생성하여 고정 IPv4 주소를 연결했습니다. 현재(2020/04/24) 셀레늄 구동을 완성하지 못해 항공권 검색과 숙소 검색 기능은 작동하지 않습니다.

<br>

## 6.참고 사항 :interrobang:
문서:[포토폴리오(유럽여행플랜커뮤니티홈페이지).pdf](https://github.com/zi-seong/euroverse/files/4543568/default.pdf)
<br>
[발표영상](https://youtu.be/xGH5Dzj8rAY)
