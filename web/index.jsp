<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html" ; charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>HRTF LAB</title>


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

    <script type="text/javascript" src="js/hrtf.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/controller.js"></script>

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
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">3D SOUND LAB</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MENU
                        <span class="caret"></span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<h1 class="center-block" style="width:500px; padding:15px;">BETTING VOLUME DEMO</h1>

<div class="col-sm-12">
    <div>
        <audio id="player" src="/audio/snow.mp3" loop="loop" autoplay="autoplay">
            Your browser does not support the audio element. Sorry.
        </audio>
        <div class=" col-sm-5 music-player">
            <div class="control col-sm-12">
                <div class="col-sm-4">
                    <img class="play-btn" id="play-btn" src="/img/play.png"/>
                    <img class="pause-btn" id="pause-btn" src="/img/pause.png"/>
                </div>
                <p class="col-sm-8" id="vol"></p>
            </div>
            <form id="gamble" class="col-sm-12">
                <input type="number" id="bet-vol" min="0" max="0"/>
                <img class="bet" id="start" src="/img/bet.png"/>
            </form>

            <div id="rock-scissor-paper" class="col-sm-12" type="hidden">
                <div class="col-sm-12">
                    <img class="user" src="/img/rock.PNG" id="rock" onclick="rockScissorsPaper(0)">
                    <img class="user" src="/img/scissors.PNG" id="scissors" onclick="rockScissorsPaper(1)">
                    <img class="user" src="/img/paper.PNG" id="paper" onclick="rockScissorsPaper(2)">
                </div>
            </div>

            <div id="result" class="col-sm-12" type="hidden">

                <img class="result" id="user">
                <img src="/img/vs.png" width="50" height="40">
                <img class="result" id="com">
            </div>

        </div>
    </div>

    <br/>
</div>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous"></script>

<style>
    .play-btn{
        width: 60px;
        height: 60px;
    }

    .play-btn:hover{
        opacity: 0.8;
    }

    .pause-btn{
        width: 60px;
        height: 60px;
    }

    .pause-btn:hover{
        opacity: 0.8;
    }


    .music-player {
        background: #fff9c4;
    }

    .button {
        background: #fff9c4;
    }

    .result {
        width: 60px;
        height: 60px;
    }

    .user {
        width: 60px;
        height: 60px;
    }

    .user:hover {
        opacity: 0.5;
    }

    .bet {
        width: 30px;
        height: 30px;
    }

    .bet:hover {
        opacity: 0.5;
    }
</style>

<script>
    var player = document.getElementById('player');
    player.volume = 0.1;

    var figures = ["rock.PNG", "scissors.PNG", "paper.PNG"];

    var bet = 0;

    function showGame() {
        if ($('#gamble').is($('#gamble').show())) {
            $('#gamble').hide();
        }

        if ($('#rock-scissor-paper').is($('#rock-scissor-paper').hide())) {
            $('#rock-scissor-paper').show();
        }
    }
    function hideGame() {
        if ($('#rock-scissor-paper').is($('#rock-scissor-paper').show())) {
            $('#rock-scissor-paper').hide();
        }

        if ($('#gamble').is($('#gamble').hide())) {
            $('#gamble').show();
        }
    }


    function showResult(user, com) {
        $('#user').attr('src', '/img/' + figures[user]);
        $('#com').attr('src', '/img/' + figures[com]);

        if ($('#result').is($('#result').hide())) {
            $('#result').show(1000);
        }
    }

    function hideResult() {
        if ($('#result').is($('#result').show())) {
            $('#result').hide();
        }
    }

    function setLimit() {
        $('#bet-vol').attr('max', (player.volume * 100).toString());
        $('#bet-vol').val('0');
    }

    function showVolume() {
        var vol = player.volume * 100;
        $('#vol').html("Volume : " + parseInt(vol));
    }

    $(document).ready(function () {
        hideGame();
        setLimit();
        hideResult();
        showVolume();
        $('#play-btn').hide();

        $('#start').click(
            function () {
                hideResult();
                bet = Number($('#bet-vol').val());
                showGame();
            }
        );

        $('#play-btn').click(
            function(){
                player.play();
                $('#pause-btn').show();
                $('#play-btn').hide();
            }
        )

        $('#pause-btn').click(
            function(){
                player.pause();
                $('#pause-btn').hide();
                $('#play-btn').show();
            }
        )
    });


    function rockScissorsPaper(userVal) {
        var comVal = Math.floor(Math.random() * 3);
        if (userVal === comVal) {
            draw();
        } else if ((userVal + 1) % 3 === comVal) {
            victory();
        } else {
            defeat();
        }

        setLimit();
        showVolume();
        hideGame();
        showResult(userVal, comVal);
    }

    function victory() {
        player.volume = ((player.volume * 100 + bet) % 100) / 100;
    }

    function draw() {
    }

    function defeat() {
        if (player.volume * 100 - bet <= 0) {
            player.volume = 0;
        } else {
            player.volume = ((player.volume * 100 - bet) % 100) / 100;
        }
    }
</script>
</body>
</html>