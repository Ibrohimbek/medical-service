<?php
/* @var $this CompanyController */
/* @var $data Company */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('ID')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->ID), array('view', 'id'=>$data->ID)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('description')); ?>:</b>
	<?php echo CHtml::encode($data->description); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('address')); ?>:</b>
	<?php echo CHtml::encode($data->address); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('logoFile')); ?>:</b>
	<?php echo CHtml::encode($data->logoFile); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('SEOID')); ?>:</b>
	<?php echo CHtml::encode($data->SEOID); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('accountantID')); ?>:</b>
	<?php echo CHtml::encode($data->accountantID); ?>
	<br />


</div>