$(function() {
	//动态加载所属平台列表
	$.ajax({
		url : "flatform.json",
		type : "get",
		data : null,
		dataType : "json",
		success : function(data) {
			$("#flatformId").html("");
			var option = "<option value=\"\">--请选择--</option>";
			for (i = 0; i < data.length; i++) {
				option += "<option value=\"" + data[i].valueId + "\">" + data[i].valueName + "</option>";
			}
			$("#flatformId").html(option);
		}
	});
	//动态加载一级分类列表
	$.ajax({
		url : "category.json",
		type : "get",
		data : {
			parentId : null
		},
		dataType : "json",
		success : function(data) {
			$("#categoryLevel1").html("");
			var option = "<option value=\"\">--请选择--</option>";
			for (i = 0; i < data.length; i++) {
				option += "<option value=\"" + data[i].id + "\">" + data[i].categoryName + "</option>";
			}
			$("#categoryLevel1").html(option);
		}
	});
	//动态加载二级分类列表
	$("#categoryLevel1").change(function() {
		var categoryLevel1 = $("#categoryLevel1").val();
		$.ajax({
			url : "category.json",
			type : "get",
			data : {
				parentId : categoryLevel1
			},
			dataType : "json",
			success : function(data) {
				$("#categoryLevel2").html("");
				var option = "<option value=\"\">--请选择--</option>";
				for (i = 0; i < data.length; i++) {
					option += "<option value=\"" + data[i].id + "\">" + data[i].categoryName + "</option>";
				}
				$("#categoryLevel2").html(option);
			}
		})

	});
	//动态加载三级分类列表
	$("#categoryLevel2").change(function() {
		var categoryLevel2 = $("#categoryLevel2").val();
		$.ajax({
			url : "category.json",
			type : "get",
			data : {
				parentId : categoryLevel2
			},
			dataType : "json",
			success : function(data) {
				$("#categoryLevel3").html("");
				var option = "<option value=\"\">--请选择--</option>";
				for (i = 0; i < data.length; i++) {
					option += "<option value=\"" + data[i].id + "\">" + data[i].categoryName + "</option>";
				}
				$("#categoryLevel3").html(option);
			}
		})

	});
	//判断软件名称是否可用
	$("#APKName").blur(function() {
		$.ajax({
			url : "apkEmpty.json",
			type : "get",
			dataType : "json",
			data : {
				APKName : $("#APKName").val()
			},
			success : function(data) {
				if (data.APKName == "empty") {
					$("#APKNameMessage").html("软件名称不可以为空!");
				}
				if (data.APKName == "true") {
					$("#APKNameMessage").html("软件名称可以使用!");
				}
				if (data.APKName == "false") {
					$("#APKNameMessage").html("软件名称不可以使用!");
					;
				}
			}
		})
	})
});