   <!-- Core JS -->
    <!-- build:js assets/Admin/vendor/js/core.js -->
    <script src="assets/Admin/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/Admin/vendor/libs/popper/popper.js"></script>
    <script src="assets/Admin/vendor/js/bootstrap.js"></script>
    <script src="assets/Admin/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/Admin/vendor/libs/hammer/hammer.js"></script>
    <script src="assets/Admin/vendor/libs/i18n/i18n.js"></script>
    <script src="assets/Admin/vendor/libs/typeahead-js/typeahead.js"></script>

    <script src="assets/Admin/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/Admin/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="assets/Admin/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/Admin/js/dashboards-crm.js"></script>
    
      <script src="assets/Admin/vendor/libs/formvalidation/dist/js/FormValidation.min.js"></script>
      <script src="assets/Admin/vendor/libs/formvalidation/dist/js/plugins/Bootstrap5.min.js"></script>
      <script src="assets/Admin/vendor/libs/formvalidation/dist/js/plugins/AutoFocus.min.js"></script>
      <script src="assets/Admin/js/pages-auth.js"></script>
      <script src="assets/Admin/js/validation.js"></script>
      
      <script src="assets/Admin/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
      <script src="assets/Admin/vendor/libs/flatpickr/flatpickr.js"></script>
       <script src="assets/Admin/vendor/libs/tagify/tagify.js"></script>
          <!-- Vendors JS -->
    <script src="assets/Admin/vendor/libs/moment/moment.js"></script>
    <!-- <script src="assets/Admin/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script> -->
    <script src="assets/Admin/vendor/libs/select2/select2.js"></script>
    <script src="assets/Admin/vendor/libs/cleavejs/cleave.js"></script>
    <script src="assets/Admin/vendor/libs/cleavejs/cleave-phone.js"></script>
    <script src="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.4/af-2.5.3/b-2.3.6/b-html5-2.3.6/b-print-2.3.6/cr-1.6.2/kt-2.8.2/r-2.4.1/sp-2.1.2/datatables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <!-- Main JS -->
    <script src="assets/Admin/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/Admin/js/app-user-list.js"></script>
     <script src="assets/Admin/js/form-wizard-numbered.js"></script>
    <script src="assets/Admin/js/form-wizard-validation.js"></script>
    <script src="assets/Admin/validation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
		<!-- select 2 plugin -->
<!--       <script src="assets/Admin/libs/select2/js/select2.min.js"></script>   -->
     <!-- <script src="assets/Admin/js/sweet-alerts.init.js"></script> -->
     
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      	<script src="https://cdn.ckeditor.com/ckeditor5/17.0.0/classic/ckeditor.js"></script>
     <script>
     let descriptionEditor;

     ClassicEditor
         .create(document.querySelector('#description'))
         .then(editor => {
             descriptionEditor = editor;
         })
         .catch(error => {
             console.error(error);
         });
     	$(document).ready(function (){
     		$(".btn").addClass("btn-sm");
     		$(".btn").css("margin-right","3px");
     		$("table .btn-sm, table .btn").addClass("btn-xs");
     	});
     	
     </script>
     <script>
document.querySelectorAll('.numberOnly').forEach(function(input) {
  input.addEventListener('input', function () {
    this.value = this.value.replace(/[^0-9]/g, '');
  });
});
document.querySelectorAll('.decimalOnly').forEach(function(input) {
	  input.addEventListener('input', function () {
	    // Replace anything that is not a digit or dot
	    this.value = this.value.replace(/[^0-9.]/g, '');

	    // Allow only one dot
	    if ((this.value.match(/\./g) || []).length > 1) {
	      this.value = this.value.substring(0, this.value.length - 1);
	    }
	  });
	});
</script>