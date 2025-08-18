// Component that fetches a public bible and displays it

// Component that fetches a public bible and displays it

import React, { useState } from "react";

const UtilBible = () => {
  // State variables
  const [book, setBook] = useState(""); // Tracks the selected book
  const [chapter, setChapter] = useState(""); // Tracks the selected chapter
  const [bookContent, setBookContent] = useState([]); // Stores the fetched book content
  const [errorMessage, setErrorMessage] = useState(""); // Tracks error messages

  // Handles dropdown selection for book
  const handleBookDropdown = (e) => {
    setBook(e.target.value);
    setChapter(""); // Reset chapter when a new book is selected
  };

  // Handles dropdown selection for chapter
  const handleChapterDropdown = (e) => {
    setChapter(e.target.value);
  };

  // Fetches the selected book and chapter from the public Bible API
  const fetchBookContent = async () => {
    try {
      if (!book || book === "0") {
        setErrorMessage("Please select a valid book.");
        return;
      }

      // Replaces 'YOUR_API_KEY' with your actual API key from the ESV API
      const apiKey = "e4de20621b23312b2d09679f6c2c4207ff333d92";
      const query = chapter ? `${book} ${chapter}` : book; // Include chapter if selected
      const apiUrl = `https://api.esv.org/v3/passage/text/?q=${query}&include-footnotes=false&include-headings=false&include-passage-references=false`;

      const response = await fetch(apiUrl, {
        headers: {
          Authorization: `Token ${apiKey}`,
        },
      });

      if (!response.ok) {
        throw new Error(`Failed to fetch book content. Status: ${response.status}`);
      }

      const data = await response.json();
      setBookContent(data.passages || []); // Store the passages in state
      setErrorMessage(""); // Clear any previous error messages

      console.log("Fetched book content:", data.passages); // Log the fetched content
    } catch (error) {
      console.error("Error fetching book content:", error);
      setErrorMessage("Failed to fetch book content. Please try again.");
    }
  };

  // Handles form submission
  const handleSubmit = (e) => {
    e.preventDefault();
    fetchBookContent(); // Fetch the selected book content
  };

  // Generates chapter options (1-150 for flexibility)
  const chapterOptions = Array.from({ length: 150 }, (_, i) => i + 1);

  return (
    <div style={{ textAlign: "center", marginTop: "20px" }}>
      <form className="scope-goals-input" onSubmit={handleSubmit}>
        <label className="scope-presetGoals-banner">
          <hr />
          SELECTIONS
          <hr /> <br />
        </label>

        <label>Select a Book</label> <br />
        <select id="book" value={book} className="goal-select" onChange={handleBookDropdown}>
          <option value="0"></option>
          <option value="Genesis">Genesis</option>
          <option value="Exodus">Exodus</option>
          <option value="Leviticus">Leviticus</option>
          <option value="Numbers">Numbers</option>
          <option value="Deuteronomy">Deuteronomy</option>
          <option value="Joshua">Joshua</option>
          <option value="Judges">Judges</option>
          <option value="Ruth">Ruth</option>
          <option value="1 Samuel">1 Samuel</option>
          <option value="2 Samuel">2 Samuel</option>
          <option value="1 Kings">1 Kings</option>
          <option value="2 Kings">2 Kings</option>
          <option value="1 Chronicles">1 Chronicles</option>
          <option value="2 Chronicles">2 Chronicles</option>
          <option value="Ezra">Ezra</option>
          <option value="Nehemiah">Nehemiah</option>
          <option value="Esther">Esther</option>
          <option value="Job">Job</option>
          <option value="Psalms">Psalms</option>
          <option value="Proverbs">Proverbs</option>
          <option value="Ecclesiastes">Ecclesiastes</option>
          <option value="Song of Solomon">Song of Solomon</option>
          <option value="Isaiah">Isaiah</option>
          <option value="Jeremiah">Jeremiah</option>
          <option value="Ezekiel">Ezekiel</option>
          <option value="Daniel">Daniel</option>
          <option value="Hosea">Hosea</option>
          <option value="Joel">Joel</option>
          <option value="Amos">Amos</option>
          <option value="Obadiah">Obadiah</option>
          <option value="Jonah">Jonah</option>
          <option value="Micah">Micah</option>
          <option value="Nahum">Nahum</option>
          <option value="Habakkuk">Habakkuk</option>
          <option value="Zephaniah">Zephaniah</option>
          <option value="Haggai">Haggai</option>
          <option value="Zechariah">Zechariah</option>
          <option value="Malachi">Malachi</option>
          <option value="Matthew">Matthew</option>
          <option value="Mark">Mark</option>
          <option value="Luke">Luke</option>
          <option value="John">John</option>
          <option value="Acts">Acts</option>
          <option value="Romans">Romans</option>
          <option value="1 Corinthians">1 Corinthians</option>
          <option value="2 Corinthians">2 Corinthians</option>
          <option value="Galatians">Galatians</option>
          <option value="Ephesians">Ephesians</option>
          <option value="Philippians">Philippians</option>
          <option value="Colossians">Colossians</option>
          <option value="1 Thessalonians">1 Thessalonians</option>
          <option value="2 Thessalonians">2 Thessalonians</option>
          <option value="1 Timothy">1 Timothy</option>
          <option value="2 Timothy">2 Timothy</option>
          <option value="Titus">Titus</option>
          <option value="Philemon">Philemon</option>
          <option value="Hebrews">Hebrews</option>
          <option value="James">James</option>
          <option value="1 Peter">1 Peter</option>
          <option value="2 Peter">2 Peter</option>
          <option value="1 John">1 John</option>
          <option value="2 John">2 John</option>
          <option value="3 John">3 John</option>
          <option value="Jude">Jude</option>
          <option value="Revelation">Revelation</option>
        </select>
        <br />

        <label>Select a Chapter</label> <br />
        <select id="chapter" value={chapter} className="goal-select" onChange={handleChapterDropdown}>
          <option value="">All Chapters</option>
          {chapterOptions.map((num) => (
            <option key={num} value={num}>
              {num}
            </option>
          ))}
        </select>
        <br /> <br className="desktop-scope-breakpoint" />

        <button type="submit" className="account-button-class">
          Submit
        </button>
        <br /> <br />

        {errorMessage && <p style={{ color: "white" }}>{errorMessage}</p>}
      </form>

      <hr className="scope-line" />

      <label>
        <label className="scope-customGoals-banner">
          VIEWPORT <br className="mobile-scope-breakpoint" /> <hr /> 
        </label>
        <br />
        <div className="eBible-window">
          {bookContent.length > 0 ? (
            bookContent.map((passage, index) => (
              <p key={index}>{passage}</p>
            ))
          ) : (
            <p>No content available. Please select a book.</p>
          )}
        </div>
      </label>
    </div>
  );
};

export default UtilBible;

