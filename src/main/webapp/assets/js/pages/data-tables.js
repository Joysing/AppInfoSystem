$(document).ready(function() {

//------------- Extend table tools -------------//
    $.extend( true, $.fn.DataTable.TableTools.classes, {
        "container": "DTTT btn-group",
        "buttons": {
            "normal": "btn btn-default",
            "disabled": "disabled"
        },
        "collection": {
            "container": "DTTT_dropdown dropdown-menu",
            "buttons": {
                "normal": "",
                "disabled": "disabled"
            }
        },
        "print": {
            "info": "DTTT_print_info modal"
        }
    } );

// Have the collection use a bootstrap compatible dropdown
    $.extend( true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
        "collection": {
            "container": "ul",
            "button": "li",
            "liner": "a"
        }
    });

//------------- Datatables -------------//
    $('#datatable').dataTable({
        "sPaginationType": "bs_full", //"bs_normal", "bs_two_button", "bs_four_button", "bs_full"
        "fnPreDrawCallback": function( oSettings ) {
            $('.dataTables_filter input').addClass('form-control input-large').attr('placeholder', '快速搜索');
            $('.dataTables_length select').addClass('form-control input-small');
        },
        "oLanguage": {
            "sSearch": "",
            "sLengthMenu": "<span>每页显示 _MENU_ 条</span>"
        },
        "bJQueryUI": false,
        "bAutoWidth": false,
        "sDom": "<'row'<'col-lg-6 col-md-6 col-sm-12 text-center'l><'col-lg-6 col-md-6 col-sm-12 text-center'f>r>t<'row-'<'col-lg-6 col-md-6 col-sm-12'i><'col-lg-6 col-md-6 col-sm-12'p>>",
    });

//------------- Sparklines -------------//
    $('#usage-sparkline').sparkline([35,46,24,56,68, 35,46,24,56,68], {
        width: '180px',
        height: '30px',
        lineColor: '#00ABA9',
        fillColor: false,
        spotColor: false,
        minSpotColor: false,
        maxSpotColor: false,
        lineWidth: 2
    });

    $('#cpu-sparkline').sparkline([22,78,43,32,55, 67,83,35,44,56], {
        width: '180px',
        height: '30px',
        lineColor: '#00ABA9',
        fillColor: false,
        spotColor: false,
        minSpotColor: false,
        maxSpotColor: false,
        lineWidth: 2
    });

    $('#ram-sparkline').sparkline([12,24,32,22,15, 17,8,23,17,14], {
        width: '180px',
        height: '30px',
        lineColor: '#00ABA9',
        fillColor: false,
        spotColor: false,
        minSpotColor: false,
        maxSpotColor: false,
        lineWidth: 2
    });

    //------------- Init pie charts -------------//
    initPieChart();


});

//Setup easy pie charts
var initPieChart = function() {
    $(".pie-chart").easyPieChart({
        barColor: '#5a5e63',
        borderColor: '#5a5e63',
        trackColor: '#d9dde2',
        scaleColor: false,
        lineCap: 'butt',
        lineWidth: 10,
        size: 40,
        animate: 1500
    });
}