<?php
$system = (new \App\Models\System())->firstOrFail();

return [
	'active' 	=> $system->floater->active,
	'image'		=> $system->floater->image,
	'link' 		=> $system->floater->link
];