<?php
$system = (new \App\Models\System())->firstOrFail();

return [
	'active'			=> $system->lgpd->active,
	'privacy_policy' 	=> $system->lgpd->privacy_policy,
	'terms_conditions'	=> $system->lgpd->terms_conditions,
	'return_policy'		=> $system->lgpd->return_policy
];