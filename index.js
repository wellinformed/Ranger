import Netmask from "netmask";

window.setupApplication = (ev) => {
  // attach a function to the calculate button
  // that takes the value from the address field
  // checks it is valid
  // if valid hide the error message and display the results
  // if it is invalid hide the results and display the error message
  document.getElementById("year").innerHTML = new Date().getFullYear();
  document.getElementById("calculator").onsubmit = function () {
    var errorMessage = document.getElementById("error-message");
    var results = document.getElementById("results");
    var address = document.getElementById("cidr_notation_range").value.trim();
    try {
      var block = new Netmask.Netmask(address);
      var startOfRange = document.getElementById("start_of_range");
      var endOfRange = document.getElementById("end_of_range");
      var netmask = document.getElementById("netmask");
      var numberOfAddresses = document.getElementById("number_of_addresses");
      startOfRange.innerHTML = block.base;
      endOfRange.innerHTML = block.broadcast;
      netmask.innerHTML = block.mask;
      numberOfAddresses.innerHTML = block.size;
      results.style.display = "block";
      errorMessage.style.display = "none";
    } catch (error) {
      results.style.display = "none";
      errorMessage.style.display = "block";
      console.log(error);
    }
    return false;
  };
};
