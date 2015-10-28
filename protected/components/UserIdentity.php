<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 * @package backend.components
 */
class UserIdentity extends CUserIdentity
{

	private $_id;
	
	public function __construct($userName, $password)
	{
		parent::__construct($userName, $password);
	}

	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
		$user=User::model()->findByAttributes(array('username'=>$this->username));
		if($user===null)
		{
			$this->errorCode=self::ERROR_USERNAME_INVALID;
		}
		else
		{
			//if($user->password!==hash_password($this->password,$user->salt))
			if($user->password!==$this->password)
			{
				$this->errorCode=self::ERROR_PASSWORD_INVALID;
			}
			else
			{
				$this->_id = $user->ID;
				$this->setState('name',$this->username);
				$this->setState('title',$this->username);
				$this->errorCode=self::ERROR_NONE;				
			}
		}
		return !$this->errorCode;
	}
	
	public function getId()
	{
		return $this->_id;
	}

}