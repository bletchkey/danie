import { notes } from "./constants.js";

let canvas;
let savedNotes = []; // Array to hold drawn notes

export function initializeCanvas() {
    const dpr = window.devicePixelRatio || 1;
    canvas = document.getElementById("main_canvas");

    if (canvas) {
        // Draw initial scene and load saved notes
        drawScene();
    } else {
        console.error("canvas element not found");
    }
}

export function handleCanvasClick(event) {

    const { x, y } = getMousePosition(event);

    // Draw the note to the correct div
    const rowDiv = event.target.closest("div");
    const xPosition = x - rowDiv.getBoundingClientRect().left;
    addNoteToRow(rowDiv, xPosition);

}

// Function to get the correct mouse position on high-resolution between divs
export function getMousePosition(event) {
    const rect = event.target.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;
    return { x, y };
}

// Function to add a note to the clicked row
export function addNoteToRow(rowDiv, xPosition) {
    drawNote(rowDiv, xPosition);
    // Save the note position
    const row = rowDiv.id;
    savedNotes.push({ row, x: xPosition });
}

export function drawNote(rowDiv, xPosition) {
    const note = document.createElement("div");
    note.style.width = "16px";
    note.style.height = "16px";
    note.style.backgroundColor = "black";
    note.style.borderRadius = "50%"; // Makes it a circle
    note.style.position = "absolute";
    note.style.left = `${xPosition}px`; // Position based on click
    note.style.top = "50%";
    note.style.transform = "translateY(-50%)"; // Center vertically

    // Append the note to the row div
    rowDiv.appendChild(note);
}

export function clearCanvas() {
    const confirmed = confirm("Are you sure you want to clear all?");

    if (confirmed) {
        savedNotes = [];
        saveNotes();
        drawScene();
    }
}

export function drawScene() {
    let i = 0;
    const canvas = document.getElementById("main_canvas");

    // Clear any existing content in the canvas
    canvas.innerHTML = "";

    for (const note of notes) {
        // Create a new div element for each note
        const newDivDrawNotes = document.createElement("div");
        const newDivNoteName = document.createElement("div");

        // Apply styles to each main note div
        newDivDrawNotes.style.width = "100%";
        newDivDrawNotes.style.height = "25px"; // Adjust height as needed
        newDivDrawNotes.style.backgroundColor = "#fff";
        newDivDrawNotes.style.position = "relative";
        newDivDrawNotes.style.display = "flex";
        newDivDrawNotes.style.alignItems = "center"; // Center vertically

        // Set the text content of newDivNoteName to the note value
        newDivNoteName.textContent = note;
        newDivNoteName.style.marginLeft = "10px"; // Space between note and line
        newDivNoteName.style.fontSize = "14px";
        newDivNoteName.style.fontWeight = "bold";
        newDivNoteName.style.color = "black";

        // Add the note name to the main note div
        newDivDrawNotes.appendChild(newDivNoteName);

        // Add center line if needed
        if (i % 2 === 0) {
            const centerLine = document.createElement("div");

            // Apply styles to make the line span the width and center it
            centerLine.style.position = "absolute";
            centerLine.style.top = "50%";
            centerLine.style.left = "35px"; // Adjust this to set the left starting position
            centerLine.style.width = "calc(100% - 50px)"; // Occupy remaining space after the note
            centerLine.style.height = "1px";
            centerLine.style.backgroundColor = "black";
            centerLine.style.transform = "translateY(-50%)";

            // Append the line to the container
            newDivDrawNotes.appendChild(centerLine);
        }

        // Append the main note div to the canvas
        canvas.appendChild(newDivDrawNotes);

        i++;
    }
}

export function saveNotes() {
    localStorage.setItem("savedNotes", JSON.stringify(savedNotes));
}

export function loadNotes() {
    savedNotes = JSON.parse(localStorage.getItem("savedNotes")) || [];
    savedNotes.forEach(note => {
        const rowDiv = document.getElementById(note.row);
        drawNote(rowDiv, note.x);
    });
}
