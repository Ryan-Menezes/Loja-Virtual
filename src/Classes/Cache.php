<?php

namespace Src\Classes;

class Cache {
    private string $dir;

    public function __construct()
    {
        $dir = trim(trim(config('cache.dir'), '/'), DIRECTORY_SEPARATOR);
        $this->dir = __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . $dir;
    
        if (!file_exists($this->dir)) {
            mkdir($this->dir);
        }
    }

    public function remember(string $key, int $expirationSeconds, callable $fn): mixed
    {
        $this->verifyExpiration($key, $expirationSeconds);

        if ($this->has($key))
        {
            return $this->get($key);
        }

        return $this->set($key, $fn());
    }

    private function verifyExpiration(string $key, int $expirationSeconds): void
    {
        if (!$this->has($key))
        {
            return;
        }

        $time = time();
        $fileTime = filemtime($this->getFilePath($key)) + $expirationSeconds;

        if ($time > $fileTime) {
            $this->forget($key);
        }
    }

    public function rememberForever(string $key, callable $fn): mixed
    {
        if ($this->has($key))
        {
            return $this->get($key);
        }

        return $this->set($key, $fn());
    }

    public function has(string $key): bool
    {
        return file_exists($this->getFilePath($key));
    }

    public function get(string $key): mixed
    {
        if (!$this->has($key)) {
            return null;
        }
        
        $content = file_get_contents($this->getFilePath($key));

        return json_decode($content);
    }

    public function set(string $key, mixed $value): mixed
    {
        $path = $this->getFilePath($key);
        $content = json_encode($value);
        
        file_put_contents($path, $content);
        
        return $this->get($key);
    }

    private function getFilePath(string $key): string
    {
        return $this->dir . DIRECTORY_SEPARATOR . $key . '.json';
    }

    public function forget(string $key): void
    {
        if ($this->has($key)) {
            unlink($this->getFilePath($key));
        }
    }
}
