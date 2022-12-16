import subprocess
from tqdm import tqdm
url=open('url.txt').read().splitlines()
with open('result.txt', 'w') as f:
	for i in tqdm(range(len(url))):
		command="wget -O /dev/null "+url[i]+' 2>&1 grep -o "[0-9.]\+ [KMG]*B/s"'
		proc=subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
		(out,err) = proc.communicate()
		f.write(url[i]+" have for speed "+str(out)+"\n")
