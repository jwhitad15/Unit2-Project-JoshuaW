import React, { useState, useEffect } from "react";
import './admin.css';

const QuestionFetch = ({setQuestionData}) => {

    const [questions, setQuestion] = useState("");
    const [answer, setAnswer] = useState("");
    const [category, setCategory] = useState("");
    const [lod, setLod] = useState("");
    const [translation, setTranslation] = useState("");
    const [fruit, setFruit] = useState("");

    const handleQuestionChange = (e) => setQuestion(e.target.value);
    const handleAnswerChange = (e) => setAnswer(e.target.value);
    const handleCategoryChange = (e) => setCategory(e.target.value);
    const handleLODChange = (e) => setLod(e.target.value);
    const handleTranslationChange = (e) => setTranslation(e.target.value);
    const handleFruitChange = (e) => setFruit(e.target.value);

    // Update the parent component's state whenever any field changes
  useEffect(() => {
    const questionData = {
      questions,
      answer,
      lod,
      translation,
      fruit,
      category,
    };
    setQuestionData(questionData); // Pass the updated data to the parent component
  }, [questions, answer, lod, translation, fruit, category, setQuestionData]);

    return (
        <main className="ua-fetch-window">
          <input id="question" maxLength="250" minLength="10" className="admin-textfield" type="text" placeholder="Question" value={questions} onChange={handleQuestionChange}/>
          <input id="answer" maxLength="150" minLength="5" className="admin-textfield" type="text" placeholder="Answer" value={answer} onChange={handleAnswerChange}/>
          <input id="category" maxLength="150" minLength="5" className="admin-textfield" type="text" placeholder="Category" value={category} onChange={handleCategoryChange}/>
          <select id="goals" className="fruit-dropdown-select" value={fruit} onChange={handleFruitChange}>
            <option value="0">FRUIT</option>
            <option value="Faith">Faith</option>
            <option value="Love">Love</option>
            <option value="Joy">Joy</option>
            <option value="Peace">Peace</option>
            <option value="Goodness">Goodness</option>
            <option value="Gentleness">Gentleness</option>
            <option value="Meekness">Meekness</option>
            <option value="Temperance">Temperance</option>
            <option value="Longsuffering">Longsuffering</option>
          </select>
          <br />
          <select id="goals" className="difficulty-dropdown-select" value={lod} onChange={handleLODChange}>
            <option value="0">LOD</option>
            <option value="Easy">Easy</option>
            <option value="Intermediate">Intermediate</option>
            <option value="Difficult">Difficult</option>
          </select>
          <br />
          <select id="translation" className="translation-dropdown-select" value={translation} onChange={handleTranslationChange}>
            <option value="0">VERSION</option>
            <option value="KJV">KJV</option>
          </select>
          <br />
        </main>
    )

}

export default QuestionFetch;