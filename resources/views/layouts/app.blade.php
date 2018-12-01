<!DOCTYPE html>
<html>
    <head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Novetus - @yield('title')</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<link rel="stylesheet" href="{{ url('/css/mdb.min.css') }}">
		<link rel="stylesheet" href="{{ url('/css/bootstrap.min.css') }}">
		<link rel="stylesheet" href="{{ url('/css/app.css?v=69') }}">
		<script src="{{ url('/js/mdb.min.js') }}"></script>
		<script src="{{ url('/js/bootstrap.min.js') }}"></script>
    </head>
    <body>
		<nav class="navbar navbar-expand-xl fixed-top navbar-dark unique-color-dark">
			<img class="navbar-brand" src="{{ url('/img/logos/NOVETUS_small.png') }}"></img>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
					   <a class="nav-link waves-effect waves-light" href="{{ url('/') }}"><span class="fas fa-home"></span>     Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link waves-effect waves-light" href="{{ url ('/games') }}"><span class="fas fa-gamepad"></span>     Games</a>
					</li>
					<li class="nav-item">
						<a class="nav-link waves-effect waves-light" href="{{ url ('/host') }}"><span class="fas fa-server"></span>     Host</a>
					</li>
					<li class="nav-item">
						<a class="nav-link waves-effect waves-light" href="{{ url ('/character') }}"><span class="fas fa-male"></span>     Character</a>
					</li>
				</ul>
				<form class="form-inline">
					<div class="md-form my-0">
						<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
					</div>
				</form>
			</div>
		</nav>
        @yield('content')
    </body>
</html>
