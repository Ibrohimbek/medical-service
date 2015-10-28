<?php

class SettingsController extends Controller
{

    public $layout='//layouts/column1';
    public $defaultAction = 'index';

    public function actionIndex()
	{
        $this->layout='//layouts/column1';

        $model = Company::model()->findByPk(1);


		$this->render('index',
            array(
                'model' =>  $model
            )
        );
	}

}