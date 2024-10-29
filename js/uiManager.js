export function setupUI({ onPlay, onClear, onCanvasClick }) {
    document.getElementById("play_button").addEventListener("click", onPlay);
    document.getElementById("clear_all_button").addEventListener("click", onClear);
    document.getElementById("main_canvas").addEventListener("click", onCanvasClick);
}
