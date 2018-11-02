<div class="row">
	<div class="col-sm-4 col-xs-12">
		<div class="row">
			<div id="partsPerPageDivHeader" class="col-sm-7 col-xs-12"
				style="font-size: 14px;padding-right:0;width:350px;">
				<span class="ten hidden"><spring:message code="label.result.perpage" /> <a href="javascript:void(0)"
					id="ten" class="ten-a" onclick="setPartPerPage(10)">10</a></span> <span
					class="twentyFive hidden"> | <a
					href="javascript:void(0)" class="twentyFive-a" id="twentyFive"
					onclick="setPartPerPage(25)">25</a></span> <span class="fifty hidden">
					| <a href="javascript:void(0)" id="fifty" class="fifty-a"
					onclick="setPartPerPage(50)">50</a>
				</span> <span class="hundred hidden"> | <a
					href="javascript:void(0)" class="hundred-a" id="hundred"
					onclick="setPartPerPage(100)">100</a>
				</span>
			</div>
		</div>
	</div>
	
	<!-- INC-2358 FIXED BY VINAYA : REVIEWED BY JK AND DIBU -->
	<div class="col-sm-8 col-xs-12">
		<div class="text-center hidden-xs" id="page-selection-top"></div>
		<div class="col-sm-12 text-center hidden-lg hidden-md hidden-sm" id="page-selection-top-xs"></div>
	</div>
</div>