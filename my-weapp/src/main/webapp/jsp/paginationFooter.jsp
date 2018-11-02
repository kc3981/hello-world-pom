<div class="row" style="height: 120px">
	<!-- <div class="col-lg-3"></div> -->
	<!-- INC-2358 FIXED BY VINAYA : REVIEWED BY JK AND DIBU -->
	<div id="partsPerPageDivFooter"
		class="col-lg-4 col-md-4 col-sm-4 col-xs-12"
		style="font-size: 14px;">
		<span class="ten hidden"><spring:message code="label.result.perpage" /> <a href="javascript:void(0)"
			id="ten2" class="ten-a" onclick="setPartPerPage(10)">10</a></span> <span
			class="twentyFive hidden"> | <a id="twentyFive"
			class="twentyFive-a" href="javascript:void(0)"
			onclick="setPartPerPage(25)">25</a></span> <span class="fifty hidden">
			| <a href="javascript:void(0)" id="fifty" class="fifty-a"
			onclick="setPartPerPage(50)">50</a>
		</span> <span class="hundred hidden"> | <a
			href="javascript:void(0)" id="hundred" class="hundred-a"
			onclick="setPartPerPage(100)">100</a>
		</span>
	</div>
	<!-- INC-2358 FIXED BY VINAYA : REVIEWED BY JK AND DIBU -->
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
		<div class="text-center hidden-xs" id="page-selection"></div>
		<div class="col-sm-12 text-center hidden-lg hidden-md hidden-sm"
			id="page-selection-xs"></div>
	</div>
</div>