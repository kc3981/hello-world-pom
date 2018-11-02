/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var retrnValArr;
var userSelectedSeries;
var userSelectedCatalog;
var slno=1;
var userId=0;
var guideEjectionVarLocal;
var ebThicknessInPoint;
var erThicknessInPoint;
var  myErrObj = new errnsp.errHandling.init();
function getValues() {
	hideAllPlates();
	$("#thickness-CP").empty();
	 $("#thickness-SU").empty();
	slno=1;
	var seriesId = $('#series').val();
	userSelectedSeries = $('#series option:selected').text();	
	var retainerSetPlateCount = 0;
	if (userSelectedSeries == "CR") {
		$('#cavityRetainerPlateCountDiv').show();	
		$('#cmsDiv').hide();
		$('#returnPinDiv').hide();
		$('#spruePullerPinDiv').hide();
		$('#sprueBushDiv').hide();
		$('#locatingRingDiv').hide();
		$('#with-2-plates').prop('checked',true);
		retainerSetPlateCount = 2;
		hideAllPlates();
		getPlates(seriesId,retainerSetPlateCount);
		$('input[type="radio"]').click(function() {
			if ($(this).attr("id") == "with-2-plates") {
				slno=1;
				retainerSetPlateCount = 2;
				hideAllPlates();
				getPlates(seriesId,retainerSetPlateCount);
			}
			else if ($(this).attr("id") == "with-3-plates") {
				slno=1;
				retainerSetPlateCount = 3;
				hideAllPlates();
				getPlates(seriesId,retainerSetPlateCount);
			}
		});
		/*if($('#with-2-plates').is(':checked')) { 
			retainerSetPlateCount = 2;
			hideAllPlates();
			getPlates(seriesId,retainerSetPlateCount);
		}else if($('#with-3-plates').is(':checked')){
			retainerSetPlateCount = 3;
			hideAllPlates();
			getPlates(seriesId,retainerSetPlateCount);
		}*/
	} else {
		$('#cavityRetainerPlateCountDiv').hide();
		getPlates(seriesId,retainerSetPlateCount);
	}
}

function hideAllPlates(){
	$('#CP').hide();
	$('#AP').hide();
	$('#BP').hide();
	$('#XP').hide();
	$('#X1P').hide();
	$('#X2P').hide();
	$('#XP').hide();
	$('#SU').hide();
	$('#ER').hide();
	$('#EB').hide();
	$('#HO').hide();
	$('#guided-ejection').prop('checked',false);
	$('#vents').prop('checked',false);
	//$('#vents-list').hide();
	$('#guided-ejection-list').hide();
	$('#guided-ejection-list-div').hide();
	$('#ge-diameter').hide();
	$('#3-Piece').prop('checked',false);
}

function getPlates(seriesId,retainerSetPlateCount){
	var catalogId = $('#catalog').val();
	var catalogName = $('#catalog option:selected').text();
	userSelectedCatalog = catalogName;
	addPlates(seriesId, catalogId, catalogName, retainerSetPlateCount,
			userSelectedSeries);
}

function addPlates(seriesId, catalogId, catalogName, retainerSetPlateCount,
		userSelectedSeries) {
	ajaxindicatorstart();
	$.ajax({
		url : "getPlatesBySeriesId?seriesId=" + seriesId + "&catalogId="
		+ catalogId + "&catalogName=" + catalogName
		+ "&retainerSetPlateCount=" + retainerSetPlateCount,
		type : "POST",
		contentType : false,
		success : function(data) {
			$('#tbl-moldparts-tbody').empty();
			var obj = JSON.parse(data);
			retrnValArr = obj;
			userId = retrnValArr.userId;
			/*
			SUPPORT-MIL-216-170216 
			if(typeof userId == 'undefined')
			{
				$("#loggedinSaveDiv").hide();
			}else
			{
				$("#guestSaveDiv").hide();
			}
			SUPPORT-MIL-216-170216
			*/
			tcpThickness = 0;
			$.each(obj.plateList, function(index, plate) {
				if (plate.plateNumber == "CP" || plate.plateNumber == "AP"
					|| plate.plateNumber == "BP"
						|| plate.plateNumber == "SU"
							|| plate.plateNumber == "HO"
								|| plate.plateNumber == "XP"
									|| plate.plateNumber == "X1P"
										|| plate.plateNumber == "X2P"
											|| plate.plateNumber == "ER"
												|| plate.plateNumber == "EB"
													|| plate.plateNumber == "BCP") {
					$("#" + plate.plateNumber).show();
					$("#"+plate.plateNumber+"_title").tooltip('hide')
			          .attr('data-original-title', plate.plateDesc);
					$("#parting-"+plate.plateNumber).prop('checked',false);
					$("#nonparting-"+plate.plateNumber).prop('checked',false);
					$("#lift-holes-"+plate.plateNumber).val("0");
					$("#lift-holes-faces-"+plate.plateNumber).val('');
					$("#lift-holes-size-"+plate.plateNumber).val('');
					addSteelTypeDropdown(plate, plate.plateNumber);
					addLiftHolesDiameterDropdown(plate,plate.plateNumber);
					addThicknessDropdown(plate, plate.plateNumber);	
					addLengthDropdown(plate, plate.plateNumber);
					if(plate.plateNumber == "BCP" && obj.isThreePieceHousingSelected == false){
						
					}else{
						showParts(plate,obj.isThreePieceHousingSelected);
					}
					if(obj.isThreePieceHousingSelected == true){
						$("#BCP").show();
					}else{
						$("#BCP").hide();
					}
				}

			});
			if(userSelectedSeries != "CR"){
				$('#cmsDiv').show();
				$('#returnPinDiv').show();
				$('#spruePullerPinDiv').show();
				$('#sprueBushDiv').show();
				$('#locatingRingDiv').show();
				addCMSDropdown(obj.componentList)
			}	
			addLoactingRingDropdown(obj.componentList);
			addSpruBushingDropdown(obj.componentList,'5/32','1/2');
			addSpruePinDropdown(obj.pinList);
			addLPBushingsDropdown(obj.componentList);
			//addGejectionDropdown(obj.componentList);
			//addlpVentsDropdown(obj.componentList);
			addRetunPinDropdown(obj.pinList);
			addLeaderPinDropdown(obj.pinList);
			setSpruePinDropdownDefault();
			if (userSelectedSeries == "T") {
				$('#eBushingsDiv').show();
				addEBushingsDropdown(obj.componentList);
			} else {
				$('#eBushingsDiv').hide();
			}
			//getComponentPartNumbers(obj.componentList,obj.isLPVentsChecked,obj.isGuidedEjectionChecked);
			getComponentPartNumbers(obj.componentList,obj.isGuidedEjectionChecked);
			getPinPartNumbers(obj.pinList);
			$('#totalCost').text("USD " + obj.totalCost);
			$('#count').text(slno-1);
			$("#commonSteelTypes").val('5');
			retrnValArr.commonSteelTypeNameSelected = 'Mixed';
			retrnValArr.selectedCommonSteelType=5;
			retrnValArr.isCsmOverriden = true;
			//SUPPORT-MIL-216-250116
			if(typeof retrnValArr.customerVO == 'undefined')
			{
				$("#customer_autocomplete").val("");
			}
			else
			{
				$("#customer_autocomplete").val(""+retrnValArr.customerVO.customerReference+" - "+retrnValArr.customerVO.customerName);
			}
			//SUPPORT-MIL-216-250116
			getValuesOnChangeAjaxAtStart();
			load3DPreview();
			ajaxindicatorstop();
		},
		error : function(jqxhr, textStatus, error) {
             var err = jqxhr.status;
            var msg = jqxhr.responseText;
            $("#resultLoading").hide();
            console.log( "Request Failed: " + err );
            console.log( "Request Failed: " + jqxhr.responseText );
            myErrObj.raise(err,msg,textStatus);	
			$('.modal-body').text("error: " + data + " status: " + status + " er:" + er);
			$("#myModal").show();
			ajaxindicatorstop();
		}
	});
}

function addLiftHolesDiameterDropdown(plate, plateNumber) {
	$('#liftHoleDiameter' + "-" + plateNumber).empty();
	$.each(plate.listOfDiameters, function(index, value) {
		$('<option />', {
			value : value.diameterId + "-" + plateNumber,// lift hole diameter id
			// for
			// a particular
			// plate
			text : value.diameterInStringFormat
		}).appendTo('#liftHoleDiameter' + "-" + plateNumber);
	});
}

