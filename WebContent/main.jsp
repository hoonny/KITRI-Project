<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html> 
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>우리동네 예체능</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive HTML5 website landing page for developers and startups">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico">  
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Global CSS -->
    <link rel="stylesheet" href="./bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="./bootstrap/assets/plugins/font-awesome/css/font-awesome.css">
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="./bootstrap/assets/css/styles.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
    <style>
.search {
    margin-top: -25%;
}
td {width:200px;  border: 1px solid;}
h4{
color : #ff7f00;
}
ul{
   list-style:none;
   padding-left:0px;
}
a{
  color:#ffffff;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){

	var $test = $(".sub-slide>ul>li>button");
	$test.click(function(){
		
		var $gu = $(this).text();
		var $sports = $(this).parent().siblings("h4").text();
		console.log($gu);
		console.log($sports);
		$.ajax({
			url : 'search.do',
			data : {sports : $sports, gu : $gu},
			type : 'post',
			success : function(data){
				$("body").empty();
				$("body").html(data);
			}
		})//ajax
	})//클릭
})//끝



</script>
</head> 

<body>
<header>
     <jsp:include page="menu.jsp"></jsp:include>
</header>
<article>			
    <div id="hero" class="hero-section">
        
        <div id="hero-carousel" class="hero-carousel carousel carousel-fade slide" data-ride="" data-interval="10000">
            
            <div class="figure-holder-wrapper">
              <div class="container">
                  <div class="row">
                      <div class="figure-holder">
					  
                        </div><!--//figure-holder-->
                  </div><!--//row-->
              </div><!--//container-->
          </div><!--//figure-holder-wrapper-->
            
         
         <!-- Wrapper for slides -->
         <div class="carousel-inner">
             
            <div class="item item-1 active">
               <div class="item-content container">
                   <div class="item-content-inner">
			
						<div class="dropdown" style="height:50px; margin-top:140px;">
							<button id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-align:center">
									당신이 원하는 지역을 찾아보세요!!
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" >
								<div class="sub-slide">
									<ul><h4>당구</h4>
										<li><a href="#">마포구</a></li><br>										
										<li><a href="search.jsp">구로구</a></li><br>
										<li><a href="search.jsp">강남구</a></li><br>
										<li><a href="search.jsp">강서구</a></li><br>
										<li><a href="search.jsp">중구 </a></li>
									</ul>
								</div>
								<div class="sub-slide">
									<ul><h4>배드민턴</h4>
										<li><a href="search.jsp">마포구</a></li><br>										
										<li><a href="search.jsp">구로구</a></li><br>
										<li><a href="search.jsp">강남구</a></li><br>
										<li><a href="search.jsp">강서구</a></li><br>
										<li><a href="search.jsp">중구 </a></li>
									</ul>
								</div>
								<div class="sub-slide">
									<ul><h4>테니스</h4>
										<li><a href="search.jsp">마포구</a></li><br>
										<li><a href="search.jsp">구로구</a></li><br>
										<li><a href="search.jsp">강남구</a></li><br>
										<li><a href="search.jsp">강서구</a></li><br>
										<li><a href="search.jsp">중구 </a></li>
									</ul>
								</div>
								<div class="sub-slide">
									<ul><h4>볼링</h4>
										<li><a href="search.jsp">마포구</a></li><br>
										<!-- <li><a href="search.jsp">구로구</a></li><br> -->
										<li><button>구로구</button><li><br>
										<li><a href="search.jsp">강남구</a></li><br>
										<li><a href="search.jsp">강서구</a></li><br>
										<li><a href="search.jsp">중구 </a></li>
									</ul>
								</div>
								<div class="sub-slide">
									<ul><h4>탁구</h4>
										<li><a href="search.jsp">마포구</a></li><br>
										<li><a href="search.jsp">구로구</a></li><br>
										<li><a href="search.jsp">강남구</a></li><br>
										<li><a href="search.jsp">강서구</a></li><br>
										<li><a href="search.jsp">중구 </a></li>
									</ul>
								</div>
							</ul>
						</div> <!-- drop down-->
					
					 
                </div><!--//item-content-inner-->
               </div><!--//item-content-->
            </div><!--//item-->
            
          
         </div><!--//carousel-inner-->

      </div><!--//carousel-->
    </div><!--//hero-->
    
    <div id="about" class="about-section">
        <div class="container text-center">
         <h3>인기 장소는 바로 여기!</h3>
            <h2 class="section-title">Hot Service</h2>
                        
            <div class="items-wrapper row">
                <div class="item col-sm-4 col-xs-12">
                    <div class="item-inner">
                        <div class="figure-holder">
                            <img class="figure-image" src="./bootstrap/assets/images/1.jpg" alt="image">
                        </div><!--//figure-holder-->                  
                    </div><!--//item-inner-->
                </div><!--//item-->
                <div class="item col-sm-4 col-xs-12">
                    <div class="item-inner">
                        <div class="figure-holder">
                            <img class="figure-image" src="./bootstrap/assets/images/2.jpg" alt="image">
                        </div><!--//figure-holder-->
                    </div><!--//item-inner-->
                </div><!--//item-->
                <div class="item col-sm-4 col-xs-12">
                    <div class="item-inner">
                        <div class="figure-holder">
                            <img class="figure-image" src="./bootstrap/assets/images/3.jpg" alt="image">
                        </div><!--//figure-holder-->                      
                    </div><!--//item-inner-->
                </div><!--//item-->
            </div><!--//items-wrapper-->
        </div><!--//container-->
      <hr>
      <div class="container text-center" style="margin-bottom: 10px">
         <h3>누가 잘하는지 겨뤄보자!!</h3>
            <h2 class="section-title">This is Competition!</h2>
         <br>
         <div style="width: 100%">
			<ul style="width: 100%">
			<li style="width: 33%;height:100%;float: left;padding-left: 0px;padding-right: 5px;"><div style="border: 1px solid;"><img src="./bootstrap/assets/images/11.png" style="width: 100%;height:100%;" alt="image"></div></li>
			<li style="width: 33%;float: left;padding-left: 0px;padding-right: 5px;">
				<div style="border: 1px solid;margin-bottom: 5px"><img src="./bootstrap/assets/images/3.jpg" style="width: 100%;height:100%;" alt="image"></div>
				<div style="border: 1px solid;"><img src="./bootstrap/assets/images/3.jpg" style="width: 100%;height:100%;" alt="image"></div>
			</li>
			<li style="width: 33%;height:100%;float: left;padding-left: 0px;padding-right: 5px;"><div style="border: 1px solid;"><img src="./bootstrap/assets/images/3.jpg" style="width: 100%;height:100%;" alt="image"></div></li>
			</ul>
		 </div>
		
		
		
            <!-- <div class="items-wrapper row">
               <div class="item col-sm-4 col-xs-12">
                  <div class="item-inner">
                     <div class="figure-holder">
						<div class="panel panel-default">
                         <div class="panel-heading">
                           <h3 class="panel-title">구로 당구대회</h3>
                         </div>
                         <div class="panel-body">
						 <img class="figure-image" src="./bootstrap/assets/images/4.jpg" alt="image"><br><br>
                            일시 : 2017.06.07 13:00~ <br>
							장소 : 구로디지털단지 볼링장    <br>
							참가비 : 10,000원         <br>
							신청 : http://www.js.com
                         </div>
                       </div>
                     </div>//figure-holder                  
                  </div>//item-inner
               </div>//item
			   
               <div class="item col-sm-4 col-xs-12">
                  <div class="item-inner">
                     <div class="figure-holder">
						<div class="panel panel-default">
                         <div class="panel-heading">
                           <h3 class="panel-title">구로 당구대회</h3>
                         </div>
                         <div class="panel-body">
						 <img class="figure-image" src="./bootstrap/assets/images/4.jpg" alt="image"><br><br>
                            일시 : 2017.06.07 13:00~ <br>
							장소 : 구로디지털단지 볼링장    <br>
							참가비 : 10,000원         <br>
							신청 : http://www.js.com
                         </div>
                       </div>
                     </div>//figure-holder                  
                  </div>//item-inner
               </div>//item
			   
               <div class="item col-sm-4 col-xs-12">
                  <div class="item-inner">
                     <div class="figure-holder">
						<div class="panel panel-default">
                         <div class="panel-heading">
                           <h3 class="panel-title">구로 당구대회</h3>
                         </div>
                         <div class="panel-body">
						 <img class="figure-image" src="./bootstrap/assets/images/4.jpg" alt="image"><br><br>
                            일시 : 2017.06.07 13:00~ <br>
							장소 : 구로디지털단지 볼링장    <br>
							참가비 : 10,000원         <br>
							신청 : http://www.js.com
                         </div>
                       </div>
                     </div>//figure-holder                  
                  </div>//item-inner
               </div>//item -->
        </div><!--//container-->
</article>  
    <footer class="footer text-center">
        <div class="container">
            <!--/* This template is released under the Creative Commons Attribution 3.0 License. Please keep the attribution link below when using for your own project. Thank you for your support. :) If you'd like to use the template without the attribution, you can check out other license options via our website: themes.3rdwavemedia.com */-->
            <small class="copyright">본 웹 페이지는 현재 FairPlay 팀에서 운용하고 있는 생활체육 검색 시스템이 적용 되어 있습니다. <br>
									 copyright ⓒ 2017. ALL RIGHTS RESERVED BY KITRI FairPlay</small>
            
        </div><!--//container-->
    </footer>
     
    <!-- Javascript -->          
    <script type="text/javascript" src="./bootstrap/assets/plugins/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="./bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./bootstrap/assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script>     
    <script type="text/javascript" src="./bootstrap/assets/js/main.js"></script> 
       
</body>
</html> 
