function september() {
  // Specify the start date
  const startDate = new Date(1993, 8, 23); // JavaScript months are 0-based, so 8 represents September
  // Calculate the number of milliseconds that have passed since September 23, 1993
  const millisecondsPassed = Date.now() - startDate.getTime();
  // Calculate the number of days passed
  const daysPassed = Math.floor(millisecondsPassed / (1000 * 60 * 60 * 24));
  // Calculate the result day by adding the day component and the days passed
  const resultDay = 23 + daysPassed;
  // Create the final result string
  const resultStr = `1993-09-${resultDay}`;
  
  return resultStr

  }

  module.exports = september;