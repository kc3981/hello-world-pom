/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
/**
 * 
 */

	function omitHolesMultiSelect() {
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

		/*$('#omit_holes_multiselect').multiselect({ sort: false, 
			startUp: function($left, $right, options){
		}
		});*/
		$('#omit_holes_multiselect').multiselect({ sort: false, 
			afterMoveToRight: function($left, $right, options){
				addRemark();
		},
			afterMoveToLeft: function($left, $right, options){
				addRemark();
		},startUp: function($left, $right, options){
		}
		
		});
		$('.omit_holes_multiselect').multiselect();
		$('.js-omit_holes_multiselect').multiselect({
			right : '#js_omit_holes_multiselect_to_1',
			rightAll : '#js_omit_holes_right_All_1',
			rightSelected : '#js_omit_holes_right_Selected_1',
			leftSelected : '#js_omit_holes_left_Selected_1',
			leftAll : '#js_omit_holes_left_All_1'
		});

		$('#keepRenderingSort').multiselect({
			keepRenderingSort : true,
			sort: false 
		});

		$('#undo_redo').multiselect();
	}
function omit_holes_savefunction()
{
	var arr = [];
	var x = document.getElementById('omit_holes_multiselect_to');
	for (var i = 0; i < x.options.length; i++) {
		//arr.push(x[i].value);
		arr.push(x[i].text);
	}
	alert("select values "+arr);
}
function showOmitHoles(id,d)
{
	id.html(omitHolesDivString);
	omitHolesMultiSelect();
}