// Some random colors
$(window).ready(function() {
$('.pages').turn({
duration: 1500,
width: 880,
height: 590,
//  acceleration: true,
//  display: 'single',
// autoCenter: true,
turnCorners: "bl,br",
elevation: 300,
when: {
  turned: function(e, page) {
    console.log('Current view: ', $(this).turn('view'));
  }
}
});


});
