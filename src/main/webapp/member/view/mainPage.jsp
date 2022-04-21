<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <title>메인페이지 | JavaBooks</title>

  <link rel="stylesheet" href="mainPage.css" />
</head>

<body>
  <header>
    <div class="menu">
      <a href="../JoinForm.jsp">회원가입</a>
      <a href="../LoginForm.jsp">로그인</a>
      <a href="">마이페이지</a>
      <a href="">Q n A</a>
    </div>
  </header>

  <hr>

  <h1 class="logo"><a href="../mainPage.jsp">JavaBooks</a></h1>

  <section>
    <nav>
      <h3>카테고리</h3>
      <hr>
      <div><a href="">자기계발</a></div>
      <div><a href="">소설</a></div>
    </nav>

    <article>
      <h1>베스트셀러</h1>
      <hr>
      <div><a href="">자기계발</a></div>
      <br />
      <a href="">
        <img src="https://cdn.pixabay.com/photo/2015/06/11/00/55/book-805405_960_720.png" width="100px"
          height="100px"></a>
      <a href="">
        <img src="https://cdn.pixabay.com/photo/2015/06/11/00/55/book-805405_960_720.png" width="100px"
          height="100px"></a>
      <a href="">
        <img src="https://cdn.pixabay.com/photo/2015/06/11/00/55/book-805405_960_720.png" width="100px"
          height="100px"></a>
      <hr />
      <div><a href="">소설</a></div>
      <br />
      <a href="">
        <img src="https://cdn.pixabay.com/photo/2015/06/11/00/55/book-805405_960_720.png" width="100px"
          height="100px"></a>
      <a href="">
        <img src="https://cdn.pixabay.com/photo/2015/06/11/00/55/book-805405_960_720.png" width="100px"
          height="100px"></a>
      <a href="">
        <img src="https://cdn.pixabay.com/photo/2015/06/11/00/55/book-805405_960_720.png" width="100px"
          height="100px"></a>
    </article>

    <aside>
      <div>
        책 검색하기<br>
        <input type="search">
        <input type="button" value="검색">
        <br>
      </div>
      <div>
        <a href="">
          <img src="https://cdn.pixabay.com/photo/2017/01/28/19/06/label-2016248_960_720.png" width="200px"
            height="200px"></a><br>
        <a href="">
          <img src="https://cdn.pixabay.com/photo/2017/01/28/19/06/label-2016248_960_720.png" width="200px"
            height="200px"></a><br>
        <a href="">
          <img src="https://cdn.pixabay.com/photo/2017/01/28/19/06/label-2016248_960_720.png" width="200px"
            height="200px"></a>
      </div>
    </aside>
  </section>

  <hr>

  <footer>
    <h1>JavaBooks</h1>
    <div>
      상호명 : JavaBooks<br>
      주소 : 천안시 동남구 대흥동<br>
      Copyright JavaBooks Inc. All Rights Reserved.
    </div>
  </footer>
</body>

</html>
