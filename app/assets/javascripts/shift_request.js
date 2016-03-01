$(function(){
    $(".cancel-button").on("click", function(event){
        var dataIndex = $(event.target).data("index")
        $("#member_shift_requests_attributes_" + dataIndex + "_slot_0").attr("checked",false);
        $("#member_shift_requests_attributes_" + dataIndex + "_slot_1").attr("checked",false);
        $("#member_shift_requests_attributes_" + dataIndex + "_slot_2").attr("checked",false);
        $("#member_shift_requests_attributes_" + dataIndex + "_slot_3").attr("checked",false);
        $("#member_shift_requests_attributes_" + dataIndex + "_start_time").val('');
        $("#member_shift_requests_attributes_" + dataIndex + "_end_time").val('');
        $("#member_shift_requests_attributes_" + dataIndex + "_comment").val('');
    });
});

$(function(){
    $(".slot-0").on("click", function(event){
        var dataIndex = $(event.target).data("index");
        var holiday = ($("#member_shift_requests_attributes_" + dataIndex + "_date").hasClass("holiday"));
        if (holiday) {
            console.log("holiday");
            $("#member_shift_requests_attributes_" + dataIndex + "_start_time").val("1000");
            $("#member_shift_requests_attributes_" + dataIndex + "_end_time").val("1600");
        } else {
            console.log("NOT holiday");
            $("#member_shift_requests_attributes_" + dataIndex + "_start_time").val("1000");
            $("#member_shift_requests_attributes_" + dataIndex + "_end_time").val("1900");
        };
    });
});

$(function(){
    $(".slot-1").on("click", function(event){
        var dataIndex = $(event.target).data("index")
        var holiday = ($("#member_shift_requests_attributes_" + dataIndex + "_date").hasClass("holiday"));
        if (holiday) {
            $("#member_shift_requests_attributes_" + dataIndex + "_start_time").val("1600");
            $("#member_shift_requests_attributes_" + dataIndex + "_end_time").val("2200");
        } else {
            $("#member_shift_requests_attributes_" + dataIndex + "_start_time").val("1300");
            $("#member_shift_requests_attributes_" + dataIndex + "_end_time").val("2200");
        };
    });
});

$(function(){
    $(".slot-2").on("click", function(event){
        var dataIndex = $(event.target).data("index")
        $("#member_shift_requests_attributes_" + dataIndex + "_start_time").val("2200");
        $("#member_shift_requests_attributes_" + dataIndex + "_end_time").val("1000");
    });
});
