
def readFile(filename, mode="rt"):
    # rt stands for "read text"
    fin = contents = None
    try:
        fin = open(filename, mode)
        contents = fin.read()
    finally:
        if (fin != None): fin.close()
    return contents

def indexToName(i):
	contents = readFile('varNames.txt')
	contents_list = contents.split('\n')
	contents_list = [ (s.split())[1][:-1] for s in contents_list ]
	return contents_list[i]

