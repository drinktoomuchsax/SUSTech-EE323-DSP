clear;
tone = 6; % 数字音符（1代表A）
scale = 3; % 调号（例如 'C'）
octave = 0; % 高低八度数量（0表示中音）
rising = 0; % 升降调（0表示无升降调）
rhythm = 0.5; % 节拍持续时间（秒）
fs = 44100; % 采样频率

%%% doremi test
waves_0 = gen_wave(0, scale, octave, rising, rhythm, fs);
waves_1 = gen_wave(1, scale, octave, rising, rhythm, fs);
waves_2 = gen_wave(2, scale, octave, rising, rhythm, fs);
waves_3 = gen_wave(3, scale, octave, rising, rhythm, fs);
waves_4 = gen_wave(4, scale, octave, rising, rhythm, fs);
waves_5 = gen_wave(5, scale, octave, rising, rhythm, fs);
waves_6 = gen_wave(6, scale, octave, rising, rhythm, fs);
waves_7 = gen_wave(7, scale, octave, rising, rhythm, fs);
waves_0_ = gen_wave(0, scale, 1, rising, rhythm, fs);
waves_1_ = gen_wave(1, scale, 1, rising, rhythm, fs);
waves_2_ = gen_wave(2, scale, 1, rising, rhythm, fs);
waves_3_ = gen_wave(3, scale, 1, rising, rhythm, fs);
waves_4_ = gen_wave(4, scale, 1, rising, rhythm, fs);
waves_5_ = gen_wave(5, scale, 1, rising, rhythm, fs);
waves_6_ = gen_wave(6, scale, 1, rising, rhythm, fs);
waves_7_ = gen_wave(7, scale, 1, rising, rhythm, fs);
waves = [waves_0 waves_1 waves_2 waves_3 waves_4 waves_5 waves_6 waves_7 waves_0_ waves_1_ waves_2_ waves_3_ waves_4_ waves_5_ waves_6_ waves_7_];
sound(waves, fs); % 播放生成的波形

%%


fs = 44100; f = 440; T = 1/f;
rhythm = 1;
t = linspace(0, rhythm, fs * rhythm);
y = sin(2*pi*f*t);
y = y.*(exp(-2*t/rhythm)-0.15*sin(t));
plot(t,y);
title("12110623-曹正阳")
sound(y, fs);


%%
fs = 8192; f = 220; T = 1/f;
rhythm = 0.3;
t = linspace(0, rhythm, fs * rhythm);
y = 0.6*sin(2*pi*f*t)+0.3*sin(2*pi*2*f*t)+ 0.15*sin(2*pi*3*f*t)+0.1*sin(2*pi*4*f*t)+0.05*sin(2*pi*5*f*t)+0.02*sin(2*pi*6*f*t);
y = y.*exp(-2*t/rhythm);
plot(t,y);
title("12110623-曹正阳")
axis([0 0.01 -1 1]);
sound(y, fs);

%%
dude = gen_music();
sound(dude, 44100); % 播放生成的波形

%%

audiowrite("skycit.wav",dude,44100);
%%

function freq = tone2freq_3(tone,scale,octave,rising)
    scales =  [3 4 5 6 7 1 2];
    base_freqs = [261.5 293.5 329.5 349 391.5 440 494];
    scaleMap = containers.Map(scales,base_freqs);
    
    % 主音频率（1号音符，中音，无升降调）
    base_freq = scaleMap(scale);
    
    % 音符频率的倍数关系
    note_freq_ratios = [1, 9/8, 5/4, 4/3, 3/2, 5/3, 15/8];
    
    % 计算音符的频率
    
    if tone >= 1 && tone <= 7
        % 根据音符计算倍频关系
        note_ratio = note_freq_ratios(tone);
        
        % 根据高低八度计算频率
        
        octave_factor = 2^(octave);
        
        % 根据升降调计算频率
        if rising == 1
            freq = base_freq * note_ratio * octave_factor * 2^(1/12);
        elseif rising == -1
            freq = base_freq * note_ratio * octave_factor / 2^(1/12);
        else
            freq = base_freq * note_ratio * octave_factor;
        end
    elseif tone == 0
        freq = 0;
    else
        error('无效的音符输入。音符范围应为1到7。');
    end
