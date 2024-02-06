$(document).ready(function() {
      $('#file-export').DataTable({
        // Add your options here
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "dom": 'Bfrtip',
        "buttons": [
          'copy', 'csv', 'excel', 'pdf', 'print'
        ]
      });
    });