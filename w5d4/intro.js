
// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   x = 'out of block again';
//   console.log(x);
// }
//
// mysteryScoping5()

function madlib(verb, adjective, noun) {
  return `We shall ${verb} the ${adjective} ${noun}`
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

// console.log(isSubstring('hello', 'i'))

function fizzBuzz(array) {
  var fizzbuzz = [];
  array.forEach( function(element) {
    if ((element % 5 === 0 && element % 3 !== 0) || (element % 5 !== 0 && element % 3 === 0)) {
      fizzbuzz.push(element)
    }
  })
  return fizzbuzz
}

// console.log(fizzBuzz([1,3,4,5]))
function isPrime(number) {
  if (number === 1) {
    return false;
  }
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false
    }
  }

  return true
}

// console.log(isPrime(4))

function sumOfNPrimes(number) {
  var firstNPrimes = [];
  var sumPrimes = 0;
  var i = 2;

  while (firstNPrimes.length < number) {
    if (isPrime(i)) {
      sumPrimes += i;
      firstNPrimes.push(i);
    }
    i++;

  }
  return sumPrimes;
}

// console.log(sumOfNPrimes(0))
//
// console.log(sumOfNPrimes(1))


// console.log(sumOfNPrimes(4))

function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt
`);
  callback(titleized);
}

titleize(['Spongebob', 'Squarepants'], (names) => {
  names.forEach(name => console.log(name))
});

function 