end

function waves = gen_wave2(tone, scale, octave, rising, rhythm, delaying, fs)
    % 计算音符的频率
    freq = tone2freq_3(tone, scale, octave, rising);
    f = freq;
    if delaying == 1 % 1代表一个右边的横线
        rhythm  = rhythm*2;
    elseif delaying == 2 % 2代表二个右边的横线
        rhythm  = rhythm*3;
    elseif delaying == 3 % 3代表三个右边的横线
        rhythm  = rhythm*4;
    elseif delaying == 0.5 % 0.5代表一个右边的点
        rhythm  = rhythm*1.5;
    elseif delaying == 0 % 0代表原音
        rhythm  = rhythm*1;
    elseif delaying == -1 % -1代表下面一条横线
        rhythm  = rhythm*0.5;
    elseif delaying == -2 % -2代表下面两条横线
        rhythm = rhythm*0.25;
    end
    t = linspace(0, rhythm, fs * rhythm);
    waves = sin(2*pi*f*t);
    waves = waves.*exp(-t/rhythm);
end


function waves = gen_music()
    clear;
    %config parameter
    scale = 3; % 调号（例如 'C'）
    octave = 0; % 高低八度数量（0表示中音）
    rising = 0; % 升降调（0表示无升降调）
    rhythm = 0.4; % 节拍持续时间（秒）
    delaying = 0;
    fs = 44100; % 采样频率
    waves = 0;
    wave = [
        [0 scale octave rising rhythm 3 fs];
        [6 scale octave rising rhythm 1 fs];
        [7 scale octave rising rhythm 1 fs];
        [1 scale octave 1 rhythm -1 fs];
        [7 scale octave rising rhythm -1 fs];
        [1 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm delaying fs];
        [7 scale octave rising rhythm 2 fs];
        [3 scale octave rising rhythm -1 fs];
        [3 scale octave rising rhythm -1 fs];
        [6 scale octave rising rhythm 0.5 fs];
        [5 scale octave rising rhythm -1 fs];
        [6 scale octave rising rhythm delaying fs]
        [1 scale octave 1 rhythm delaying fs];
        [5 scale octave rising rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [3 scale octave rising rhythm -1 fs];
        [3 scale octave rising rhythm -1 fs];
        [4 scale octave rising rhythm 0.5 fs];
        [3 scale octave rising rhythm -1 fs];
        [4 scale octave rising rhythm -1 fs];
        [1 scale octave 1 rhythm 0.5 fs];
        [3 scale octave rising rhythm 1 fs];
        [0 scale octave rising rhythm -1 fs];
        [1 scale octave rising rhythm -1 fs];
        [1 scale octave rising rhythm -1 fs];
        [1 scale octave rising rhythm -1 fs];
        [7 scale octave rising rhythm 0.5 fs];
        [4 scale octave 1 rhythm -1 fs];
        [4 scale octave 1 rhythm delaying fs];
        [7 scale octave rising rhythm delaying fs];
        [7 scale octave rising rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [6 scale octave rising rhythm -1 fs];
        [7 scale octave rising rhythm -1 fs];
        [1 scale octave 1 rhythm 0.5 fs];
        [7 scale octave rising rhythm -1 fs];
        [1 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm delaying fs];
        [7 scale octave rising rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [3 scale octave rising rhythm -1 fs];
        [3 scale octave rising rhythm -1 fs];
        [6 scale octave rising rhythm 0.5 fs];
        [5 scale octave rising rhythm -1 fs];
        [6 scale octave rising rhythm delaying fs];
        [1 scale octave 1 rhythm delaying fs];
        [5 scale octave rising rhythm 2 fs];
        [0 scale octave rising rhythm -1 fs];
        [3 scale octave rising rhythm -1 fs];
        [4 scale octave rising rhythm delaying fs];
        [1 scale octave 1 rhythm -1 fs];
        [7 scale octave rising rhythm -1 fs];
        [7 scale octave rising rhythm delaying fs];
        [1 scale octave 1 rhythm delaying fs];
        [2 scale octave 1 rhythm -1 fs];
        [2 scale octave 1 rhythm -1 fs];
        [3 scale octave 1 rhythm -1 fs];
        [1 scale octave 1 rhythm delaying fs];
        [0 scale octave rising rhythm delaying fs];
        [1 scale octave 1 rhythm delaying fs];
        [7 scale octave rising rhythm -1 fs];
        [6 scale octave rising rhythm -1 fs];
        [6 scale octave rising rhythm -1 fs];
        [7 scale octave rising rhythm delaying fs];
        [5 scale octave 1 rhythm delaying fs];
        [6 scale octave rising rhythm delaying fs];
        [0 scale octave rising rhythm delaying fs];
        [1 scale octave 1 rhythm -1 fs];
        [2 scale octave 1 rhythm -1 fs];
        [3 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm -1 fs];
        [3 scale octave 1 rhythm delaying fs];
        [5 scale octave 1 rhythm delaying fs];
        [2 scale octave 1 rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [5 scale octave rising rhythm -1 fs];
        [5 scale octave rising rhythm -1 fs];
        [1 scale octave 1 rhythm -1 fs];
        [7 scale octave rising rhythm -1 fs];
        [1 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [0 scale octave rising rhythm delaying fs];
        [6 scale octave rising rhythm -1 fs];
        [7 scale octave rising rhythm -1 fs];
        [1 scale octave 1 rhythm delaying fs];
        [7 scale octave 1 rhythm delaying fs];
        [2 scale octave 1 rhythm -1 fs];
        [2 scale octave 1 rhythm -1 fs];
        [1 scale octave 1 rhythm 0.5 fs];
        [5 scale octave rising rhythm -1 fs];
        [5 scale octave rising rhythm delaying fs];
        [0 scale octave rising rhythm delaying fs];
        [4 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm delaying fs];
        [2 scale octave 1 rhythm delaying fs];
        [1 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm 3 fs];
        [3 scale octave 1 rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [3 scale octave 1 rhythm delaying fs];
        [6 scale octave 1 rhythm 1 fs];
        [5 scale octave 1 rhythm delaying fs];
        [5 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm 0.5 fs];
        [1 scale octave 1 rhythm delaying fs];
        [0 scale octave 1 rhythm 0.5 fs];
        [1 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm delaying fs];
        [1 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm 0.5 fs];
        [5 scale octave 1 rhythm delaying fs];
        [3 scale octave 1 rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [3 scale octave 1 rhythm delaying fs];
        [6 scale octave 1 rhythm 1 fs];
        [5 scale octave 1 rhythm 1 fs];
        [3 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm 0.5 fs];
        [1 scale octave 1 rhythm 1 fs];
        [0 scale octave rising rhythm 0.5 fs];
        [1 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm delaying fs];
        [1 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm 0.5 fs];
        [2 scale octave 1 rhythm 0.5 fs];
        [7 scale octave rising rhythm delaying fs];
        [6 scale octave rising rhythm 1 fs];
        [0 scale octave rising rhythm delaying fs];
        [6 scale octave rising rhythm 0.5 fs];
        [7 scale octave rising rhythm 0.5 fs];
        [6 scale octave rising rhythm 3 fs]];
    for i = 1:length(wave)
        tone_tmp = wave(i,1);
        scale_tmp = wave(i,2);
        octave_tmp = wave(i,4);
        rising_tmp = wave(i,3);
        rhythm_tmp = wave(i,5);
        delaying_tmp = wave(i,6);
        fs_tmp = wave(i,7);
        wave_temp = gen_wave2(tone_tmp ,scale_tmp, octave_tmp, rising_tmp, rhythm_tmp, delaying_tmp, fs_tmp);
        waves = [waves wave_temp];
    end
end

