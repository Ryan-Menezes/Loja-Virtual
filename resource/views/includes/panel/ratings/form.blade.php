<form action="{{ $action }}" method="{{ ($method != 'GET' && $method != 'POST') ? 'POST' : $method }}" class="border p-4 form-validate" enctype="multipart/form-data">
    @include('includes.messages')
    
    <input type="hidden" name="_method" value="{{ $method }}">
    
    @include('includes.components.form.select', [
        'name' => 'visible', 
        'title' => 'Visibilidade',
        'value' => (isset($rating) ? $rating->visible : null),
        'options' => [
            0 => 'Invisivel',
            1 => 'Visível'
        ],
        'required' => true
    ])

    <button type="submit" class="btn btn-danger">Salvar <i class="fas fa-save"></i></button>
</form>