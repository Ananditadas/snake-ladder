<%-- 
    Document   : class
    Created on : 24 Mar, 2019, 10:44:42 PM
    Author     : MANDIRA CHAUDHURI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONArray,org.json.JSONException"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="javascript/turn.js"></script>
        <script src="javascript/menu.js" type="text/javascript"></script>
        <link  rel="stylesheet" href="css/menu.css" type="text/css" />
    </head>
    <body>
        <%
            int count=0;
            ArrayList<String> cls=new ArrayList<String>();
            String url="jdbc:mysql://localhost:3306/game";
            String username="root";
            String password="user";
            String sql="select C_id,class from class";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,username,password);
            Statement st=con.createStatement();
            
            ResultSet rs= st.executeQuery(sql);
            while(rs.next())
            {
                String cl=rs.getString("c_id")+":"+rs.getString("class");
                cls.add(cl);
                count=count+1;
            }
            JSONArray jsar=new JSONArray(cls);
        
        %>
        
        
        <div class="container">
          <div class="book-wrapper">
            <div class="book-cover">
                <img src="images/book5.png" alt="">
            </div>
            <div class="pages-container">
                <div class="pages">
                    <!--<div class="page-num-1">
                        <div class="pages-content">
                            <div class="content-inner">
                                <h1>
                                    <a href="#" id="class_1"> Class 5 </a>
                                </h1>                              
                            </div>
                        </div>
                    </div>
                    <div class="page-num-2">
                        <div class="pages-content">
                            <div class="content-inner">
                                <h1><a href="#" id="class_2"> Class 6 </a></h1>
                            </div>
                        </div>
                    </div>
                    <div class="page-num-3">
                        <div class="pages-content">
                            <div class="content-inner">
                                <h1><a href="#" id="class_3"> Class 7 </a></h1>
                            </div>
                        </div>
                    </div>
                    <div class="page-num-4">
                        <div class="pages-content">
                            <div class="content-inner">
                                <h1>
                                    <a href="#" id="class_4"> Class 8 </a>
                                </h1>                                
                            </div>
                        </div>
                    </div>
                    <div class="page-num-5">
                        <div class="pages-content">
                            <div class="content-inner">
                                <h1>
                                    <a href="#" id="class_5"> The End </a>
                                </h1>
                            </div>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
    </div>
        <script>
            var class_ar='<%=jsar%>';
            var i;
            //console.log(class_ar);
            //console.log(class_ar[1]);
            var page_des="";
            var cls_det_ar=JSON.parse(class_ar);
            console.log(cls_det_ar.length);
            var len=cls_det_ar.length+1;
            for(i=0;i<len;i++)
            {
                var main_div_name='page-num-'+(i+1);
                //var id_name="class_"+(i+1);
                //console.log(cls_det_ar[i]);
                if((i+1)!=len)
                {
                    var class_det=cls_det_ar[i].split(":"); //class_det[0] contains class_id and class_det[1] contains class
                    //console.log(class_det[0]);                     
                    //console.log(main_div_name);
                    page_des=page_des+"<div class='"+main_div_name+"'> <div class='pages-content'> <div class='content-inner'> <h1><a class='redirect'   href='#' id='"+class_det[0]+"'>"+"Class -"+class_det[1]+"</a></h1></div></div></div>";
                    //console.log(page_des);
                }
                else
                {
                    page_des=page_des+"<div class='"+main_div_name+"'> <div class='pages-content'> <div class='content-inner'> <h1><a href='#' id='end'> The End </a></h1></div></div></div>";
                } 
            }
            
            var obdiv=document.getElementsByClassName("pages");
            $(obdiv).html(page_des);
            
            
            $('a.redirect').click(function (event) {
                event.preventDefault();
                //var href = $(this).attr('href')
                var cls_id=$(this).attr('id');
                console.log(cls_id);
                window.location='topic.jsp?classid='+cls_id;
                });
                
                
            
        </script>
</body>
</html>
