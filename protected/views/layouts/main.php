<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="ru" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

    <!-- CSS -->
        <link href="../libs/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="../libs/live/css/ace.min.css" media="screen" type="text/css" rel="stylesheet">
        <link href="../libs/css/main_css.css" rel="stylesheet">
    <!--end CSS -->

    <!--JS-->
        <script src="../libs/live/js/ace-extra.min.js"></script>
    <!--end JS-->

</head>

<body class="no-skin" >
<?php
    
    $user_div = '
                    <div role="navigation" class="navbar-buttons navbar-header pull-right  collapse navbar-collapse">
                                <ul class="nav ace-nav">

                                    <li class="light-blue user-min">
                                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                                            <img alt="Jason Photo" src="../image/user.jpg" class="nav-user-photo">
                                            <span class="user-info">
                                                <small>Salom,</small>Ibrohim
                                            </span>

                                            <i class="ace-icon fa fa-caret-down"></i>
                                        </a>

                                        <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                            <li>
                                                <a href="#">
                                                    <i class="ace-icon fa fa-cog"></i>
                                                    Settings
                                                </a>
                                            </li>

                                            <li>
                                                <a href="profile.html">
                                                    <i class="ace-icon fa fa-user"></i>
                                                    Profile
                                                </a>
                                            </li>

                                            <li class="divider"></li>

                                            <li>
                                                <a href="#">
                                                    <i class="ace-icon fa fa-power-off"></i>
                                                    Logout
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                ';

    $this->widget( 'booster.widgets.TbNavbar',
            array(
                'type' => null, // null or 'inverse'
                'brand' => '<span center>Медицинская Академия</span>',
                'brandUrl' => '#',
                'collapse' => false, // requires bootstrap-responsive.css
                'fixed' => false,
                'fluid' => true,
                'items' => array(
                    array(
                        'class' => 'booster.widgets.TbMenu',
                        'type' => 'navbar',
                        'items' => array(
                            array('label' => 'Отделы', 'url' => 'department'),
                            array('label' => 'Отчеты', 'url' => '#'),
                            array(
                                'label' => 'База',
                                'url' => '#',
                                'items' => array(
                                    array('label' => 'Настройки', 'url' => Yii::app()->baseUrl.'settings'),
                                    array('label' => 'Палаты', 'url' => '#'),
                                    '---',
                                    array('label' => 'Диагнозы', 'url' => '#'),
                                    array('label' => 'Операции','url' => '#'),
                                    array('label' => 'Медикаменты','url' => '#'),
                                    '---',
                                    array('label' => 'Сметы', 'url' => '#'),
                                )
                            ),
                        ),
                    ),

                    $user_div,


                ),
            )
    );
?>


<div id="main-container" class="main-container">
    <?php echo $content; ?>
</div>



<script src="../libs/live/js/ace-elements.min.js"></script>
<script src="../libs/live/js/ace.min.js"></script>


</body>

</html>
