
f = open("rnn_binary_model_0312_rnn32.txt")

lines = f.readlines()

for raw_line in lines:
    line = raw_line.strip()
    if "{" in line:
        print(line)
    else:
        result = 0
        weights = line.split()
        for w in weights:
            x = w.split(":")
            val = x[-1]
            if 'row' in w:
                result += (int(val) << 24)
            if 'col' in w:  
                result += (int(val) << 16)
            if 'vec' in w:
                result += (int(val) << 16)
            if 'val' in w:
                result += int(val,2)
        
        print(hex(result))