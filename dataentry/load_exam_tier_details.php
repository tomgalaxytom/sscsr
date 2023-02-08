<?php

require_once("config/db.php");
require_once("functions.php");

if( isset( $_SERVER['HTTP_X_REQUESTED_WITH'] ) && ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' ) )
{

	$output = "";

	$query =  "select  em.exam_name, dtm.no_of_days,dbm.table_exam_year, dbm.table_type, dbm.table_name,dbm.table_exam_short_name,dtm.tier_id as tier_id,dtm.updated_on as updated_on,tm.tier_name as tier_name,dtm.id as tier_master_id,dtm.status as dtmstatus  from exam_master em 
	join sscsr_db_table_master dbm on em.exam_short_name = dbm.table_exam_short_name
	join sscsr_db_table_tier_master dtm on dbm.table_name = dtm.table_name
	join tier_master tm on cast(dtm.tier_id as char(255)) =  cast(tm.tier_id as char(255)) order by dbm.table_exam_year desc,dtm.tier_id asc ";

	$result =  getAll($query);
	$resultCount =  getRowCount($query);



	/* 
	print_r($result);
	exit; */
	
	

	$output .= "
	 <form id='frm-example' action='' method='POST'>
	 <table id='exam_data' class='display table table-striped table-bordered dt-responsive' width='100%'>
						<thead>
							<tr class='danger'>	
							  <th width=3%>Sno</th>						  
							  <th width=20%>Exam Name</th> 
							  <th width=10%>Exam Type</th> 
							  <th width=3%>Rows</th>  
							  <th width=1%>Count<br>Days</th> 
							  <th width=5%>Exam<br> Date</th> 
							  <th width=15%>Action</th>							  
							</tr>
						</thead>
						<tfoot>
							<tr class='success'>       
							 <th width=3%>Sno</th>						  
							  <th width=20%>Exam Name</th>                    
							  <th width=10%>Exam Type</th> 
							  <th width=3%>Rows</th>
							  <th width=1%>Count<br>Days</th> 
							  <th width=5%>Exam <br> Date</th>	
							  <th width=15%>Action</th>							  
							 
							</tr>
						</tfoot>
					<tbody>
	 ";
	$i = 1;

	foreach ($result as $row) {
		
		$table_count =  "select count(*) from $row->table_name    where tier_id='$row->tier_id'";
		$table_tot_row_count =  getRowCount($table_count);
		$sql = "SELECT date1::date - INTEGER '$row->no_of_days' AS yesterday_date FROM $row->table_name where tier_id = '$row->tier_id' order by id asc limit 1";
		$result =  getAll($sql);
		$sql2 = "SELECT date1::date  AS exam_date FROM $row->table_name where tier_id = '$row->tier_id' order by id asc limit 1";
		$result2 =  getAll($sql2);
		$admitcard_enable_date = $result[0]->yesterday_date;
		$current_exam_date = $result2[0]->exam_date;
		$str = $row->no_of_days.'=>'.$admitcard_enable_date.'=>'.$current_exam_date;

		$examname =  $row->exam_name.' ('.$row->tier_name.') ('.$row->table_exam_year.')';
		if($row->table_type=='kyas'){
			$table_for = "Application Status";
		}
		else if($row->table_type=='tier'){
			$table_for = "Written Exam";
		}else if($row->table_type=='skill'){
			$table_for = "Skill Test";
		}else if($row->table_type=='dme'){
			$table_for = "Detailed Medical Examination";
		}else if($row->table_type=='pet'){
			$table_for = "Physical Standard Test and Physical Endurance Test";
		}else if($row->table_type=='dv'){
			$table_for = "Document Verification";
		}
		
		//if($row->dtmstatus == '0'){
			
			$output .=
			'<tr class="warning">
			<td width="20px">' . $i . '</td>
			<td id ="exam_name_id">' .	$examname . '</td>
			<td>' .	$table_for . '</td>
			<td style="text-align:right">' . $table_tot_row_count  . '</td>
			<td style="text-align:right" class="publish-button">' .	$row->no_of_days .'&nbsp;&nbsp;<i class="fa fa-pencil "  id ="red" style="color:grey"></i> <input class="form-control" type="hidden" name="id" id="tier_master_id" value=' .	$row->tier_master_id . '></td>
			<td style="text-align:right" class="exam_date_class">' .	$current_exam_date .'</td>';
			 $enable_date = date('Y-m-d', strtotime($admitcard_enable_date))."<br>";
			 
			
			   $current_date = date('Y-m-d');
			   //$current_date = "2023-02-10";
			   $exam_date    =  date('Y-m-d', strtotime($current_exam_date));
			   $enable_date = date('Y-m-d', strtotime($admitcard_enable_date));

				// echo "Current Date: " .$current_date."<br>";
				// echo "Exam Date: " . $exam_date."<br>";
				// echo "Previus Date: " .$enable_date."<br>";






			date_default_timezone_set("Asia/Calcutta"); 
			$updated_time = $date = date("Y-m-d H:i:s");



		
			 if( $current_date == $enable_date ){
				$sql = "UPDATE public.sscsr_db_table_tier_master SET  status='1',updated_on = '$updated_time' WHERE id='$row->tier_master_id'";
				$stmt = $pdo->prepare($sql);
				$stmt->execute();
				$text  = $row->updated_on == null ? '' : '<span style="color:green;font-size:13px">Published Time: </span>';
				$time = $row->updated_on == null ? '' :'<span style="color:black;font-size:13px">'.date("d-m-Y H:i:s", strtotime($row->updated_on)).'</span>';
				$output .='<td>
				<form method="post">
					<i class="fa fa-flag c" id ="green" style="color:green"></i>  
					<span>'.$text.	$time  . '</span>
				</form>
				<input class="form-control" type="hidden" name="id" id="tier_master_id" value=' .	$row->tier_master_id . '>
				
				</td></tr>';

			 }
			 else if($current_date > $exam_date ){
				$sql = "UPDATE public.sscsr_db_table_tier_master SET  status='0',updated_on = '$updated_time' WHERE id='$row->tier_master_id'";
				$stmt = $pdo->prepare($sql);
				$stmt->execute();
				$text  = $row->updated_on == null ? '' : '<span style="color:red;font-size:13px">Unpublished Time: </span>';
				$time = $row->updated_on == null ? '' :'<span style="color:black;font-size:13px">'.date("d-m-Y H:i:s", strtotime($row->updated_on)).'</span>';
				$output .='<td>
				<form method="post">
					<i class="fa fa-flag "  id ="red" style="color:red"></i>  
					<span>'.$text.	$time  . '</span>
				</form>
				<input class="form-control" type="hidden" name="id" id="tier_master_id" value=' .	$row->tier_master_id . '>
				
				</td></tr>';
			 }
			 else{
				$sql = "UPDATE public.sscsr_db_table_tier_master SET  status='0',updated_on = '$updated_time' WHERE id='$row->tier_master_id'";
				$stmt = $pdo->prepare($sql);
				$stmt->execute();
				$text  = $row->updated_on == null ? '' : '<span style="color:red;font-size:13px">Unpublished Time: </span>';
				$time = $row->updated_on == null ? '' :'<span style="color:black;font-size:13px">'.date("d-m-Y H:i:s", strtotime($row->updated_on)).'</span>';
				$output .='<td>
				<form method="post">
					<i class="fa fa-flag "  id ="red" style="color:red"></i>  
					<span>'.$text.	$time  . '</span>
				</form>
				<input class="form-control" type="hidden" name="id" id="tier_master_id" value=' .	$row->tier_master_id . '>
				
				</td></tr>';
				
			 }
			

// exit;



			// if($row->dtmstatus == '0'){
				
				
			// }
			// else{
				
				
			// }
			
			
			$i++;
		
			
	}
	$output .= "</tbody></table>";
	echo $output;

}
else{
	header("Location: index.php"); 
	exit();
	
}

?>
<script type="text/javascript" language="javascript">


	$(document).ready(function() {
		// Setup - add a text input to each footer cell
		$('#exam_data tfoot th').each(function() {
			var title = $('#exam_data thead th').eq($(this).index()).text();
			$(this).html('<input type="text" placeholder="&#xF002;"  style="font-family:FontAwesome;" />');
		});

		// DataTable
		var table = $('#exam_data').DataTable({

			select: {
				'style': 'multi'
			},


			pageLength: 5,
			lengthMenu: [
				[5, 10, 20, -1],
				[5, 10, 20, 'All']
			],
			"dom": "RZfrltip",
			select: true,

		});

		// Apply the search
		table.columns().eq(0).each(function(colIdx) {
			$('input', table.column(colIdx).footer()).on('keyup change', function() {
				table.column(colIdx)
					.search(this.value)
					.draw();
			});
		});


		// Fetch  Single record
	//	$('.updateUser').on('click', function(event) {
		$('#exam_data').on('click', '.updateUser', function(event) {
			event.preventDefault();
			var id = $(this).data('id');

			$('#txt_userid').val(id);

			// AJAX request
			$.ajax({
				url: 'ajaxfile.php',
				type: 'post',
				data: {
					request: 2,
					id: id
				},
				dataType: 'json',
				success: function(response) {
					
					if (response.status == 1) {

						$('#column_name_update').val(response.data.col_name);
						$('#column_description_update').val(response.data.col_description);
						if (response.data.is_kyas === '1') {

							$(".kyas").prop('checked', true);
						}
						if (response.data.is_tier === '1') {
							$(".tier").prop('checked', true);
						}

					} else {
						alert("Invalid ID.");
					}
				}
			});

		});





		// Save user 
		$('#btn_update_save').click(function(event) {
			
			event.preventDefault();
			var id = $('#txt_userid').val();

			var column_name_update = $('#column_name_update').val().trim();
			var column_description_update = $('#column_description_update').val().trim();
			var myCheckboxes = new Array();
			$("input:checked").each(function() {
				myCheckboxes.push($(this).val());
			});


			if (column_name != '' && column_description != '' && myCheckboxes != '') {
				$.ajax({
					url: "ajaxfile.php",
					method: "POST",
					data: {
						request: 3,
						id: id,
						column_name_update: column_name_update,
						column_description_update: column_description_update,
						myCheckboxes: myCheckboxes,
					},
					dataType: "json",
				}).done(function(data) {
					$('#updateModal').modal('toggle');
					$('#column_name_update', '#column_name_update').val('');

					swal.fire({
						showCloseButton: true,
						title: data.response.title,
						text: data.response.message,
						icon: data.response.status,
					}).then(function() {
						location.reload();
					});


				});
			} else {

				swal.fire("Oops", "Please fill the required ( *) fields !", "error")
			}

		});

		//Delete column master
		$('#exam_data').on('click', '.deleteUser', function(event) {
			//$('#btn_update_save').click(function(event) {
			event.preventDefault();
			var id = $(this).data('id');
			var deleteConfirm = confirm("Are you sure?");
			if (deleteConfirm == true) {
				// AJAX request
				$.ajax({
					url: "ajaxfile.php",
					method: "POST",
					data: {
						request: 4,
						id: id
					},
					dataType: "json",
				}).done(function(data) {


					swal.fire({
						showCloseButton: true,
						title: data.response.title,
						text: data.response.message,
						icon: data.response.status,
					}).then(function() {
						location.reload();
					});


				});
			}


		});
		
		
		//Publish Button
	 
	 $('#exam_data').on('click', '.publish-button', function(event) {
		debugger;
		 
		 
		
	// $('#tbl').on('click', 'tbody tr a', function() 
	 
    var exam_tier_master_id =  $(this).closest('td').find('#tier_master_id').val();
	  //var baseurl = 'exam_tier_master_publish_ajax.php';
      //var redirecturl = 'dataentry/exam_tier_master.php';
	 var count_of_days = $(this).parent().find('.publish-button').text();

	 var exam_date = $(this).parent().find('.exam_date_class').text();
	 
	 
	 
	// var exam_name = $(this).closest('tr').find('#exam_name_id').text();
	//   	if(iconid=='green'){
	// 	var title ="Un Publish";
	// }
	// else{
	// 	var title =" Publish";
	// }  

	

	  
	  
	swal.fire({
		title: '<strong> Want to change Count of Days</strong>',
		showCloseButton: true,
		confirmButtonText: 'Yes',
		cancelButtonText: 'No',
		confirmButtonClass: 'some-class',
		cancelButtonClass: 'some-other-class',
		showCancelButton: true
	}).then(function(result) {
		if (result.value) {

			// Prompt Box
			Swal.fire({
			title: 'Submit your no of days',
			input: 'text',
			inputAttributes: {
				autocapitalize: 'off'
			},
			showCancelButton: true,
			confirmButtonText: 'submit',
			showLoaderOnConfirm: true,
			preConfirm: (login) => {
debugger;
			
				var today = new Date();
				var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();


				var d1 = new Date(date); 
				var d2 = new Date(exam_date); 
			
				var diff = d2.getTime() - d1.getTime(); 
			
				var daydiff = diff / (1000 * 60 * 60 * 24); 
				var roundValue = Math.round(daydiff);
				if(roundValue < login){
					//alert("Remaining Days For Examination "+roundValue+" days Only");
					alert("Remaining Days For Examination "+roundValue+" days Only")


					
					return;

				}


				

				$.ajax({
				url: "exam_tier_master_publish_ajax.php",
				method: "POST",
				data: {
					exam_tier_master_id: exam_tier_master_id,
					count_of_days :login
				},
				dataType: "json",
			}).done(function(data) {

				


				swal.fire({
					showCloseButton: true,
					title: data.response.title,
					text: data.response.message,
					icon: data.response.status,
				}).then(function() {
					location.reload();
					var dt = new Date();
				var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();

				$('#update_time').html(time);
				});
			});
			},
			allowOutsideClick: () => !Swal.isLoading()
			}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire({
				title: `${result.value.login}'s avatar`,
				imageUrl: result.value.avatar_url
				})
			}
			}) 
			//Prompt Box

		} else {
		console.log('button B pressed')
		}
	})
	  

	  
	  
  });
  //Publish Button

	});
</script>
<style>
	#exam_data{
		font-size: 12px !important;
	}
</style>