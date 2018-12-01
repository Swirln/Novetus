@extends('layouts.app')
@section('title', 'Welcome')

@section('content')

<div class="card card-image" style="background-image: url({{ url('/img/demos/Collage.jpg') }}); border-radius: 0px;">
  <div class="text-white text-center rgba-stylish-strong py-5 px-4">
    <div class="py-5">
      <h2 class="card-title h2 my-4 py-2"><img src="{{ url('/img/logos/NOVETUS_small.png') }}" style="max-width: 550px;"></img></h2>
      <p class="mb-4 pb-2 px-md-5 mx-md-5"> A multi-client ROBLOX launcher built to provide the best possible ROBLOX emulation experience.</p>
      <a class="btn blue-gradient"><span class="fas fa-gamepad"></span> Start playing</a>
    </div>
  </div>
</div>

<br><br>

<div class="row mx-1">
  <div class="col-lg-4 col-md-12 mb-4">
    <div class="card card-cascade narrower">
      <div class="view view-cascade overlay">
        <img class="card-img-top" src="{{ url('/img/demos/2014.png') }}" alt="Good stuff."></img>
        <a href="#!">
          <div class="mask rgba-white-slight waves-effect waves-light"></div>
        </a>
      </div>
      
	  <div class="card-body card-body-cascade text-center">
        <h4 class="card-title"><strong>2014</strong></h4>
        <p class="card-text">Yes, we have it.</p>
      </div>
    </div>
  </div>
</div>

@endsection
