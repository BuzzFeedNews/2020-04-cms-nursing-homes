default:

replicate: fetch analyze

fetch:
	nbexec notebooks/get-*.ipynb

analyze:
	nbexec notebooks/analyze-*.ipynb
