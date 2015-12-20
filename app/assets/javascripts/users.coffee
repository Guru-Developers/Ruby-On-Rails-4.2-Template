# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#Select from a patient in the table and view patient specific information including devices and annotiations
$ ->
  $("#patienttable").on "click", (event) ->
    selected_id = $(event.target).parent().children(".patient-id").text().trim()
    valid_entry = !!selected_id.match /\d+/i
    if valid_entry
      $('#patient-describe-view').addClass("hidden")
      $('#specific-patient-view').removeClass("hidden")
      patient_view_id = "#patient-view-#{selected_id}"
      $(patient_view_id).removeClass("hidden")
      $(patient_view_id).addClass("selected")

#Go back to the patient table after viewing patient specific information
$ ->
  $("#patient-table-back").on "click", (event) ->
    $('#specific-patient-view').addClass("hidden")
    $('#patient-describe-view').removeClass("hidden")
    $selected_patient = $('#specific-patient-view').children('.selected')
    $selected_patient.removeClass("selected")
    $selected_patient.addClass("hidden")