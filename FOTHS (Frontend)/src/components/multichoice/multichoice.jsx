import React, { Component } from "react";
import Question from "./question";
import Score from "./score";
import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";

class Multichoice extends Component {
    constructor(props) {
        super(props);
        this.state = {
            questionBank: [], // Stores questions fetched from the backend
            currentQuestion: 0, // Tracks the current question index
            selectedOption: "", // Tracks the user's selected option
            score: 0, // Tracks the user's score
            quizEnd: false, // Tracks whether the quiz has ended
        };
    }

    componentDidMount() {
        this.fetchQuestions(); // Fetch questions when the component mounts
    }

    fetchQuestions = async () => {
        try {
            const response = await fetch("http://localhost:8080/questions"); // Replace with your backend endpoint
            if (!response.ok) {
                throw new Error(`Failed to fetch questions. Status: ${response.status}`);
            }
            const data = await response.json();
            this.setState({ questionBank: data }); // Store the fetched questions in state
        } catch (error) {
            console.error("Error fetching questions:", error);
        }
    };

    handleOptionChange = (e) => {
        this.setState({ selectedOption: e.target.value });
    };

    handleFormSubmit = (e) => {
        e.preventDefault();
        this.checkAnswer();
        if (!this.state.quizEnd) {
            this.handleNextQuestion();
        }
    };

    checkAnswer = () => {
        const { questionBank, currentQuestion, selectedOption } = this.state;
        if (selectedOption === questionBank[currentQuestion]?.answer) {
            this.setState((prevState) => ({ score: prevState.score + 1 }));
        }
    };

    handleNextQuestion = () => {
        const { questionBank, currentQuestion } = this.state;
        if (currentQuestion + 1 < questionBank.length) {
            this.setState((prevState) => ({
                currentQuestion: prevState.currentQuestion + 1,
                selectedOption: "",
            }));
        } else {
            this.setState({ quizEnd: true });
        }
    };

    handlePreviousQuestion = () => {
        const { currentQuestion } = this.state;
        if (currentQuestion > 0) {
            this.setState((prevState) => ({
                currentQuestion: prevState.currentQuestion - 1,
                selectedOption: "",
            }));
        }
    };

    render() {
        const { questionBank, currentQuestion, selectedOption, score, quizEnd } = this.state;

        return (
            <div>
                <FourElementHeader />
                <div className="study-title">Quiz Mode</div>
                {!quizEnd && questionBank.length > 0 && (
                    <main className="quiz-display">
    {questionBank.length > 0 ? (
        <>
            <p>{questionBank[currentQuestion]?.question || "Loading question..."}</p>
            <form onSubmit={this.handleFormSubmit}>
                {Array.isArray(questionBank[currentQuestion]?.options) && questionBank[currentQuestion]?.options.length > 0 ? (
                    questionBank[currentQuestion]?.options.map((option, index) => (
                        <div key={index}>
                            <input
                                type="radio"
                                id={`option-${index}`}
                                name="quiz-option"
                                value={option}
                                checked={selectedOption === option}
                                onChange={this.handleOptionChange}
                            />
                            <label htmlFor={`option-${index}`}>{option}</label>
                        </div>
                    ))
                ) : (
                    <p>No options available</p>
                )}
                <button type="submit">Submit</button>
            </form>
        </>
    ) : (
        <p>Loading question...</p>
    )}
</main>
                )}
                {quizEnd && (
                    <main className="quiz-display">
                        <p>End of quiz. Take a moment to review your results.</p>
                        <br />
                        <a
                            href="./#/game-mode"
                            className="start-button"
                            text="Hover Effect 2"
                            effecttype="effect2"
                        >
                            Return
                        </a>
                    </main>
                )}
                <div className="quiz-score">
                    <div className="verse-size">
                        <Score
                            score={score}
                            onNextQuestion={this.handleNextQuestion}
                            className="score"
                        />
                    </div>
                </div>
                <div>
                    <button
                        className="study-previous-button"
                        onClick={this.handlePreviousQuestion}
                        disabled={currentQuestion === 0}
                    >
                        Previous
                    </button>
                    <button
                        className="study-next-button"
                        onClick={this.handleNextQuestion}
                        disabled={currentQuestion === questionBank.length - 1}
                    >
                        Next
                    </button>
                </div>
                <Footer />
            </div>
        );
    }
}

export default Multichoice;