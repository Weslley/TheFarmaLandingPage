// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
// require turbolinks

//= require vendor/jQuery/jquery-1.12.4.min.js
//= require vendor/bootstrap/bootstrap.min.js

//= require vendor/jquery-inputmask/jquery.inputmask.bundle.min.js
//= require vendor/jquery-maskMoney/jquery.maskMoney.min.js
//= require vendor/propeller/propeller.min.js

//$.noConflict();

$(function() {
  init();
});

function init() {
  //$('select[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable();

  //$("[data-toggle='tooltip']").tooltip();
  //$(':file').filestyle({buttonText : ''});
  //$('select').select2();
  //$(".checkbox").iCheck({radioClass: 'icheck_minimal'});
  //$("input[type='radio']").iCheck({radioClass: 'iradio_minimal'});

  //$(".timepicker").timepicker({showInputs: false, showMeridian: false});
  //$('.datepicker').datepicker({format: "dd/mm/yyyy",language: "pt-BR" });
  //$(".colorpicker").colorpicker();

  $(".moeda").maskMoney({
    prefix: "R$ ",
    thousands: ".",
    decimal: ",",
    allowZero: true,
    precision: 2
  });
  $(".percentual").maskMoney({ thousands: ".", decimal: ",", allowZero: true });

  $(".data").inputmask({ mask: "99/99/9999" });
  $(".datetime").inputmask({ mask: "99/99/9999 99:99" });
  $(".horario").inputmask({ mask: "99:99" });
  $(".cpf").inputmask({ mask: "999.999.999-99" });
  $(".cnpj").inputmask({ mask: "99.999.999/9999-99" });
  $(".cep").inputmask({ mask: "99999-999" });
  $(".placa").inputmask({ mask: "aaa-9999" });
  $(".telefone").inputmask({ mask: "(99)9999-9999" });
  $(".celular").inputmask({ mask: "(99)99999-9999" });
  $(".numero").inputmask("Regex", { regex: "[0-9]+" });

  function reposition() {
    var modal = $(this),
      dialog = modal.find(".modal-dialog");
    modal.css("display", "block");
    dialog.css(
      "margin-top",
      Math.max(0, ($(window).height() - dialog.height()) / 2)
    );
  }

  $(".modal").on("show.bs.modal", reposition);
  $(window).on("resize", function() {
    $(".modal:visible").each(reposition);
  });
}

