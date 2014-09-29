<?php

class User { //main user

	protected $token;
	
	protected $token1;
	
	protected $verified;
	
	protected $last_ip;
	
	function __construct() { //constructor
	
		$this->check(); //check
	
	}
		
	public function check() { //call to check session
	
		//made in new object class
		
	}
	
	public function logout() { //logout
	
		session_destroy();
		
		$this->check();
		
		header("Location:../index.php");
		
	}
	
	public function setToken($t) { //set token
		
		$this->token = $t;
	
	}
	
	public function setToken1($t) { //set token with session id
		
		$this->token1 = $t;
	
	}
	
	public function setVerified($v) { //set verified
		
		$this->verified = $v;
	
	}
	
	public function setIP($ip) { //set verified
		
		$this->last_ip = $ip;
	
	}
	
	public function setId($id) { //set private id
		
		//made in the new object class
	
	}
	
	public function setUsername($username) { //set private username
		
		//made in the new object class
	
	}
	
	public function setLoggedin($loggedin) { //set private log in
	
		//made in the new object class
	
	}
	
	public function getTokens() {
		
		//made in the new object class
		
	}
	
	public function getVerified() {
		
		//made in the new object class
		
	}
	
	public function getLoggedin() {
	
		//made in the new object class		
		
	}
	
	public function getId() {
		
		//made in the new object class
		
	}
	
	public function getUsername() {
		
		//made in the new object class
		
	}
	
	public function toString() { //print id, loggedin, and username
		
		echo $this->getId();
		echo $this->getLoggedin();
		echo $this->getUsername();
	}
	
}

?>
