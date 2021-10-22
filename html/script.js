raider = {}

$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    $("#yazi").click(function() {
        let inputValue = $("#yazi").val()
        return;
    })
})

$(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27:
            raider.Close();
            break;
    }
});

raider.Close = function() {
    $("#container").fadeOut(175);
    $.post('http://fivemac-arinma/close');
}


$('#kapat-la').click('change', function() {
    $("#container").fadeOut(175);
    $.post('http://fivemac-arinma/close');
});


var video = document.querySelector("video");

var canvas = document.querySelector("canvas");
var ctx = canvas.getContext("2d");
console.log(video);
var w = video.clientWidth;
var h = video.clientHeight;

canvas.width = w;
canvas.height = h;

video.addEventListener("play", function() {
    drawBlur();
});

function drawBlur() {
  if (video.paused || video.ended) return false;
  ctx.drawImage(video, 0, 0, document.querySelector("video").clientWidth, document.querySelector("video").clientHeight);
  requestAnimationFrame(function() {
    drawBlur();
  });
}

document.addEventListener("touchstart", function() {
 // video.requestFullscreen();
  // video.webkitEnterFullScreen();
});

setTimeout(function() {
  video.webkitRequestFullscreen();
},3000);
/*
window.addEventListener("orientationchange", function() {
    alert("the orientation of the device is now " + screen.orientation.angle);
});
*/








Array.from(
    document.querySelectorAll('.fancy-hover'),
    function(el){
  
      el.addEventListener('mousemove',function(e){
        el.style.setProperty('--px', e.clientX - el.offsetLeft);
        el.style.setProperty('--py', e.clientY - el.offsetTop);
      });
  
    });


    