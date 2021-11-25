let noDocumentCounter = 0;
let ArrivedCounter = 0;
let noImageCounter = 0;

const rowCount = $('#container_status_table > tbody tr').length;
$('#container_status_table > tbody  > tr > td:nth-child(5)').each(function () {
    if (($(this).children("a").attr("href")) === undefined) {
        noDocumentCounter += 1;
    }
});
$('#container_status_table > tbody  > tr > td:nth-child(6)').each(function () {
    if (($(this).children("img").attr("src")) === undefined) {
        noImageCounter += 1;
    }
});
imageCounter = rowCount - noImageCounter
const arrivedStatus = $('input[name="arrived_status"]:checked').length;
documentCounter = rowCount - noDocumentCounter
$('.arrived').width(((arrivedStatus / rowCount) * 100) + '%')
$('.shipment_document').width(((documentCounter / rowCount) * 100) + '%')
$('.seal_image').width(((imageCounter / rowCount) * 100) + '%')


function open_modal(url_image) {

    var img_div = '<div class="carousel-item active text-center"><img  src="' + url_image + '" width="70%"> </div>';
    $("#carousel_plomb_images").append(img_div);
    $('#plomb_images').modal('show')
}