function addSteelTypeDropdown(plate, plateNumber) {
	$('#steelType' + "-" + plateNumber).empty();
	$.each(plate.steelTypeList, function(index, value) {
		$('<option />', {
			value : value.steelTypeId + "-" + plate.plateNumber,// steel type id
			// for
			// a particular
			// plate
			text : value.name
		}).appendTo('#steelType' + "-" + plateNumber);
	});
}

function getSteelTypeValues(a) {
	var str = a.options[a.selectedIndex].value;
	var steelTypeArr = str.split("-");
	var selectedSteelTypeId = steelTypeArr[0];
	var forPlateNumber = steelTypeArr[1];
	$.each(retrnValArr.plateList, function(index, plate) {
		if (plate.plateNumber == forPlateNumber) {
			plate.userSelectedSteelTypeId = selectedSteelTypeId;
			plate.userSelectedSeries = userSelectedSeries;
			plate.userSelectedCatalog = userSelectedCatalog;
		}
	});
	if(selectedSteelTypeId == 4 && forPlateNumber == hoVar)
	{
		retrnValArr.isThreePieceHousingSelected = true;
		$("#3-Piece").prop('checked',true);
		$("#3-Piece").prop('disabled', 'disabled');
		$("#BCP").show();
	}else if(selectedSteelTypeId != 4 && forPlateNumber == hoVar)
	{
		var tHo = $("#thickness-HO").find(':selected').attr('value').split("-")[0];
		if(tHo < 22)
		{
			retrnValArr.isThreePieceHousingSelected = false;
			$("#3-Piece").prop('checked',false);
			$("#3-Piece").prop('disabled', false);
			$("#BCP").hide();
		}
	}
	getValuesOnChangeAjax();
}

function addThicknessDropdown(plate, plateNumber) {
	$('#thickness' + "-" + plateNumber).empty();
	$('#steelType' + "-" + plate.plateNumber).prop('disabled', false);
	$('#steelType' + "-" + plate.plateNumber).css('background-color','white');
	var thickness1 = plate.thicknessList[0];
	if(plateNumber == 'AP')
	{
		$("#thickness-AP").prepend($('<option>', {
			value: "0" + "-" + "AP",
			text: 'Select',
			select: 'selected'
		}));
		plateAThickness = 0;
		plate.userSelectedThicknessId = 0;
	}
	else if(plateNumber == 'BP')
	{
		$("#thickness-BP").prepend($('<option>', {
			value: "0" + "-" + "BP",
			text: 'Select',
			select: 'selected'
		}));
		plateBThickness = 0;
		plate.userSelectedThicknessId = 0;
	}
	else if(plateNumber == 'CP')
	{
		tcpThickness = thickness1.thicknessPartNum;
		plate.userSelectedThicknessId = thickness1.thicknessId;
	}
	else if(plateNumber == 'ER')
	{
		ejectorRetainerThickness = thickness1.thicknessPartNum;
		$("#thickness-ER-label").text(thickness1.thicknessInInch);
		erThicknessInPoint = thickness1.thickness;
		plate.userSelectedThicknessId = thickness1.thicknessId;
	}
	else if(plateNumber == 'EB')
	{
		ejectorBarThickness = thickness1.thicknessPartNum;
		$("#thickness-EB-label").text(thickness1.thicknessInInch);
		ebThicknessInPoint = thickness1.thickness;
		plate.userSelectedThicknessId = thickness1.thicknessId;
	}
	$.each(plate.thicknessList, function(index, value) {
		if(plate.plateNumber == 'CP'){
			if(plate.plateWidth < 13.375 && value.thickness==0.875){
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness,
					selected : true
				}).appendTo('#thickness' + "-" + plateNumber);
				plate.userSelectedThicknessId = value.thicknessId;
			}else if(plate.plateWidth >= 13.375 && value.thickness==1.375){
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness,
					selected : true
				}).appendTo('#thickness' + "-" + plateNumber);
				plate.userSelectedThicknessId = value.thicknessId;
			}else{
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness
				}).appendTo('#thickness' + "-" + plateNumber);
			}	
		}else if(plate.plateNumber == 'SU'){
			if(plate.plateWidth == 7.875 && value.thickness==1.375){
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness,
					selected : true
				}).appendTo('#thickness' + "-" + plateNumber);
				plate.userSelectedThicknessId = value.thicknessId;
			}else if((plate.plateWidth > 7.875 && plate.plateWidth <= 13.375) && value.thickness==1.875){
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness,
					selected : true
				}).appendTo('#thickness' + "-" + plateNumber);
				plate.userSelectedThicknessId = value.thicknessId;
			}else if(plate.plateWidth > 13.375 && value.thickness==2.375){
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness,
					selected : true
				}).appendTo('#thickness' + "-" + plateNumber);
				plate.userSelectedThicknessId = value.thicknessId;
			}else{
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness
				}).appendTo('#thickness' + "-" + plateNumber);
			}		
		}else if(plate.plateNumber == 'AP' || plate.plateNumber == 'BP'){
				$('<option />', {
					value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
					text : value.thicknessInInch,
					test : value.thickness
				}).appendTo('#thickness' + "-" + plateNumber);
		}else{
			$('<option />', {
				value : value.thicknessId + "-" + plate.plateNumber+"-"+value.thicknessPartNum,// thickness id for a particular plate
				test : value.thickness,
				text : value.thicknessInInch			
			}).appendTo('#thickness' + "-" + plateNumber);
		}
	});
	//$('#thickness' + "-" + plate.plateNumber).change();
	plate.isLiftHoleApplied = false;
}

