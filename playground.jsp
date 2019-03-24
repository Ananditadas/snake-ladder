<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/playground.css" />
    <link rel="stylesheet" type="text/css" href="css/timeTo.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.createjs.com/1.0.0/createjs.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
    <script src="js/jquery.timeTo.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        html
        {
            height:100%;
            background:#63D0FF;
        }

        body
        {
            margin:0;
            padding:0;
            background:#63D0FF;
            height:100%;
        }

        #wrapper
        {
            position:relative;
            width:100%;
            height:100%;
        }

        #clouds
        {
            background:url("images/bg-clouds2-tinypng.png") repeat-x 0 bottom #ACE6FF;
            width:100%;
            height:230px; /*190px*/
            min-height:230px;
            position:absolute;
            top:0;
            left:0;
            z-index:1;
            -webkit-transform:translate3d(0,0,0.01);
            transform:translate3d(0,0,0.01);
        }

        #ground
        {
            background:url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/56901/grass_tile-tinypng.png") repeat-x 0 0 transparent;
            position: absolute;
            bottom: 0;
            left: 0;
            z-index:2;
            width: 100%;
            height: 140px;
            min-height:140px;
            border:0 none transparent;
            outline:0 none transparent;
            -webkit-transform:translate3d(0,0,0.01);
            transform:translate3d(0,0,0.01);
            will-change: transform;
        }
    </style>
  </head>





  <body>
    <div class="constainer-fluid">
      <div class="wrapper">
        <div id="clouds"></div>
        <br /><br /><br />




          <div id="Game_Elements">
                  <canvas id="board"></canvas>
                  <canvas id="spriteStage"></canvas>
                  <script src="js/canvas.js"></script>

                  <img id="ladder1" src="images/ladder1.png" style="display:none;">
                  <img id="snake1" src="images/snake1.png" style="display:none;">
                  <img id="snake2" src="images/snake2.png" style="display:none;">
                  <audio id="my_audio" src="music/sound.mp3" loop="loop"></audio>


                  <div id="show">
                      <div id="showq">
                        <div id="countdown-11"></div>
                        <div id="opt"></div>
                      </div>

                      <div id="showf">
                        <button id="ok">Ok</button>
                      </div>

                      <div id="dice-body"><h3 id="value"></h3></div>
                      <button id="btn" onclick="roll_dice()">ROLL</button>

                  </div>
        </div>







        <br /><br /><br />
          <div id="ground"></div>
      </div>
    </div>

  </body>

</html>
