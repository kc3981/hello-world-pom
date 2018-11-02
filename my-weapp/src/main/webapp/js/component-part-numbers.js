/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/

function showParts(plate,threePieceHousingVal) {
	if(plate.platePartNum!=""){
	var tr = document.createElement('tr');

	var td1 = document.createElement('td');
	td1.className = "col1";
	td1.appendChild(document.createTextNode(slno));

	var td2 = document.createElement('td');
	td2.className = "col2";
	td2.appendChild(document.createTextNode(plate.platePartNum));

	var td3 = document.createElement('td');
	td3.className = "col3";
	td3.appendChild(document.createTextNode(plate.plateName));

	var td4 = document.createElement('td');
	td4.className = "col4";
	if(threePieceHousingVal == true && plate.plateNumber == "HO"){
		td4.appendChild(document.createTextNode(1));
	}else if(threePieceHousingVal == false && plate.plateNumber == "HO"){
		td4.appendChild(document.createTextNode(plate.quantity));
	}else{
		td4.appendChild(document.createTextNode(plate.quantity));
	}

	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);
	tr.appendChild(td4);
	document.getElementById('tbl-moldparts-tbody').appendChild(tr);	
	slno = slno+1;
	}
}

//function getComponentPartNumbers(componentList,isLPVentsChecked,isGuidedEjectionChecked) {
function getComponentPartNumbers(componentList,isGuidedEjectionChecked) {
	$.each(componentList, function(index, component) {	
		if (component.isOmitParts == false) {
			$.each(component.partList, function(index, part) {
				if(component.name==locatingRingVar){
					$.each(part.locatingRingPartValueList, function(index, locRingPartValue) {
						if(locRingPartValue.isUserSelected==true){
							
							var tr = document.createElement('tr');

							var td1 = document.createElement('td');
							td1.className = "col1";
							td1.appendChild(document.createTextNode(slno));

							var td2 = document.createElement('td');
							td2.className = "col2";
							td2.appendChild(document.createTextNode(locRingPartValue.partNumber));

							var td3 = document.createElement('td');
							td3.className = "col3";
							td3.appendChild(document.createTextNode(locRingPartValue.partDesc));
							
							var td4 = document.createElement('td');
							td4.className = "col4";
							td4.appendChild(document.createTextNode(component.quantity));

							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							document.getElementById('tbl-moldparts-tbody').appendChild(tr);
							slno = slno+1;
						}					
					});		
				}
				else if(component.name==sprueBushVar){
					$.each(part.spruBushingPartValueList, function(index, spruBushPartValue) {
						if(spruBushPartValue.isUserSelected==true){
							var tr = document.createElement('tr');

							var td1 = document.createElement('td');
							td1.className = "col1";
							td1.appendChild(document.createTextNode(slno));

							var td2 = document.createElement('td');
							td2.className = "col2";
							var strarray = spruBushPartValue.partNumber.split("-");
							var arr1=strarray[0];
							var arr2=strarray[1];
							var arr3=strarray[2];
							var newStr = arr1+arr2+arr3;
							td2.appendChild(document.createTextNode(newStr));
							
							var td3 = document.createElement('td');
							td3.className = "col3";
							td3.appendChild(document.createTextNode(spruBushPartValue.partDesc));

							var td4 = document.createElement('td');
							td4.className = "col4";
							td4.appendChild(document.createTextNode(component.quantity));

							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							document.getElementById('tbl-moldparts-tbody').appendChild(tr);
							slno = slno+1;
						}					
					});		
				}
				else if(component.name== lpBushingsVar){
					$.each(part.lpBushingsPartValueList, function(index, lpBushingsPartValue) {
						if(lpBushingsPartValue.isUserSelected==true){
							
							var tr = document.createElement('tr');

							var td1 = document.createElement('td');
							td1.className = "col1";
							td1.appendChild(document.createTextNode(slno));

							var td2 = document.createElement('td');
							td2.className = "col2";
							td2.appendChild(document.createTextNode(lpBushingsPartValue.partNumber));

							var td3 = document.createElement('td');
							td3.className = "col3";
							td3.appendChild(document.createTextNode(lpBushingsPartValue.partDesc));

							var td4 = document.createElement('td');
							td4.className = "col4";
							td4.appendChild(document.createTextNode(component.quantity));

							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							document.getElementById('tbl-moldparts-tbody').appendChild(tr);
							slno = slno+1;
						}					
					});		
				}
				else if(component.name==guidedEjectorVar && isGuidedEjectionChecked==true){
					$.each(part.gePartValueList, function(index, gePartValue) {
						if(gePartValue.isUserSelected==true){
							
							var tr = document.createElement('tr');

							var td1 = document.createElement('td');
							td1.className = "col1";
							td1.appendChild(document.createTextNode(slno));

							var td2 = document.createElement('td');
							td2.className = "col2";
							td2.appendChild(document.createTextNode(gePartValue.partNumber));

							var td3 = document.createElement('td');
							td3.className = "col3";
							td3.appendChild(document.createTextNode(gePartValue.partDesc));

							var td4 = document.createElement('td');
							td4.className = "col4";
							td4.appendChild(document.createTextNode("-"));

							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							document.getElementById('tbl-moldparts-tbody').appendChild(tr);
							slno = slno+1;
						}					
					});		
				}
				else if(component.name==extensionBushingsVar){
					$.each(part.eBushingPartValueList, function(index, eBushingPartValue) {
						if(eBushingPartValue.isUserSelected==true){
							var tr = document.createElement('tr');

							var td1 = document.createElement('td');
							td1.className = "col1";
							td1.appendChild(document.createTextNode(slno));

							var td2 = document.createElement('td');
							td2.className = "col2";
							td2.appendChild(document.createTextNode(eBushingPartValue.partNumber));

							var td3 = document.createElement('td');
							td3.className = "col3";
							td3.appendChild(document.createTextNode(eBushingPartValue.partDesc));

							var td4 = document.createElement('td');
							td4.className = "col4";
							td4.appendChild(document.createTextNode("-"));

							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							document.getElementById('tbl-moldparts-tbody').appendChild(tr);
							slno = slno+1;
						}					
					});		
				}
				/*else if(component.name==leaderPinVentsVar && isLPVentsChecked==true){
					$.each(part.lpVentsPartValueList, function(index, lpVentsPartValue) {
						if(lpVentsPartValue.isUserSelected==true){
							
							var tr = document.createElement('tr');

							var td1 = document.createElement('td');
							td1.className = "col1";
							td1.appendChild(document.createTextNode(slno));

							var td2 = document.createElement('td');
							td2.className = "col2";
							td2.appendChild(document.createTextNode(lpVentsPartValue.partNumber));

							var td3 = document.createElement('td');
							td3.className = "col3";
							td3.appendChild(document.createTextNode(lpVentsPartValue.partDesc));

							var td4 = document.createElement('td');
							td4.className = "col4";
							td4.appendChild(document.createTextNode("-"));

							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							document.getElementById('tbl-moldparts-tbody').appendChild(tr);
							slno = slno+1;
						}					
					});		
				}*/
				else if(component.name==csmVar){
					console.log("Commented CSM");
					/*
					$.each(part.csmPartValueList, function(index, csmPartValue) {
						if(csmPartValue.isUserSelected==true){
							
							var tr = document.createElement('tr');

							var td1 = document.createElement('td');
							td1.className = "col1";
							td1.appendChild(document.createTextNode(slno));

							var td2 = document.createElement('td');
							td2.className = "col2";
							td2.appendChild(document.createTextNode(csmPartValue.partNumber));

							var td3 = document.createElement('td');
							td3.className = "col3";
							td3.appendChild(document.createTextNode(csmPartValue.partDesc));

							var td4 = document.createElement('td');
							td4.className = "col4";
							td4.appendChild(document.createTextNode("-"));

							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							document.getElementById('tbl-moldparts-tbody').appendChild(tr);
							slno = slno+1;
						}					
					});	*/
				}
/*				else{
					$.each(part.partValueList, function(index, partValue) {
						
						var tr = document.createElement('tr');

						var td1 = document.createElement('td');
						td1.className = "col1";
						td1.appendChild(document.createTextNode(1));

						var td2 = document.createElement('td');
						td2.className = "col2";
						td2.appendChild(document.createTextNode(partValue.partNumber));

						var td3 = document.createElement('td');
						td3.className = "col3";
						td3.appendChild(document.createTextNode(partValue.partDesc));

						var td4 = document.createElement('td');
						td4.className = "col4";
						td4.appendChild(document.createTextNode(component.quantity));

						tr.appendChild(td1);
						tr.appendChild(td2);
						tr.appendChild(td3);
						tr.appendChild(td4);
						document.getElementById('tbl-moldparts-tbody').appendChild(tr);
						
					});
				}*/
			});
		}
	});
}

		function getPinPartNumbers(pinList) {
			$.each(pinList, function(index, pin) {
				if (pin.isOmitParts == false) {
					$.each(pin.partList, function(index, part) {
						if(pin.name==spruePullerVar){						
							$.each(part.spruePullerPinPartValueList,function(index,spruePinPartValue){
								if(spruePinPartValue.isUserSelected==true){	
									
									
									var tr = document.createElement('tr');

									var td1 = document.createElement('td');
									td1.className = "col1";
									td1.appendChild(document.createTextNode(slno));

									var td2 = document.createElement('td');
									td2.className = "col2";
									td2.appendChild(document.createTextNode(spruePinPartValue.partNumber));

									var td3 = document.createElement('td');
									td3.className = "col3";
									td3.appendChild(document.createTextNode(spruePinPartValue.partDesc));

									var td4 = document.createElement('td');
									td4.className = "col4";
									td4.appendChild(document.createTextNode(pin.quantity));

									tr.appendChild(td1);
									tr.appendChild(td2);
									tr.appendChild(td3);
									tr.appendChild(td4);
									document.getElementById('tbl-moldparts-tbody').appendChild(tr);
									slno = slno+1;
								}					
							});		
						}
						else if(pin.name==leaderPinVar){						
							$.each(part.leaderPinPartValueList,function(index,leaderPinPartValue){
								if(leaderPinPartValue.isUserSelected==true){	
									
									var tr = document.createElement('tr');

									var td1 = document.createElement('td');
									td1.className = "col1";
									td1.appendChild(document.createTextNode(slno));

									var td2 = document.createElement('td');
									td2.className = "col2";
									td2.appendChild(document.createTextNode(leaderPinPartValue.partNumber));

									var td3 = document.createElement('td');
									td3.className = "col3";
									td3.appendChild(document.createTextNode(leaderPinPartValue.partDesc));

									var td4 = document.createElement('td');
									td4.className = "col4";
									td4.appendChild(document.createTextNode(pin.quantity));

									tr.appendChild(td1);
									tr.appendChild(td2);
									tr.appendChild(td3);
									tr.appendChild(td4);
									document.getElementById('tbl-moldparts-tbody').appendChild(tr);
									slno = slno+1;
								}					
							});		
						}
						else if(pin.name==returnPinVar){						
							$.each(part.returnPinPartValueList,function(index,returnPinPartValue){
								if(returnPinPartValue.isUserSelected==true){	
									
									var tr = document.createElement('tr');

									var td1 = document.createElement('td');
									td1.className = "col1";
									td1.appendChild(document.createTextNode(slno));

									var td2 = document.createElement('td');
									td2.className = "col2";
									td2.appendChild(document.createTextNode(returnPinPartValue.partNumber));

									var td3 = document.createElement('td');
									td3.className = "col3";
									td3.appendChild(document.createTextNode(returnPinPartValue.partDesc));

									var td4 = document.createElement('td');
									td4.className = "col4";
									td4.appendChild(document.createTextNode(pin.quantity));

									tr.appendChild(td1);
									tr.appendChild(td2);
									tr.appendChild(td3);
									tr.appendChild(td4);
									document.getElementById('tbl-moldparts-tbody').appendChild(tr);
									slno = slno+1;
								}					
							});		
						}
						/*else{					
							$.each(part.partValueList, function(index, partValue) {
								
								var tr = document.createElement('tr');

								var td1 = document.createElement('td');
								td1.className = "col1";
								td1.appendChild(document.createTextNode(slno));

								var td2 = document.createElement('td');
								td2.className = "col2";
								td2.appendChild(document.createTextNode(partValue.partNumber));

								var td3 = document.createElement('td');
								td3.className = "col3";
								td3.appendChild(document.createTextNode(partValue.partDesc));

								var td4 = document.createElement('td');
								td4.className = "col4";
								td4.appendChild(document.createTextNode("-"));

								tr.appendChild(td1);
								tr.appendChild(td2);
								tr.appendChild(td3);
								tr.appendChild(td4);
								document.getElementById('tbl-moldparts-tbody').appendChild(tr);
								slno = slno+1;
							});
						}*/
					});
				}
			});
}
