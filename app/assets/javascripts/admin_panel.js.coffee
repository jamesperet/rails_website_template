# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


attachHandler = ->
	$(".bootstrap_switch").bootstrapSwitch('size', 'large');
	$('#admin_navbar').affix()
	$('.help_btn').popover('hide')
	  
$(document).ready attachHandler
$(document).on "page:load", attachHandler