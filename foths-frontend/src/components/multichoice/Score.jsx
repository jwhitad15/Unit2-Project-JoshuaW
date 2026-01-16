// Score component for displaying the quiz score

import React, { Component } from 'react';

class Score extends Component {
    render() {
        const { score, onNextQuestion } = this.props;


        return (
            <div>
                <h2>Results: {score}/16</h2>
            </div>
        );
    }
}

export default Score;