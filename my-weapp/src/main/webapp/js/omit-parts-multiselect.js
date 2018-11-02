/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
/**
 * 
 */

	function omitPartsMultiSelect() {
		$("#omit_parts_multiselect_div").hide();
		$("#omit_parts_successMessage").hide();
		// make code pretty
		window.prettyPrint && prettyPrint();

		if (window.location.hash) {
			scrollTo(window.location.hash);
		}

		$('#omit_parts_multiselect').multiselect({ sort: false, 
			afterMoveToRight: function($left, $right, options){
				$right.find('option').each(function(index, option){
					hidePinDiv(option.text);
					addRemark();
				});
		},
			afterMoveToLeft: function($left, $right, options){
				$left.find('option').each(function(index, option){
					showPinDiv(option.text);
					addRemark();
				});
		},startUp: function($left, $right, options){
		}
		
		});
		$('.omit_parts_multiselect').multiselect({ sort: false});
		$('.js-omit_parts_multiselect').multiselect({
			right : '#js_omit_parts_multiselect_to_1',
			rightAll : '#js_omit_parts_right_All_1',
			rightSelected : '#js_omit_parts_right_Selected_1',
			leftSelected : '#js_omit_parts_left_Selected_1',
			leftAll : '#js_omit_parts_left_All_1'
		});

		$('#keepRenderingSort').multiselect({
			keepRenderingSort : true,
			sort : false
		});

		$('#undo_redo').multiselect();
	}
function omit_parts_savefunction()
{
	var arr = [];
	var x = document.getElementById('omit_parts_multiselect_to');
	for (var i = 0; i < x.options.length; i++) {
		//arr.push(x[i].value);
		arr.push(x[i].text);
	}
	alert("select values "+arr);
}
function showOmitParts(id)
{
	id.html(omitPartsDivString);
	omitPartsMultiSelect();
}
function hidePinDiv(text) {
	if (text == locatingRingVar) {
		$("#locring").prop("disabled",true);
	} else if (text == sprueBushVar) {
		$("#sprueBush").prop("disabled",true);
	} else if (text == spruePullerVar) {
		$("#spruePin").prop("disabled",true);
	} else if (text == leaderPinVar) {
		$("#leaderPin").prop("disabled",true);
	} else if (text == returnPinVar) {
		$("#returnPin").prop("disabled",true);
	} else if (text == extensionBushingsVar) {
		if (userSelectedSeries == 'T') {
			$("#ebushings").prop("disabled",true);
		}
	} else {
	}
}
function showPinDiv(text) {
	if (text == locatingRingVar) {
		$("#locring").prop("disabled",false);
	} else if (text == sprueBushVar) {
		$("#sprueBush").prop("disabled",false);
	} else if (text == spruePullerVar) {
		$("#spruePin").prop("disabled",false);
	} else if (text == leaderPinVar) {
		$("#leaderPin").prop("disabled",false);
	} else if (text == returnPinVar) {
		$("#returnPin").prop("disabled",false);
	} else if (text == extensionBushingsVar) {
		if (userSelectedSeries == 'T') {
			$("#ebushings").prop("disabled",false);
		}
	} else {
	}
}