function getThicknessValue(a) {
	var str = a.options[a.selectedIndex].value;
	var thicknessArr = str.split("-");
	var selectedThicknessId = thicknessArr[0];
	var forPlateNumber = thicknessArr[1];
	$.each(retrnValArr.plateList, function(index, plate) {
		if (plate.plateNumber == forPlateNumber) 
		{
			setSpruePinDropdownDefault();
			if(thicknessArr[2] == 7 && ( userSelectedCatalog >= 88 && userSelectedCatalog < 1118 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('1-'+forPlateNumber);
			}
			if(thicknessArr[2] == 13 && ( userSelectedCatalog >= 88 && userSelectedCatalog < 1118 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('1-'+forPlateNumber);
			}
			if(thicknessArr[2] == 7 && ( userSelectedCatalog >= 1123 && userSelectedCatalog < 1524 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('3-'+forPlateNumber);
			}
			if(thicknessArr[2] == 13 && ( userSelectedCatalog >= 1123 && userSelectedCatalog < 1524 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('3-'+forPlateNumber);
			}
			if(thicknessArr[2] == 7 && ( userSelectedCatalog >= 1529 && userSelectedCatalog < 1829 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('3-'+forPlateNumber);
			}
			if(thicknessArr[2] == 13 && ( userSelectedCatalog >= 1529 && userSelectedCatalog < 1829 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('2-'+forPlateNumber);
			}
			if(thicknessArr[2] == 7 && ( userSelectedCatalog >= 1835 && userSelectedCatalog < 2429 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('3-'+forPlateNumber);
			}
			if(thicknessArr[2] == 13 && ( userSelectedCatalog >= 1835 && userSelectedCatalog < 2429 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('4-'+forPlateNumber);
			}
			if(thicknessArr[2] == 13 && ( userSelectedCatalog >= 2435 ))
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('4-'+forPlateNumber);
			}
			if( thicknessArr[2] != 7 && thicknessArr[2] != 13)
			{
				$(a).parent().parent().children('.quantity-change').children('.spinner-control').children('#liftHoleDiameter-'+forPlateNumber).val('1-'+forPlateNumber);
			}
			$('#liftHoleDiameter' + "-" + plate.plateNumber).change();
			if(forPlateNumber == 'AP')
			{
				plateAThickness = thicknessArr[2];
				setLeaderPinDefaultValue();
			}
			else if(forPlateNumber == 'BP')
			{
				plateBThickness = thicknessArr[2];
				setLeaderPinDefaultValue();
			}
			else if(forPlateNumber == 'CP')
			{
				tcpThickness = thicknessArr[2];
			}else if(forPlateNumber == 'ER')
			{
				ejectorRetainerThickness = thicknessArr[2];
			}
			else if(forPlateNumber == 'EB')
			{
				ejectorBarThickness = thicknessArr[2];
			}
			if(forPlateNumber == hoVar && thicknessArr[0] >= 22)
			{
				retrnValArr.isThreePieceHousingSelected = true;
				$("#3-Piece").prop('checked',true);
				$("#3-Piece").prop('disabled', 'disabled');
				$("#BCP").show();
			}else if(plate.plateNumber == hoVar && thicknessArr[0] < 22)
			{
				var tHo = $("#steelType-HO").find(':selected').attr('value').split("-")[0];
				if(tHo != 4)
				{
					retrnValArr.isThreePieceHousingSelected = false;
					$("#3-Piece").prop('checked',false);
					$("#3-Piece").prop('disabled', false);
					$("#BCP").hide();
				}
			}
			plate.userSelectedThicknessId = selectedThicknessId;
			plate.userSelectedSeries = userSelectedSeries;
			plate.userSelectedCatalog = userSelectedCatalog;
			
			addSpruBushingDropdown(retrnValArr.componentList, $("#orificeDropDown").find(':selected').attr('value'), $("#radiusDropDown").find(':selected').attr('value'));
			//SUPPORT-MIL-203-190116
			retrnValArr.isCsmOverriden = true;
			getValuesOnChangeAjax();
		}
	});
}



function addLengthDropdown(plate, plateNumber) {
	if(plateNumber == 'EB')
	{
		var length1 = plate.lengthList[0];
		ejectorBarLength = length1.lengthPartNum;
		$('#length' + "-" + plateNumber).empty();
		$.each(plate.lengthList, function(index, value) {
			$('<option />', {
				value : value.lengthId + "-" + plate.plateNumber+"-"+value.lengthPartNum,// length id
				// for
				// a particular
				// plate
				text : value.lengthPartNum
			}).appendTo('#length' + "-" + plateNumber);
		});
	}
}
function getLengthValue(a) {
	var str = a.options[a.selectedIndex].value;
	var LengthArr = str.split("-");
	var selectedLengthId = LengthArr[0];
	var forPlateNumber = LengthArr[1];
	if(forPlateNumber == 'EB')
	{
		$.each(retrnValArr.plateList, function(index, plate) {
			if (plate.plateNumber == forPlateNumber) {
				if(forPlateNumber == 'EB')
				{
					ejectorBarLength = LengthArr[2];
					plate.userSelectedLengthId = selectedLengthId;
					plate.userSelectedSeries = userSelectedSeries;
					plate.userSelectedCatalog = userSelectedCatalog;
					getValuesOnChangeAjax();
				}
			}
		});
	}
}
function threePieceIsChecked(a){
	//	SUPPORT-MIL-219-220216
	if (a.checked) {
		retrnValArr.isThreePieceHousingSelected = true;
		$("#BCP").show();
	} else {
		retrnValArr.isThreePieceHousingSelected = false;
		$("#BCP").hide();
	}
	$('#lift-holes-BCP').val('0');
	$('#lift-holes-BCP').blur();
//	SUPPORT-MIL-219-220216
}

function addLoactingRingDropdown(componentList) {
	$('#locring').empty();
	$.each(componentList, function(index, component) {
		if (component.name == locatingRingVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.locatingRingPartValueList, function(index,
						locRingPartValue) {
					 var locring = locRingPartValue.partDesc.split(" ");
				     var locringName = locRingPartValue.partDesc.split("-");
				     var locringPartNumber = locring[0];
				     var locatingRingDesc = locringName[1];
				     if(typeof locatingRingDesc == 'undefined') {
				    	 locatingRingDesc = " ";
				     }
				     var locringDisplay = locringPartNumber+' '+locatingRingDesc; 
				     if(locRingPartValue.partNumber == '6501')
				    {
				    	 $('<option />', {
					    		value : locRingPartValue.partNumber,
					    		text : locringDisplay,
					    		selected : true
					    	}).appendTo('#locring');
				    	 locRingPartValue.isUserSelected = true;
				    }
				    else
				    {
				    	$('<option />', {
				    		value : locRingPartValue.partNumber,
				    		text : locringDisplay
				    	}).appendTo('#locring');
				    	locRingPartValue.isUserSelected = false;
				    }
				});
			});
		}
	});
	/*$('#locring').val('6501');
	$('#locring').change();*/
}

function selectedLocRing(selectedPart) {
	var selectedPartNum = selectedPart.value;
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == locatingRingVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.locatingRingPartValueList, function(index,
						locRingPartValue) {
					if (selectedPartNum == locRingPartValue.partNumber) {
						locRingPartValue.isUserSelected = true;
					} else {
						locRingPartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}

function addSpruBushingDropdown(componentList, o, r ) {
	$('#sprueBush').empty();
	var setOfOrifice = new Set();
	var setOfRadius = new Set();
	var theArray=[];
	var allSprueArray=[];
	var tcP = $("#thickness-CP").find(':selected').attr('test');
	if(typeof tcP == 'undefined')
	{
		tcP = 0;
	}
	console.log("tcp "+tcP);
	var addAandTcp = parseFloat(tcP) + parseFloat($("#thickness-AP").find(':selected').attr('test'));
	$.each(componentList, function(index, component) {
		if (component.name == sprueBushVar) {
			$.each(component.partList, function(index, part) {
				
				$.each(part.spruBushingPartValueList, function(index,
						spruBushingPartValue) {
					setOfOrifice.add(spruBushingPartValue.orifice);
					if(typeof spruBushingPartValue.radius != 'undefined')
					{
						setOfRadius.add(spruBushingPartValue.radius);
					}
					if(spruBushingPartValue.orifice == o &&  ( spruBushingPartValue.radius == r || typeof spruBushingPartValue.radius == 'undefined'))
					{
						allSprueArray.push(spruBushingPartValue);
						if(userSelectedCatalog >= 88 && userSelectedCatalog <= 812 && spruBushingPartValue.partNumber.indexOf('A') == 0)
						{
							theArray.push(spruBushingPartValue);
						}else if(userSelectedCatalog > 812 && spruBushingPartValue.partNumber.indexOf('B') == 0)
						{
							theArray.push(spruBushingPartValue);
						}
					}
				});
			});
		}
	});
	allSprueArray.sort(function(o1, o2){
	    return o1.partDesc > o2.partDesc;
	});
	allSprueArray.forEach(function(value) {
		$('<option />', {
			value : value.partNumber,
			text : value.partDesc
		}).appendTo("#sprueBush");
	});
	var sbDefault = closestFun(addAandTcp, theArray);
	$("#sprueBush").val(sbDefault);
	$.each(componentList, function(index, component) {
		if (component.name == sprueBushVar) {
			$.each(component.partList, function(index, part) {
				
				$.each(part.spruBushingPartValueList, function(index,
						spruBushingPartValue) {
					if(spruBushingPartValue.partNumber == sbDefault)
					{
						spruBushingPartValue.isUserSelected = true;
						var selectedPartNumArr = sbDefault.split("-");
						orifice = selectedPartNumArr[1];
						radius = selectedPartNumArr[2];
					}
					else
					{
						spruBushingPartValue.isUserSelected = false;
					}
				});
			});
		}
	});
	var arrOfOrifice = [];
	setOfOrifice.forEach(function(value) {
		arrOfOrifice.push(value);
	});
	var arrOfRadius = [];
	setOfRadius.forEach(function(value) {
		arrOfRadius.push(value);
	});
	arrOfOrifice.sort();
	arrOfRadius.sort();
	$("#orificeDropDown").empty();
	arrOfOrifice.forEach(function(value) {
			$('<option />', {
				value : value,
				text : value
			}).appendTo("#orificeDropDown");
		});
	$("#radiusDropDown").empty();
	arrOfRadius.forEach(function(value) {
			$('<option />', {
				value : value,
				text : value
			}).appendTo("#radiusDropDown");
		});
	$("#orificeDropDown").val(o);
	$("#radiusDropDown").val(r);
}
function selectedSprueBush(selectedPart) {
	var selectedPartNum = selectedPart.value;
	var selectedPartNumArr = selectedPart.value.split("-");
	orifice = selectedPartNumArr[1];
	radius = selectedPartNumArr[2];
	//console.log("orifice "+orifice+" radius "+radius);
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == sprueBushVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.spruBushingPartValueList, function(index,
						spruBushPartValue) {
					if (selectedPartNum == spruBushPartValue.partNumber) {
						spruBushPartValue.isUserSelected = true;
					} else {
						spruBushPartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}

function addSpruePinDropdown(pinList) {
	$('#spruePin').empty();
	var sprueDefault = 0;
	$.each(pinList, function(index, pin) {
		if (pin.name == spruePullerVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.spruePullerPinPartValueList, function(index,
						spruePinPartValue) {
					if(spruePinPartValue.partDiameter == 0.25 && sprueDefault == 0 && userSelectedCatalog >= 88 && userSelectedCatalog <= 812)
					{
						sprueDefault = spruePinPartValue.partNumber ;
						$('<option />', {
							value : spruePinPartValue.partNumber,
							text : spruePinPartValue.partDesc,
							selected : true
						}).appendTo("#spruePin");
						spruePinPartValue.isUserSelected = true;
					}else if(spruePinPartValue.partDiameter == 0.375 && sprueDefault == 0 && userSelectedCatalog > 812)
					{
						sprueDefault = spruePinPartValue.partNumber ;
						$('<option />', {
							value : spruePinPartValue.partNumber,
							text : spruePinPartValue.partDesc,
							selected : true
						}).appendTo("#spruePin");
						spruePinPartValue.isUserSelected = true;
					}
					else
					{
						$('<option />', {
							value : spruePinPartValue.partNumber,
							text : spruePinPartValue.partDesc
						}).appendTo("#spruePin");
						spruePinPartValue.isUserSelected = false;
					}
				});
			});
		}
	});
	/*$('#spruePin').val(sprueDefault);
	$('#spruePin').change();*/
}

function selectedSpruePin(selectedPart) {
	var selectedPartNum = selectedPart.value;
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == spruePullerVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.spruePullerPinPartValueList, function(index,
						spruePinPartValue) {
					if (selectedPartNum == spruePinPartValue.partNumber) {
						spruePinPartValue.isUserSelected = true;
					} else {
						spruePinPartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}

function addLeaderPinDropdown(pinList) {
	$('#leaderPin').empty();
	$.each(pinList, function(index, pin) {
		if (pin.name == leaderPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.leaderPinPartValueList, function(index,
						leaderPinPartValue) {
					$('<option />', {
						value : leaderPinPartValue.partNumber,
						text : leaderPinPartValue.partDesc
					}).appendTo("#leaderPin");
				});
			});
		}
	});
}

function selectedLeaderPin(selectedPart) {
	var selectedPartNum = selectedPart.value;
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == leaderPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.leaderPinPartValueList, function(index,
						leaderPinPartValue) {
					if (selectedPartNum == leaderPinPartValue.partNumber) {
						leaderPinPartValue.isUserSelected = true;
					} else {
						leaderPinPartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}

function addLPBushingsDropdown(componentList) {
	$('#lpbushings').empty();
	var defaultLP;
	$.each(componentList, function(index, component) {
		if (component.name == lpBushingsVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.lpBushingsPartValueList, function(index,
						lpBushingsPartValue) {
					if(lpBushingsPartValue.partDesc == 'STEEL')
					{
						defaultLP = lpBushingsPartValue.partNumber;
						$('<option />', {
							value : lpBushingsPartValue.partNumber,
							text : lpBushingsPartValue.partDesc,
							selected : true
						}).appendTo("#lpbushings");
						lpBushingsPartValue.isUserSelected = true;
					}else
					{
						$('<option />', {
							value : lpBushingsPartValue.partNumber,
							text : lpBushingsPartValue.partDesc
						}).appendTo("#lpbushings");
						lpBushingsPartValue.isUserSelected = false;
					}
				});
			});
		}
	});
/*	$('#lpbushings').val(defaultLP);
	$('#lpbushings').change();*/
}

function selectedLpBushings(selectedPart) {
	var selectedPartNum = selectedPart.value;
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == lpBushingsVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.lpBushingsPartValueList, function(index,
						lpBushingsPartValue) {
					if (selectedPartNum == lpBushingsPartValue.partNumber) {
						lpBushingsPartValue.isUserSelected = true;
					} else {
						lpBushingsPartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}

function addRetunPinDropdown(pinList) {
	$('#returnPin').empty();
	$.each(pinList, function(index, pin) {
		if (pin.name == returnPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.returnPinPartValueList, function(index,
						returnPinPartValue) {
					$('<option />', {
						value : returnPinPartValue.partNumber,
						text : returnPinPartValue.partDesc
					}).appendTo("#returnPin");
				});
			});
		}
	});
	//setReturnPinDropdownDefault();
}

function selectedReturnPin(selectedPart) {
	var selectedPartNum = selectedPart.value;
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == returnPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.returnPinPartValueList, function(index,
						returnPinPartValue) {
					if (selectedPartNum == returnPinPartValue.partNumber) {
						returnPinPartValue.isUserSelected = true;
					} else {
						returnPinPartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}

/*function lpventsIsChecked(a) {
	if (a.checked) {
		retrnValArr.isLPVentsChecked = true;
		getValuesOnChangeAjax();
		$('#vents-list').show();
	} else {
		retrnValArr.isLPVentsChecked = false;
		getValuesOnChangeAjax();
		$('#vents-list').hide();
	}
}*/

function lpventsIsChecked(a) {
	if (a.checked) {
		retrnValArr.isLPVentsChecked = true;
		$.each(retrnValArr, function(index, componentList) {
			$.each(componentList, function(index, component) {
				if (component.name == leaderPinVentsVar) {
					component.remark = "Leader Pin Vents added";
					getValuesOnChangeAjax();
				}
			});
		});
	} else {
		retrnValArr.isLPVentsChecked = false;
		$.each(retrnValArr, function(index, componentList) {
			$.each(componentList, function(index, component) {
				if (component.name == leaderPinVentsVar) {
					component.remark = "";
					getValuesOnChangeAjax();
				}
			});
		});
	}
}

/*function addlpVentsDropdown(componentList) {
	$('#vents-list').empty();	
	$.each(componentList, function(index, component) {
		if (component.name == leaderPinVentsVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.lpVentsPartValueList, function(index,
						lpVentsPartValue) {
					$('<option />', {
						value : lpVentsPartValue.partNumber,
						text : lpVentsPartValue.partDesc
					}).appendTo("#vents-list");
				});
			});
		}
	});
}

function selectedlpVents(selectedPart) {
	var selectedPartNum = selectedPart.value;
		$.each(retrnValArr.componentList, function(index, component) {
			if (component.name == leaderPinVentsVar) {
				$.each(component.partList, function(index, part) {
					$.each(part.lpVentsPartValueList, function(index,
							lpVentsPartValue) {
						if (selectedPartNum == lpVentsPartValue.partNumber) {
							lpVentsPartValue.isUserSelected = true;
						} else {
							lpVentsPartValue.isUserSelected = false;
						}
					});
				});
				getValuesOnChangeAjax();
			}
		});
}
*/
function guidedEjectionIsChecked(a) {
	if (a.checked) {
		retrnValArr.isGuidedEjectionChecked = true;
		addGejectionDropdown(retrnValArr.componentList)
		addGeType();
		addGeQuantity();
		$('#guided-ejection-list').show();
		$('#guided-ejection-list-div').show();
		$('#ge-diameter').show();
		if(userSelectedCatalog == 88 || userSelectedCatalog == 812 || userSelectedCatalog == 108)
		{
			$('#geQuantity').val('1');
		}else
		{
			$('#geQuantity').val('2');
		}
	} else {
		retrnValArr.isGuidedEjectionChecked = false;
		$('#guided-ejection-list').hide();
		$('#guided-ejection-list-div').hide();
		$('#ge-diameter').hide();
	}
	getValuesOnChangeAjax();
}

function addGejectionDropdown(componentList) {
	$('#guided-ejection-list').empty();
	$('#ge-diameter').empty();
	$('#ge-diameter').hide();	
	var gejDefault;
	var theArray = [];
	var addOfEbAndEr= ebThicknessInPoint + erThicknessInPoint;
	$.each(componentList, function(index, component) {
		if (component.name == guidedEjectorVar) {
			guideEjectionVarLocal = component;
			$.each(component.partList, function(index, part) {
				$.each(part.gePartValueList, function(index, gePartValue) {
					gePartValue.isUserSelected = false;
					if(userSelectedCatalog >= 88 && userSelectedCatalog <= 1123)
					{
						if(gePartValue.partDiameter == 0.750)
						{
							theArray.push(gePartValue);
						}
					}else if(userSelectedCatalog >= 1212 && userSelectedCatalog <= 1329)
					{
						if(gePartValue.partDiameter == 0.875)
						{
							theArray.push(gePartValue);
						}
					}else if(userSelectedCatalog >= 1518 && userSelectedCatalog <= 1935)
					{
						if(gePartValue.partDiameter == 1.000)
						{
							theArray.push(gePartValue);
						}
					}else if(userSelectedCatalog >= 2424 && userSelectedCatalog <= 2435)
					{
						if(gePartValue.partDiameter == 1.250)
						{
							theArray.push(gePartValue);
						}
					}  
					
					$('<option />', {
						value : gePartValue.partNumber,
						text : gePartValue.partDesc
					}).appendTo('#guided-ejection-list');
				});
			});
			$('#ge-diameter').text(component.diameter);
		}
	});
	gejDefault = closestFun(addOfEbAndEr, theArray);
	$('#guided-ejection-list').val(gejDefault);
	var selectedPartNum = gejDefault;
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == guidedEjectorVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.gePartValueList, function(index, gePartValue) {
					if (selectedPartNum == gePartValue.partNumber) {
						gePartValue.isUserSelected = true;
					} else {
						gePartValue.isUserSelected = false;
					}
				});
			});
		}
	});
	//$('#guided-ejection-list').change();
}

