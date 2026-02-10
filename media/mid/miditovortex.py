import mido
import sys
from collections import defaultdict

class MIDIToVortex:
    def __init__(self):
        # Mappa delle note MIDI (numero) a note VortexTracker
        self.note_names = ['C-', 'C#', 'D-', 'D#', 'E-', 'F-', 'F#', 'G-', 'G#', 'A-', 'A#', 'B-']
        
    def midi_note_to_vortex(self, midi_note):
        """Converte un numero di nota MIDI in formato VortexTracker (es: C-4)"""
        octave = (midi_note // 12) - 1
        note = self.note_names[midi_note % 12]
        return f"{note}{octave}"
    
    def velocity_to_hex(self, velocity):
        """Mappa velocity MIDI (0-127) a volume Vortex (0-F)"""
        vol_int = min(15, velocity // 8)
        return f"{vol_int:X}"

    def get_optimal_speed(self, mid, rows_per_note):
        """
        Cerca il tempo (BPM) nel MIDI e calcola la Speed per Vortex (PAL 50Hz).
        Formula: Speed = (50Hz * 60s) / (BPM * RowsPerBeat)
        """
        bpm = 120  # Default standard
        
        # Cerca il primo cambio di tempo
        for track in mid.tracks:
            for msg in track:
                if msg.type == 'set_tempo':
                    bpm = mido.tempo2bpm(msg.tempo)
                    print(f"BPM Rilevati nel MIDI: {bpm:.2f}")
                    break
            else:
                continue
            break
            
        # Calcolo Speed per MSX PAL (50Hz)
        # Se rows_per_note=4, la formula semplificata è: 750 / BPM
        target_speed = (50 * 60) / (bpm * rows_per_note)
        
        # Arrotonda all'intero più vicino, ma mai sotto 1 o sopra 31
        final_speed = int(round(target_speed))
        final_speed = max(1, min(31, final_speed))
        
        return final_speed, bpm

    def convert(self, midi_file, output_file, speed=0, rows_per_note=4):
        """
        Converte un file MIDI in formato VortexTracker II
        Se speed è 0, viene calcolata automaticamente dai BPM.
        """
        mid = mido.MidiFile(midi_file)
        
        # Gestione automatica della velocità
        detected_bpm = 0
        if speed == 0:
            speed, detected_bpm = self.get_optimal_speed(mid, rows_per_note)
            print(f"Velocità calcolata automaticamente: {speed} (per ~{detected_bpm:.0f} BPM)")
        else:
            print(f"Uso velocità manuale fissa: {speed}")

        # Struttura per memorizzare le note
        patterns = defaultdict(lambda: defaultdict(list))
        
        # Processa ogni traccia MIDI
        for track in mid.tracks:
            current_tick = 0
            for msg in track:
                current_tick += msg.time
                row = (current_tick * rows_per_note) // mid.ticks_per_beat
                
                if msg.type == 'note_on' and msg.velocity > 0:
                    note = self.midi_note_to_vortex(msg.note)
                    vol = self.velocity_to_hex(msg.velocity)
                    channel = msg.channel % 3
                    patterns[row][channel].append((note, vol))
        
        self.write_vtxt(output_file, patterns, speed)
    
    def write_vtxt(self, output_file, patterns, speed):
        max_pattern = max(patterns.keys()) if patterns else 0
        num_patterns = (max_pattern // 64) + 1
        
        with open(output_file, 'w') as f:
            f.write("[Module]\n")
            f.write("VortexTrackerII=1\n")
            f.write("Version=3.6\n")
            f.write("Title=MIDI Conversion\n")
            f.write("Author=PythonConverter\n")
            f.write("NoteTable=2\n")
            f.write(f"Speed={speed}\n")
            
            play_order = ','.join([str(i) for i in range(num_patterns)])
            f.write(f"PlayOrder=L{play_order}\n\n")
            
            for i in range(1, 16):
                f.write(f"[Ornament{i}]\nL0\n\n")
            
            f.write("[Sample1]\n")
            f.write("Tne +000_ +00_ F_ L\n")
            f.write("Tne +000_ +00_ F_\n")
            f.write("Tne +000_ +00_ F_\n")
            f.write("Tne +000_ +00_ F_\n")
            f.write("Tne +000_ +00_ F-\n\n")
            
            for i in range(2, 32):
                f.write(f"[Sample{i}]\n")
                f.write("tne +000_ +00_ 0_ L\n\n")
            
            for pattern_num in range(num_patterns):
                f.write(f"[Pattern{pattern_num}]\n")
                for row in range(64):
                    global_row = pattern_num * 64 + row
                    channels_data = []
                    for channel in range(3):
                        if global_row in patterns and channel in patterns[global_row]:
                            items = patterns[global_row][channel]
                            if items:
                                note_str, vol_str = items[0]
                                channels_data.append(f"{note_str} 1.{vol_str}.")
                            else:
                                channels_data.append("--- ....")
                        else:
                            channels_data.append("--- ....")
                    channels_data.append("....")
                    line = "....|..|" + " ....|".join(channels_data[:3]) + " " + channels_data[3]
                    f.write(line + "\n")
                f.write("\n")

# MAIN ------------------------------
if __name__ == "__main__":
    converter = MIDIToVortex()
    
    # Valori di default
    midi_input = "melody3.mid"
    vtxt_output = "output.txt"
    speed_val = 0  # 0 = AUTO DETECT
    rows_val = 4

    if len(sys.argv) > 1: midi_input = sys.argv[1]
    if len(sys.argv) > 2: vtxt_output = sys.argv[2]
    
    # Se l'utente specifica speed, usala. Altrimenti 0 attiva l'auto-detect
    if len(sys.argv) > 3:
        try: speed_val = int(sys.argv[3])
        except: pass
        
    if len(sys.argv) > 4:
        try: rows_val = int(sys.argv[4])
        except: pass

    print(f"--- Configurazione ---")
    print(f"Input: {midi_input}")
    print(f"Output: {vtxt_output}")
    print(f"Mode: {'AUTO-BPM' if speed_val == 0 else 'MANUALE'}")
    print(f"Rows/Note: {rows_val}")
    print(f"----------------------")

    try:
        converter.convert(midi_input, vtxt_output, speed=speed_val, rows_per_note=rows_val)
        print(f"Fatto! File salvato: {vtxt_output}")
    except Exception as e:
        print(f"ERRORE: {e}")