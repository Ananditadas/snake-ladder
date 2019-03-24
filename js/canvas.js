var cur_position = 0, final_position = 0, dice_face_val, cur_state = 'fact', prev_state = 'fact', solved = 0,
game_started = false, cur_x = 0, cur_y = 495;
var max = 6, min = 1;
var moveTopixel;
var spriteCanvas = document.getElementById("spriteStage");
var c2 = spriteCanvas.getContext('2d');
var boy = new Image();
boy.src = "images/boy.png"
var row = 1;


//-------------------------roll_dice------------------------------------------//
function roll_dice()
{

    dice_face_val = Math.floor(Math.random() * (max - min + 1)) + min;
    console.log(dice_face_val);
    var b = document.getElementById("value");
    b.innerHTML = dice_face_val;


    moveTopixel = dice_face_val * 71;





    if(dice_face_val == 1 && game_started == false)
    {
        game_started = true;
        game_start();
    }



    else if(game_started == true)
    {

        if(prev_state == 'fact')
        {
            cur_state='ques';
            showQuestion();
            move_hero();
        }
        else
        {
            cur_state ='fact';
            showFact();
            move_hero();

        }
        prev_state = cur_state;

    }
}

//----------------------------------------------------------------------------//



//----------------------------Game Start--------------------------------------//
function game_start()
{
    if(prev_state == cur_state)
    {
      showFact();
      place_hero();
    }

}

//----------------------------------------------------------------------------//








//-----------------------------move_hero-------------------------------------//

function move_hero()
{
  c2.clearRect(cur_x, cur_y, 64, 64);
  var w = spriteCanvas.width;

  if((row % 2) != 0)
  {

        if((cur_x + moveTopixel) >= w)
        {
          cur_y -= 56;
          var diff = w - cur_x;
          row++;
          moveTopixel = moveTopixel - diff + 56;
          cur_x = w;
          cur_x = cur_x - moveTopixel;

        }
        else
        {
            cur_x  = cur_x + moveTopixel;
        }
  }
  else
  {

        if((cur_x - moveTopixel) <= 0)
        {
          console.log(cur_x - moveTopixel);
          cur_y -= 56;
          row++;
          moveTopixel = moveTopixel - cur_x - 56;
          cur_x = 0;
          cur_x = cur_x + moveTopixel;
        }
        else
        {
            cur_x  = cur_x - moveTopixel;
        }

  }

  c2.drawImage(boy, cur_x, cur_y, 64, 64);

}
//---------------------------------------------------------------------------//







//-----------------------------showFact---------------------------------------//

function showFact()
{
  console.log("fact is shown");
  $("#showq").hide();
  $("#btn").hide();

  $("#showf").show();

  $("#ok").click(function(){
    $("#showf").hide();
    $("#btn").show();
  })
}


//----------------------------------------------------------------------------//










//---------------------------place_hero--------------------------------------//
function place_hero()
{
  c2.drawImage(boy, cur_x, cur_y, 64, 64);
}









//---------------------------showQuestion-------------------------------------//
var objDiv,ques_item,radioItem1,radioItem2,objTextNode1,objTextNode2,objLabel,objLabel2,br,submit_btn, count_times = 0, score = 0;

function showQuestion()
{
  console.log("question is shown");
  objDiv = document.getElementById("opt");
  ques_item = document.createElement("p");
  ques_item.innerHTML = "Is abc??";
  $(objDiv).append(ques_item);
  radioItem1 = document.createElement("input");


  radioItem1.type = "radio";
  $(radioItem1).addClass("option-input radio");

  radioItem1.name = "optn";
  radioItem1.id = "rad1";
  radioItem1.value = "yes";
  radioItem1.defaultChecked = true;
  radioItem1.checked = true;


  radioItem2 = document.createElement("input");
  radioItem2.type = "radio";
  $(radioItem2).addClass("option-input radio");
  radioItem2.name = "optn";
  radioItem2.id = "rad2";
  radioItem2.value = "no";

  objTextNode1 = document.createTextNode("Yes");
  objTextNode2 = document.createTextNode("No");

  objLabel = document.createElement("label");
  objLabel.htmlFor = radioItem1.id;
  objLabel.appendChild(radioItem1);
  objLabel.appendChild(objTextNode1);

  $(objLabel).css("padding","1rem");

  objLabel2 = document.createElement("label");
  objLabel2.htmlFor = radioItem2.id;
  objLabel2.appendChild(radioItem2);
  objLabel2.appendChild(objTextNode2);
  $(objLabel2).css("padding","1rem");

  objDiv.appendChild(objLabel);
  objDiv.appendChild(objLabel2);




  br = document.createElement("br");
  objDiv.appendChild(br);
  submit_btn = document.createElement("input");
  submit_btn.type = "submit";
  submit_btn.value = "submit";
  submit_btn.id = "sbmt";
  submit_btn.addEventListener("click",getResponse,false);
  $(submit_btn).css({"margin-top" : "1rem", "text-transform": "uppercase"});

  objDiv.appendChild(submit_btn);

  $("#showf").hide();
  $("#btn").hide();
  $("#showq").show();





 $('#countdown-11').timeTo(30,function(){
  swal('Your time is finished');
		$("#showq").hide();
   $("#btn").show();
  });
  count_times = count_times + 1;
}

