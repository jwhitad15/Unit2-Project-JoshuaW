export default class Questions {
    constructor(id, question, answer) {
        this.id = id;
        this.question = question;
        this.answer = answer;
    }   
    // Method to get the question profile
    getProfile() {
        return `${this.id} - ${this.question}: ${this.answer}`;
    }
    
    // Method to add a question
    addQuestion(question) {
        this.questions.push(question);
    } 
    // Method to get all questions
    getAllQuestions() {
        return this.questions;
    }
    // Method to find a question by name
    findQuestionByName(name) {  
        return this.questions.find(question => question.name === name);
    }
    // Method to find a question by ID
    findQuestionById(id) {
        return this.questions.find(question => question.id === id);
    }
    // Method to update a question
    updateQuestion(id, newQuestion) {       
        const questionIndex = this.questions.findIndex(question => question.id === id);
        if (questionIndex !== -1) {
            this.questions[questionIndex].question = newQuestion;
        }
    }
    // Method to delete a question
    deleteQuestion(id) {                
        this.questions = this.questions.filter(question => question.id !== id);
    }
    // Method to get a random question
    getRandomQuestion() {
        const randomIndex = Math.floor(Math.random() * this.questions.length);
        return this.questions[randomIndex];
    }
    // Method to get a question by ID
    getQuestionById(id) {
        return this.questions.find(question => question.id === id);
    }  
}