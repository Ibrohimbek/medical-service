<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');
	Yii::setPathOfAlias('booster', dirname(__FILE__) . DIRECTORY_SEPARATOR . '../extensions/yiibooster');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Medical service',
	'language'=>'ru',
	
	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		
		'application.modules.rights.*',
        'application.modules.rights.components.*',
		'application.modules.rights.models.*'
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'12233',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),
		'rights'=>array(
            'install'=>false,
            'userClass'=>'User',
            'userIdColumn'=>'ID',
            'userNameColumn'=>'username',
            'enableBizRule'=>true,
            'enableBizRuleData'=>true,
            'superuserName'=>'Admin',

        ),
		
	),

	// application components
	'components'=>array(
		'user'=>array(
			'class'=>'RWebUser',
			'allowAutoLogin'=>true,
		),
		'authManager'=>array(
            'class'=>'RDbAuthManager',
			'assignmentTable'=>'authassignment',
			'itemTable'=>'authitem',
			'rightsTable'=>'rights',
			'itemChildTable'=>'authitemchild',
        ),
		//'user'=>array(
			// enable cookie-based authentication
		//	'allowAutoLogin'=>true,
		//),
		// uncomment the following to enable URLs in path-format
		'urlManager'=>array(
			'urlFormat'=>'path',
            'showScriptName' => false,
			'rules'=>array(
				
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
				
			),
		),
		
		/*
		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		*/
		/*
		'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),
		*/
		// uncomment the following to use a MySQL database
		
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=medical_service',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => 'max@789@biotrack*',
			'charset' => 'utf8',
            
		),		
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
		
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
		
		'booster' => array(
            'class' => 'booster.components.Booster',
        ),
	),
	
	// preloading 'log' component
	'preload'=>array('log', 'booster'),
	


	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'faxriddinjon@gmail.com',
	),
);