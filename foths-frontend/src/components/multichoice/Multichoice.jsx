import React, { Component, useContext } from "react";
import { SelectionLogic } from "../foths/SelectionLogic";
import './Multichoice.css'
import Score from "./Score";
import FourElementHeader from "../header-components/FourElementHeader";
import Footer from "../footer/Footer";

class Multichoice extends Component {
    static contextType = SelectionLogic; // Use contextType to access the SelectionLogic context

    constructor(props) {
        super(props);
        this.state = {
            questionBank: [], // Stores questions fetched from the backend
            currentQuestion: 0, // Tracks the current question index
            selectedOption: "", // Tracks the user's selected option
            score: 0, // Tracks the user's score
            quizEnd: false, // Tracks whether the quiz has ended
            showModal: false, // Controls the visibility of the modal
            filteredScriptures: [], // Filtered scriptures based on fruitSelection
            answerOptions: [ // Array of answer options corresponding to question IDs
            ["Option 1A", "Option 1B", "Option 1C", "Option 1D"], // Question ID 1
            ["Option 2A", "Option 2B", "Option 2C", "Option 2D"], // Question ID 2
            ["Option 3A", "Option 3B", "Option 3C", "Option 3D"], // Question ID 3
            ["Option 4A", "Option 4B", "Option 4C", "Option 4D"], // Question ID 4
            ["Option 5A", "Option 5B", "Option 5C", "Option 5D"], // Question ID 5
            ["Option 6A", "Option 6B", "Option 6C", "Option 6D"], // Question ID 6
            ["Option 7A", "Option 7B", "Option 7C", "Option 7D"], // Question ID 7
            ["Option 8A", "Option 8B", "Option 8C", "Option 8D"], // Question ID 8
            ["Option 9A", "Option 9B", "Option 9C", "Option 9D"], // Question ID 9
            ["Option 10A", "Option 10B", "Option 10C", "Option 10D"], // Question ID 10
            ["Option 11A", "Option 11B", "Option 11C", "Option 11D"], // Question ID 11
            ["Option 12A", "Option 12B", "Option 12C", "Option 12D"], // Question ID 12
        ],
        };
    }

    componentDidMount() {
        this.fetchQuestions(); // Fetch questions when the component mounts
    }

    closeModal = () => {
        this.setState({ showModal: false });
    };

    fetchQuestions = async () => {
        const { fruitSelection } = this.context; // Get the selected fruit from context
        console.log("Selected fruit:", fruitSelection); // Debugging

        if (!fruitSelection) {
            console.error("fruitSelection is undefined. Please select a fruit.");
            return;
        }

        try {
            // Fetch questions from the backend
            const response = await fetch(`${ApiHelper.baseUrl}/questions`); // Replace with your backend endpoint
            if (!response.ok) {
                throw new Error(`Failed to fetch questions. Status: ${response.status}`);
            }
            const questionsData = await response.json();
    
            // Fetch scriptures from the backend
            const scripturesResponse = await fetch(`${ApiHelper.baseUrl}/scriptures`); // Replace with your backend endpoint
            if (!scripturesResponse.ok) {
                throw new Error(`Failed to fetch scriptures. Status: ${scripturesResponse.status}`);
            }
            const scripturesData = await scripturesResponse.json();
    
            // Filter questions by FRUIT value
            const filteredQuestions = questionsData.filter((question) => question.fruit === fruitSelection);
            console.log("Filtered questions:", filteredQuestions); // Debugging

            if (filteredQuestions && filteredQuestions.length > 0) {
                // Populate answerOptions with values from the ANSWER column
                const answerOptions = filteredQuestions.map((question) => {
                    const options = [question.answer, ...this.generateRandomOptions(questionsData, question.answer)];
                    return options.sort(() => Math.random() - 0.5); // Shuffle the options
                });

                this.setState({
                    questionBank: filteredQuestions, // Update the filtered questions
                    answerOptions: answerOptions, // Update answerOptions in state
                });
            } else {
                console.warn(`No questions found for fruit: ${fruitSelection}`);
            }
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    };

    generateRandomOptions = (questions, correctAnswer) => {
        // Generate 3 random incorrect options from the question bank
        const incorrectOptions = questions
          .map((q) => q.answer)
          .filter((answer) => answer !== correctAnswer)
          .sort(() => Math.random() - 0.5)
          .slice(0, 3);
        return incorrectOptions;
      };

    handleOptionChange = (e) => {
        this.setState({ selectedOption: e.target.value });
    };

    handleNextQuestion = () => {
        const { currentQuestion, questionBank } = this.state;
        if (currentQuestion < questionBank.length - 1) {
            this.setState((prevState) => ({
                currentQuestion: prevState.currentQuestion + 1, // Move to the next question
            }));
        } else {
            this.setState({ quizEnd: true }); // End the quiz if no more questions
        }
    };

    handleFormSubmit = (e) => {
        e.preventDefault(); // Prevent default form submission behavior
    
        const { selectedOption } = this.state;
    
        if (!selectedOption) {
            // Show the modal if no selection is made
            this.setState({ showModal: true });
            return;
        }
    
        this.checkAnswer(); // Validate the selected answer
        if (!this.state.quizEnd) {
            this.handleNextQuestion(); // Navigate to the next question
        }
    };

    checkAnswer = () => {
        const { questionBank, currentQuestion, selectedOption } = this.state;
        if (selectedOption === questionBank[currentQuestion]?.answer) {
            this.setState((prevState) => ({ score: prevState.score + 1 }));
        }
    };

    render() {
        const { questionBank, currentQuestion, score, quizEnd, answerOptions, selectedOption, showModal } = this.state;
    
        return (
            <div>
                <FourElementHeader />
                <div className="study-title">Quiz Mode</div>
                {!quizEnd && (
                    <main className="quiz-display">
                        {questionBank.length > 0 ? (
                            <div>
                                <div className="fixed-element">
                                    <p className="question-container">
                                        {questionBank[currentQuestion]?.questions || "Loading question..."}
                                    </p> {/* Styled question */}
                                </div>
                                {/* Render each answer option in its corresponding div */}
                                {answerOptions[currentQuestion]?.map((option, index) => (
                                    <div key={index} className={`option-${index + 1}`}>
                                        <div className="checkbox-container">
                                            <label className="answer-option-text">
                                                <input
                                                    type="checkbox"
                                                    value={option}
                                                    checked={selectedOption === option}
                                                    onChange={this.handleOptionChange}
                                                />
                                                {option} 
                                            </label>
                                        </div>
                                    </div>
                                ))}
                                <form onSubmit={this.handleFormSubmit}>
                                    <button type="submit" className="quiz-submit-button">Submit</button>
                                </form>
                            </div>
                        ) : (
                            <p>No questions available</p>
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
                <Footer />
    
                {/* Modal and Overlay */}
                {showModal && (
                    <>
                        <div className="modal-overlay"></div> {/* Overlay */}
                        <div className="modal">
                            <div className="modal-content">
                                <p style={{ color: "white" }}>You must make a selection before moving to the next question.</p>
                                <button className="close-button" onClick={this.closeModal}>X</button>
                            </div>
                        </div>
                    </>
                )}
            </div>
        );
    }
}

export default Multichoice;