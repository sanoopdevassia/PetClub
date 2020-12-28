<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>pet store</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />

    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta tag Keywords -->

    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Bootstrap-Core-CSS -->

    <!-- owl carousel -->
    <link rel="stylesheet" href="css/stylemain.css" type="text/css" media="all" />
    <link href="css/blast.min.css" rel="stylesheet" />

    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <!--lightbox -->
    <link rel="stylesheet" href="css/lightbox.css">
    <!-- lightbox -->


    <!-- Font-Awesome-Icons-CSS -->
    <link href="//fonts.googleapis.com/css?family=Oswald:300,400,500,600,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">



<link rel="stylesheet" type="text/css" href="css/style2.css">
</head>

<body>
  
  
  <c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
  
  
  
  
  
                <!--/banner-->
         <header>
		<h1>
		 	<i><b>Pet <font color="#00a8e0">Club</font></b></i>
		</h1>
		<nav >
	
			<ul>
			
			   <li class="nav-item active"> <a class="nav-link" href="#myCarousel" data-blast="color">Home <span class="sr-only">(current)</span></a> </li>
                                <li class="nav-item"> <a class="nav-link" href="#services">Services</a> </li>
                                <li class="nav-item"> <a class="nav-link" href="#about">About</a> </li>
                                <li class="nav-item"> <a class="nav-link" href="#gallery">Photos</a> </li>
                                <li class="nav-item"> <a class="nav-link" href="#contact">Contact</a> </li>
                                
                                
                                
				
				
				
				<c:choose>
					<c:when test="${session == null}">
						<li class="nav-item"><a class="nav-link" href="Controller?page=login">Login</a></li>
						
					</c:when>
					<c:when test="${session != null}">
					<li class="nav-item"><a class="nav-link" href="Controller?page=order">Orders</a></li>
						<li class="nav-item"><a class="nav-link" href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				
			</ul>
			
		</nav>
	</header>
                <!-- Swiper Silder
                
                
                
                
                
                
    ================================================== -->
                <!-- Slider main container -->
                <div class="swiper-container main-slider" id="myCarousel" data-blast="bgColor">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide slider-bg-position" style="background:url(images/1.jpg)" data-hash="slide1">
                            <div class="ban-info" data-blast="bgColor">
                                <h2>We Make Pets Happy</h2>
                                <p>Especially made to fulfill minutest personal care of tour loving Pets.</p>
                            </div>
                        </div>
                        <div class="swiper-slide slider-bg-position" style="background:url(images/2.jpg)" data-hash="slide2">
                            <div class="ban-info" data-blast="bgColor">
                                <h2>We'r Happy to Pamper</h2>
                                <p>Especially made to fulfill minutest personal care of tour loving Pets.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Add Navigation -->
                    <div class="swiper-button-prev"><i class="fa fa-chevron-left"></i></div>
                    <div class="swiper-button-next"><i class="fa fa-chevron-right"></i></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Benefits
    ================================================== -->

    <section class="grids-bottom-w3ls bg-light py-md-5 py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 about-in text-left">
                    <div class="card">
                        <div class="card-body">
                            <i class="fa fa-home" aria-hidden="true" data-blast="color"></i>
                            <h5 class="card-title">Pet Room</h5>
                            <div class="line" data-blast="bgColor"></div>
                            <p class="card-text mt-3">Especially made to fulfill minutest personal care of tour loving Pets.
                            </p>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 about-in text-left">
                    <div class="card">
                        <div class="card-body">
                            <i class="fa fa-cubes" aria-hidden="true" data-blast="color"></i>
                            <h5 class="card-title"> Best Food</h5>
                            <div class="line" data-blast="bgColor"></div>
                            <p class="card-text mt-3">Pet Club is the pioneer to introduce Pets boutique range of clothes apparels and Food
                            </p>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 about-in text-left">
                    <div class="card">
                        <div class="card-body">
                            <i class="fa fa-heart-o" aria-hidden="true" data-blast="color"></i>
                            <h5 class="card-title"> Veterinarian Help</h5>
                            <div class="line" data-blast="bgColor"></div>
                            <p class="card-text mt-3">Pet Club has made it possible to get connected with the highly qualified Veterinary Expert in just one click –
                            </p>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 about-in text-left">
                    <div class="card">
                        <div class="card-body">
                            <i class="fa fa-calendar" aria-hidden="true" data-blast="color"></i>
                            <h5 class="card-title">Easy Booking</h5>
                            <div class="line" data-blast="bgColor"></div>
                            <p class="card-text mt-3">We Provide Easy Booking for Animal Enquiry
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- Servives
    ================================================== -->
    <section class="banner-bottom-wthree py-md-5 py-3" id="services">
        <div class="container">
            <div class="inner-sec-w3layouts py-md-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3">
                    <span data-blast="color">Our</span>Services</h3>
                <div class="row choose-main mb-lg-4">

 
	 <input type="hidden" name="page" value="buy-now">


                    <div class="col-lg-6 galsses-grid-right">
                        <!----
                        <h5>
                            <span class="post-color">21</span> May 2018</h5>
                         <!---->
                        <h4 class="post mt-3">Buy Your Favourite Pet a Home or its Accesories</h4>
                        <div class="line" data-blast="bgColor"></div>
                        <p class="mt-3">All types of Accesories for Dogs,Birds and cats, online payment and with 15 days of return-back policy</p>
                        <div class="log-in mt-md-4 mt-3">
                            <a class="btn text-uppercase" data-blast="bgColor" href="index.jsp">
                             Buy Now</a>
                        </div>
                    </div>

                    <div class="col-lg-6 galsses-grid-right">
                        <div class="galsses-grid-left">
                            <figure class="effect-lexi">
                                <img src="images/4.jpg" alt="" class="img-fluid">
                                <figcaption>
                                    <h3>Pet
                                        <span data-blast="color">Accesories</span>

                                    </h3>
                                    <p data-blast="color"> Service 1</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>

                <div class="row choose-main my-lg-4 my-3">
                    <div class="col-lg-6 galsses-grid-right mt-lg-4">
                        <div class="galsses-grid-left">
                            <figure class="effect-lexi">
                                <img src="images/5.jpg" alt="" class="img-fluid">
                                <figcaption>
                                    <h3>Pet
                                        <span data-blast="color">Dictionary</span>

                                    </h3>
                                    <p data-blast="color"> Service 2</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>



	 <input type="hidden" name="page" value="Dictionary">

                    <div class="col-lg-6 galsses-grid-right mt-4">

                        <h4 class="post mt-3">Dog's Dictionary</h4>
                        <div class="line" data-blast="bgColor"></div>
                         <p class="mt-3">We maintain Dog's Dictionary which is updated every year with dogs Popularity,colour and Region</p>
                        <div class="log-in mt-md-4 mt-3">
                            <a class="btn text-uppercase" data-blast="bgColor" href="Controller?page=dogs">
                             Go to Dictionary</a>
                        </div>

                    </div>
                    
                    
                </div>
                
                </div>
            </div>
        </div>
    </section>

    <!-- About 
    ================================================== -->
    <section class="about-sec parallax-section py-lg-5 py-4" id="about">
        <div class="container">
            <div class="inner-sec-w3layouts py-md-5 py-3">
                <div class="row choose-main">
                    <div class="col-lg-3">
                        <h3><small>Who We Are</small>About<br> Our Blog</h3>
                    </div>
                    <div class="col-lg-4">
                        <p>Welcome to India's favorite online pet supplies service. What we bring at your doorstep is only the very best in Pet's Daily </p>
                        <p>Nutrition and Care, plus everything else that concerns your beloved furry pals. Simply, choose your pet's favorite brands,place an order and we will make them appear at your doorstep in no time; Almost Like Magic!</p>
                    </div>
                    <div class="col-lg-4">
                        <p>At Pets Club, we are continuously tethering with the market logistics whilst churning out the best deals for our site visitors.
