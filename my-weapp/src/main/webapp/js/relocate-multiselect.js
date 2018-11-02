/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
/**
 * 
 */

	function relocateMultiSelect() {
		// make code pretty
		window.prettyPrint && prettyPrint();
		$("#locring").prop("disabled",false);
		$("#sprueBush").prop("disabled",false);
		$("#spruePin").prop("disabled",false);
		$("#leaderPin").prop("disabled",false);
		$("#returnPin").prop("disabled",false);
		$("#ebushings").prop("disabled",false);


		if (window.location.hash) {
			scrollTo(window.location.hash);
		}

		/*$('#relocate_multiselect').multiselect({ selectableOptgroup: true,sort: false,startUp: function($left, $right, options){
		} });*/
		$('#relocate_multiselect').multiselect({ sort: false, 
			afterMoveToRight: function($left, $right, options){
				addRemark();
		},
			afterMoveToLeft: function($left, $right, options){
				addRemark();
		},startUp: function($left, $right, options){
		}
		
		});
		$('.relocate_multiselect').multiselect({ selectableOptgroup: true,sort: false });
		$('.js-relocate_multiselect').multiselect({
			right : '#js_relocate_multiselect_to_1',
			rightAll : '#js_relocate_right_All_1',
			rightSelected : '#js_relocate_right_Selected_1',
			leftSelected : '#js_relocate_left_Selected_1',
			leftAll : '#js_relocate_left_All_1'
		});

		$('#keepRenderingSort').multiselect({
			keepRenderingSort : false,
			sort: false
		});

		$('#undo_redo').multiselect();
	}
function relocate_savefunction()
{
	var arr = [];
	var x = document.getElementById('relocate_multiselect_to');
	for (var i = 0; i < x.options.length; i++) {
		//arr.push(x[i].value);
		arr.push(x[i].text);
	}
	alert("select values "+arr);
}
function showRelocates(id)
{
	
	id.html(relocateDivString);
	relocateMultiSelect();
}