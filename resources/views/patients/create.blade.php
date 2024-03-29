@extends('layouts.panel')

@section('content')
<div class="card shadow">
  <div class="card-header border-0">
    <div class="row align-items-center">
      <div class="col">
        <h3 class="mb-0">Nuevo Paciente</h3>
      </div>
      <div class="col text-right">
        <a href="{{ url('/patients') }}" class="btn btn-sm btn-default">
          Cancelar y Volver
        </a>
      </div>
    </div>
  </div>
  <div class="card-body">
    @if ($errors->any())
      <ul>
        @foreach ($errors->all as $error)
        <li>{{ $error }}</li>
        @endforeach
      </ul>
    @endif

    <form action="" method="POST">
      <div class="form-group">
        <label for="name">Nombre del Paciente</label>
        <input type="text" name="name" class="form-control" value="{{ old('name') }}" required>
      </div>
      <div class="form-group">
        <label for="description">E-mail</label>
        <input type="text" name="email" class="form-control" value="{{ old('email') }}">
      </div>
      <div class="form-group">
        <label for="description">DNI</label>
        <input type="text" name="dni" class="form-control" value="{{ old('dni') }}">
      </div>
      <div class="form-group">
        <label for="description">Dirección</label>
        <input type="text" name="address" class="form-control" value="{{ old('address') }}">
      </div>
      <div class="form-group">
        <label for="description">Telefono/Móvil</label>
        <input type="text" name="phone" class="form-control" value="{{ old('phone') }}">
      </div>
      <button type="submit" class="btn btn-primary">
        Guardar
      </button>
    </form>
  </div>
</div>
@endsection
