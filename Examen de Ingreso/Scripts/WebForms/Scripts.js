function configurationDatePicker() {
    //Configuración datepicker.
    $('.selector_fechas').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: 'true'
    });
}

configurationDatePicker();