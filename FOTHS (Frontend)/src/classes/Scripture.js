// Prepares the Scriptures class for managing scripture data
// This class includes methods for adding, retrieving, and finding scriptures by name

export default class Scriptures {
    constructor(id, verse, scripture) {
        this.id = id;
        this.verse = verse;
        this.scripture = scripture;
    }
    
    getProfile() {
        return `${this.id} - ${this.verse}: ${this.scripture}`;
    }   
    
    // Method to add a scripture
    addScripture(scripture) {
        this.scriptures.push(scripture);
    }

    // Method to get all scriptures
    getAllScriptures() {
        return this.scriptures;
    }

    // Method to find a scripture by name
    findScriptureByName(name) {
        return this.scriptures.find(scripture => scripture.name === name);
    }
}