function selectedGEjection(selectedPart) {
	var selectedPartNum = selectedPart.value;
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == guidedEjectorVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.gePartValueList, function(index, gePartValue) {
					if (selectedPartNum == gePartValue.partNumber) {
						gePartValue.isUserSelected = true;
					} else {
						gePartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}

function addEBushingsDropdown(componentList) {
	$('#ebushings').empty();
	$.each(componentList, function(index, component) {
		if (component.name == extensionBushingsVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.eBushingPartValueList, function(index,
						eBushingPartValue) {
					$('<option />', {
						value : eBushingPartValue.partNumber,
						text : eBushingPartValue.partDesc
					}).appendTo("#ebushings");
				});
			});
		}
	});
}

function selectedEBushings(selectedPart) {
	var selectedPartNum = selectedPart.value;
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == extensionBushingsVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.eBushingPartValueList, function(index,
						eBushingPartValue) {
					if (selectedPartNum == eBushingPartValue.partNumber) {
						eBushingPartValue.isUserSelected = true;
					} else {
						eBushingPartValue.isUserSelected = false;
					}
				});
			});
			getValuesOnChangeAjax();
		}
	});
}
/**
 * 
 * @param Populate the CSM option based on flag showOption flag
 */
function addCMSDropdown(componentList) {
	$('#cms').empty();
	$.each(componentList, function(index, component) {
		if (component.name == csmVar) {
			$.each(component.partList, function(index, part) {
				$.each(part.csmPartValueList, function(index, csmPartValue) {
					if(csmPartValue.showOption){
						if (csmPartValue.isUserSelected) {
							$('<option />', {
								value : csmPartValue.partNumber,
								text : csmPartValue.partDesc,
								selected : true
							}).appendTo("#cms");
						} else {
							$('<option />', {
								value : csmPartValue.partNumber,
								text : csmPartValue.partDesc
							}).appendTo("#cms");
						}
					}
				});
			});
		}
	});
}

