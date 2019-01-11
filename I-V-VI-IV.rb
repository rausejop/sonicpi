# Welcome to Sonic Pi v2.11
# (C) 16/10/2018 Rafael Ausejo Prieto.
# Prueba de melodía I - V - VI -IV


# Velocidad
use_bpm 90 # default

# Duración de las figuras musicales
redonda = 4
blanca = 2
negra = 1
corchea = 0.5
semicorchea= 0.25
fusa = 0.125
semifusa =0.0625


# Hilos de sonido
in_thread(name: :hilo_metronomo) {metronomo}
in_thread(name: :hilo_melodia) {melodia}


# Partes
define :tercia do
  use_synth :fm
  play :G4
  sleep redonda
  play :D4
  sleep redonda
  play :E5
  sleep redonda
  play :C4
  sleep redonda
end


define :acordes do
  use_synth :pluck
  8.times do
    # Acorde de Do Mayor  (I)
    play_chord [:C3,:E3,:G3]
    sleep corchea
  end
  8.times do
    # Acorde de Sol Mayor (V)
    play_chord [:G3,:B4,:D4]
    sleep corchea
  end
  8.times do
    # Acorde de La menor (VI-)
    play_chord [:A4,:C4,:E4]
    sleep corchea
  end
  8.times do # Acorde de Fa Mayor (IV)
    play_chord [:F3,:A4,:C4]
    sleep corchea
  end
end


define :acordes_final do
  use_synth :pluck
  use_synth_defaults attack: 2, release: 2
  1.times do
    # Acorde de Do Mayor  (I)
    play_chord [:C3,:E3,:G3]
    sleep corchea
  end
  use_synth_defaults
end


define :estribillo1 do
  use_synth :dsaw
  play :C5
  play_pattern_timed [:e4,:c4,:e4,:c4], [negra,negra,negra,negra]
  
  play :G5
  play_pattern_timed [:e4,:d4,:c4,:e4,:d4,:c4,:c4,:c4], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  
  play :A6
  play_pattern_timed [:e4,:d4,:c4,:e4,:c4], [1,0.5,0.5,1,1,1]
  
  play :F5
  play_pattern_timed [:e4,:d4,:c4,:e4,:d4,:c4,:c4,:c4], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
end


define :estribillo2 do
  use_synth :dsaw
  play :C5
  play_pattern_timed [:e4,:d4,:c4,:e4,:d4,:c4], [1,0.5,0.5,1,0.5,1,0.5]
  
  play :G5
  play_pattern_timed [:e4,:d4,:c4,:e4,:d4,:c4,:c4,:c4], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  
  play :A6
  play_pattern_timed [:c5,:d5,:e5,:c5,:d5,:e5,:c5,:d5,:e5,:c5,:e5,:e5:c5,:e5,:d5,:c5], [0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25]
  
  play :F5
  #play_pattern_timed [:e4,:e4,:d4,:c4], [0.5,0.5,1.5,1.5]
  play_pattern_timed [:c5,:d5,:e5,:c5,:d5,:e5,:c5,:d5,:e5,:c5,:e5,:e5:c5,:e5,:d5,:c5], [0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25]
end


define :estribillo3 do
  use_synth :dsaw
  play :C5
  play_pattern_timed [:e4,:d4,:c4,:e4,:d4,:c4,:c4,:c4], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  
  play :G5
  play_pattern_timed [:e4,:d4,:c4,:e4,:d4,:c4,:c4,:c4], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  
  play :A6
  play_pattern_timed [:c5,:d5,:e5,:c5,:d5,:e5,:c5,:d5,:e5,:c5,:e5,:e5:c5,:e5,:d5,:c5], [0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25]
  
  play :F5
  #play_pattern_timed [:e4,:e4,:d4,:c4], [0.5,0.5,1.5,1.5]
  play_pattern_timed [:c5,:d5,:e5,:c5,:d5,:e5,:c5,:d5,:e5,:c5,:e5,:e5:c5,:e5,:d5,:c5], [0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25]
end



define :metronomo  do
  138.times do
    sample :drum_heavy_kick
    sleep 1
    sample :drum_heavy_kick
    sleep 1
    sample :drum_heavy_kick
    sleep 1
    sample :drum_heavy_kick
    sleep 1
  end
end


define :melodia do
  1.times do
    acordes
    estribillo1
    estribillo2
    acordes
    2.times do
      estribillo2
    end
    use_synth_defaults attack: 0.4, release: 0.1
    acordes
    use_synth_defaults
    2.times do
      estribillo3
    end
    use_synth_defaults attack: 0.4, release: 0.1
    acordes
    use_synth_defaults attack: 0.5, release: 0.5
    acordes
    use_synth_defaults
    estribillo2
    acordes
    acordes_final
  end
end