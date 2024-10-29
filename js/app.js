import { initializeCanvas, handleCanvasClick, clearCanvas, loadNotes } from './canvasManager.js';
import { playNotes } from './audioManager.js';
import { setupUI } from './uiManager.js';

function main() {
    // Initialize the canvas, load notes from storage
    initializeCanvas();
    loadNotes();

    // Set up UI interactions
    setupUI({
        onPlay: playNotes,
        onClear: clearCanvas,
        onCanvasClick: handleCanvasClick
    });
}

document.addEventListener("DOMContentLoaded", main);