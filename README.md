# :trolleybus: 유로버스 :trolleybus:

[![euroverseMAIN](https://user-images.githubusercontent.com/57661883/77535422-ee1e1c80-6edd-11ea-8aad-bfdfd6ceaf36.png)](http://15.165.109.175:8080/main.jsp)
###### 이미지를 클릭하면 홈페이지로 이동합니다.      
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
### :one: 로그인
<p>bootstrap 의 modal 을 사용하여 메인 페이지에서 로그인텍스트를 클릭하면 출력됩니다.ajax 를 사용하여 일치하는 회원이 없는경우 , 회원탈퇴한 회원이 로그인을 누르면 sweetalert 이 출력됩니다.아이디찾기와 비밀번호찾기 페이지로 이동할 수 있으며 naver,kakao,google sns계정으로 로그인하거나 되있으면 간단한 회원가입페이지로 이동할 수 있습니다.</p> 
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/81904667-898a5e80-95fe-11ea-917e-60d1421eb3e9.PNG" width="250" height="200">
</p>


### :two: 아이디찾기 비밀번호찾기
<p>첫 단계에서는 이름, 핸드폰, 아이디(비밀번호 찾기)를 입력하고 찾기를 하면 일치하는 회원의 아이디(아이디 찾기) 3글자만 보여주고 뒤에는 *로 표시한다 ( ex=jis*****) 그리고 인증을 누르면 입력한 핸드폰 번호 또는 이메일로 청기와 랩, 자바 메일 api를 사용하여 인증번호를 발송하고 일치하는 인증번호를 입력하면 아이디 찾기는 *이 사라진 아이디를 확인할 수 있고 비밀번호 찾기는 비밀번호 변경을 하게 된다.</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/81902127-93aa5e00-95fa-11ea-9d4b-7b790a0a1558.PNG" width="250" height="200"> 
<img src="https://user-images.githubusercontent.com/57661883/81907969-83e34780-9603-11ea-828b-cced5d8e049e.PNG" width="250" height="200"> 
</p>

### :three: 회원가입

<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/81902150-9e64f300-95fa-11ea-93b8-b8c35cc49182.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/81902155-9f962000-95fa-11ea-9141-bbc0abbbd48a.PNG" width="250" height="200">
</p>
  
### :four: 마이페이지
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/81902179-a91f8800-95fa-11ea-9494-ab7f611e8e98.PNG" width="250" height="200">
</p>

### :five: 게시판(포인트 사용 내역,나의 게시글/댓글,나의 북마크,플래너 초대,내가 찜한 상품,1:1문의)
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/81902885-d7519780-95fb-11ea-85c5-ee4193ba2e1b.PNG" width="250" height="200">
</p>

### :six: 중복 로그인 방지
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/81902896-da4c8800-95fb-11ea-89f0-780748ba4e0b.PNG" width="250" height="200">
</p>


       

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

### :two: 분석(UseCase유형정의 , UseCase정의서 , 요구사항추적표 , VOPC , ERD , 화면정의서)
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/79183402-5791ab00-7e4c-11ea-9a8c-77c7d48d620c.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183409-5d878c00-7e4c-11ea-9f9b-9d6bc98245f5.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183418-62e4d680-7e4c-11ea-9b49-16630bd4dbb7.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183433-6a0be480-7e4c-11ea-8eec-4f0054dcc9d0.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79183440-7001c580-7e4c-11ea-8f01-d8baf949c691.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79184002-008cd580-7e4e-11ea-9f7a-7703c67ff386.png" width="250" height="200">
</p>


### :three: 설계(VOPC , ERD , 테이블정의서)
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/79184144-4e094280-7e4e-11ea-87a8-c00eab661306.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79184154-52356000-7e4e-11ea-8007-2df8f193c97f.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/79184158-55305080-7e4e-11ea-8a04-29eaa47068b4.PNG" width="250" height="200">
</p>

### :four: 구현(풀캘린더 이용한 출석체크 , 플래너 초대 동의 코드 , 포인트 리스트 sql(mybatis))
<p align="center">
<img src="https://user-images.githubusercontent.com/57661883/81911962-ebe85c80-9608-11ea-99ea-302567da09c8.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/81911968-ee4ab680-9608-11ea-9549-4dcb615f8cb6.PNG" width="250" height="200">
<img src="https://user-images.githubusercontent.com/57661883/81911972-ee4ab680-9608-11ea-93fc-e62da92bd8a3.PNG" width="250" height="200">
</p>


      

## 5.추가 학습 :pencil2:
### AWS 이용한 배포
학원 수료 후 AWS를 이용해 배포를 해보았습니다. 아마존 **EC2**의 **인스턴스**를 2개 생성하여 각각 **웹 서버와 MongoDB**를 설치하였고, 아마존 **RDS**를 이용하여 Oracle 12를 설정했습니다. 각 인스턴스끼리 연동을 한 뒤 **탄력적 IP**를 생성하여 고정 IPv4 주소를 연결했습니다. 
<br><br>
**(2020/04/24)** 셀레니움 구동을 완성하지 못해 항공권 검색과 숙소 검색 기능은 작동하지 않습니다.
<br>
**(2020/05/02)** EC2의 인스턴스를 프리티어로 하나만 실행해야 무료인건데 두 개의 인스턴스를 동시실행하니 비용이 발생하기에 MongoDB 인스턴스를 중지 하여서 채팅 기능이 실행되지 않습니다.
     

     
            
                   



      
## 6.참고 사항 :interrobang:
**문서**:[포토폴리오(유럽여행플랜커뮤니티홈페이지).pdf](https://github.com/zi-seong/euroverse/files/4543568/default.pdf)      
**영상**:[유튜브 발표영상](https://youtu.be/xGH5Dzj8rAY)