How we are able to provide you unearthly discounts on most popular dog and cat food brands, fish food and Aquarium supplies, is
by simply erasing the cliched middle man and by passing the supply chain benefits directly to you.</p>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Gallery
    ================================================== -->
    <section class="banner-bottom-wthree py-md-5 py-3" id="gallery">
        <div class="container">
            <div class="inner-sec-w3layouts py-md-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3">
                    <span data-blast="color">Latest</span> Photos</h3>
                <div class="row gallery_grid-more project-grids">
                    <div class="col-md-3 p-0 pr-2 col-sm-3 col-6 personal_gallery_grid1 hover14 column">
                        <div class="personal_gallery_effect">
                            <a href="images/g1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
                                <figure>
                                    <img src="images/g1.jpg" alt=" " class="img-fluid" />
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 p-0 pr-2 col-sm-3 col-6 personal_gallery_grid1 hover14 column">
                        <div class="personal_gallery_effect">
                            <a href="images/g2.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
                                <figure>
                                    <img src="images/g2.jpg" alt=" " class="img-fluid" />
                                </figure>
                            </a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="col-md-6 p-0 col-sm-6 col-12 pt-sm-0 pt-2 personal_gallery_grid1 hover14 column">
                        <div class="personal_gallery_effect">
                            <a href="images/g3.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
                                <figure>
                                    <img src="images/g3.jpg" alt=" " class="img-fluid" />
                                </figure>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row gallery_grid-more">
                    <div class="col-md-6 p-0 col-sm-6 col-12 pt-sm-0 pt-2 personal_gallery_grid1 view_gallery_grid1 hover14 column">
                        <div class="personal_gallery_effect">
                            <a href="images/g4.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
                                <figure>
                                    <img src="images/g4.jpg" alt=" " class="img-fluid" />
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 pt-2 pl-2 p-0 col-sm-3 col-6 personal_gallery_grid1 hover14 column">
                        <div class="personal_gallery_effect">
                            <a href="images/g5.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
                                <figure>
                                    <img src="images/g5.jpg" alt=" " class="img-fluid" />
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 pt-2 pl-2 p-0 col-sm-3 col-6 personal_gallery_grid1 hover14 column">
                        <div class="personal_gallery_effect">
                            <a href="images/g6.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
                                <figure>
                                    <img src="images/g6.jpg" alt=" " class="img-fluid" />
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>

            </div>
        </div>
    </section>


  

 
    <!-- Footer
    ================================================== -->
      <!-- Footer
    ================================================== -->
    <footer class="action-sec py-lg-5 py-3" id="contact">
        <div class="container-fluid px-lg-5 px-3">
            <div class="row">
                <div class="col-lg-5 footer-grid">
                    <h3 class="mb-4">About Us</h3>
                    <p>We would like to introduce ourself as the most reputed, acknowledged, renowned, innovative organization in pets world. with an excellent track record & never ending list of mare than 50,000 satisfied clients all across India. </p>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <h3 class="text-uppercase mb-3 ">Connect With Social</h3>
                            <p><span class="fa fa-twitter"></span> twitter/@my_website</p>
                            <p><span class="fa fa-instagram"></span> instagram/@my_website</p>
                            <p><span class="fa fa-youtube mb-5"></span> youtube/@my_website</p>
                            <a href="#" class="facebook-footer mr-2"><span class="fa fa-facebook mr-1"></span> Facebook</a>
                            <a href="#" class="twitter-footer"><span class="fa fa-twitter mr-1"></span> Twitter</a>
                        </div>
                        <div class="col-md-6">
                            <h3 class="mb-4">Address</h3>
                            <address class="mb-0">
							<p class="mb-2"><i class="fas fa-map-marker-alt"></i> 8088H 5th Street Parking, <br>Church street,Mg road.</p>
							<p><i class="fa fa-phone mr-1"></i> +91 8075904751</p>
							<p><i class="fa fa-fax mr-1"></i> +91 8884643301</p>
							<p><i class="fa fa-envelope-open  mr-1"></i> <a href="mailto:info@example.com">melsan@gmail.com</a></p>
						</address>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 footer-grid">
                    <h3 class="mb-4">Instagram</h3>
                    <div class="blog-grids row mb-3">
                        <div class="col-md-4 blog-grid-left">
                            <a href="single.html">
							<img src="images/5.jpg" class="img-fluid" alt="">
						</a>
                        </div>
                        <div class="col-md-8 blog-grid-right">
                            <h5>
                                <a href="single.html"> </a>
                            </h5>
                            <div class="sub-meta">
                                <span>
								<i class="far fa-clock"></i> 10 Sep, 2018</span>
                            </div>
                        </div>
                    </div>
                    <div class="blog-grids row mb-3">
                        <div class="col-md-4 blog-grid-left">
                            <a href="single.html">
							<img src="images/4.jpg" class="img-fluid" alt="">
						</a>
                        </div>
                        <div class="col-md-8 blog-grid-right">
                            <h5>
                         
                            </h5>
                            <div class="sub-meta">
                                <span>
								<i class="far fa-clock"></i> 22 Sep, 2018</span>
                            </div>
                        </div>
                    </div>
                    <div class="blog-grids row mb-3">
                        <div class="col-md-4 blog-grid-left">
                            <a href="single.html">
							<img src="images/6.jpg" class="img-fluid" alt="">
						</a>
                        </div>
                        <div class="col-md-8 blog-grid-right">
                            <h5>
                              
                            </h5>
                            <div class="sub-meta">
                                <span>
								<i class="far fa-clock"></i> 23 Sep, 2018</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 footer-grid">
                    <h3 class="mb-4">We Offer</h3>
                    <ul>
                  
                    </ul>
                    <h3 class="mt-4 mb-4">Newsletter</h3>
                    <p class="mb-3">Subscribe to Our Newsletter to get News, Amazing Offers &amp; More</p>
                    <form action="#" method="post">
                        
                        <button class="btn1" data-blast="bgColor"><i class="fa fa-envelope-o" aria-hidden="true"></i></button>
                        <div class="clearfix"> </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="copyright mt-md-5 mt-4 text-center">
            <p>© 2020 Pet Club . All Rights Reserved

        </div>

    </footer>


    <!--//banner-->
    <!--//footer-->
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="js/boost.js"></script>
    <script src="js/blast.min.js"></script>
    <!--  light box js -->
    <script src="js/lightbox-plus-jquery.min.js">
    </script>
    <script>
        // optional
        $('#blogCarousel').carousel({
            interval: 5000
        });
    </script>
    <!-- //light box js-->

    <!--/ start-smoth-scrolling -->
    <script src="js/move-top.js"></script>
    <script src="js/easing.js"></script>
    <script>
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            /*
            						var defaults = {
            							  containerID: 'toTop', // fading element id
            							containerHoverID: 'toTopHover', // fading element hover id
            							scrollSpeed: 1200,
            							easingType: 'linear' 
            						 };
            						*/

            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
    <!--// end-smoth-scrolling -->

    <!-- //js -->

    <script src="js/bootstrap.js"></script>

</body>

</html>