function selectedcsmvalue(selectedPart) {
	var selectedPartNum = selectedPart.value;
	//SUPPORT-MIL-203-190116
	retrnValArr.isCsmOverriden = false;
	$.each(retrnValArr.componentList,function(index, component) {
		if (component.name == csmVar) {
		 	$.each(component.partList,function(index,part) {
				$.each(part.csmPartValueList,function(index,csmPartValue) {
					if (selectedPartNum == csmPartValue.partNumber) {
						csmPartValue.isUserSelected = true;
					} else {
						csmPartValue.isUserSelected = false;
					}
				});
			}); 
			getValuesOnChangeAjax();
		}
	});
}

function isPrySlotSelected(selectedPlate) {
	if (selectedPlate.checked == true) {
		var str = selectedPlate.id;
		var selectedIdArr = str.split("-");
		var selectionType = selectedIdArr[0]
		var forPlateType = selectedIdArr[1];
		$.each(retrnValArr.plateList,function(index, plate) {
			if (plate.plateNumber == forPlateType) {
				if(selectionType == "parting"){
					plate.isPartingApplied = true;
					plate.isPrySlotApplied = true;
				}else if(selectionType == "nonparting"){
					plate.isNonPartingApplied = true;
					plate.isPrySlotApplied = true;
				}
				retrnValArr.plates_With_PrySlot_Count = retrnValArr.plates_With_PrySlot_Count + 1;
				/*if(plate.isPrySlotApplied == false){
					plate.isPrySlotApplied = true;
					retrnValArr.plates_With_PrySlot_Count = retrnValArr.plates_With_PrySlot_Count + 1;
				}*/
				//alert(plate.isPartingApplied+" "+plate.isNonPartingApplied+" "+forPlateType+" "+retrnValArr.plates_With_PrySlot_Count+" "+plate.isPrySlotApplied);
				getValuesOnChangeAjax();
			}
		});
	} else if (selectedPlate.checked == false) {
		var str = selectedPlate.id;
		var selectedIdArr = str.split("-");
		var selectionType = selectedIdArr[0]
		var forPlateType = selectedIdArr[1];
		$.each(retrnValArr.plateList,function(index, plate) {
			if (plate.plateNumber == forPlateType) {
				if(selectionType == "parting"){
					plate.isPartingApplied = false;
					plate.isPrySlotApplied = false;
				}else if(selectionType == "nonparting"){
					plate.isNonPartingApplied = false;
					plate.isPrySlotApplied = false;
				}
				retrnValArr.plates_With_PrySlot_Count = retrnValArr.plates_With_PrySlot_Count - 1;
				/*if(plate.isPrySlotApplied == true){
					plate.isPrySlotApplied = false;
					if (retrnValArr.plates_With_PrySlot_Count > 0) {
						retrnValArr.plates_With_PrySlot_Count = retrnValArr.plates_With_PrySlot_Count - 1;
					}
				}*/
				getValuesOnChangeAjax();
			}
		});
	}
}

function isLiftHolesApplied(txtLiftHole) {
	if (txtLiftHole.value != '' && txtLiftHole.value > 0) {
		var str = txtLiftHole.id;
		var selectedIdArr = str.split("-");
		var forPlateType = selectedIdArr[2];
		$.each(retrnValArr.plateList,function(index, plate) {
			if (plate.plateNumber == forPlateType) {
				plate.isLiftHoleApplied = true;
				plate.liftHoleQuantity = txtLiftHole.value;
				retrnValArr.plates_With_LiftHoles_Count = retrnValArr.plates_With_LiftHoles_Count + 1
				getValuesOnChangeAjax();
			}
		});
	} else {
		var str = txtLiftHole.id;
		var selectedIdArr = str.split("-");
		var forPlateType = selectedIdArr[2];
		$.each(retrnValArr.plateList,function(index, plate) {
			if (plate.plateNumber == forPlateType) {
				plate.isLiftHoleApplied = false;
				plate.liftHoleQuantity = 0;
				if (retrnValArr.plates_With_LiftHoles_Count > 0) {
					retrnValArr.plates_With_LiftHoles_Count = retrnValArr.plates_With_LiftHoles_Count - 1;
				}
				getValuesOnChangeAjax();
			}
		});
	}
}

function setDiameter(selectedDiameter) {
	var str = selectedDiameter.id;
	var selectedIdArr = str.split("-");
	var forPlateType = selectedIdArr[1];
	$.each(retrnValArr.plateList,function(index, plate) {
		if (plate.plateNumber == forPlateType) {
			plate.selectedLiftHoleDiameter = selectedDiameter.value.split("-")[0];
			//console.log(" diamter for "+forPlateType+" is "+selectedDiameter.value.split("-")[0]);
			//getValuesOnChangeAjax();
		}
	});
}

