window.addEventListener('load', function() {
  var calculate = document.querySelector('#show');
  var results = document.querySelector('#hide');
  setTimeout(function() {
    calculate.id = 'hide';
    results.id = 'show';
  }, 4000);
});

setTimeout(function() { weaknessPopover()}, 5000);

var weaknessPopover = function() {
  var weaknesses = [];
  weaknesses = document.querySelectorAll(".weakness");
  for (var i = 0; i < weaknesses.length; i++) {
    if (weaknesses[i].id === "Alcohol") {
        $(weaknesses[i]).popover({
          title: "Alcohol Flush Reaction",
          content: "When hanging with your superhero friends, alcohol flush is not a good look - just sayin."
        })
    }
    if (weaknesses[i].id === "Bitter") {
        $(weaknesses[i]).popover({
          title: "Bitter Taste Perception",
          content: "As a superhero, bitter taste perception is critical, as all heroes harness the bitter taste of evil in order to achieve their potential."
        })
    }
    if (weaknesses[i].id === "Lactose") {
        $(weaknesses[i]).popover({
          title: "Lactose Intolerance",
          content: "Superheroes need to be able to tolerate whatever is thrown at them - never good to have lactose as your kryptonite."
        })
    }
    if (weaknesses[i].id === "Male") {
        $(weaknesses[i]).popover({
          title: "Male Pattern Baldness",
          content: "While looks aren't everything, not many people want a balding superhero coming to their rescue - sorry but the truth hurts!"
        })
    }
    if (weaknesses[i].id === "Red") {
        $(weaknesses[i]).popover({
          title: "Red Hair",
          content: 'This disease is called "Gingervitis". Kids who have Gingervitis cannot be cured.' + '  ' + '-- Cartman'
        })
    }
    if (weaknesses[i].id === "Smoking") {
        $(weaknesses[i]).popover({
          title: "Smoking Behavior",
          content: "As a role model, a true superhero would want to set the right example and not smoke. Also, those lungs won't be super forever! Or will they?"
        })
    }
  }
};
