window.addEventListener('load', function() {
  var calculate = document.querySelector('#show');
  var results = document.querySelector('#hide');
  setTimeout(function() {
    calculate.id = 'hide';
    results.id = 'show';
  }, 6000);
});

// setTimeout(function() { weaknessPopover()}, 7000);
//   var weaknessPopover = function() {
//   var weaknesses = [];
//   weaknesses = document.querySelectorAll(".weakness");
//   console.log(weaknesses);
//   console.log(weaknesses[0].id);
//   for (var i = 0; i < weaknesses.length; i++) {
//     console.log(weaknesses[i].id);
//     if (weaknesses[i].id === "Bitter") {
//       console.log("made it here");
//       (weaknesses[i]).popover("data-container"="body","data-toggle"="popover", "data-content"="As a superhero, bitter taste perception is critical, as all heroes harness the bitter taste of evil in order to achieve their potential.", "data-placement"="top","data-trigger"="click");
//       })
//     }
//   }
// }
