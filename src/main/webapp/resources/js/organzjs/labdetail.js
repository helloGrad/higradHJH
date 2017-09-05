
	//박가혜 2017-08-30
	$(function() {
	
		
		
		
		$('input:checkbox[name="cdlist"]').each(function() {
			for (var i = 0; i < codeList.length; i++) {
				
				if (codeList[i].cdId == this.value) {
					
					this.checked = true; //checked 처리
					
				}
			}
		});
		
		for (var i = 0; i < codeList.length; i++) {
			
			
			if(codeList[i].cdDstnct == '연구분야'){
				
				var name = codeList[i].cdNm;
	    		var no = codeList[i].cdId;
	    		
	    		checkList.push(name);
	    		
	    		$("#cdNmList").append("<div id='"+no+"'><span id='cdNm' name='cdNm' val='"+no+"'>"+name+"</span>" +
	    				"<button id='deleteBtn' type='button' onclick='clickDelete(\""+no+"\");' class='btn'>X</button>" +
	    						"<input type='hidden' name='codes["+index+"].cdId' value='"+no+"'>" +
	    						"<input type='hidden' name='codes["+index+"].cdNm' value='"+name+"'>" +
	    						"</div>")
				
	    	index++;					
			}
			
			
			
		}
		
	});