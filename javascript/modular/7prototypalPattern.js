//prototypal inheritance
var human = {
 species: "human",
 create: function(values) {
  var instance = Object.create(this);
  Object.keys(values).forEach(function(key) {
    instance[key] = values[key];
  });
  return instance;
 },
 saySpecies: function() {
  console.log(this.species);
 },
 sayName: function() {
  console.log(this.name);
 }
};

var musician = human.create({
  species: "musician",
  playInstrument: function() {
    console.log("plays " + this.instrument);
  }
});

var will = musician.create({
  name: "Will",
  instrument: "drums"
});

will.playInstrument(); // plays drums
will.sayName(); //will

