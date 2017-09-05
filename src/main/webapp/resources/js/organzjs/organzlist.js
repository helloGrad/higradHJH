/*
 * 허주한
 */

$(function(){
	for(var i=1;i<=$("#charList button").length;i++){
		$("#charBtn"+i).click(clickCharBtn)
		console.log("@@@@");
	}
})
var matchChar ={
	1:['가','깋'],	2:['나','닣'],	3:['다','딯'],	4:['라','맇'],	5:['마','밓'],	6:['바','빟'],	7:['사','싷'],	8:['아','잏'],	9:['자','짛'],	10:['차','칳'],
	11:['카','킿'],	12:['타','팋'],	13:['파','핗'],	14:['하','힣'],	15:['A','z']
}
var clickCharBtn = function(){
	
	
	var char = $(this).val();
	var type = $("#type").val();
	var start = matchChar[char][0];
	var end = matchChar[char][1];
	
	
	console.log(type);
	console.log(start);
	console.log(end);
	
	
	$.ajax({
		url : "/admin/organz/api/getlist?type="+type+"&start="+start+"&end="+end,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			console.log(response.data)
			console.log(response.data.length)
			$("#fetchList").empty();
			for(var i = 0 ; i<response.data.length ; i++){
				$("#fetchList").append("<div class='col-md-12'> " +
				"<h3> " +
				"<a	href='/admin/organz/updateform?no=" + response.data[i].orgnzNo +"&type="+response.data[i].orgnzDstnct+"'>"+response.data[i].orgnzFullNm+"</a> "+
				"</h3> " +
				"<hr> </div>");
			}
			
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
}