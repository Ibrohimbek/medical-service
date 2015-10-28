<?php
    $form = $this->beginWidget(
        'booster.widgets.TbActiveForm',
        array(
            'id' => 'org_info',
            'type' => 'horizontal',
            'htmlOptions' => array('class' => 'well'),
        )
    );

    echo $form->textFieldGroup($model, 'name');
    echo $form->textFieldGroup($model, 'address');
    echo $form->textFieldGroup($model, 'SEOID');
    echo $form->textFieldGroup($model, 'accountantID');
    //echo $form->passwordFieldGroup($model, 'password');
    //echo $form->checkboxGroup($model, 'checkbox');

    $this->widget(
        'booster.widgets.TbButton',
        array('buttonType' => 'submit', 'label' => 'Login')
    );

    $this->endWidget();
    unset($form);
?>