function setFace(txtFace) {
	var str = txtFace.id;
	var selectedIdArr = str.split("-");
	var forPlateType = selectedIdArr[3];
	$.each(retrnValArr.plateList,function(index, plate) {
		if (plate.plateNumber == forPlateType) {
			if(txtFace.value == "")
			{
				plate.noOfFaces = null;
			}
			else
			{
				plate.noOfFaces = txtFace.value;
			}
			//console.log(" faces for "+forPlateType+" is "+txtFace.value);
			//getValuesOnChangeAjax();
		}
	});
}

function isLiftHoleSizeApplied(txtLiftHoleSize) {
	 var str1reg = new RegExp("\\d{1,2}\/\\d{1,2}$");// for 33/33
	   var str2reg = new RegExp("\\d{1,2}\ \\d{1,2}\/\\d{1,2}$");// for 33 33/33
	   
	if (txtLiftHoleSize.value != '' && (str1reg.test(txtLiftHoleSize.value) == true || str2reg.test(txtLiftHoleSize.value) == true)) {
		var str = txtLiftHoleSize.id;
		var selectedIdArr = str.split("-");
		var forPlateType = selectedIdArr[3];
		$.each(retrnValArr.plateList,function(index, plate) {
			if (plate.plateNumber == forPlateType) {
				plate.sizeOfLiftHole = txtLiftHoleSize.value;
			}
		});
	} else {
		var str = txtLiftHoleSize.id;
		var selectedIdArr = str.split("-");
		var forPlateType = selectedIdArr[3];
		$.each(retrnValArr.plateList,function(index, plate) {
			if (plate.plateNumber == forPlateType) {
				plate.sizeOfLiftHole = null;
			}
		});
		/*alert("Invalid Lift hole size!");*/
		$('.modal-body').text("Invalid Lift hole size!");
		$("#myModal").show();
	}
}

function checkLiftHoleSelection(){
	var flagForCheck = false;
	$.each(retrnValArr.plateList,function(index, plate) {
		if (plate.isLiftHoleApplied == true && plate.noOfFaces == null && (typeof plate.plateName != 'undefined')) {
			flagForCheck = true;
			/*alert(enterLiftHoleMsg.replace("{p}", plate.plateName));*/
			$("#gensuite_checkout_popup").hide();
			$('.modal-body').text(enterLiftHoleMsg.replace("{p}", plate.plateName));
			$("#myModal").show();
		}else if(plate.isLiftHoleApplied == false && plate.noOfFaces != null && (typeof plate.plateName != 'undefined')){
			flagForCheck = true;
			/*alert(enterLiftHoleQuantityMsg.replace("{p}", plate.plateName));*/
			$("#gensuite_checkout_popup").hide();
			$('.modal-body').text(enterLiftHoleQuantityMsg.replace("{p}", plate.plateName));
			$("#myModal").show();
		}else if (plate.isLiftHoleApplied == true && plate.noOfFaces != null && (typeof plate.plateName != 'undefined')) {
			if(plate.liftHoleQuantity >= plate.noOfFaces)
			{
				$("#gensuite_checkout_popup").hide();
				flagForCheck = true;
				incorrectLiftHoleMsg = incorrectLiftHoleMsg.replace("{p}",plate.plateName);
				incorrectLiftHoleMsg = incorrectLiftHoleMsg.replace("{f}",plate.noOfFaces);
				/*alert(incorrectLiftHoleMsg);*/
				$('.modal-body').text(incorrectLiftHoleMsg);
				$("#myModal").show();
			}
		}
	 });
	return flagForCheck;
}

function getValuesOnChangeAjax() {
	ajaxindicatorstart();
	$.ajax({
		type : "POST",
//		contentType : "application/json",
		data : {configurator:JSON.stringify(retrnValArr)},
		url : "getValuesOnChange",
		success : function(data) {
			retrnValArr = JSON.parse(data);
			$('#tbl-moldparts-tbody').empty();
			$('#totalCost').empty();
			slno = 1;
			$.each(retrnValArr.plateList, function(index, plate) {
				if(plate.plateNumber == "BCP" && retrnValArr.isThreePieceHousingSelected == false){
					
				}else{
					showParts(plate,retrnValArr.isThreePieceHousingSelected);
				}
				
			});
			//getComponentPartNumbers(retrnValArr.componentList,retrnValArr.isLPVentsChecked,retrnValArr.isGuidedEjectionChecked);
			addCMSDropdown(retrnValArr.componentList);
			getComponentPartNumbers(retrnValArr.componentList,retrnValArr.isGuidedEjectionChecked);
			getPinPartNumbers(retrnValArr.pinList);
			$('#totalCost').text("USD " + retrnValArr.totalCost);
			$('#count').text(slno-1);
			$("#mold-refresh").css("background", "darkgreen");	
			ajaxindicatorstop();
		},
		error : function(jqxhr, textStatus, error) {
            var err = jqxhr.status;
            var msg = jqxhr.responseText;
            $(".pageLoader").hide();
            console.log( "Request Failed: " + err );
            console.log( "Request Failed: " + jqxhr.responseText );
            myErrObj.raise(err,msg,textStatus);	
			/*alert("error: " + data + " status: " + status + " er:" + er);*/
			$('.modal-body').text("error: " + data + " status: " + status + " er:" + er);
			$("#myModal").show();
			ajaxindicatorstop();
		}
	});	
}

$(function() {
	$('.numeric').keypress(function(e) {
		   if(e.charCode >= 49 && e.charCode <= 51)
		   {
		    if(this.value.length == 0 )
		    {
		     return true;
		    }
		    else
		    {
		     return false;
		    }
		   }else if(e.keyCode ==8)
		   {
		    return true;
		   }
		   e.preventDefault();
		   return false;
		 });
		 $('.sizenumeric').keypress(function(e) {
		   if(e.charCode >= 49 && e.charCode <= 52)
		   {
		    if(this.value.length == 0 )
		    {
		     return true;
		    }
		    else
		    {
		     return false;
		    }
		   }else if(e.keyCode ==8)
		   {
		    return true;
		   }
		   e.preventDefault();
		   return false;
		 });
	/*
	 	String.prototype.splice = function( idx, rem, s ) {
	    	return (this.slice(0,idx) + s + this.slice(idx + Math.abs(rem)));
		};
		String.prototype.remove = function( idx, rem, s ) {
	    	return (this.slice(0,idx-1) + this.slice(idx + Math.abs(rem)));
		}; 
	$('.sizenumeric').keypress(function(e) {
	   var regex = new RegExp("^[0-9\b\/\ ]$");
	   var str1= this.value.splice(this.selectionStart,0,String.fromCharCode(e.which));
	   var str1reg = new RegExp("\\d{1,2}\/\\d{1,2}$");// for 33/33
	   var str2reg = new RegExp("\\d{1,2}\ \\d{1,2}\/\\d{1,2}$");// for 33 33/33
	   //var validNumber=/^\d{10}$/;
	   var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	   if (regex.test(str)) {
		   if(str1.length <= 8)
		   {
			   if(e.keyCode == 8)
			   {
				   str1= this.value.remove(this.selectionStart,0,String.fromCharCode(e.which));
			   }
			   if(str1reg.test(str1) == true || str2reg.test(str1) == true)
			   {
				   $(this).css('border', '1px solid #69696a'); 
			   }else
			   {
				   $(this).css('border', '1px solid red'); 
			   }
			   return true;
		   }else
		   {
			   if(e.keyCode == 8)
			   {
				   str1= this.value.remove(this.selectionStart,0,String.fromCharCode(e.which));
			   }
			   if(str1reg.test(str1) == true || str2reg.test(str1) == true)
			   {
				   $(this).css('border', '1px solid #69696a'); 
			   }else
			   {
				   $(this).css('border', '1px solid red'); 
			   }
			   if(e.keyCode == 8)
			   {
				   return true;
			   }else
			   {
				   return false;
			   }
		   }
	   }
	   e.preventDefault();
	   return false;
	  });*/
});

