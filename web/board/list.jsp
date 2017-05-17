<%--
  Created by IntelliJ IDEA.
  User: znxkz
  Date: 2017-05-17
  Time: ���� 1:30
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>

<%
    Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.

    try{
        String url = "jdbc:mysql://localhost:3306/hrtf";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���

        String id = "admin";                                                    // ����� ����
        String pw = "Rladud8292!@#";                                            // ����� ������ �н�����

        int total = 0;

        Class.forName("com.mysql.jdbc.Driver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager ��ü�κ��� Connection ��ü�� ���´�.

        System.out.println("����� ����Ǿ����ϴ�.");                            // Ŀ�ؼ��� ����� ����Ǹ� ����ȴ�.

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
    <!-- �� 3���� ��Ÿ �±״� *�ݵ��* head �±��� ó���� �;��մϴ�; � �ٸ� ���������� �ݵ�� �� �±׵� *������* �;� �մϴ� -->
    <title>HRTF BOARD</title>


    <!-- �������� �ּ�ȭ�� �ֽ� CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- �ΰ����� �׸� -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- IE8 ���� HTML5 ��ҿ� �̵�� ������ ���� HTML5 shim �� Respond.js -->
    <!-- WARNING: Respond.js �� ����� file:// �� ���� �������� �� ���� �������� �ʽ��ϴ�. -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->

    <!-- �ΰ����� �׸� -->
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
            <td colspan = "5">��ϵ� ���� �����ϴ�.</td>
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
    }catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
        System.out.println("����� ������� �ʾҽ��ϴ�.!!!");
        e.printStackTrace();
    }
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
