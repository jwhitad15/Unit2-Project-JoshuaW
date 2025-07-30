import './admin.css';

const QuestionFetch = () => {


    return (
        <main className="ua-fetch-window"> 
            <label for="goals"></label> <br/>
            <select id="goals" className="fruit-dropdown-select" >
                <option value="0">FRUIT</option>
                <option value="1">Faith</option>
                <option value="2">Love</option>
                <option value="3">Joy</option>
                <option value="4">Peace</option>
                <option value="5">Goodness</option>
                <option value="6">Gentleness</option>
                <option value="7">Meekness</option>
                <option value="8">Temperance</option>
                <option value="9">Longsuffering</option>
            </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
            <input id='question' maxLength='250' minLength='10' className="admin-textfield" type="text" placeholder="Question" ></input>
            <input id='answer' maxLength='150' minLength='5' className="admin-textfield" type="text" placeholder="Answer" ></input>
            <input id='category' maxLength='150' minLength='5' className="admin-textfield" type="text" placeholder="Category" ></input>
            <label for="goals"></label> <br/>
                <select id="goals"  className="difficulty-dropdown-select" >
                    <option value="0">DIFFICULTY</option>
                    <option value="1">Easy</option>
                    <option value="2">Intermediate</option>
                    <option value="3">Difficult</option>
                </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
            <label for="translation"></label> <br/>
                <select id="translation"  className="translation-dropdown-select">
                    <option value="0">TRANSLATION</option>
                    <option value="1">KJV</option>
                </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
            
        </main>
    )

}

export default QuestionFetch;