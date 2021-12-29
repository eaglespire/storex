<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

    <!-- Styles -->
    <link rel="stylesheet" href="{{ mix('css/dashboard.css') }}">

    <!-- Scripts -->
    <script src="{{ mix('js/app.js') }}" defer></script>
    <script src="{{ mix('js/dashboard.js') }}" defer></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed font-sans antialiased text-sm">
<div class="wrapper">

@include('layouts.navigation')

<!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-warning elevation-2">
        <!-- Brand Logo -->
        <a href="/" class="brand-link">
            <img src="{{ asset('logo.svg') }}" alt="" class="img-fluid">
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar Menu -->
            <nav class="mt-4 py-2">
                <ul class="nav nav-pills nav-sidebar flex-column nav-legacy" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item mb-2">
                        <a href="./index2.html" class="nav-link ">
                            <i class="far fa-circle nav-icon text-primary"></i>
                            <p>Site Data</p>
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="./index2.html" class="nav-link active ">
                            <i class="far fa-circle nav-icon text-primary"></i>
                            <p>Manage Users</p>
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="./index2.html" class="nav-link ">
                            <i class="far fa-circle nav-icon text-primary"></i>
                            <p>Blockchain Accounts</p>
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="./index2.html" class="nav-link ">
                            <i class="far fa-circle nav-icon text-primary"></i>
                            <p>Site Information</p>
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="{{ route('logout') }}" class="nav-link"  onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                            <i class="fas fa-power-off nav-icon text-danger"></i>
                            <p>Logout</p>
                        </a>
                        <form method="POST" id="logout-form" action="{{ route('logout') }}">
                            @csrf
                            {{--                            @method('delete')--}}
                        </form>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col">
                        <h1>{{ $header }}</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        {{ $slot }}
                    </div>

                    @if (isset($aside))
                        <div class="col-lg-3">
                            {{ $aside }}
                        </div>
                    @endif
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="float-right d-none d-sm-block">
            <b><a href="{{ url('/') }}">{{ config('app.name') }}</a></b>
        </div>
        <strong>Powered by</strong> <a href="{{ url('/') }}">{{ config('app.name') }}</a>
    </footer>
</div>

@stack('scripts')
</body>
</html>
