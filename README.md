# :trolleybus: 유로버스 :trolleybus:

[![euroverseMAIN](https://user-images.githubusercontent.com/57661883/77535422-ee1e1c80-6edd-11ea-8aad-bfdfd6ceaf36.png)](https://youtu.be/2Q8ZXSbwx8Q)
###### 이미지를 클릭하면 구현영상을 볼 수 있습니다.      
* * *
# :bookmark: 목차

1.[개요](https://github.com/zi-seong/euroverse/blob/master/README.md#1개요-smiley)    
2.[담당 모듈](https://github.com/zi-seong/euroverse/blob/master/README.md#2담당-모듈-dart)     
3.[의존성 및 버전 정보](https://github.com/zi-seong/euroverse/blob/master/README.md#3의존성-및-버전-정보-two_men_holding_hands)    
4.[분석 및 설계 과정](https://github.com/zi-seong/euroverse/blob/master/README.md#4분석-및-설계-과정-bar_chart)     
5.[추가 학습](https://github.com/zi-seong/euroverse/blob/master/README.md#5추가-학습-pencil2)     
6.[참고 사항](https://github.com/zi-seong/euroverse/blob/master/README.md#6참고-사항-interrobang)     





## 1.개요 :smiley:
+ 총 개발 기간 : 2개월  
    + 분석 및 설계 : 2020/01/01 ~ 2020/01/23  
    + 구현 : 2020/01/24 ~ 2020/03/07  
+ 총 개발 인원 : 6명  
+ 시스템 개요 : MVC2 모델을 기반으로 스프링 프레임워크를 이용하여 만든 유럽 여행 플래너 및 커뮤니티 사이트입니다. 크게 회원 관리, 주문 관리, 플래너, 커뮤니티, 채팅 및 알람 모듈로 구성되어 있습니다.
<br>

## 2.담당 모듈 :dart:

회원관리     


       

## 3.의존성 및 버전 정보 :two_men_holding_hands:
+ Laguage : Java    
+ Back-end : Spring Framework 4.0.1 / MyBatis / Apache Tomcat / Selenium
+ Front : HTML5 / BootStrap 4 / CSS3 / jQuery / Ajax / JSP
+ Database : Oracle 10g / MongoDB 3.6.1  
+ VCS tool : GitHub  
+ IDE : Eclipse  
+ Open Source : Sweetalert / FullCalendar / SummerNote / Owl carousel / AOS / Swiper / Foreign exchange rates API / 공공데이터포털API / 청기와 LAB / I'mPort API / JavaMail API / 네이버로그인 API / 카카오로그인 API / GoogleMap API

      
## 4.분석 및 설계 과정 :bar_chart:
###  :one: 주제선정(현업 요구사항 정의서,Problem Statement)
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/79181404-3da19980-7e47-11ea-9589-d28be24ae36f.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79181678-e7812600-7e47-11ea-9c82-04c73627bbae.PNG" width="250" height="200">
</p>

### :two: 분석
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/79183402-5791ab00-7e4c-11ea-9a8c-77c7d48d620c.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183409-5d878c00-7e4c-11ea-9f9b-9d6bc98245f5.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183418-62e4d680-7e4c-11ea-9b49-16630bd4dbb7.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183433-6a0be480-7e4c-11ea-8eec-4f0054dcc9d0.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183440-7001c580-7e4c-11ea-8f01-d8baf949c691.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79184002-008cd580-7e4e-11ea-9f7a-7703c67ff386.png" width="250" height="200">
</p>
(좌측부터 UseCase유형정의 , UseCase정의서 , 요구사항추적표 , VOPC Diagram , ERD , 화면정의서)

### :three: 설계


### :four: 구현 


      

## 5.추가 학습 :pencil2:
### **⚡️ AWS 이용한 배포 [(Euroverse 바로가기)](http://13.125.136.145:8080/)**  
학원 수료 후 AWS를 이용해 배포를 해보았습니다. 아마존 **EC2**의 **인스턴스**를 2개 생성하여 각각 **웹 서버와 MongoDB**를 설치하였고, 아마존 **RDS**를 이용하여 Oracle 12를 설정했습니다. 각 인스턴스끼리 연동을 한 뒤 **탄력적 IP**를 생성하여 고정 IPv4 주소를 연결했습니다. 현재(2020/04/24) 셀레늄 구동을 완성하지 못해 항공권 검색과 숙소 검색 기능은 작동하지 않습니다.

      
## 6.참고 사항 :interrobang:
문서:[포토폴리오(유럽여행플랜커뮤니티홈페이지).pdf](https://github.com/zi-seong/euroverse/files/4543568/default.pdf)      
영상:[유튜브 발표영상](https://youtu.be/xGH5Dzj8rAY)
