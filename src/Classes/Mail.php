<?php
namespace Src\Classes;

class Mail{
    /** @var string */
    private static $to = null;

    /** @var string */
    private static $name = null;

    /** @var string */
    private static $subject = null;

    /** @var string */
    private static $message = null;

    /** @var string|array */
    private static $from = [];

    /** @var string|array */
    private static $cc = [];

    /** @var string|array */
    private static $bcc = [];

    /** @var string */
    private static $charset = 'utf-8';

    /** @var string */
    private static $contentType = 'text/plain';

    /** @var string */
    private static $header = null;

    /**
     * Method informs message subject
     * 
     * @param string
     * 
     * @return \Src\Classes\Mail
     */
    public static function subject(string $subject) : Mail{
        self::$subject = $subject;

        return new static;
    }

    /**
     * Method that informs the email message
     * 
     * @param string|array
     * 
     * @return \Src\Classes\Mail
     */
    public static function message(string $message) : Mail{
        self::$message = $message;

        return new static;
    }

    /**
     * Method that informs who the sender will be
     * 
     * @param string
     * @param string
     * 
     * @return \Src\Classes\Mail
     */
    public static function addFrom(string $email, string $name) : Mail{
        self::$from[$name] = $email;

        return new static;
    }

    /**
     * Method that tells who will receive a copy of that email
     * 
     * @param string
     * @param string
     * 
     * @return \Src\Classes\Mail
     */
    public static function addCc(string $email, string $name) : Mail{
        self::$cc[$name] = $email;

        return new static;
    }    

    /**
     * Method that tells who will receive a copy of that email
     * 
     * @param string
     * @param string
     * 
     * @return \Src\Classes\Mail
     */
    public static function addBcc(string $email, string $name) : Mail{
        self::$bcc[$name] = $email;

        return new static;
    }

    /**
     * Method that sets the text encoding type
     * 
     * @param string
     * 
     * @return \Src\Classes\Mail
     */
    public static function charset(string $charset) : Mail{
        self::$charset = $charset;

        return new static;
    }

    /**
     * Method that determines whether text will be interpreted as HTML
     * 
     * @param bool
     * 
     * @return \Src\Classes\Mail
     */
    public static function isHtml(bool $html) : Mail{
        if($html)
            self::$contentType = 'text/html';
        else
            self::$contentType = 'text/plain';

        return new static;
    }

    /**
     * Method that sets the page header
     * 
     * @return void
     */
    private static function setHeader() : void{
        // Format From
        if(is_array(self::$from)){
            foreach(self::$from as $name => $email){
                self::$from[$name] = "{$name} <{$email}>";
            }

            self::$from = implode(', ', self::$from);
        }

        // Format Cc
        if(is_array(self::$cc)){
            foreach(self::$cc as $name => $email){
                self::$cc[$name] = "{$name} <{$email}>";
            }

            self::$cc = implode(', ', self::$cc);
        }

        // Format Bcc
        if(is_array(self::$bcc)){
            foreach(self::$bcc as $name => $email){
                self::$bcc[$name] = "{$name} <{$email}>";
            }

            self::$bcc = implode(', ', self::$bcc);
        }

        // Set Header
        self::$header  = "MIME-Version: 1.0\r\n";
        self::$header .= "Content-Type: " . self::$contentType . "; charset=" . self::$charset . "\r\n";

        self::$header .= 'To: ' . self::$name .  ' <' . self::$to . '>' . "\r\n";

        if(!empty(self::$cc))
            self::$header .= 'Cc: ' . self::$cc . "\r\n";

        if(!empty(self::$bcc))
            self::$header .= 'Bcc: ' . self::$bcc . "\r\n";

        if(!empty(self::$from)){
            self::$header .= 'From: ' . self::$from . "\r\n";
            self::$header .= 'Reply-To: ' . self::$from . "\r\n";
        }   

        self::$header .= "X-Mailer: php\r\n";
    }

    /**
     * Method sends the email
     * 
     * @param string
     * 
     * @return bool
     */
    public static function send(string $to, string $name) : bool{
        self::$to = $to;
        self::$name = $name;
        self::setHeader();

        return mail(self::$to, self::$subject, self::$message, self::$header);
    }
}