var codeList2;

$( function() {
	
	var type = $("#type").val()
	if(type=="학과"){
		fetchListByType2();
	}
	
    
    $( "#tags2" ).autocomplete({
    	minLength: 0,
    	delay:0,
    	source: function(request, response) {
    		$("#duplicateMsg2").css("display","none");
            var results2 = $.ui.autocomplete.filter(availableTags2, request.term);

            if (!results2.length) {
                results2 = [NoResultsMsg];
            }
            
            response(results2);
        },
        select: function(event, ui, request, response){
        	
        	if(checkDuplicate(ui.item.label)){
          		$("#duplicateMsg2").css("display","block");
          		$("#tags2").select();
          		return;
          	}
        	
        	if(ui.item.label===NoResultsMsg){
        		event.preventDefault();
        	}else{
        		var name = ui.item.label
        		var no = findNo2(ui.item.label);
        		$("#cdNmList2").append("<div id='"+resultSet2[no]["cdId"]+"'><span id='cdNm' name='cdNm' val='"+resultSet2[no]["cdId"]+"'>"+resultSet2[no]["cdNm"]	+"</span>" +
        				"<button id='deleteBtn' type='button' onclick='clickDelete(\""+resultSet2[no]['cdId']+"\");' class='btn'>X</button>" +
        						"<input type='hidden' name='codes2["+index2+"].cdId' value='"+resultSet2[no]["cdId"]+"'>" +
        						"<input type='hidden' name='codes2["+index2+"].cdNm' value='"+resultSet2[no]["cdNm"]+"'>" +
        						"</div>")
        		checkList.push(ui.item.label);
        		index2 ++;

        	}
        }
    }).focus(function () {
        window.pageIndex = 0;
        $(this).autocomplete("search");
    });
    
    $( "#tags2" ).click(function() {
    	$("#tags2").val("");
    });
    
  } );

var availableTags2 = new Array();
var resultSet2 = new Array();
var NoResultsMsg = "검색 결과가 없음";
var index2=0;


var fetchListByType2=function(){
	
	$.ajax({
		url : "/admin/organz/api/getcode2?type=전공",
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			console.log(response.data)
			for(var i=0;i<response.data.length;i++){
				resultSet2 = response.data;
				availableTags2.push(resultSet2[i]["cdNm"]);
			}
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
	
};

var findNo2=function(name){
	for(var i=0;i<availableTags2.length;i++){
		if(availableTags2[i]===name){
			return i;
		}
	}
}


