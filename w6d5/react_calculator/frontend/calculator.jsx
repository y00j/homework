import React from 'react';
import Results from './results';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      num1: "",
      num2: "",
      result: 0,
      previousResults: []
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.minus = this.minus.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);


  }

  setNum1(event) {
    let num1 = "";
    if (event.target.value) {
      num1 = parseInt(event.target.value);
    }

    this.setState({ num1 });
  }

  setNum2(event) {
    let num2 = "";
    if (event.target.value) {
      num2 = parseInt(event.target.value);
    }

    this.setState({ num2 });
  }

  add(event) {
    event.preventDefault();
    this.setState({ result: this.state.num1 + this.state.num2 });
  }

  minus(event) {
    // event.preventDefault();
    this.setState({ result: this.state.num1 - this.state.num2 });
  }

  multiply(event) {
    event.preventDefault();
    this.setState({result: this.state.num1 * this.state.num2 });

  }

  divide(event) {
    event.preventDefault();
    this.setState({result: this.state.num1 / this.state.num2 });

  }

  clear(event) {
    event.preventDefault();
    const previousResults = this.state.previousResults;
    previousResults.push(this.state.result);
    this.setState({num1: "", num2: "", result: 0, previousResults });

  }



  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}></input>
        <input onChange={this.setNum2} value={this.state.num2}></input>
        <button onClick={this.clear}>Clear</button>
        <br/>
        <button onClick={this.add}>+</button>
        <button onClick={this.minus}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <Results previousResults={this.state.previousResults} />
      </div>
    );
  }
}

export default Calculator;
