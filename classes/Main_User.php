<?php

require_once("user.php");

class Main_User extends User {
	
	protected $user_id;
	
	protected $user_username;
	
	protected $user_loggedin;
	
	function __construct() {

		//parent::__construct();

	$this->setLoggedin(false);

	$this->setUsername("");

	$this->setId("0");

	}

	public function setId($id) { //set private id
		
		$this->user_id = $id;
	
	}
	
	public function setUsername($username) { //set private username
		
		$this->user_username = $username;
	
	}
	
	public function setLoggedin($loggedin) { //set private log in
		
		$this->user_loggedin = $loggedin;
	
	}

	public function setIP($ip) {

		$this->ip = $ip;

	}


	public function getLoggedin() {
		
		return $this->user_loggedin;
		
	}
	
	public function getId() {
		
		return $this->user_id;
		
	}
	
	public function getUsername() {
		
		return $this->user_username;
		
	}

	public function getIP() {

		return $this->last_ip;

	}

}

?>
