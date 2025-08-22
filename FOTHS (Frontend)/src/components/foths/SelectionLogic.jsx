import React, { createContext, useState } from "react";

export const SelectionLogic = createContext();

export const SelectionProvider = ({ children }) => {
  const [fruitSelection, setFruitSelection] = useState("Faith"); // Store selected fruit
  const [gameModeSelection, setGameModeSelection] = useState(null); // Store selected game mode

  return (
    <SelectionLogic.Provider
      value={{
        fruitSelection,
        setFruitSelection,
        gameModeSelection,
        setGameModeSelection,
      }}
    >
      {children}
    </SelectionLogic.Provider>
  );
};