function load3DPreview()
{
	//SUPPORT-MIL-216-160216
	if(typeof radius == 'undefined')
	{
		radius = 0;
	}
	if(typeof orifice == 'undefined')
	{
		orifice = 0;
	}
	//SUPPORT-MIL-216-160216

//Start of SUPPORT-MIL-203-210116
var raiserHeightSelected = $("#thickness-HO").find(':selected').attr('test');
 if(userSelectedSeries == 'A ' || userSelectedSeries == 'a ' || userSelectedSeries == 'A' || userSelectedSeries == 'a' || userSelectedSeries == 'B ' || userSelectedSeries == 'b ' || userSelectedSeries == 'B' || userSelectedSeries == 'b')
 {
	 /*if( plateAThickness > 0 && plateBThickness >0)
	 {*/
		 ajaxindicatorstart();
		 $.ajax({
			 url : "getImagePreviewURL?series=" + userSelectedSeries + "&catalogId="
			 + userSelectedCatalog + "&plateAThickness=" + plateAThickness
			 + "&plateBThickness=" + plateBThickness
			 + "&ejectorBarLength=" + ejectorBarLength
			 + "&orifice=" + orifice
			 + "&radius=" + radius
			 + "&ejectorRetainerThickness=" + ejectorRetainerThickness
			 + "&ejectorBarThickness="+ejectorBarThickness
			 + "&tcpThickness=" + tcpThickness
			 + "&raiserHeight="+raiserHeightSelected,
			 type : "GET",
			 contentType : false,
			 success : function(data) {
				 $("#iFrameIdErrMsg").hide();
				 $("#iFrameId").show();
				 $("#iFrameId").attr("src", data);
				 $("#iFrameIdErrMsg").html("");
				 ajaxindicatorstop();
			 },
			 error : function(jqxhr, textStatus, error) {
		            var err = jqxhr.status;
		            var msg = jqxhr.responseText;
		            $(".pageLoader").hide();
		            console.log( "Request Failed: " + err );
		            console.log( "Request Failed: " + jqxhr.responseText );
		            myErrObj.raise(err,msg,textStatus);	
				 /*alert("error: " + data + " status: " + status + " er:" + er);*/
				 $('.modal-body').text("error: " + data + " status: " + status + " er:" + er);
				$("#myModal").show();
				 ajaxindicatorstop();
			 }
		 });
	/* }
	 else
	 {
		 $("#iFrameIdErrMsg").show();
		 $("#iFrameId").hide();
		 $("#iFrameId").attr("src", "");
		 $("#iFrameIdErrMsg").html("No 3D preivew available for selected " + userSelectedSeries+" series");
	 }*/
 }else
 {
  $("#iFrameIdErrMsg").show();
  $("#iFrameId").hide();
  $("#iFrameId").attr("src", "");
  $("#iFrameIdErrMsg").html("No 3D preivew available for selected " + userSelectedSeries+" series");
 }
}

