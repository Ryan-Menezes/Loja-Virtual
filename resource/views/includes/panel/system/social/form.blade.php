<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate">
	<input type="hidden" name="_method" value="{{ $method }}">

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'url', 
				'name' => 'facebook', 
				'title' => 'Facebook', 
				'value' => (isset($system) && $system->social ? $system->social->facebook : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'url', 
				'name' => 'instagram', 
				'title' => 'Instagram', 
				'value' => (isset($system) && $system->social ? $system->social->instagram : null)
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'url', 
				'name' => 'twitter', 
				'title' => 'Twitter', 
				'value' => (isset($system) && $system->social ? $system->social->twitter : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'url', 
				'name' => 'linkedin', 
				'title' => 'Linkedin', 
				'value' => (isset($system) && $system->social ? $system->social->linkedin : null)
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'url', 
				'name' => 'youtube', 
				'title' => 'Youtube', 
				'value' => (isset($system) && $system->social ? $system->social->youtube : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'url', 
				'name' => 'twitch', 
				'title' => 'Twitch', 
				'value' => (isset($system) && $system->social ? $system->social->twitch : null)
			])
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'url', 
				'name' => 'discord', 
				'title' => 'Discord', 
				'value' => (isset($system) && $system->social ? $system->social->discord : null)
			])
		</div>
		<div class="col-md-6">
			@include('includes.components.form.input', [
				'type' => 'text', 
				'name' => 'whatsapp', 
				'title' => 'WhatsApp', 
				'value' => (isset($system) && $system->social ? $system->social->whatsapp : null),
				'class' => 'cell-mask'
			])
		</div>
	</div>
	<br>
	<button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>