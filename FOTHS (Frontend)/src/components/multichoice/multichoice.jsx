// Quiz component for Game Mode

import React, { useState, useEffect } from "react";
import Question from "./question";
import Score from "./score";
import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import faithMultiChoice from "../../data/faith-multi-choice";

const Multichoice = () => {
    // constructor(props) {
    //     super(props);
    //     this.state = {
    //         questionBank: faithMultiChoice,
    //         currentQuestion: 0,
    //         selectedOption: "",
    //         score: 0,
    //         quizEnd: false,
    //     };

    //     this.questionAnswered = true;
    // }
    
    // handleOptionChange = (e) => {
    //     this.setState({ selectedOption: e.target.value })
    // };

    // handleFormSubmit = (e) => {
    //     e.preventDefault(); 
    //     this.checkAnswer(); 
    //     if (this.questionAnswered){
    //         this.handleNextQuestion()
    //     }
    // };

    // checkAnswer = () => {
    //     const { questionBank, currentQuestion, selectedOption, score } = this.state;
    //     if (selectedOption !== ''){
    //         this.questionAnswered = true;
    //     }
    //     else{
    //         this.questionAnswered = false
    //     }

    //     if (selectedOption === questionBank[currentQuestion].answer) {
    //         this.setState((prevState) => ({ score: prevState.score + 1 }));
    //         }
    // };
    
    // handleNextQuestion = () => {const { questionBank, currentQuestion } = this.state;

    //     if (currentQuestion + 1 < questionBank.length) {
    //         this.setState((prevState) => ({ currentQuestion: prevState.currentQuestion + 1, selectedOption: "" }));
    //     } else {
    //         this.setState({quizEnd: true});
    //     }
    // };

    // render() {
    //   const { questionBank, currentQuestion, selectedOption, score, quizEnd } = this.state;

    //   return (
    //     <div>
    //         <div> <FourElementHeader/> </div> 
    //         <div className="study-title"> Quiz Mode </div>
    //             {!quizEnd && (<main className="quiz-display"> <p> <Question question={questionBank[currentQuestion]} selectedOption={selectedOption} onOptionChange={this.handleOptionChange} onSubmit={this.handleFormSubmit}/> </p></main>)}
    //             {quizEnd && (<main className="quiz-display"> <p> End of quiz. Take a moment to review your results. </p> <br/> <a href="./#/game-mode" className="start-button" text="Hover Effect 2" effecttype="effect2" >Return</a> </main>)}
    //         <div className="quiz-score"> <p className="verse-size"> <Score score={score} onNextQuestion={this.handleNextQuestion} className="score" /></p> </div>
    //         <Footer/>
    //     </div>
    //   )


    const [questionBank, setQuestionBank] = useState([]); // Holds questions fetched from the database
    const [currentQuestion, setCurrentQuestion] = useState(0); // Tracks the current question index
    const [selectedOption, setSelectedOption] = useState(""); // Tracks the selected option
    const [quizEnd, setQuizEnd] = useState(false); // Tracks whether the quiz has ended

    // Fetch questions from the MySQL database
    const fetchQuestions = async () => {
        try {
            const response = await fetch("http://localhost:8080/questions"); // Replace with your API endpoint
            const data = await response.json();
            console.log("Questions fetched successfully:", data);

            setQuestionBank(data); // Set the fetched questions in state
        } catch (error) {
            console.error("Error fetching questions:", error);
        }
    };

    // Navigate to the next question
    const handleNextQuestion = () => {
        if (currentQuestion + 1 < questionBank.length) {
            setCurrentQuestion(currentQuestion + 1);
            setSelectedOption(""); // Reset selected option for the next question
        } else {
            setQuizEnd(true); // End the quiz if there are no more questions
        }
    };
    // Navigate to the previous question
    const handlePreviousQuestion = () => {
        if (currentQuestion > 0) {
            setCurrentQuestion(currentQuestion - 1);
            setSelectedOption(""); // Reset selected option for the previous question
        }
    };

    // Handle option change
    const handleOptionChange = (e) => {
        setSelectedOption(e.target.value);
    };

    // Handle form submission
    const handleFormSubmit = (e) => {
        e.preventDefault();
        console.log("Selected option:", selectedOption);
        // Add logic to check the answer if needed
    };

    // Fetch questions when the component mounts
    useEffect(() => {
        fetchQuestions();
    }, []);

    return (
        <div>
            <div>
                <FourElementHeader />
            </div>
            <div className="study-title">Quiz Mode</div>

            {!quizEnd && questionBank.length > 0 && (
                <main className="quiz-display">
                    <p>{questionBank[currentQuestion]?.question}</p>
                    <form onSubmit={handleFormSubmit}>
                        {questionBank[currentQuestion]?.options.map((option, index) => (
                            <div key={index}>
                                <input
                                    type="radio"
                                    id={`option-${index}`}
                                    name="quiz-option"
                                    value={option}
                                    checked={selectedOption === option}
                                    onChange={handleOptionChange}
                                />
                                <label htmlFor={`option-${index}`}>{option}</label>
                            </div>
                        ))}
                        <button type="submit">Submit</button>
                    </form>
                    <div>
                        <button onClick={handlePreviousQuestion} disabled={currentQuestion === 0}>
                            Previous
                        </button>
                        <button onClick={handleNextQuestion} disabled={currentQuestion === questionBank.length - 1}>
                            Next
                        </button>
                    </div>
                </main>
            )}

            {quizEnd && (
                <main className="quiz-display">
                    <p>End of quiz. Take a moment to review your results.</p>
                    <br />
                    <a href="./#/game-mode" className="start-button" text="Hover Effect 2" effecttype="effect2">
                        Return
                    </a>
                </main>
            )
            }
        </div>
    )

            
    }

;

export default Multichoice;
