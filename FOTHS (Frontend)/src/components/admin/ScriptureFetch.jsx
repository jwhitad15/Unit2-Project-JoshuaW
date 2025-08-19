import React, { useState, useEffect } from "react";
import './Admin.css'

const ScriptureFetch = ({setScriptureData}) => {

    const [verse, setVerse] = useState("");
        const [scripture, setScripture] = useState("");
        const [category, setCategory] = useState("");
        const [lod, setLod] = useState("");
        const [translation, setTranslation] = useState("");
        const [fruit, setFruit] = useState("");
    
        const handleVerseChange = (e) => setVerse(e.target.value);
        const handleScriptureChange = (e) => setScripture(e.target.value);
        const handleCategoryChange = (e) => setCategory(e.target.value);
        const handleLODChange = (e) => setLod(e.target.value);
        const handleTranslationChange = (e) => setTranslation(e.target.value);
        const handleFruitChange = (e) => setFruit(e.target.value);
    
        // Update the parent component's state whenever any field changes
      useEffect(() => {
        const scriptureData = {
          verse,
          scripture,
          lod,
          translation,
          fruit,
          category,
        };
        setScriptureData(scriptureData); // Pass the updated data to the parent component
      }, [verse, scripture, lod, translation, fruit, category, setScriptureData]);

    return (
        <main className="ua-fetch-window"> 
            <input id='verse' maxLength='250' minLength='10' className="admin-textfield" type="text" placeholder="Verse" value={verse} onChange={handleVerseChange}></input>
            <input id='scripture' maxLength='1000' minLength='10' className="admin-textfield" type="text" placeholder="Scripture" value={scripture} onChange={handleScriptureChange}></input>
            <input id='category' maxLength='150' minLength='5' className="admin-textfield" type="text" placeholder="Category" value={category} onChange={handleCategoryChange}></input>
            <label for="goals"></label> <br/>
                <select id="goals" className="fruit-dropdown-select" value={fruit} onChange={handleFruitChange} >
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
                </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
            <label for="goals"></label> <br/>
                <select id="goals"  className="difficulty-dropdown-select" value={lod} onChange={handleLODChange} >
                    <option value="0">LOD</option>
                    <option value="Easy">Easy</option>
                    <option value="Intermediate">Intermediate</option>
                    <option value="Difficult">Difficult</option>
                </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
            <label for="translation"></label> <br/>
                <select id="translation"  className="translation-dropdown-select" value={translation} onChange={handleTranslationChange}>
                    <option value="0">VERSION</option>
                    <option value="KJV">KJV</option>
                </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
        </main>
    )

}

export default ScriptureFetch;