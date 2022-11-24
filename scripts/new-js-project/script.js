
function stringify(element1, element2) {
  return `${element1.value} ${element2.value}`
}

function execute() {
  
  const output = document.getElementsByName("output")[0];
  const firstname = document.getElementsByName("firstname")[0];
  const lastname = document.getElementsByName("lastname")[0];

  output.value = `Hello ${stringify(firstname, lastname)}`;
  console.log(output.value);
}
