<?php
namespace Src\Classes\SiteMap;

class SiteMap{
    /** @var array */
    private $urls;

    /** @var string */
    private $xml;

    public function __construct(){
        $this->urls = [];
    }

    /**
     * Add a url to the sitemap
     * 
     * @param string
     * @param string
     * 
     * @return \Src\Classes\SiteMap\SiteMap
     */
    public function addUrl(string $loc, string $changefreq, string $priority = '1.0') : SiteMap{
        array_push($this->urls, [
            'loc' => $loc,
            'lastmod' => date('Y-m-d') . 'T' . date('H:i:s') . '+00:00',
            'changefreq' => $changefreq,
            'priority' => $priority
        ]);

        return $this;
    }

    /**
     * Render XML
     * 
     * @return void
     */
    private function renderXML() : void{
        $this->xml  = '<?xml version="1.0" encoding="UTF-8"?>';
        $this->xml .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">';

        foreach($this->urls as $url){
            $this->xml .= '<url>';
            foreach($url as $key => $value){
                $this->xml .= "<{$key}>{$value}</{$key}>";
            }
            $this->xml .= '</url>';
        }

        $this->xml .= '</urlset>';
    }

    /**
     * Return XML
     * 
     * @return string|null
     */
    public function xml() : ?string{
        $this->renderXML();
        return $this->xml;
    }

    /**
     * Generate the sitemap file
     * 
     * @param string
     * 
     * @return void
     */
    public function generate(string $filename) : void{
        $filename = dirname(__DIR__, 3) . '/' . trim($filename, '/');
        
        file_put_contents($filename, $this->xml());
    }
}