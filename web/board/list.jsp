<%--
  Created by IntelliJ IDEA.
  User: znxkz
  Date: 2017-05-17
  Time: 오후 1:30
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>

<%
    Connection conn = null;                                        // null로 초기화 한다.

    try{
        String url = "jdbc:mysql://localhost:3306/hrtf";        // 사용하려는 데이터베이스명을 포함한 URL 기술

        String id = "admin";                                                    // 사용자 계정
        String pw = "Rladud8292!@#";                                            // 사용자 계정의 패스워드

        int total = 0;

        Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.

        System.out.println("제대로 연결되었습니다.");                            // 커넥션이 제대로 연결되면 수행된다.

        Statement stmt = conn.createStatement();
        String sqlCount = "SELECT COUNT(*) FROM board";
        ResultSet rs = stmt.executeQuery(sqlCount);


        if(rs.next()){
            total = rs.getInt(1);
        }
        rs.close();
        System.out.print("total : " + total);

        String sqlList = "SELECT * FROM board";
        rs = stmt.executeQuery(sqlList);

%>


<html lang="ko">

<head>
    <meta http-equiv="content-type" content="text/html" ; charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>HRTF BOARD</title>


    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index.jsp">HTRF LAB</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MENU
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li class="divider"></li>
                        <li><a href="/board/list.jsp">BOARD</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="col-md-12">
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th style="width:10%">#</th>
            <th style="width:15%">id</th>
            <th style="width:50%">name</th>
            <th style="width:15%">date</th>
            <th style="width:10%">views</th>
        </tr>
        </thead>

        <% if(total == 0){
            %>
        <tr>
            <td colspan = "5">등록된 글이 없습니다.</td>
        </tr>


        <%
        }else{
            while(rs.next()){
                int _id = rs.getInt(1);
                String name = rs.getString(2);
                String date = rs.getString(3);
                int views = rs.getInt(4);%>


        <tr>
            <td style="width:10%"><%= id%></td>
            <td style="width:15%"><%= id%></td>
            <td style="width:50%"><%= name%></td>
            <td style="width:15%"><%= date%></td>
            <td style="width:10%"><%= views%></td>

        </tr>

        <%}
        }%>


    </table>
</div>

<div class="raw pull-right">
    <button type="button" class="btn btn-default" onclick="location.href='view.jsp'" style="margin-right:50px" >
        Write</button>
</div>

<%
    }catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
        System.out.println("제대로 연결되지 않았습니다.!!!");
        e.printStackTrace();
    }
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
