<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ config('app.name') }}</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicons -->
    <link href="{{ asset('logo.svg') }}" rel="icon">
{{--    <link href="/img/apple-touch-icon.png" rel="apple-touch-icon">--}}

<!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="{{ asset('css/app.css')  }}">
    <!-- Libraries CSS Files -->
    <link href="{{ asset('lib/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">
    <link href="{{ asset('lib/animate/animate.min.css') }}" rel="stylesheet">
    <link href="{{ asset('lib/ionicons/css/ionicons.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/eaglespire.css') }}" rel="stylesheet">
    <link href="{{ asset('lib/magnific-popup/magnific-popup.css" rel="stylesheet') }}">
    <link href="{{ asset('lib/ionicons/css/ionicons.min.css') }}" rel="stylesheet">

    <!-- Main Stylesheet File -->
{{--    <link href="/css/style.css" rel="stylesheet">--}}
    @livewireStyles
    @livewireScripts
</head>

<body id="body">
<div id="preloader"></div>

<!--==========================
  Top Bar
============================-->
<section id="topbar" class="d-none d-lg-block">
    <div class="container clearfix">
        <div class="contact-info float-left">
            <i class="fa fa-envelope-o"></i> <a href="mailto:contact@example.com">contact@mariajones.com</a>
            <i class="fa fa-phone"></i> +1 5589 55488 55
        </div>
        <div class="social-links float-right">
            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
            <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
            <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
            <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
        </div>
    </div>
</section>

<!--==========================
  Header
============================-->
<header id="header">
    <div class="container">

        <div id="logo" class="pull-left">
            <h1><a href="#body" class="scrollto">Maria<span>Jones</span></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="#body"><img src="img/logo.png" alt="" title="" /></a>-->
        </div>

        <nav id="nav-menu-container">
            <ul class="nav-menu">
                <li class="menu-active"><a href="#body">Home</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#services">Why Us</a></li>
                <li><a href="#portfolio">Mining RoadMap</a></li>
                <li><a href="#call-to-action">FAQS</a></li>
                @auth
                    <li class="menu-has-children"><a href="">{{ Auth()->user()->name }}</a>
                        <ul>
                            <li><a href="{{ show_correct_dashboard() }}">{{__('Dashboard')}}</a></li>
                            <li><a href="#" onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">{{ __('logout') }}
                                <!-- Form -->
                                    <form method="POST" id="logout-form" action="{{ route('logout') }}">
                                        @csrf
                                    </form>
                                </a></li>
                        </ul>
                    </li>
                    @else
                    <li class="{{ set_active('login') }}"><a href="{{ route('login') }}">Login</a></li>
                    <li class="{{ set_active('register') }}"><a href="{{ route('register') }}">Register</a></li>
                @endauth
            </ul>
        </nav><!-- #nav-menu-container -->
    </div>
</header><!-- #header -->

<!--==========================
  Intro Section
============================-->
@if(isset($intro))
    {{ $intro }}
@endif

<main id="main">
    {{ $slot }}
</main>

<!--==========================
  Footer
============================-->
<footer id="footer">
    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong>MariaJones</strong>. All Rights Reserved
        </div>
        <div class="credits">
            <a href="https://bootstrapmade.com/">Powered </a> by MariaJonesNetwork
        </div>
    </div>
</footer><!-- #footer -->

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<script src="{{ asset('js/app.js') }}"></script>
<script src="{{ asset('lib/easing/easing.min.js') }}"></script>
<script src="{{ asset('lib/superfish/superfish.min.js') }}"></script>
<script src="{{ asset('lib/wow/wow.min.js') }}"></script>
<script src="{{ asset('js/guests.js') }}"></script>
<script src="{{ asset('lib/magnific-popup/magnific-popup.min.js') }}"></script>
<script src="{{ asset('lib/sticky/sticky.js') }}"></script>


{{--<script src="{{ asset('js/turbolinks.js') }}"></script>--}}
</body>
</html>



