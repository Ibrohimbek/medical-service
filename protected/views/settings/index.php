<div class="settings_main" style="margin: 50px;">

<?php
    $this->widget('booster.widgets.TbTabs', array(
            'type' => 'tabs',
            'tabs' => array(
                array('label' => 'Организация', 'content' => $this->renderPartial('tab_organisation', array('model'=> $model), true), 'active' => true),
                array('label' => 'Разделы', 'content' => $this->renderPartial('tab_department', NULL, true), 'active' => false),
                array('label' => 'Сотрудники', 'content' => $this->renderPartial('tab_employee', NULL, true), 'active' => false)
            )
        )
    );
?>