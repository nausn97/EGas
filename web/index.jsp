<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="css/footer.css" type="text/css"/>
        <link rel="stylesheet" href="css/home_style.css" type="text/css"/>
        
        <style>
            body{
                background: url("../home_imgs/banner.png") no-repeat scroll 12px 15px transparent;
            }
            *{
                margin:0;
                padding: 0;
                //
                
            }
         .TopLogo img{
                position:fixed;
                float:left;
                width:40%;
                height: auto;
                margin:0;
                
            }
           /* .BottomLogo img{                
                float:left;
                width:40%;
                height: auto;
                margin:0;
                position:relative;
                z-index:-1;
                opacity: 0.75;
            }*/
         
                
    </style>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    
    <script src="js/more_links.js"></script>  
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/overcast/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link rel="stylesheet" href="css/zoomy.css" />
    <script src="js/zoomy.js"></script>
    
        <script type="text/javascript">
            $(document).ready(function() {
            $(".zoom").zoomy({zoomSize:100, round:false, glare:true, border:"solid thin ghostwhite"});


            });
        </script>

    
    <style>
        #container {
            font-size: 12px;
            height: 420px;
            width: 350px;
        }
        .Message{
            margin-top: 140px;
            margin-left: 20px;
            width: 350px;
            height: 350px;            
            position: absolute;
        }
        
        #apps{
            height: 40px;
            width: 40px;
            overflow: hidden;
            border:1px solid gray;
            margin-top: 500px;
            margin-left: 930px;
            position: absolute;                

        }
        .cs{
            width:150px;
            margin-top: 550px;
            margin-left: 900px;
            position: absolute;                
            text-transform: uppercase;
            font-family: tahoma;
            color: #B82020;
        }
        
        .slider{
            -webkit-animation: myanimation 6s ease-in-out infinite alternate;

        }
        @-webkit-keyframes myanimation
        {	
            0% {-webkit-transform:translateY(0px); }
            25% {-webkit-transform:translateY(-40px); }
            50% {-webkit-transform:translateY(-80px);}
            75% {-webkit-transform:translateY(-120px);}
            //100% {-webkit-transform:translateY(-160px);}				

        }
       

    </style>
    </head>
    <body >
      
        <div class="TopLogo">
            <img src="images/fLogo.png"/>
        </div>
        
        
         
    <div style="position:absolute; top: 0; right:30px;z-index:1; width:410px" id="pic">
      <div id="panneau_contact">
        <div id="contenu_panneau">
          <ul>
            
            <li><a href="">Change Your Distributor</a></li>
            <li><a href="">Web Booking</a></li>
            <li><a href="">IVRS/SMS</a></li>
            <li><a href="">Tariff/Prices</a></li>
          </ul>
          <ul>
            <li><a href="">Advantages</a></li>
            <li><a href="">Our Brands</a></li>
            <li><a href="">Auto Lpg Outlets</a></li>
            <li><a href="">Advertisements</a></li>
          </ul>            
           <!-- <div class="ex_div">
            <ul>
              <li><a href="">Download Formats</a></li>
              <li><a href="">Safety Tips</a></li>
              <li><a href=""> Safety Requirement</a></li>
              <li><a href=""> Bottling Plants</a></li>
            </ul>
          </div>          -->
        </div>
      </div>
        <div>
        <div>
            <div style="float:left"><img src="images/more_links_left.png" width="30" height="30" alt="" /></div>
          <div style="background:#ffd200;width:380px; position:relative;  float:left; height:26px; padding-top:4px">
              <div class="right_black_links"> <a href="LoginForm.jsp">Login</a>:<a href="SignUpForm.jsp">SignUp</a>:<a href="NewConnection.jsp">New Connection</a></div>
          </div>
        </div>
        <div id="btn-contact"> <a class="open" href="#&nbsp;"></a> </div>
    </div>
    </div>
        <div class="Home">
            
        </div>
        
       <%-- <div class="Message">
            <div id="container"><!--start of div container-->
                <div id="accordion"><!--start of div accordion-->

                <h2>About Indane</h2>
                <div> Indane is today one of the largest packed-LPG brands in the world. Indian Oil pioneered the launch of LPG in India in the 1970s and transformed the lives of millions of people with the introduction of the clean, efficient and safe cooking fuel. LPG also led to a substantial improvement in the health of women in rural areas by replacing smoky and unhealthy chullahs with Indane. It is today a fuel synonymous with safety, reliability and convenience.

                        LPG is a blend of Butane and Propane readily liquefied under moderate pressure. LPG vapour is heavier than air; thus it normally settles down in low-lying places. Since LPG has only a faint scent, a mercaptan odorant is added to help in its detection. In the event of an LPG leak, the vapourisation of liquid cools the atmosphere and condenses the water vapour contained in it to form a whitish fog, which is easy to observe. LPG in fairly large concentrations displaces oxygen leading to a nauseous or suffocating feeling.

                        Suraksha LPG hose, flame retardant aprons and energy efficient Green Label stoves are recommended to enhance safety measures while using LPG as fuel.

                        2010
                        5.8 million customers covering every corner of India
                        Every second LPG cooking gas connection in India is an Indane
                        The world’s highest LPG bottling plant – situated 3500 metres above sea level – is at Leh
                        Each day, the Indane distribution network delivers 1.20 million cylinders
                        Of the 57.41 million families served by 5500 Indane distributors, 27% are in semi-urban and rural markets
                        Indane sales network is backed by 45 Indane Area Offices</div>

                <h2>Achivements</h2>
                <div> IndianOil was the first company to introduce the concept of LPG rural marketing. This concept was mooted largely to counter the extensive deforestation that takes place in rural areas. It has since contributed immensely to the preservation of the environment and helped limit the use of conventional fuels like firewood.
                    Company doubled its bottling capacity from 1.45 million tonnes per annum to over 3 million tonnes per annum Conscious of its environment, IndianOil has also tied up with leading manufacturers of ‘Green Label’ branded LPG stoves by Bureau of Indian Standards (BIS), giving thermal efficiency of 68% and fuel savings of 15%.</div>

                <h2>Market</h2>
                <div> "The sheer size, spread and complexity of its distribution network would be the envy of most fast moving consumer durable (FMCG) companies. "
                    IndianOil delivers Indane to the doorsteps of more than 63 million customers across the country through a dedicated network of more than 5500 distributors. IndianOil leads the competition with a share of over 49% in the domestic segment currently accounting for 6 million tonnes of the 12.3 million tonne per annum market.
                    <a href="home_imgs/market_covered.jpg" class="zoom"><img src="home_imgs/market_covered.jpg" width="250px" height="250" style="margin: 5px;"></a>
                    <a href="home_imgs/dist_number.jpg" class="zoom"><img src="home_imgs/dist_number.jpg" width=250px" height="250"></a>
                    <a href="home_imgs/customer_no.jpg" class="zoom"><img src="home_imgs/customer_no.jpg" width="250px" height="250"></a>
                    <a href="home_imgs/sales_mt.jpg" class="zoom"><img src="home_imgs/sales_mt.jpg" width="px" height="250"></a>
                </div>

                </div><!--end of div accordion-->
                </div><!--end of div container--> --%>
                <script type="text/javascript" src="js/ext.js"></script>            
        </div>
        <div class="banner" style="width: 100%;height: 60%;z-index: -10;">
            <img src="home_imgs/banner.png" style="width: 100%;height: 100%;margin-top: 10%;">
        </div>
        <div id="apps">
            <img class="slider" src="home_imgs/icon_android.png" width="40" height="40">
            <img class="slider" src="home_imgs/icon_apple.png" width="40" height="40">
            <img class="slider" src="home_imgs/icon_windows.png" width="40" height="40">
            
        </div>  
        <div class="cs">
            <label>
                Coming Soon
            </label>
        </div
        
     <div class="mainFooter">    
    <footer>  
        <!--<div class="titleMarqueeNews" style="background: #000;height: 40px;width: 150px;color: white;font-family: tahoma;padding-top: 8px;padding-left: 10px;position: absolute">E-Gas Seva News</div>
        <div class="MarqueeNews" style="background: #ffd200;width:80%;height: 40px; position: absolute;margin-top: 536px">            
            
            
            
        </div> -->
        
    <div class="search">
        
    <form action="#" name="form1" id="form1">                        
                        <input type="text" name="q" size="35" style="width:130px !important; " />
                        <input name="sa" type="image" id="Search" src="images/go.png" alt="Web Search" style="margin-left:140px;margin-top: -23px;"/>
                        
    </form>
    </div>
    <div class="expand_icon"><a id="show" href="javaScript:void(0);">&nbsp;</a></div>
    <div style="position:fixed;background-color: rgb(59, 89, 152); bottom:0px; width:100%; left:0px; z-index:150;">
    <div style="width:1000px; margin:auto; position:relative; height:93px;">
      <div id="footer_nav">
        <div style="padding-right:67px;"><a href="" id="section1" onClick="goto('#products', this); return false">PRODUCTS</a></div>
        <div style="padding-right:62px;"><a href="TPortal.jsp" id="section2" onClick="goto('#section2', this); return false">T-PORTAL</a></div>
        <div style="padding-right:39px;"><a href="3" id="section3" onClick="goto('#section3', this); return false">DOWNLOAD FORMATS</a></div>
        <div style="padding-right:45px;"><a href="HowDo.jsp" target="new" >HOW DO I</a>       </div>
        <div style="padding-right:58px;"><a href="#" id="4" onClick="goto('#life_at_lpu', this); return false">Education</a></div>
        <div><a href="#" id="5" onClick="goto('#contact_us', this); return false">Contact Us</a></div>
      </div>
      <div style="position:absolute; left:0; margin-top:-10px;"><a href="#" id="btnHome" onClick="goto('#home', this); return false"><img src="home_imgs/home.png" width="65" height="65" /></a></div>
      <div class="fade_nav"> </div>
      <div style="width:734px; height:29px; margin:auto; clear:both; position:relative; margin-top:-14px;">
          <div id="div_active" style="position:absolute; z-index:111; margin-left:-7px; margin-top:-22px;"><img src="home_imgs/nav_active.png" /></div>
      </div>
    </div>
  </div>
</footer>        
    </div>
      
    </body>
</html>
