

$(document).ready(function() {

    $('#selectClub').change(function() {
        getClubInfo(this.value);
    });
});


function getClubInfo(clubNo) {
    $.ajax({
        url: '/api/club/get/detail/' + clubNo,
        type: "GET",
        contentType: 'application/json',
        success: function (data) {
            console.log(data);
            for(let i = 0; i<data.length; i++){
                console.log("i start");
                let map = data[i];
                console.log(map);
                $('#clubContent').val(map.clubContent);
                $('#professorNo').val(map.professorName);

            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}