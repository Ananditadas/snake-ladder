window.onload = function(){

  var mycanvas = document.querySelector("canvas");

//for high definition canvas
  var dpr = window.devicePixelRatio || 1;
  var rect = mycanvas.getBoundingClientRect();
  mycanvas.width = rect.width * dpr;
  mycanvas.height = rect.height * dpr;
  var c = mycanvas.getContext('2d');
  c.scale(dpr, dpr);




//----------------------------------------------------------------------------//
//rendering the board
  var x=0,y=0;
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





//----------------------------------------------------------------------------//
//rendering the numbers
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




//----------------------------------------------------------------------------//
  var img = document.getElementById("ladder1");
  c.drawImage(img, 150, 425,50,120);


//----------------------------------------------------------------------------//
}
