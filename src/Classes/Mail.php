<?php
namespace Src\Classes;

use Src\Classes\Storage\File;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

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
    private static $replyTo = [];

    /** @var string|array */
    private static $cc = [];

    /** @var string|array */
    private static $bcc = [];

    /** @var string */
    private static $charset = 'utf-8';

    /** @var string */
    private static $isHtml = false;

    /** @var array */
    private static $attachments = [];

    /**
     * Method informs message subject
     *
     * @param string
     *
     * @return \Src\Classes\Mail
     */
    public static function subject(string $subject) : self{
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
    public static function message(string $message) : self{
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
    public static function addFrom(string $email, string $name) : self{
        self::$from[$name] = $email;

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
    public static function addReplyTo(string $email, string $name) : self{
        self::$replyTo[$name] = $email;

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
    public static function addCc(string $email, string $name) : self{
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
    public static function addBcc(string $email, string $name) : self{
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
    public static function charset(string $charset) : self{
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
    public static function isHtml(bool $html) : self{
        self::$isHtml = $html;

        return new static;
    }

    /**
     * Method that add a file
     *
     * @param \Src\Classes\Storage\File
     *
     * @return \Src\Classes\Mail
     */
    public static function addAttachment(File $file) : self {
        self::$attachments[] = $file;

        return new static;
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

        $mail = new PHPMailer();

        try {
            // Server settings
            // $mail->SMTPDebug = SMTP::DEBUG_SERVER;
            $mail->isSMTP();
            $mail->Host       = config('mail.host');
            $mail->SMTPAuth   = true;
            $mail->Username   = config('mail.username');
            $mail->Password   = config('mail.password');
            $mail->SMTPSecure = config('mail.encryption');
            $mail->Port       = config('mail.port');
            $mail->CharSet    = self::$charset;

            // Recipients
            $mail->addAddress(self::$to, self::$name);

            foreach (self::$from as $name => $address) {
                $mail->setFrom($address, $name);
            }

            foreach (self::$replyTo as $name => $address) {
                $mail->addReplyTo($address, $name);
            }

            foreach (self::$cc as $name => $address) {
                $mail->addCC($name, $address);
            }

            foreach (self::$bcc as $name => $address) {
                $mail->addBCC($name, $address);
            }

            // Attachments
            foreach (self::$attachments as $attachment) {
                $mail->addAttachment($attachment->tmp_name, $attachment->name);
            }

            // Content
            $mail->isHTML(self::$isHtml);
            $mail->Subject = self::$subject;
            $mail->Body    = self::$message;
            $mail->AltBody = self::$message;

            return $mail->send();
        } catch (Exception $e) {
            return false;
        }
    }
}
