const ScriptureFetch = () => {

    return (
        <main className="ua-fetch-window"> 
           <label for="goals">Fruit</label> <br/>
                <select id="goals" className="dropdown-select" >
                    <option value="0"></option>
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
            <input id='verse' maxLength='250' minLength='10' className="admin-textfield" type="text" placeholder="Verse" ></input>
            <input id='scripture' maxLength='1000' minLength='10' className="admin-textfield" type="text" placeholder="Scripture" ></input>
            <label for="goals">Difficulty</label> <br/>
                <select id="goals"  className="dropdown-select" >
                    <option value="0"></option>
                    <option value="1">Easy</option>
                    <option value="2">Intermediate</option>
                    <option value="3">Difficult</option>
                </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
            <label for="translation">Translation</label> <br/>
                <select id="translation"  className="dropdown-select" >
                    <option value="0"></option>
                    <option value="1">KJV</option>
                </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
            <input id='category' maxLength='150' minLength='5' className="admin-textfield" type="text" placeholder="Category" ></input>
            
        </main>
    )

}

export default ScriptureFetch;