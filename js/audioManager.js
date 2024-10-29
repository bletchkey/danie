import { noteFrequencies } from "./constants.js";

let audioContext = new (window.AudioContext || window.webkitAudioContext)();
let isPlaying = false;
let savedNotes = []; // Make sure this is correctly populated or imported

export function playNotes() {
    if (isPlaying || savedNotes.length === 0) return;
    isPlaying = true;

    let index = 0;
    function playNext() {
        if (index < savedNotes.length) {
            const note = savedNotes[index];
            const frequency = noteFrequencies[note.noteText];
            if (frequency) {
                playFrequency(frequency);
            }
            index++;
            setTimeout(playNext, 100); // Delay between notes
        } else {
            isPlaying = false;
        }
    }
    playNext();
}

function playFrequency(frequency) {
    if (!audioContext) {
        // Restart audio context if it was suspended
        audioContext = new (window.AudioContext || window.webkitAudioContext)();
    }

    const oscillator = audioContext.createOscillator();
    oscillator.type = "sine";
    oscillator.frequency.setValueAtTime(frequency, audioContext.currentTime);

    const gainNode = audioContext.createGain();
    gainNode.gain.setValueAtTime(0.1, audioContext.currentTime);

    oscillator.connect(gainNode);
    gainNode.connect(audioContext.destination);

    oscillator.start();
    oscillator.stop(audioContext.currentTime + 0.2); // Plays each note for 0.2s
}
