<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property string $ID
 * @property string $lastName
 * @property string $firstName
 * @property string $patronymic
 * @property string $birthDate
 * @property string $workPhoneNumber
 * @property string $homePhoneNumber
 * @property string $mobilePhoneNumber
 * @property string $username
 * @property string $password
 * @property string $salt
 * @property string $photoFileName
 * @property integer $accessForLogin
 *
 * The followings are the available model relations:
 * @property Authitem[] $authitems
 * @property Company[] $companies
 * @property Company[] $companies1
 */
class User extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('lastName, firstName, birthDate', 'required'),
			array('accessForLogin', 'numerical', 'integerOnly'=>true),
			array('lastName, firstName, patronymic, workPhoneNumber, homePhoneNumber, mobilePhoneNumber, username, salt', 'length', 'max'=>45),
			array('password', 'length', 'max'=>200),
			array('photoFileName', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ID, lastName, firstName, patronymic, birthDate, workPhoneNumber, homePhoneNumber, mobilePhoneNumber, username, password, salt, photoFileName, accessForLogin', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'authitems' => array(self::MANY_MANY, 'Authitem', 'authassignment(userid, itemname)'),
			'companies' => array(self::HAS_MANY, 'Company', 'accountantID'),
			'companies1' => array(self::HAS_MANY, 'Company', 'SEOID'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ID' => 'ID',
			'lastName' => 'Last Name',
			'firstName' => 'First Name',
			'patronymic' => 'Patronymic',
			'birthDate' => 'Birth Date',
			'workPhoneNumber' => 'Work Phone Number',
			'homePhoneNumber' => 'Home Phone Number',
			'mobilePhoneNumber' => 'Mobile Phone Number',
			'username' => 'Username',
			'password' => 'Password',
			'salt' => 'Salt',
			'photoFileName' => 'Photo File Name',
			'accessForLogin' => 'Access For Login',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('ID',$this->ID,true);
		$criteria->compare('lastName',$this->lastName,true);
		$criteria->compare('firstName',$this->firstName,true);
		$criteria->compare('patronymic',$this->patronymic,true);
		$criteria->compare('birthDate',$this->birthDate,true);
		$criteria->compare('workPhoneNumber',$this->workPhoneNumber,true);
		$criteria->compare('homePhoneNumber',$this->homePhoneNumber,true);
		$criteria->compare('mobilePhoneNumber',$this->mobilePhoneNumber,true);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('salt',$this->salt,true);
		$criteria->compare('photoFileName',$this->photoFileName,true);
		$criteria->compare('accessForLogin',$this->accessForLogin);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
