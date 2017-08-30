var changFrom = function(selectvalue) {
	console.log(selectvalue);
	document.getElementById('orgnzNo1').value = '';
	document.getElementById('organzinput').value = '';
	if (selectvalue === '대학원') {

		document.getElementById('organzinfo').style.visibility = 'visible';
		document.getElementById('search').innerHTML = "<input type='button' value='기관검색하기' onclick='openOrganzSearch(\"대학교\");'> ";
	}
	else if (selectvalue === '학과') {
		document.getElementById('organzinfo').style.visibility = 'visible';
		document.getElementById('search').innerHTML = "<input type='button' value='기관검색하기' onclick='openOrganzSearch(\"대학원\");'> ";
	}
	else {
		document.getElementById('organzinfo').style.visibility = 'hidden';
	}

}


$( function() {
	
	var type = $("#type").val()
	if(type=="학과"||type=="연구실"){
		fetchListByType(type);
	}
	
    
    $( "#tags" ).autocomplete({
    	maxShowItems: 5,
    	source: function(request, response) {
            var results = $.ui.autocomplete.filter(availableTags, request.term);

            if (!results.length) {
                results = [NoResultsMsg];
            }
            
            response(results);
        },
        select: function(event, ui, request, response){
        	
//        	if(checkDuplicate(ui.item.label)){
//        		console.log("중복");
//        		alert("중복선택입니다");
//        		return;
//        	}
        	
        	if(ui.item.label===NoResultsMsg){
        		event.preventDefault();
        	}else{
        		var name = ui.item.label
        		var no = findNo(ui.item.label);
        		$("#cdNmList").append("<div id='"+resultSet[no]["cdId"]+"'><span id='cdNm' name='cdNm' val='"+resultSet[no]["cdId"]+"'>"+resultSet[no]["cdNm"]	+"</span>" +
        				"<button id='deleteBtn' type='button' onclick='clickDelete(\""+resultSet[no]['cdId']+"\");' class='btn'>X</button>" +
        						"<input type='hidden' name='codes["+index+"].cdId' value='"+resultSet[no]["cdId"]+"'>" +
        						"<input type='hidden' name='codes["+index+"].cdNm' value='"+resultSet[no]["cdNm"]+"'>" +
        						"</div>")
//        		checkList.push(ui.item.label);
        		index ++;
        		
        		//선택된거 리스트에서 삭제
//        		availableTags.splice(availableTags.indexOf(name),1)
        	}
        }
//        focus: function (event, ui) {
//            if (ui.item.label === NoResultsMsg) {
//                event.preventDefault();
//            }else{
//        		console.log(ui.item.label);
//        	}
//        }
    });
  } );

var availableTags = new Array();
var resultSet = new Array();
var NoResultsMsg = "검색 결과가 없음";
var index=0;
//var checkList = [];
var clickDelete=function(id){
	//선택제거되면 리스트에 다시 추가
//	availableTags.push($("#"+id+" span").text())
	$("#"+id).remove();
}

var checkDuplicate = function(name){
	
	for(var i=0;i<checkList.length;i++){
		if(checkList[i]===name){
			return true;
		}
	}
	return false;
	
}

var fetchListByType=function(type){
	
	$.ajax({
		url : "/admin/organz/api/getcode?type="+type,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			console.log(response.data)
			for(var i=0;i<response.data.length;i++){
//				availableTags.push(response.data[i].cdNm)
				resultSet = response.data;
				availableTags.push(resultSet[i]["cdNm"]);
			}
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
	
};

var findNo=function(name){
	for(var i=0;i<availableTags.length;i++){
		if(availableTags[i]===name){
			return i;
		}
	}
}

