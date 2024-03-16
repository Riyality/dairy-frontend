
<jsp:include page="../modules/header.jsp" />
<style>
</style>
<body>

	<div class="main-content app-content p-4">

		<div class="container-fluid">
			<div class="row">
				<div class="col-10 m-auto">
					<div class="card custom-card">
						<div class="card-header justify-content-between dairy-card-header">
							<div class="card-title">Add Branch</div>
						</div>
						<div class="card-body dairy-card-body">
							<form class="row g-3 needs-validation" method="POST" action="/restore/product/upload" enctype="multipart/form-data" >
								
								<div class="col-md-6">
									<input type="file" name="file" class="form-control dairy-form-input">
								</div>
								
								<div class="col-md-6">
									<button type="submit"class="btn btn-primary ">Restore DB Backup</button>
								</div>
							</form>				
								<div class="col-12">
									<a href="/DBBackup/TakeExcel"><button class="btn btn-primary " type="submit">Take DB Backup</button></a>
								</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modules/footer.jsp" />
