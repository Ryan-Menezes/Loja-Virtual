@if(isset($success))
<div class="alert alert-success">
	<p class="m-0 p-0">{{ $success }}</p>
</div>
@endif

@if(isset($error))
<div class="alert alert-danger">
	<p class="m-0 p-0">{{ $error }}</p>
</div>
@endif

@if(isset($errors))
	@foreach($errors as $error)
	<div class="alert alert-danger">
		<p class="m-0 p-0">{{ $error }}</p>
	</div>
	@endforeach
@endif