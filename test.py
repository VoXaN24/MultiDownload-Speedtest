from os import popen
from tqdm import tqdm
url=open('url.txt').read().splitlines()
with open('result.txt', 'w') as f:
	for i in tqdm(range(len(url))):
		args = ["wget","-O","/dev/null",url[i],"2>&1","|","grep","-o",'"[0-9.]\+','[KMG]*B/s"']
		out=popen(' '.join(args)).read()
		f.write(f"{url[i]} have for speed {out}\n")