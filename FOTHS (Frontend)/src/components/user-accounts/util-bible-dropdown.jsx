// grandchild component that displays the dynamic user data on FOTHS main page
import React from "react";
import './user-account.css'



const UtilBibledDropdown = (props) => {

    const chapters = {
        0: "",
        1: {title: "Genesis", bookChapters:"31"},
        2: {title: "Exodus", bookChapters:"31"},
        3: {title: "Leviticus", bookChapters:"31"},
        4: {title: "Numbers", bookChapters:"31"},
        5: {title: "Deuteronomy", bookChapters:"31"},
        6: {title: "Joshua", bookChapters:"31"},
        7: {title: "Judgess", bookChapters:"31"},
        8: {title: "Ruth", bookChapters:"31"},
        9: {title: "1 Samuel", bookChapters:"31"},
        10: {title: "2 Samuel", bookChapters:"31"},
        11: {title: "1 Kings", bookChapters:"31"},
        12: {title: "2 Kings", bookChapters:"31"},
        13: {title: "1 Chronicles", bookChapters:"31"},
        14: {title: "2 Chronicles", bookChapters:"31"},
        15: {title: "Ezra", bookChapters:"31"},
        16: {title: "Nehemiah", bookChapters:"31"},
        17: {title: "Esther", bookChapters:"31"},
        18: {title: "Job", bookChapters:"31"},
        19: {title: "Psalms", bookChapters:"31"},
        20: {title: "Proverbs", bookChapters:"31"},
        21: {title: "Ecclesiastes", bookChapters:"31"},
        22: {title: "Song of Solomon", bookChapters:"31"},
        23: {title: "Isaiah", bookChapters:"31"},
        24: {title: "Jeremiah", bookChapters:"31"},
        25: {title: "Lamentations", bookChapters:"31"},
        26: {title: "Ezekiel", bookChapters:"31"},
        27: {title: "Daniel", bookChapters:"31"},
        28: {title: "Hosea", bookChapters:"31"},
        29: {title: "Joel", bookChapters:"31"},
        30: {title: "Amos", bookChapters:"31"},
        31: {title: "Obadiah", bookChapters:"31"},
        32: {title: "Jonah", bookChapters:"31"},
        33: {title: "Micah", bookChapters:"31"},
        34: {title: "Nahum", bookChapters:"31"},
        35: {title: "Habakkuk", bookChapters:"31"},
        36: {title: "Zephaniah", bookChapters:"31"},
        37: {title: "Haggai", bookChapters:"31"},
        38: {title: "Zechariah", bookChapters:"31"},
        39: {title: "Malachi", bookChapters:"31"},
        40: {title: "Matthew", bookChapters:"31"},
        41: {title: "Mark", bookChapters:"31"},
        42: {title: "Luke", bookChapters:"31"},
        43: {title: "John", bookChapters:"31"},
        44: {title: "Acts", bookChapters:"31"},
        45: {title: "Romans", bookChapters:"31"},
        46: {title: "1 Corinthians", bookChapters:"31"},
        47: {title: "2 Corinthians", bookChapters:"31"},
        48: {title: "Galatians", bookChapters:"31"},
        49: {title: "Ephesians", bookChapters:"31"},
        50: {title: "Philippians", bookChapters:"31"},
        51: {title: "Colossians", bookChapters:"31"},
        52: {title: "1 Thessalonians", bookChapters:"31"},
        53: {title: "2 Thessalonians", bookChapters:"31"},
        54: {title: "1 Timothy", bookChapters:"31"},
        55: {title: "2 Timothy", bookChapters:"31"},
        56: {title: "Titus", bookChapters:"31"},
        57: {title: "Philemon", bookChapters:"31"},
        58: {title: "Hebrews", bookChapters:"31"},
        59: {title: "James", bookChapters:"31"},
        60: {title: "1 Peter", bookChapters:"31"},
        61: {title: "2 Peter", bookChapters:"31"},
        62: {title: "1 John", bookChapters:"31"},
        63: {title: "2 John", bookChapters:"31"},
        64: {title: "3 John", bookChapters:"31"},
        65: {title: "Jude", bookChapters:"31"},
        66: {title: "Revelation", bookChapters:"31"},
    }

    let notZero = false;

    if (props.goalData !== 0) {
        notZero = true;
    } 

    return (
        <div className="scope-card-list-item">
  
            <div > 

                <p className="scope-display-dropdown-selection"> <b>{chapters[props.goalData].title}</b></p>
                <p className="scope-preset-item"> + {chapters[props.goalData].a} </p>
                <p className="scope-preset-item"> + {chapters[props.goalData].b} </p>
                <p className="scope-preset-item"> + {chapters[props.goalData].c} </p>
    

            </div>

        </div>
    );


}



export default UtilBibledDropdown;