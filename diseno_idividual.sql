<div class="col-md-12"><button id="pdf" wg-action="JobOverView ${_data?.jobNo}" class="btn btn-p-1 ic-pdf-r w-25">Generate PDF</button></div>
<div class="col-md-12 px-5" id="content">
	<style>
		.tt-r {float:right;font-weight: bold;}hr {height: 6px !important;background-color: black;opacity: 1!important;}.line-r {float:right;width: 110px;margin-top: 46px;margin-bottom: 3rem;}
	</style>
	<div class="container">
		<div class="row">
			<div class="col-8 text-end mt-3">
				<h3>${__title}</h3></div>
			<div class="col-4 text-start"><img class="w-50" src=${__logoBS64Orders} /></div>
		</div>
	</div>
	<div class="container row">
		<div class="panel invoice-list col-3 border border-black lh-lg overflow-y-auto h-75">
			<h5 class="text-center mt-4"><strong>JOB INFORMATION</strong></h5>
			<hr>
			<div><strong>Description: ${_data?.jobDescription}</strong></div>
			<div><strong>Size: ${_data?.ringSize}</strong></div>
			<div><strong>Serial #: ${_data?.jobNo}</strong></div>
			<div><strong>Order type: ${_data?.productionReason}</strong></div>
			<div><strong>P.O.:</strong> ${_data?.poNo}</div>
			<div><strong>Article #:</strong> ${_data?.referenceNo}</div>
			<div><strong>Batch/Destination:</strong> ${_data?.batch} ${_data?.destinations}</div>
			<div><strong>CPO:</strong> ${_data?.cpoNo}</div>
			<div><strong>SO:</strong> ${_data?.soNo}</div>
		</div>
		<div class="col-1 overflow-y-auto h-50"></div>
		<div class="col-8 table-responsive-sm border border-black overflow-y-auto h-75">
			<table class="table table-sm table-striped">
				<thead>
					<tr>
						<h5 class="text-center mt-4"><strong>LABOR INFORMATION</strong></h5></tr>
					<hr>
					<th>Assigned</th>
					<th>Average</th>
					<th>Actual</th>
				</thead>
				<tbody data-bind="foreach: wg.jobOverView">
					<tr>
						<td class="text-left" data-bind="text: name"></td>
						<td class="text-left" data-bind="text: rate"></td>
						<td class="text-left" data-bind="text: regTime"></td>
					</tr>
				</tbody>
			</table>
			<div class="row">
				<div class="col text-end"><strong>LEGACY USS</strong></div>
				<div class="col-4 text-center"> <strong>SAP USS</strong></div>
				<div class="col-4 text-start"> <strong>SAP</strong></div>
				<div class="row mb-4">
					<div class="col col-md-2">
						<div><strong>ZMLAB (I) </strong></div>
						<div><strong>ZMLABE (I) </strong></div>
						<div><strong>ZMLAB00 (VC)-CC </strong></div>
						<div><strong>ZMLAB01 (WG)-CC </strong></div>
						<div><strong>ZMLAB02 (PLT)-CC</strong> </div>
						<div><strong>ZMLAB03 (SE%)</strong> </div>
						<div><strong>TOTAL</strong> </div>
					</div>
					<div class="col-1 col-md-3">
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
					</div>
					<div class="col-1 col-md-3">
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
					</div>
					<div class="col-2 col-md-1">
						<div><strong>COST </strong></div>
						<div><strong>APPROVED </strong></div>
						<div><strong>GR </strong></div>
						<div><strong>SETTLEMENT</strong></div>
						<div><strong>ODN</strong> </div>
						<div><strong>-</strong> </div>
						<div><strong>Difference</strong> </div>
					</div>
					<div class="col-1 col-md-3">
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
					</div>
				</div>
				<div class="col text-end"><strong>WS QA (1)</strong></div>
				<div class="col-3 text-center"> <strong>WS QA (2)</strong></div>
				<div class="col-5 text-center"> <strong>Exquemal Final QA</strong></div>
				<div class="row">
					<div class="col col-md">
						<div><strong>DATE </strong></div>
						<div><strong>QUALITY </strong></div>
						<div><strong>ASSURANCE </strong></div>
					</div>
					<div class="col-1 col-md-2">
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
					</div>
					<div class="col-1 col-md-2">
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
						<div class="px-4">______________________</div>
					</div>
					<div class="col-1 col-md-6">
						<div class="px-4">_______________________________________________________________</div>
						<div class="px-4">_______________________________________________________________</div>
						<div class="px-4">_______________________________________________________________</div>
					</div>
				</div>
				<div class="row">
					<div class="col col-md">
						<div><strong>PRODUCTION </strong></div>
					</div>
					<div class="col col-md"></div>
					<div class="col col-md"><strong>ADJUSTMENT </strong></div>
					<div class="col col-md"><strong>ENGRAVING </strong></div>
					<div class="col col-md"><strong>998,1 QUEMADO </strong></div>
				</div>
				<div class="row">
					<div class="col col-md">
						<div><strong>STO CLEANING </strong></div>
					</div>
					<div class="col col-md">603,1 QUEMADO</div>
					<div class="col col-md"><strong></strong></div>
					<div class="col col-md-5"><strong></strong></div>
				</div>
				<div class="row">
					<div class="col col-md">
						<div><strong>STO ASSEMBLING </strong></div>
					</div>
					<div class="col col-md">603,2 QUEMADO</div>
					<div class="col col-md"><strong>999,1 QUEMADO</strong></div>
					<div class="col col-md-5"><strong></strong></div>
				</div>
				<div class="row">
					<div class="col col-md">
						<div><strong>STO POLISHING </strong></div>
					</div>
					<div class="col col-md">603,3 QUEMADO</div>
					<div class="col col-md"><strong>999,2 QUEMADO</strong></div>
					<div class="col col-md-5"><strong></strong></div>
				</div>
				<div class="row">
					<div class="col col-md">
						<div><strong>STO SETTING </strong></div>
					</div>
					<div class="col col-md">603,4 QUEMADO</div>
					<div class="col col-md"><strong>999,3 QUEMADO</strong></div>
					<div class="col col-md-5"><strong></strong></div>
				</div>
				<div class="row">
					<div class="col col-md">
						<div><strong>STO QC </strong></div>
					</div>
					<div class="col col-md">603,5 QUEMADO</div>
					<div class="col col-md"><strong></strong></div>
					<div class="col col-md-5"><strong></strong></div>
				</div>
			</div>
		</div>
	</div>
	<div class="container row">
		<div class="panel invoice-list col-3 lh-lg overflow-y-auto h-75">
		</div>
		<div class="col-1 overflow-y-auto h-50"></div>
		<div class="col-8 table-responsive-sm border border-black overflow-y-auto h-75">
			<table class="table table-sm table-striped">
				<thead>
					<th>DATE</th>
					<th>STAGE</th>
					<th>Dimentions</th>
					<th>Mounting</th>
					<th>Clasp</th>
					<th>Setting</th>
					<th>Polishing</th>
					<th>Engraving</th>
					<th>Stamp</th>
					<th>ACC/REF</th>
				</thead>
				<tbody>
					<tr>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
					</tr>
					<tr>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
					</tr>
					<tr>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
					</tr>
					<tr>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
					</tr>
					<tr>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
						<td class="text-left">____________</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-sm table-striped">
				<thead>
					<th>Invoice #</th>
					<th>Description</th>
					<th>Lot #</th>
					<th>DWT</th>
					<th>COC Y/N</th>
				</thead>
				<tbody>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-sm table-striped">
				<thead>
					<tr>
						<h5 class="text-center mt-4"><strong>COMMENTS and NOTES from QUALITY CONTROL</strong></h5>
					</tr>
				</thead>
				<tbody>
					<tr>
						__________________________________________________________________________________________________________________________________________________
					</tr>
					<tr>
						__________________________________________________________________________________________________________________________________________________
					</tr>
					<tr>
						__________________________________________________________________________________________________________________________________________________
					</tr>
					<tr>
						__________________________________________________________________________________________________________________________________________________
					</tr>
					<tr>
						__________________________________________________________________________________________________________________________________________________
					</tr>
				</tbody>
			</table>
			<table class="table table-sm table-striped">
				<thead>
					<tr>
						<h5 class="text-center mt-4"><strong>COMMENTS and NOTES from WORKSHOP</strong></h5>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							IMAGEN
						</td>
						<td>
							___________________________
							<br>
							___________________________
							<br>
							___________________________
							<br>
							___________________________
							<br>
							___________________________
							<br>
							___________________________
							<br>
							___________________________
							<br>
						</td>
					</tr>
					<tr>
						<td>
						<strong>FINISH WT</strong>
						</td>
						<td>
						<strong>TOTAL</strong>
						</td>
						<td>
						<strong>PT</strong>
						</td>
						<td>
						<strong>WG</strong>
						</td>
						<td>
						<strong>YG/PG</strong>
						</td>
					</tr>
					<tr>
						<td>
						<strong>STONE INFO</strong>
						</td>
						<td>
						<strong>QTY</strong>
						</td>
						<td>
						<strong>CT.</strong>
						</td>
						<td>
						<strong>$$</strong>
						</td>
						<td>
						<strong>DWT</strong>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-sm table-striped">
				<thead>
					<th>INVENTORY</th>
					<th>PLT</th>
					<th>WG</th>
					<th>YG</th>
					<th>PG</th>
				</thead>
				<tbody>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
					<tr>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
						<td class="text-left">_______________</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>