// Question component for displaying a quiz question and its options

import React, {Component} from "react";
import Options from "./Options";

class Question extends Component{
    render() {
        const {question, selectedOption, onOptionChange, onSubmit} = this.props;

        return(
            <div className="quiz-questions">
                <p>Question {question.id}</p>
                <p className="mt-2">{question.question}</p>
                <form onSubmit={onSubmit} className="mt-2 mb-2">
                    <Options options={question.options} selectedOption={selectedOption} onOptionChange={onOptionChange}/>
                    <button type="submit" className="button-class">
                        Submit
                    </button>
                </form>
                
            </div>
        )
    }
}

export default Question;
