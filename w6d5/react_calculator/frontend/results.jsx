import React from 'react';

// class Results extends React.Component {
//   constructor(props) {
//     super(props);
//   }
//
//   render() {
//     return (
//       <h2>Previous Results</h2>
//       <ul>
//         {
//           this.props.previousResults.map((result) => <li>{result}</li>)
//         }
//       </ul>
//     );
//   }
// }

const Results = (props) => (
  <ul>
    <h1>results</h1>

    {
      props.previousResults.map((result, idx) => <li key={idx}>{result}</li>)
    }
  </ul>
);

export default Results;
