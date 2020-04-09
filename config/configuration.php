<?php
namespace leantime\core;

class config
{
    public $dbHost = null;  //Database host
	public $dbUser = null;   //Database username
	public $dbPassword = null; //Database password
    public $dbDatabase = null; //Database name
    public $sessionpassword = null; //Salting sessions. Replace with a strong password
    

	/* General */
	public $sitename = "Leantime"; //Name of your site, can be changed later
	public $language = "en-US"; //Default language
    public $mainColor = "1b75bb"; //Default color, can be changed later
    public $logoPath = "/images/logo.png"; //Default logo path, can be changed later
    public $appUrl = ""; //Base URL, trailing slash not needed

    /* Database 
    public $dbHost = getenv("DATABASE_HOST");  //Database host
	public $dbUser = getenv("DATABASE_USER");   //Database username
	public $dbPassword = getenv("DATABASE_PASSWORD"); //Database password
    public $dbDatabase = getenv("DATABASE_NAME"); //Database name */
    

        /* Fileupload */
	public $userFilePath= "userfiles/"; //Local relative path to store uploaded files (if not using S3)
								
	public $useS3 = false; //Set to true if you want to use S3 instead of local files
	public $s3Key = ""; //S3 Key
	public $s3Secret = ""; //S3 Secret
	public $s3Bucket = ""; //Your S3 bucket
	public $s3Region = ""; //S3 region
	public $s3FolderName = ""; //Foldername within S3 (can be emtpy)
								
	/* Sessions */
//	public $sessionpassword = getenv("LEANTIME_SECRET_TOKEN"); //Salting sessions. Replace with a strong password
    public $sessionExpiration = 28800; //How many seconds after inactivity should we logout?  28800seconds = 8hours

	/* Email */
	public $email = ""; //Return email address
	public $useSMTP = false; //Use SMTP? If set to false, the default php mail() function will be used
	public $smtpHosts = ""; //SMTP host
	public $smtpUsername =""; //SMTP username
	public $smtpPassword = ""; //SMTP password
	public $smtpAutoTLS = true; //SMTP Enable TLS encryption automatically if a server supports it
	public $smtpSecure =""; //SMTP Security protocol (usually one of: TLS, SSL, STARTTLS)
	public $smtpPort = ""; //Port (usually one of 25, 465, 587, 2526)

    public function __construct() {
        $this->dbHost = getenv('DATABASE_HOST');
        $this->dbUser = getenv('DATABASE_USER');
        $this->dbPassword = getenv('DATABASE_PASSWORD');
        $this->dbDatabase = getenv('DATABASE_NAME');
        $this->sessionpassword = getenv('LEANTIME_SECRET_TOKEN');
    }
}