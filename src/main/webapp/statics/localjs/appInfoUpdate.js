$(function() {
	//2级列表

	var cl2 = $("#cl2").val();
	$.ajax({
		url : "category.json",
		data : {
			parentId : $("#cl1").val()
		},
		dataType : "json",
		type : "get",
		success : function(data) {
			$("#categoryLevel2").html("");
			var option = "<option value=\"\">--请选择--</option>";
			for (var i = 0; i < data.length; i++) {
				if (cl1 != null && cl1 != undefined && cl1 == data[i].id) {
					option += "<option selected=\"selected\" value=\"" + data[i].id + "\" >" + data[i].categoryName + "</option>";
				} else {
					option += "<option selected=\"selected\" value=\"" + data[i].id + "\" >" + data[i].categoryName + "</option>";
				}
			}
			$("#categoryLevel2").html(option);
		}
	})


	//3级列表

	var cl3 = $("#cl3").val();
	$.ajax({
		url : "category.json",
		data : {
			parentId : $("#cl2").val()
		},
		dataType : "json",
		type : "get",
		success : function(data) {
			$("#categoryLevel3").html("");
			var option = "<option value=\"\">--请选择--</option>";
			for (var i = 0; i < data.length; i++) {
				if (cl1 != null && cl1 != undefined && cl1 == data[i].id) {
					option += "<option selected=\"selected\" value=\"" + data[i].id + "\" >" + data[i].categoryName + "</option>";
				} else {
					option += "<option selected=\"selected\" value=\"" + data[i].id + "\" >" + data[i].categoryName + "</option>";
				}
			}
			$("#categoryLevel3").html(option);
		}
	})

})