function changePlateSteelType(selectedSteelType){
	var id = selectedSteelType.options[selectedSteelType.selectedIndex].value;
	var mainSelectedId = id;
	var steelTypeVal = selectedSteelType.options[selectedSteelType.selectedIndex].text;
	retrnValArr.commonSteelTypeNameSelected = steelTypeVal;
	if(mainSelectedId == 5){
		id = 1;
	}
	var selId = id;
	$.each(retrnValArr.plateList, function(index, plate) {
		$('#steelType' + "-" + plate.plateNumber).empty();
		if(mainSelectedId == 5)
		{
			$('#steelType' + "-" + plate.plateNumber).prop('disabled', false);
			$('#steelType' + "-" + plate.plateNumber).css('background-color','white');
		}else
		{
			$('#steelType' + "-" + plate.plateNumber).prop('disabled', 'disabled');
			$('#steelType' + "-" + plate.plateNumber).css('background-color','#D8D8D8');
			//$('#steelType' + "-" + plate.plateNumber).css('background-color','#D8D8D8');
		}
		$.each(plate.steelTypeList, function(index, steelType) {
			if(plate.plateNumber == 'HO' || plate.plateNumber == 'BCP')
			{
				if(id == 2 || id == 3)
				{
					id = 1;
				}
			}
			if(plate.plateNumber == 'HO' && id == 4)
			{
				retrnValArr.isThreePieceHousingSelected = true;
				$("#3-Piece").prop('checked',true);
				$("#3-Piece").prop('disabled', 'disabled');
				$("#BCP").show();
			}else if(plate.plateNumber == 'HO' && id != 4)
			{
				retrnValArr.isThreePieceHousingSelected = false;
				$("#3-Piece").prop('checked',false);
				$("#3-Piece").prop('disabled', false);
				$("#BCP").hide();
			}
			if(plate.plateNumber == 'CP' && id == 3)
			{
				id = 2;
			}
			if(plate.plateNumber == 'SU' && id == 3)
			{
				id = 2;
			}
			if(plate.plateNumber == 'ER' && (id == 3 || id == 2))
			   {
			    id = 1;
			 }
			if(plate.plateNumber == 'EB' && (id == 3 || id == 2))
			   {
			    id = 1;
			}
			if(steelType.steelTypeId==id){
				$('<option />', {
					value : steelType.steelTypeId + "-" + plate.plateNumber,// steel type id for a particular plate
					text : steelType.name,
					selected : true
				}).appendTo('#steelType' + "-" + plate.plateNumber);
			}else{
				$('<option />', {
					value : steelType.steelTypeId + "-" + plate.plateNumber,// steel type id for a particular plate
					text : steelType.name
				}).appendTo('#steelType' + "-" +plate. plateNumber);
			}	
			plate.userSelectedSteelTypeId = id;
			id=selId;
		});
		plate.userSelectedSeries = userSelectedSeries;
		plate.userSelectedCatalog = userSelectedCatalog;
	});
	if(mainSelectedId == 5){
		retrnValArr.selectedCommonSteelType = 5;
	}else{
		retrnValArr.selectedCommonSteelType = id;
	}
	getValuesOnChangeAjax();
}
function addGeType()
{
	$('#geType').empty();
	$.each(retrnValArr.guidedEjectionType, function(index, value) {
		if(value.geTypeId == '2')
		{
			$('<option />', {
				value : value.geTypeId,// lift hole diameter id
				// for
				// a particular
				// plate
				text : value.geType,
				selected : true
			}).appendTo('#geType');
		}
		else
		{
			$('<option />', {
				value : value.geTypeId,// lift hole diameter id
				// for
				// a particular
				// plate
				text : value.geType
			}).appendTo('#geType');
		}
	});
	$('#geType').val('2');
	$.each(retrnValArr.componentList, function(index, component) 
	{
		if (component.name == guidedEjectorVar) 
		{
			component.selectedGuidedEjectionType= $("#geType").find(':selected').attr('value');
		}
	});
}
function addGeQuantity()
{
	$('#geQuantity').empty();
	$.each(retrnValArr.guidedEjectionQuantity, function(index, value) {
		if(value.quantityId == '2')
		{
			$('<option />', {
				value : value.quantityId,// lift hole diameter id
				// for
				// a particular
				// plate
				text : value.geQuantity,
				selected : true
			}).appendTo('#geQuantity');
		}
		else
		{
			$('<option />', {
				value : value.quantityId,// lift hole diameter id
				// for
				// a particular
				// plate
				text : value.geQuantity 
			}).appendTo('#geQuantity');
		}
	});
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == guidedEjectorVar) 
		{
			component.selectedGuidedEjectionQuantity =  $("#geQuantity").find(':selected').attr('value');
		}
	});
}
function selectedGeType(geTypeDropdown)
{
	$.each(retrnValArr.componentList, function(index, component) 
	{
		if (component.name == guidedEjectorVar) 
		{
			component.selectedGuidedEjectionType= geTypeDropdown.options[geTypeDropdown.selectedIndex].value;
		}
	});
}
function selectedGeQuantity(geQuantityDropdown)
{
	$.each(retrnValArr.componentList, function(index, component) {
		if (component.name == guidedEjectorVar) 
		{
			component.selectedGuidedEjectionQuantity = geQuantityDropdown.options[geQuantityDropdown.selectedIndex].value;
		}
	});
}
function clearFaces()
{
	$.each(retrnValArr.plateList,function(index, plate) {
		$('#lift-holes-faces-'+plate.platNumber).val("");
			plate.noOfFaces = $('#lift-holes-faces-'+plate.platNumber).val();
	});
}
function setSpruePinDropdownDefault() {
	//Refer to B thickness + Support Plate + Riser height - Stop pin (3/16) - Ejector Bar thickness - 0.19
	var sprueDefault = 0;
	var stopPinVar = 0.1875;
	var addOfAll=0;
	var bT =  $("#thickness-BP").find(':selected').attr('test');
	var sP = $("#thickness-SU").find(':selected').attr('test');
	var rH = $("#thickness-HO").find(':selected').attr('test');
	if(typeof sP == 'undefined')
	{
		sP = 0;
	}
	if(typeof bT == 'undefined')
	{
		bT = 0;
	}
	//var stP = $("#thickness-SP").find(':selected').attr('test');
	addOfAll = parseFloat(bT) + parseFloat(sP) + parseFloat(rH) - stopPinVar - parseFloat(ebThicknessInPoint) - 0.19;
	var theArray =[];
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == spruePullerVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.spruePullerPinPartValueList, function(index,
						spruePinPartValue) {
					if(spruePinPartValue.partDiameter == 0.25 && userSelectedCatalog >= 88 && userSelectedCatalog <= 812)
					{
						theArray.push(spruePinPartValue);
					}
					else if(spruePinPartValue.partDiameter == 0.375 && userSelectedCatalog > 812)
					{
						theArray.push(spruePinPartValue);
					}
				});
			});
		}
	});
	sprueDefault = closestFun(addOfAll, theArray);
	$('#spruePin').val(sprueDefault);
	var selectedPartNum = $("#spruePin").find(':selected').attr('value');
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == spruePullerVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.spruePullerPinPartValueList, function(index,
						spruePinPartValue) {
					if (selectedPartNum == spruePinPartValue.partNumber) {
						spruePinPartValue.isUserSelected = true;
					} else {
						spruePinPartValue.isUserSelected = false;
					}
				});
			});
		}
	});
	setReturnPinDropdownDefault();
}
function setReturnPinDropdownDefault() {
	//Refer to B thickness + Support Plate + Riser height - Stop pin (3/16) - Ejector Bar thickness
	var returnPinDefault = 0;
	var addOfAll=0;
	var stopPinVar = 0.1875;
	var bT =  $("#thickness-BP").find(':selected').attr('test');
	var sP = $("#thickness-SU").find(':selected').attr('test');
	var rH = $("#thickness-HO").find(':selected').attr('test');
	if(typeof bT == 'undefined')
	{
		bT = 0;
	}
	if(typeof sP == 'undefined')
	{
		sP = 0;
	}
	//var stP = $("#thickness-SP").find(':selected').attr('test');
	addOfAll = parseFloat(bT) + parseFloat(sP) + parseFloat(rH) - stopPinVar - parseFloat(ebThicknessInPoint);
	var theArray =[];
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == returnPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.returnPinPartValueList, function(index,
						returnPinPartValue) {
					if(returnPinPartValue.partDiameter == 0.5 && userSelectedCatalog >= 88 && userSelectedCatalog <= 812)
					{
						theArray.push(returnPinPartValue);
					}else if(returnPinPartValue.partDiameter == 0.625 && userSelectedCatalog > 812 && userSelectedCatalog <= 1123)
					{
						theArray.push(returnPinPartValue);
					}else if(returnPinPartValue.partDiameter == 0.75 && userSelectedCatalog > 1123)
					{
						theArray.push(returnPinPartValue);
					}
				});
			});
		}
	});
	returnPinDefault = closestFun(addOfAll, theArray);
	//console.log(" return pin addOfAll "+addOfAll);
	$('#returnPin').val(returnPinDefault);
	var selectedPartNum = $("#returnPin").find(':selected').attr('value');
	
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == returnPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.returnPinPartValueList, function(index,
						returnPinPartValue) {
					if (selectedPartNum == returnPinPartValue.partNumber) {
						//console.log(selectedPartNum+" :: "+returnPinPartValue.partNumber+" :: "+returnPinDefault);
						returnPinPartValue.isUserSelected = true;
					} else {
						returnPinPartValue.isUserSelected = false;
					}
					//console.log(returnPinPartValue.partNumber+" :: "+returnPinPartValue.isUserSelected);
				});
			});
		}
	});
}
function setLeaderPinDefaultValue()
{
	var addAandB=0;
	var varA= parseFloat( $("#thickness-AP").find(':selected').attr('test') );
	var varB= parseFloat( $("#thickness-BP").find(':selected').attr('test') );
	if(typeof varA == 'undefined')
	{
		varA = 0;
	}
	if(typeof varB == 'undefined')
	{
		varB = 0;
	}
	if(userSelectedSeries == 'A' || userSelectedSeries == 'A ')
	{
		addAandB = varA + varB + 0.5;
	}
	if(userSelectedSeries == 'B' || userSelectedSeries == 'B ')
	{
		addAandB = varA + varB;
	}
	var theArray= [];
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == leaderPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.leaderPinPartValueList, function(index,
						leaderPinPartValue) {
					if(leaderPinPartValue.partDiameter == pin.diameter)
					{
						theArray.push(leaderPinPartValue);
					}
					leaderPinPartValue.isUserSelected = false;
				});
			});
		}
	});
	$('#leaderPin').val(closestFun(addAandB, theArray));
	var selectedPartNum = $("#leaderPin").find(':selected').attr('value');
	$.each(retrnValArr.pinList, function(index, pin) {
		if (pin.name == leaderPinVar) {
			$.each(pin.partList, function(index, part) {
				$.each(part.leaderPinPartValueList, function(index,
						leaderPinPartValue) {
					if (selectedPartNum == leaderPinPartValue.partNumber) {
						leaderPinPartValue.isUserSelected = true;
					} else {
						leaderPinPartValue.isUserSelected = false;
					}
				});
			});
		}
	});
}

function getValuesOnChangeAjaxAtStart() {
	$.ajax({
		type : "POST",
//		contentType : "application/json",
		data : {configurator:JSON.stringify(retrnValArr)},
		url : "getValuesOnChange",
		success : function(data) {
			retrnValArr = JSON.parse(data);
			$('#tbl-moldparts-tbody').empty();
			$('#totalCost').empty();
			slno = 1;
			$.each(retrnValArr.plateList, function(index, plate) {
				if(plate.plateNumber == "BCP" && retrnValArr.isThreePieceHousingSelected == false){
					
				}else{
					showParts(plate,retrnValArr.isThreePieceHousingSelected);
				}
				
			});
			//getComponentPartNumbers(retrnValArr.componentList,retrnValArr.isLPVentsChecked,retrnValArr.isGuidedEjectionChecked);
			addCMSDropdown(retrnValArr.componentList);
			getComponentPartNumbers(retrnValArr.componentList,retrnValArr.isGuidedEjectionChecked);
			getPinPartNumbers(retrnValArr.pinList);
			$('#totalCost').text("USD " + retrnValArr.totalCost);
			$('#count').text(slno-1);
			$("#mold-refresh").css("background", "darkgreen");	
		},
		error : function(jqxhr, textStatus, error) {
            var err = jqxhr.status;
            var msg = jqxhr.responseText;
            $(".pageLoader").hide();
            console.log( "Request Failed: " + err );
            console.log( "Request Failed: " + jqxhr.responseText );
            myErrObj.raise(err,msg,textStatus);	
			$('.modal-body').text("error: " + data + " status: " + status + " er:" + er);
			$("#myModal").show();
		}
	});	
}

function closestFun (num, arr) {
    var curr = arr[0];
    var diff = Math.abs (num - curr.partLength);
    for (var val = 0; val < arr.length; val++) {
        var newdiff = Math.abs (num - arr[val].partLength);
        if (newdiff < diff) {
            diff = newdiff;
            curr = arr[val];
        }
    }
    return curr.partNumber;
}
function onOrficeChange(o)
{
	addSpruBushingDropdown(retrnValArr.componentList, o.options[o.selectedIndex].value, $("#radiusDropDown").find(':selected').attr('value'));
	getValuesOnChangeAjax();
}
function onRadiusChange(r)
{
	addSpruBushingDropdown(retrnValArr.componentList, $("#orificeDropDown").find(':selected').attr('value'), r.options[r.selectedIndex].value);
	getValuesOnChangeAjax();
}