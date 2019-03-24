<%-- 
    Document   : canvas
    Created on : 2 Mar, 2019, 11:52:32 PM
    Author     : MANDIRA CHAUDHURI
--%>

<%@page contentType="text/javascript" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONArray,org.json.JSONException"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
            int count=0;
            ArrayList<String> ar=new ArrayList<String>();
            String url="jdbc:mysql://localhost:3306/game";
            String username="root";
            String password="user";
            String sql="select ques,correct_ans,opt,opt2 from game.question a join game.option b  on a.q_id=b.Q_id where class=5";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,username,password);
            Statement st=con.createStatement();
            
            ResultSet rs= st.executeQuery(sql);
            
            while(rs.next())
            {
                String q_a=rs.getString("ques")+":"+rs.getString("correct_ans")+":"+rs.getString("opt")+","+rs.getString("opt2");
                //out.println(ques+"\n");
                ar.add(q_a);
                count=count+1;
            }
            JSONArray jsarray= new JSONArray(ar);

        %>



//----------------Script----------------------//
var cur_position = 0, final_position = 0, dice_face_val=0, cur_state = 'fact', prev_state = 'fact', solved = 0,
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
   // console.log("withinrolldice function");
    
    /*dice_face_val = Math.floor(Math.random() * (max - min + 1)) + min;
    console.log(dice_face_val);
    var b = document.getElementById("value");
    b.innerHTML = dice_face_val;*/
   
    //console.log("within roll_dice function");
    console.log("dice_face_val: "+dice_face_val);
    moveTopixel = dice_face_val * 71;


    if(dice_face_val == 6 && game_started == false) //Staring condition when the counter will enter into the board
    {
        game_started = true;
        game_start();
    }

    else if(game_started == true)
    {

        if(prev_state == 'fact')
        {
            cur_state='ques';
            count_times=0;
            showQuestion();
            //move_hero();
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
  $("#countdown-11").stop();  
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


//-----------------------Variables for fetched question----------------------//
var ques_selector;
var q_min=0;
var q_max;
var ques;

//---------------------------showQuestion-------------------------------------//
var objDiv,ques_item,radioItem,objTextNode,objLabel,br,submit_btn, count_times = 0, score = 0,correct_ans;


  

function showQuestion()
{
  var optns,optn_len;
  var len=<%=count%>; //Total number of questions
  console.log("No of question: "+len);
  q_max=len-1;
  ques_selector= Math.floor(Math.random() * (q_max - q_min + 1)) + q_min; //Question pointer
  console.log(ques_selector);
  
  var array='<%=jsarray%>'; //Array holding all questions,correct answer and options
  console.log(array);
  
  var qu=JSON.parse(array); //Parsing the json into array
  console.log(qu[ques_selector]);
  
  ques=qu[ques_selector].split(":");
  
  correct_ans=ques[1];
  console.log("question is shown");
  objDiv = document.getElementById("opt");
  ques_item = document.createElement("p");
  ques_item.innerHTML = ques[0]; //Question is being displayed to the player like "Is abc??";
  $(objDiv).append(ques_item);
  
  optns=ques[2].split(","); //Getting the options
  optn_len=optns.length; //length of option array
  
  
 //---Generation of Options for the question------------// 
 var i;
  for (i=0;i<optn_len;i++)
 {
  radioItem = document.createElement("input");
  radioItem.type = "radio";
  $(radioItem).addClass("option-input radio");
  radioItem.name = "optn";
  radioItem.id = "rad"+i;
  radioItem.value = optns[i];//"yes";
  radioItem.defaultChecked = true;
  radioItem.checked = true;

  objTextNode = document.createTextNode(optns[i]);

  objLabel = document.createElement("label");
  objLabel.htmlFor = radioItem.id;
  objLabel.appendChild(radioItem);
  objLabel.appendChild(objTextNode);
  $(objLabel).css("padding","1rem");
  objDiv.appendChild(objLabel);

}

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
    console.log("response_ans: "+response_ans);
    console.log("correct_ans: "+correct_ans);

    $("#countdown-11").stop();
    $(ques_item).remove();
    //$(radioItem).remove();
   // $(".option-input radio").remove();
    $('input[type=radio][name=optn]').remove();
    $(objTextNode).remove();
    $(objLabel).remove();
    $("label").remove();
    $(br).remove()
    $(submit_btn).remove();

    $("#showq").hide();
    $("#countdown-11").stop();

    if(count_times != 4)
    {
        if(response_ans != correct_ans)
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
            move_hero();
            
        }
    }
    else
    {
        $("#countdown-11").stop();
        $("#btn").show();
        swal("You have exceeded number of attempts");
        
        
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
  
  for(var i=0;i < mycanvas.width;i += 74.3)
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
      c.fillRect(i,j,74.3,56);

      column = !column;

    }
    loop++;
  }
//----------------------------------------------------------------------------//





//----------------------------rendering the numbers---------------------------//

  var x = 1; var loop = 0;
  for(var j=mycanvas.height; j>0; j-= 58)
  {
      //console.log("test");
      if(loop%2 === 0)
      {
        for(var i=0; i<mycanvas.width; i+= 76)
        {
          c.font = "20px MS Comic Sans";
          c.fillStyle = "white";
          c.fillText(x,i+20,j-12);
          //console.log(i+20);
          //console.log(j-12);
          x++;
        }
      }
      else
      {
        for(var i=mycanvas.width; i>0 ; i -= 76)
        {
          c.font = "20px MS Comic Sans";
          c.fillStyle = "white";
          c.fillText(x,i-35,j-12);  
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
