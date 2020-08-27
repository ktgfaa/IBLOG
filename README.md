
# IBLOG Web Page Project
- IBLOG는 개인블로그 사이트 입니다.
- 회원가입 후 본인이 원하는 주제,스킨에 맞게 블로그를 만들 수 있습니다.
- 다른 사람의 블로그도 검색해서 볼 수 있습니다.(미완성)
- 인기 블로그를 한눈에 볼 수 있습니다.(미완성)



#### 블로그 만들기
![image](https://user-images.githubusercontent.com/57380730/91409674-b0ecfa80-e880-11ea-9002-249d7e5506d4.png)


#### 카테고리 만들기
![image](https://user-images.githubusercontent.com/57380730/91409681-b64a4500-e880-11ea-86bd-9e534b0b81b0.png)


#### 글쓰기
![image](https://user-images.githubusercontent.com/57380730/91409688-b9453580-e880-11ea-9902-fd8b55d4a3fc.png)


#### 완성된 블로그 메인페이지
![image](https://user-images.githubusercontent.com/57380730/91409696-bc402600-e880-11ea-82e1-de30a71a5f7e.png)



## 테스트 환경
>  <pre><code>Eclipse IDE + Tomcat 9V + Java 1.8V + Maven 4.0V</code></pre>
>  <pre><code>Spring Framwork 5.2.1.Release + Tiles 3.0.8V + Mybatis 3.1V</code></pre>
>  <pre><code>Spring Security 5.2.1.Release</code></pre>
>  <pre><code>JDBC 19.1.0.2.0V + Oracle Database 19c</code></pre>


## 기능
- 회원가입,로그인
- 아이디,비밀번호 찾기
- 휴먼계정 인증
- 블로그 만들기,수정,삭제
- 카테고리 만들기,수정,삭제
- 글쓰기,수정,삭제
- 스킨
- 검색(미완성)
- 인기글(미완성)

## 실행하기

 1. 프로젝트 다운

 2. Database 생성

 3. 프로젝트에 포함되어 있는 iblog.sql 파일로 테이블 만들기 및 기본 자료 넣기

 4. 본인 버전에 맞는 jdbc 설치
 
 5. WEB-INF > config > jdbc > jdbc.properties 파일 본인 정보에 맞게 수정
 
 6. 실행
 
 8. 접속(http://localhost:8080/iblog/main.do,메인페이지) 
