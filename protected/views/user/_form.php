<?php
/* @var $this UserController */
/* @var $model User */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'lastName'); ?>
		<?php echo $form->textField($model,'lastName',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'lastName'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'firstName'); ?>
		<?php echo $form->textField($model,'firstName',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'firstName'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'patronymic'); ?>
		<?php echo $form->textField($model,'patronymic',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'patronymic'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'birthDate'); ?>
		<?php echo $form->textField($model,'birthDate'); ?>
		<?php echo $form->error($model,'birthDate'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'workPhoneNumber'); ?>
		<?php echo $form->textField($model,'workPhoneNumber',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'workPhoneNumber'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'homePhoneNumber'); ?>
		<?php echo $form->textField($model,'homePhoneNumber',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'homePhoneNumber'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'mobilePhoneNumber'); ?>
		<?php echo $form->textField($model,'mobilePhoneNumber',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'mobilePhoneNumber'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'username'); ?>
		<?php echo $form->textField($model,'username',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'username'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'password'); ?>
		<?php echo $form->passwordField($model,'password',array('size'=>60,'maxlength'=>200)); ?>
		<?php echo $form->error($model,'password'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'salt'); ?>
		<?php echo $form->textField($model,'salt',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'salt'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'photoFileName'); ?>
		<?php echo $form->textField($model,'photoFileName',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'photoFileName'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'accessForLogin'); ?>
		<?php echo $form->textField($model,'accessForLogin'); ?>
		<?php echo $form->error($model,'accessForLogin'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->