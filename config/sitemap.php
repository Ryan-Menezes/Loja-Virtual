<?php
return [
    'filename' => 'sitemap.xml',
    'urls' => [
        [
            'loc' => route('site'),
            'changefreq' => 'weekly',
            'priority' => '1.00'
        ],
        [
            'loc' => route('site.notices'),
            'changefreq' => 'weekly',
            'priority' => '0.80'
        ],
        [
            'loc' => route('site.products'),
            'changefreq' => 'weekly',
            'priority' => '0.80'
        ],
    ],
    'images' => [
        'filename' => 'sitemap-images.xml',
        'directories' => [
            'public/assets/img/site',
            'public/assets/img/site/bg-img',
            'public/assets/img/site/core-img',
            'storage/app/public/products',
            'storage/app/public/notices',
            'storage/app/public/slideshow',
            'storage/app/public/banners',
            'storage/app/public/floaters'
        ]
    ]
];