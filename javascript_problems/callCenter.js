function Employee() {
  this.name = null;
  this.age = null;
  this.address = null;
  this.jobTitle = null;
}

Employee.prototype.getName = function() {
  return "person";
};

function Respondent(level) {
  this.level = level;
}

Respondent.prototype = new Employee();

Respondent.prototype.getName = function() {
  return "respondent";
};

function CallHandler() {
  
}
