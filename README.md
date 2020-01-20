# KITRI_Best

## BestShop

## demo
### 개요
spring boot와 MariaDB, jsp 연동시킨 게시판 (수정 중)
### 개발 환경
1. Eclipse
2. Java </br>
  jdk1.8 </br>
  jre 1.8
3. MariaDB </br>
  version 10.2

### 실행 방법
1. spring boot로 실행
2. localhost:8080/main.html 접속
3. signin 에서 회원가입 폼 작성까지
4. testdb 의 members 테이블 검색하여 확인

### 참고사항
1. testdb 의 members 테이블에 회원가입 정보 저장까지 구현
2. members 테이블 임시 구현 내용은 아래와 같음
> MariaDB에서 생성한 테이블  
> create table members( 
	name varchar(20) not null, 
	gender varchar(30) , 
	age varchar(30), 
	phone varchar(30), 
	address varchar(30), 
	email varchar(30), 
	ID varchar(30) primary key, 
	pwd varchar(30), 
	likeit   varchar(30), 
	agree  varchar(30), 
	agree2 varchar(30) 
);
3. html에서 form 이용하여 signin.jsp로 데이터 넘긴 후 sign.jsp에서 직접 데이터베이스에 삽입