//----------------------------------------------------------------------------//






//---------------get_response------------------------------------------------//
function getResponse()
{
    response_ans = $("input[name='optn']:checked").val();
    console.log(response_ans);

    $("#countdown-11").stop();
    $(ques_item).remove();
    $(radioItem1).remove();
    $(radioItem2).remove();
    $(objTextNode1).remove();
    $(objTextNode2).remove()
    $(objLabel).remove();
    $(objLabel2).remove();
    $(br).remove()
    $(submit_btn).remove();

    $("#showq").hide();

    if(count_times != 4)
    {
        if(response_ans == "no")
        {

            showQuestion();
            $("#countdown-11").stop();
        }
        else
        {
            swal("correct answer");
            $("#countdown-11").stop();
            score = score + 1;
            $("#score").text(score);
            $("#btn").show();
        }
    }
    else
    {
        swal("You have exceeded number of attempts");
        $("#countdown-11").stop();
    }
}

//----------------------------------------------------------------------------//




// wait until DOM is ready
document.addEventListener("DOMContentLoaded", function(event) {

  function ground() {

    var tl = new TimelineMax({
      repeat: -1
    });

    tl.to("#ground", 20, {
        backgroundPosition: "1301px 0px",
        force3D:true,
        rotation:0.01,
        z:0.01,
        autoRound:false,
        ease: Linear.easeNone
      });

    return tl;
  }

  function clouds() {

    var tl = new TimelineMax({
      repeat: -1
    });

    tl.to("#clouds", 52, {
      backgroundPosition: "-2247px bottom",
      force3D:true,
      rotation:0.01,
      z:0.01,
      //autoRound:false,
      ease: Linear.easeNone
    });

    return tl;
  }

  var masterTL = new TimelineMax({
    repeat: -1
  });

  // window load event makes sure image is
// loaded before running animation
window.onload = function() {

  masterTL
  .add(ground(),0)
  .add(clouds(),0)
  .timeScale(0.7)
  .progress(1).progress(0)
  .play();



  var mycanvas = document.getElementById("board");

//for high definition canvas
  var dpr = window.devicePixelRatio || 1;
  var rect = mycanvas.getBoundingClientRect();
  mycanvas.width = rect.width * dpr;
  mycanvas.height = rect.height * dpr;

  var c = mycanvas.getContext('2d');
  c.scale(dpr, dpr);


  //for high definition canvas
    var dpr = window.devicePixelRatio || 1;
    var rect = spriteCanvas.getBoundingClientRect();
    spriteCanvas.width = rect.width * dpr;

    spriteCanvas.height = rect.height * dpr;
    var c2 = spriteCanvas.getContext('2d');
    c2.scale(dpr, dpr);





//-------------------------------rendering the board--------------------------//
  var x = 0,y = 0;
  var loop = 0;

  for(var i=0;i < mycanvas.width;i += 71)
  {
    var column = true;
    for(var j=0;j< mycanvas.height;j += 56)
    {

      if(loop % 2 == 0)
      {
        if(column == true)
        {
          c.fillStyle = "#33a842";
        }
        else {
          c.fillStyle = "#503838";
        }
      }
      else
      {
        if(column == true)
        {
          c.fillStyle = "#503838";
        }
        else {
          c.fillStyle = "#33a842";
        }

      }
      c.fillRect(i,j,71,56);

      column = !column;

    }
    loop++;
  }
//----------------------------------------------------------------------------//





//----------------------------rendering the numbers---------------------------//

  var x = 1; var loop = 0;
  for(var j=mycanvas.height; j> 0; j -= 56)
  {
      if(loop % 2 == 0)
      {
        for(var i=0; i< mycanvas.width; i += 71)
        {
          c.font = "20px Comic Sans MS";
          c.fillStyle = "white";
          c.fillText(x,i+20, j-12);
          x++;
        }
      }
      else
      {
        for(var i=mycanvas.width; i>0 ; i -= 71)
        {
          c.font = "9px";
          c.fillStyle = "white";
          c.fillText(x,i-50, j-12);
          x++;
        }
      }
      loop++;
  }
//----------------------------------------------------------------------------//




//-------------------------Addding snake and ladder--------------------------//
  var img = document.getElementById("ladder1");
  c.drawImage(img, 150, 425,50,120);
  var s = document.getElementById("snake1");
  c.drawImage(s, 10, 30, 100, 100);
  var s1 = document.getElementById("snake2");
  c.drawImage(s1, 550, 320, 100, 100);



};

});
