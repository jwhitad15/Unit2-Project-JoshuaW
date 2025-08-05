import React, { Component } from "react";
import { FaArrowRightLong, FaArrowLeftLong } from "react-icons/fa6";
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
            console.log("Fetched questions:", data); // Debug the fetched data
    
            // Filter questions with FRUIT value of 'Faith'
            const filteredQuestions = data.filter(question => question.fruit === 'Faith');
            if (filteredQuestions && filteredQuestions.length > 0) {
                this.setState({ questionBank: filteredQuestions });
            } else {
                console.error("No questions with FRUIT value 'Faith' found.");
            }
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
        const { questionBank, currentQuestion, score, quizEnd } = this.state;
        console.log("Question bank:", questionBank); // Debug the state
    
        return (
            <div>
                <FourElementHeader />
                <div className="study-title">Quiz Mode</div>
                {!quizEnd && (
                    <main className="quiz-display">
                        {questionBank.length > 0 ? (
                            <p>{questionBank[currentQuestion]?.questions || "Loading question..."}</p> /* Display the first question */
                        ) : (
                            <p>No questions available</p> /* Fallback if no questions are fetched */
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
                        onClick={this.handleNextQuestion}
                        className="study-next-button"
                        disabled={currentQuestion >= questionBank.length - 1} // Disable Next button if at the last scripture
                    >
                        <div id="study-button-text"> Next </div>
                        <div id="study-button-icon"> <FaArrowRightLong /> </div>
                    </button>
                </div>
    
                <div>
                    <button
                        onClick={this.handlePreviousQuestion}
                        className="study-previous-button"
                        disabled={currentQuestion <= 0} // Disable Previous button if at the first scripture
                    >
                        <div id="study-button-text"> Previous </div>
                        <div id="study-button-icon"> <FaArrowLeftLong /> </div>
                    </button>
                </div>
                <Footer />
            </div>
        );
    }
}

export default Multichoice;