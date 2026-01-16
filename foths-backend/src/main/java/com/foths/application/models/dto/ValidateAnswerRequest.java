package com.foths.application.models.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ValidateAnswerRequest {
    private String verse;
    private String userAnswer;

    public String getVerse() { return verse; }
    public void setVerse(String verse) { this.verse = verse; }

    public String getUserAnswer() { return userAnswer; }
    public void setUserAnswer(String userAnswer) { this.userAnswer = userAnswer; }
}

