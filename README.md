
ET Planner (Europe Travel Planner)
===================
This project is Web Application for Europe Traveler. 
You can make a plan using this app through the Google Map.

----------

<i class="icon-info"></i> about
-------------
유럽 여행을 꿈꾸는 사람들을 위한 지도 기반 여행 플랜 작성 사이트입니다. \
웹 애플리케이션(Web Application) 형태이며 웹 과정을 공부중인 학생의 프로젝트로 현재 운영되는 사이트는 아닙니다. 


- 일반회원, 제휴회원, 관리자를 위한 페이지가 개별적으로 존재하고 
각 회원들은 자신들에게 제공하는 서비스를 이용합니다. 

- 일반 회원들은 지도 위에서 가시적으로 유럽 여행(루트/일정)을 짜고 저장,관리할 수 있습니다. \
또한 다른 회원들이 작성한 플랜을 서로 공유하고 스크랩/좋아요할 수 있으며, \
좋아요 수가 많은 플랜일 경우 인기플랜으로 선정됩니다. \
 그 외에 제휴 회원이 올린 투어글을 확인할 수 있고 여행관련 질문들을 서로 답할 수 있는 Q&A공간도 마련되어 있습니다. 

- 제휴 회원은 관리자에게 제휴문의를 남기고 제휴가 이뤄졌을 시 자신들이 운영하고 있는 투어 상품을 직접 홍보할 수 있습니다. 
제휴 회원이 올린 투어글은 일반 회원이 바로 확인할 수 있으며 투어글 클릭 시 제휴사 페이지로 이동합니다.

- 관리자는 회원관리, 여행지관리, 플랜관리, 제휴사 관리 등 사이트의 모든 서비스를 관리할 수 있습니다. 


----------


  
<i class="icon-folder-open"></i> Directory 
-------------

**MVC 패턴 Model2 방식으로 구현하였습니다. ** 
```
ET PLANNER(REPO NAME : ET_VIEW)
│   README.md
│
└─  src
│    └──  com.kh.et
│    │      └── controller
│    │      └── model
│    │
│    └──  sql
│            └── driver.properties 
│            └── query.properties
│     
│     
└── web
      │
      └──  views
      │       └── view.jsp
      │       └── style.css
      │       └── event.js
      │ 
      └── image
      └──  profileUpload
      └──  tourUpload

```
- src : controller, vo, model, sql 저장 
- sql : jdbc 설정 및 쿼리문 저장
- web-first.jsp : 시작페이지로 forward
- web-index.jsp : 시작페이지 (회원 메인페이지) 
- web-views : 모든 view 페이지 
- web-image : 공통으로 사용되는 이미지
- web-profileUpload : 회원 프로필 이미지
- web-tourUpload : 투어글 대표 이미지


- startPage \
<b>localhost:port/et/first.jsp </b> 



---------
<i class="icon-cog"></i> Using
-------------
<b>API </b> 
- Google map api 
- Kakao login api 
- Naver login api 
- Import payment api
  
<b>Library </b> 
- FullCalendar v1.4.7 (http://arshaw.com/fullcalendar/)
- cos
- Gson-2.6.2
- Json-simple-1.1
- javax.mail
- jsoup-1.7.3
- ojdbc6




Database Model
-----------


![enter image description here](https://lh3.googleusercontent.com/-Tq2zjNbS9-4/XHyCxKc2X4I/AAAAAAAACpk/sLwppaUi0oAbBTQLm2V3KA_2xcWMeBJdwCLcBGAs/s0/etmodel.png "etmodel.png")




